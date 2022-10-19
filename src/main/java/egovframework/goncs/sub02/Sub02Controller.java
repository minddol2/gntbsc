package egovframework.goncs.sub02;

import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.goncs.bbs.service.BBSAttributeManageService;
import egovframework.goncs.bbs.service.BBSCommentService;
import egovframework.goncs.bbs.service.BBSManageService;
import egovframework.goncs.bbs.service.BoardMasterVO;
import egovframework.goncs.bbs.service.BoardVO;
import egovframework.goncs.member.service.LoginVO;
import egovframework.goncs.sub01.Sub01Controller;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class Sub02Controller {
	
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

	private static final Logger LOGGER = LoggerFactory.getLogger(Sub02Controller.class);
	
	@RequestMapping(value = "/sub02/sub01_01.do")
	public String get_sub02_page_01(ModelMap model, Locale locale) throws Exception{

		String lang_temp = (String) locale.getLanguage();
		model.addAttribute("lang_temp", lang_temp);
				
		return "egovframework/gntbsc/sub02/sub01_01";
	}
	
	@RequestMapping(value = "/sub02/sub02_01.do")
	public String get_sub02_page_02(ModelMap model, Locale locale) throws Exception{

		String lang_temp = (String) locale.getLanguage();
		model.addAttribute("lang_temp", lang_temp);
				
		return "egovframework/gntbsc/sub02/sub02_01";
	}
	
	@RequestMapping(value = "/sub02/sub02_02.do")
	public String get_sub02_page_022(ModelMap model, Locale locale) throws Exception{

		String lang_temp = (String) locale.getLanguage();
		model.addAttribute("lang_temp", lang_temp);
				
		return "egovframework/gntbsc/sub02/sub02_02";
	}
	
	@RequestMapping(value = "/sub02/sub02_03.do")
	public String get_sub02_page_023(ModelMap model, Locale locale) throws Exception{

		String lang_temp = (String) locale.getLanguage();
		model.addAttribute("lang_temp", lang_temp);
				
		return "egovframework/gntbsc/sub02/sub02_03";
	}
	
	@RequestMapping(value = "/sub02/sub03_01.do")
	public String get_sub02_page_03(ModelMap model, Locale locale) throws Exception{

		String lang_temp = (String) locale.getLanguage();
		model.addAttribute("lang_temp", lang_temp);
				
		return "egovframework/gntbsc/sub02/sub03_01";
	}
	
	@RequestMapping(value = "/sub02/sub03_02.do")
	public String get_sub02_page_032(ModelMap model, Locale locale) throws Exception{

		String lang_temp = (String) locale.getLanguage();
		model.addAttribute("lang_temp", lang_temp);
				
		return "egovframework/gntbsc/sub02/sub03_02";
	}
	
	@RequestMapping(value = "/sub02/sub03_03.do")
	public String get_sub02_page_033(ModelMap model, Locale locale) throws Exception{

		String lang_temp = (String) locale.getLanguage();
		model.addAttribute("lang_temp", lang_temp);
				
		return "egovframework/gntbsc/sub02/sub03_03";
	}
	
	@RequestMapping(value = "/sub02/sub03_04.do")
	public String get_sub02_page_034(ModelMap model, Locale locale) throws Exception{

		String lang_temp = (String) locale.getLanguage();
		model.addAttribute("lang_temp", lang_temp);
				
		return "egovframework/gntbsc/sub02/sub03_04";
	}
	
	@RequestMapping(value = "/sub02/sub04_01.do")
	public String get_sub02_page_04(ModelMap model, Locale locale) throws Exception{

		String lang_temp = (String) locale.getLanguage();
		model.addAttribute("lang_temp", lang_temp);
				
		return "egovframework/gntbsc/sub02/sub04_01";
	}
	
	@RequestMapping(value = "/sub02/sub05_01.do")
	public String get_sub02_page_05(@ModelAttribute("searchVO") BoardVO boardVO, ModelMap model) throws Exception {

		int us_level = 5;
    	LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
    	if(user == null) {
    		us_level = 5;
    	} else {
    		us_level = user.getUs_level();
    	}
		model.addAttribute("us_level", us_level);

    	boardVO.setBbsId("BBSMSTR_000000000305");
    	    	
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
				
		return "egovframework/gntbsc/sub02/sub05_01";
	}
	
	@RequestMapping(value = "/sub02/sub05_01v.do")
	public String get_sub02_page_05v(@ModelAttribute("searchVO") BoardVO boardVO, ModelMap model) throws Exception {

		int us_level = 5;
    	LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
    	if(user == null) {
    		us_level = 5;
    	} else {
    		us_level = user.getUs_level();
    	}
		model.addAttribute("us_level", us_level);

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
				
		return "egovframework/gntbsc/sub02/sub05_01_view";
	}
	
}
