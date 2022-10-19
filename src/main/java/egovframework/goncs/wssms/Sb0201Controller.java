package egovframework.goncs.wssms;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.com.cmm.service.FileVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.goncs.bbs.service.BBSAttributeManageService;
import egovframework.goncs.bbs.service.BBSCommentService;
import egovframework.goncs.bbs.service.BBSManageService;
import egovframework.goncs.bbs.service.Board;
import egovframework.goncs.bbs.service.BoardMaster;
import egovframework.goncs.bbs.service.BoardMasterVO;
import egovframework.goncs.bbs.service.BoardVO;
import egovframework.goncs.member.service.LoginVO;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class Sb0201Controller {

	@Resource(name = "BBSManageService")
    private BBSManageService bbsMngService;
	
	@Resource(name = "BBSAttributeManageService")
    private BBSAttributeManageService bbsAttrbService;
	
	@Resource(name = "EgovFileMngService")
    private EgovFileMngService fileMngService;

    @Resource(name = "EgovFileMngUtil")
    private EgovFileMngUtil fileUtil;

    @Resource(name = "propertiesService")
    protected EgovPropertyService propertyService;
   
    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;
    
    @Autowired(required=false)
    private BBSCommentService bbsCommentService;
    
    @Autowired
    private DefaultBeanValidator beanValidator;
    
    protected String unscript(String data) {
        if (data == null || data.trim().equals("")) {
            return "";
        }
        
        String ret = data;
        
        ret = ret.replaceAll("<(S|s)(C|c)(R|r)(I|i)(P|p)(T|t)", "&lt;script");
        ret = ret.replaceAll("</(S|s)(C|c)(R|r)(I|i)(P|p)(T|t)", "&lt;/script");
        
        ret = ret.replaceAll("<(O|o)(B|b)(J|j)(E|e)(C|c)(T|t)", "&lt;object");
        ret = ret.replaceAll("</(O|o)(B|b)(J|j)(E|e)(C|c)(T|t)", "&lt;/object");
        
        ret = ret.replaceAll("<(A|a)(P|p)(P|p)(L|l)(E|e)(T|t)", "&lt;applet");
        ret = ret.replaceAll("</(A|a)(P|p)(P|p)(L|l)(E|e)(T|t)", "&lt;/applet");
        
        ret = ret.replaceAll("<(E|e)(M|m)(B|b)(E|e)(D|d)", "&lt;embed");
        ret = ret.replaceAll("</(E|e)(M|m)(B|b)(E|e)(D|d)", "&lt;embed");
        
        ret = ret.replaceAll("<(F|f)(O|o)(R|r)(M|m)", "&lt;form");
        ret = ret.replaceAll("</(F|f)(O|o)(R|r)(M|m)", "&lt;form");

        return ret;
    }
    
    /**
     * 게시물에 대한 목록을 조회한다.
     * 
     * @param boardVO
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/sb02/sub01.do")
    public String get_sb02_sub01(@ModelAttribute("searchVO") BoardVO boardVO, ModelMap model) throws Exception {
    	
    	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			return "redirect:/wssms/LoginUsr.do";
		}
    	LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
    	int us_level = user.getUs_level();
		model.addAttribute("us_level", us_level);
		int m_level = user.getUs_level();
		if(m_level > 2) {
			return "redirect:/wssms/LoginUsr.do";
		}

    	boardVO.setBbsId("BBSMSTR_000000000306");
    	    	
    	BoardMasterVO vo = new BoardMasterVO();
    	vo.setBbsId(boardVO.getBbsId());
    	//vo.setUniqId(user.getUniqId());
    	System.out.println("boardVO.getBbsId() : " + boardVO.getBbsId());
    	
    	BoardMasterVO master = bbsAttrbService.selectBBSMasterInf(vo);
    	
    	boardVO.setPageUnit(propertyService.getInt("pageUnit"));
    	boardVO.setPageSize(propertyService.getInt("pageSize"));

    	PaginationInfo paginationInfo = new PaginationInfo();
	
    	paginationInfo.setCurrentPageNo(boardVO.getPageIndex());
    	paginationInfo.setRecordCountPerPage(boardVO.getPageUnit());
    	paginationInfo.setPageSize(boardVO.getPageSize());

    	boardVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
    	boardVO.setLastIndex(paginationInfo.getLastRecordIndex());
    	boardVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

    	Map<String, Object> map = bbsMngService.selectBoardArticles(boardVO, master.getBbsAttrbCode());//2011.09.07
    	int totCnt = Integer.parseInt((String)map.get("resultCnt"));
    	
    	paginationInfo.setTotalRecordCount(totCnt);

    	model.addAttribute("user", user);
    	model.addAttribute("resultList", map.get("resultList"));
    	model.addAttribute("resultCnt", map.get("resultCnt"));
    	model.addAttribute("boardVO", boardVO);
    	model.addAttribute("brdMstrVO", master);
    	model.addAttribute("paginationInfo", paginationInfo);
    	model.addAttribute("totCnt", totCnt);
    	
    	System.out.println("aaa");

    	return "egovframework/gntbsc/wssms/sub02_01";
    }
    
    /**
     * 게시물에 대한 상세 정보를 조회한다.
     * 
     * @param boardVO
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/sb02/sub01_view.do")
    public String view_sb02_sub01(@ModelAttribute("searchVO") BoardVO boardVO, ModelMap model) throws Exception {
    	
    	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			return "redirect:/wssms/LoginUsr.do";
		}
    	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
    	int us_level = user.getUs_level();
    	model.addAttribute("us_level", us_level);
    	int m_level = user.getUs_level();
		if(m_level > 2) {
			return "redirect:/wssms/LoginUsr.do";
		}

    	// 조회수 증가 여부 지정
    	boardVO.setPlusCount(true);

    	//---------------------------------
    	// 2009.06.29 : 2단계 기능 추가
    	//---------------------------------
    	if (!boardVO.getSubPageIndex().equals("")) {
    		boardVO.setPlusCount(false);
    	}
    	////-------------------------------

    	if(user != null){
    		System.out.println("user.getUs_id():"+ user.getUs_id());
    		boardVO.setLastUpdusrId(user.getUs_id());
    	}
    	BoardVO vo = bbsMngService.selectBoardArticle(boardVO);

    	model.addAttribute("result", vo);
    	//CommandMap의 형태로 개선????

    	if(user != null){
    		model.addAttribute("sessionUniqId", user.getUs_id());
    	}

    	//----------------------------
    	// template 처리 (기본 BBS template 지정  포함)
    	//----------------------------
    	BoardMasterVO master = new BoardMasterVO();
    	
    	master.setBbsId(boardVO.getBbsId());
    	if(user != null){
    		master.setUniqId(user.getUs_id());
    	}
    	
    	BoardMasterVO masterVo = bbsAttrbService.selectBBSMasterInf(master);
    	
    	model.addAttribute("brdMstrVO", masterVo);
    	
    	if (bbsCommentService != null){
    		if (bbsCommentService.canUseComment(boardVO.getBbsId())) {
    		    model.addAttribute("useComment", "true");
    		}
    	}
    	//System.out.println("공지뷰12");

    	return "egovframework/gntbsc/wssms/sub02_01_view";
    }
    
    /**
     * 게시물 등록을 위한 등록페이지로 이동한다.
     * 
     * @param boardVO
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/sb02/sub01_write.do")
    public String write_sb02_sub01(@ModelAttribute("searchVO") BoardVO boardVO, ModelMap model) throws Exception {
    	
    	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			return "redirect:/wssms/LoginUsr.do";
		}
    	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
    	int us_level = user.getUs_level();
    	model.addAttribute("us_level", us_level);
    	int m_level = user.getUs_level();
		if(m_level > 2) {
			return "redirect:/wssms/LoginUsr.do";
		}

    	BoardMasterVO bdMstr = new BoardMasterVO();

    	if (isAuthenticated) {

    		BoardMasterVO vo = new BoardMasterVO();
    		vo.setBbsId(unscript(boardVO.getBbsId()));
    		vo.setUniqId(user.getUs_id());

    		bdMstr = bbsAttrbService.selectBBSMasterInf(vo);
    		model.addAttribute("bdMstr", bdMstr);
    	}

    	model.addAttribute("user", user);
    	model.addAttribute("brdMstrVO", bdMstr);
    	////-----------------------------

    	return "egovframework/gntbsc/wssms/sub02_01_write";
    }
    
    /**
     * 게시물을 등록한다.
     * 
     * @param boardVO
     * @param board
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/sb02/sub01_Add.do")
    public String add_sb02_sub01(final MultipartHttpServletRequest multiRequest, @ModelAttribute("searchVO") BoardVO boardVO,
	    @ModelAttribute("bdMstr") BoardMaster bdMstr, @ModelAttribute("board") Board board, BindingResult bindingResult, SessionStatus status,
	    ModelMap model) throws Exception {
    	
    	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			return "redirect:/wssms/LoginUsr.do";
		}
    	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
    	int us_level = user.getUs_level();
    	model.addAttribute("us_level", us_level);
    	int m_level = user.getUs_level();
		if(m_level > 2) {
			return "redirect:/wssms/LoginUsr.do";
		}

    	beanValidator.validate(board, bindingResult);
    	if (bindingResult.hasErrors()) {

    		BoardMasterVO master = new BoardMasterVO();
    		BoardMasterVO vo = new BoardMasterVO();
	    
    		vo.setBbsId(boardVO.getBbsId());
    		vo.setUniqId(user.getUs_id());

    		master = bbsAttrbService.selectBBSMasterInf(vo);
	    
    		model.addAttribute("bdMstr", master);

    		model.addAttribute("brdMstrVO", master);
    		////-----------------------------

    		return "redirect:/sb02/sub01_write.do";
    	}
	
    	if (isAuthenticated) {
    		List<FileVO> result = null;
    		String atchFileId = "";
	    
    		final Map<String, MultipartFile> files = multiRequest.getFileMap();
    		
    		if (!files.isEmpty()) {
    			result = fileUtil.parseFileInf(files, "BBS_", 0, "", "");
    			atchFileId = fileMngService.insertFileInfs(result);
    		}
    		
    		board.setAtchFileId(atchFileId);
    		board.setFrstRegisterId(user.getUs_id());
    		board.setBbsId(board.getBbsId());
	    
    		board.setPassword("");	// dummy 오류 수정 (익명이 아닌 경우 validator 처리를 위해 dummy로 지정됨)
	    
    		board.setNtcrId(user.getUs_id()); //게시물 통계 집계를 위해 등록자 ID 저장
    		board.setNtcrNm(user.getUs_name()); //게시물 통계 집계를 위해 등록자 Name 저장
	    
    		//board.setNttCn(unscript(board.getNttCn()));	// XSS 방지
	    
    		bbsMngService.insertBoardArticle(board);
    	}

    	//status.setComplete();
    	return "redirect:/sb02/sub01.do";
    }
    
    
    /**
     * 게시물에 대한 내용을 삭제한다.
     * 
     * @param boardVO
     * @param board
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/sb02/sub01_delete.do")
    public String delete_sb02_sub01(@ModelAttribute("searchVO") BoardVO boardVO, @ModelAttribute("board") Board board,
	    @ModelAttribute("bdMstr") BoardMaster bdMstr, ModelMap model) throws Exception {
	
    	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			return "redirect:/wssms/LoginUsr.do";
		}
    	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
    	int us_level = user.getUs_level();
    	model.addAttribute("us_level", us_level);
    	int m_level = user.getUs_level();
		if(m_level > 2) {
			return "redirect:/wssms/LoginUsr.do";
		}

    	if (isAuthenticated) {
    		board.setLastUpdusrId(user.getUs_id());
	    
    		bbsMngService.deleteBoardArticle(board);
    	}

    	return "redirect:/sb02/sub01.do";
    }
    
    
    /**
     * 게시물 수정을 위한 수정페이지로 이동한다.
     * 
     * @param boardVO
     * @param vo
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/sb02/sub01_modify.do")
    public String modi_sb02_sub01(@ModelAttribute("searchVO") BoardVO boardVO, @ModelAttribute("board") BoardVO vo, 
    		ModelMap model) throws Exception {

    	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			return "redirect:/wssms/LoginUsr.do";
		}
    	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
    	int us_level = user.getUs_level();
    	model.addAttribute("us_level", us_level);
    	int m_level = user.getUs_level();
		if(m_level > 2) {
			return "redirect:/wssms/LoginUsr.do";
		}

    	boardVO.setFrstRegisterId(user.getUs_id());
	
    	BoardMaster master = new BoardMaster();
    	BoardMasterVO bmvo = new BoardMasterVO();
    	BoardVO bdvo = new BoardVO();
	
    	vo.setBbsId(boardVO.getBbsId());
	
    	master.setBbsId(boardVO.getBbsId());
    	master.setUniqId(user.getUs_id());

    	if (isAuthenticated) {
    		bmvo = bbsAttrbService.selectBBSMasterInf(master);
    		bdvo = bbsMngService.selectBoardArticle(boardVO);
    	}

    	model.addAttribute("result", bdvo);
    	model.addAttribute("bdMstr", bmvo);

    	model.addAttribute("user", user);
    	model.addAttribute("brdMstrVO", bmvo);
    	////-----------------------------
	
    	return "egovframework/gntbsc/wssms/sub02_01_modi";
    }
    
    
    /**
     * 게시물에 대한 내용을 수정한다.
     * 
     * @param boardVO
     * @param board
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/sb02/sub01_Updt.do")
    public String updt_sb02_sub01(final MultipartHttpServletRequest multiRequest, @ModelAttribute("searchVO") BoardVO boardVO,
	    @ModelAttribute("bdMstr") BoardMaster bdMstr, @ModelAttribute("board") Board board, BindingResult bindingResult, ModelMap model,
	    SessionStatus status) throws Exception {

    	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			return "redirect:/wssms/LoginUsr.do";
		}
    	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
    	int us_level = user.getUs_level();
    	model.addAttribute("us_level", us_level);
    	int m_level = user.getUs_level();
		if(m_level > 2) {
			return "redirect:/wssms/LoginUsr.do";
		}
		
    	String atchFileId = boardVO.getAtchFileId();

    	beanValidator.validate(board, bindingResult);
    	if (bindingResult.hasErrors()) {

    		boardVO.setFrstRegisterId(user.getUs_id());
	    
    		BoardMaster master = new BoardMaster();
    		BoardMasterVO bmvo = new BoardMasterVO();
    		BoardVO bdvo = new BoardVO();
	    
    		master.setBbsId(boardVO.getBbsId());
    		master.setUniqId(user.getUs_id());

    		bmvo = bbsAttrbService.selectBBSMasterInf(master);
    		bdvo = bbsMngService.selectBoardArticle(boardVO);

    		model.addAttribute("result", bdvo);
    		model.addAttribute("bdMstr", bmvo);

    		return "redirect:/sb02/sub01_modify.do";
    	}
	
    	System.out.println("저장1");
    	if (isAuthenticated) {
    		final Map<String, MultipartFile> files = multiRequest.getFileMap();
    		if (!files.isEmpty()) {
    			if ("".equals(atchFileId)) {
    				List<FileVO> result = fileUtil.parseFileInf(files, "BBS_", 0, atchFileId, "");
    				atchFileId = fileMngService.insertFileInfs(result);
    				board.setAtchFileId(atchFileId);
    			} else {
    				FileVO fvo = new FileVO();
    				fvo.setAtchFileId(atchFileId);
    				int cnt = fileMngService.getMaxFileSN(fvo);
    				List<FileVO> _result = fileUtil.parseFileInf(files, "BBS_", cnt, atchFileId, "");
    				fileMngService.updateFileInfs(_result);
    			}
    		}

    		System.out.println("저장2");
    		board.setLastUpdusrId(user.getUs_id());
	    
    		//board.setNtcrNm("");	// dummy 오류 수정 (익명이 아닌 경우 validator 처리를 위해 dummy로 지정됨)
    		board.setPassword("");	// dummy 오류 수정 (익명이 아닌 경우 validator 처리를 위해 dummy로 지정됨)
	    
    		//System.out.println("저장3");
    		//board.setNttCn(unscript(board.getNttCn()));	// XSS 방지
	    
    		bbsMngService.updateBoardArticle(board);
    	}
	
    	return "redirect:/sb02/sub01.do";
    }
}
