package egovframework.goncs.sub03;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.HandlerMapping;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.com.cmm.service.FileVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.goncs.bbs.service.BBSAttributeManageService;
import egovframework.goncs.bbs.service.BBSCommentService;
import egovframework.goncs.bbs.service.BBSManageService;
import egovframework.goncs.bbs.service.BoardMasterVO;
import egovframework.goncs.bbs.service.BoardVO;
import egovframework.goncs.member.service.LoginVO;
import egovframework.goncs.sub02.Sub02Controller;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class Sub03Controller {

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

    @Resource(name = "egovMessageSource")
    EgovMessageSource egovMessageSource;

    @Autowired(required = false)
    private BBSCommentService bbsCommentService;

    @Autowired
    private DefaultBeanValidator beanValidator;

    private static final Logger LOGGER = LoggerFactory.getLogger(Sub03Controller.class);

    @RequestMapping(value = {"/sub03/sub01_01.do", "/sub03/sub01_01_test.do"})
    public String get_sub03_page_01(@ModelAttribute("searchVO") BoardVO boardVO, ModelMap model, Locale locale, HttpServletRequest request) throws Exception {

        int us_level = 5;
        LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
        if (user == null) {
            us_level = 5;
        } else {
            us_level = user.getUs_level();
        }
        model.addAttribute("us_level", us_level);

        boardVO.setBbsId("BBSMSTR_000000000309");

        BoardMasterVO vo = new BoardMasterVO();
        vo.setBbsId(boardVO.getBbsId());
        //vo.setUniqId(user.getUniqId());
        System.out.println("boardVO.getBbsId() : " + boardVO.getBbsId());

        BoardMasterVO master = bbsAttrbService.selectBBSMasterInf(vo);

        boardVO.setPageUnit(12);
        boardVO.setPageSize(10);

        PaginationInfo paginationInfo = new PaginationInfo();

        paginationInfo.setCurrentPageNo(boardVO.getPageIndex());
        paginationInfo.setRecordCountPerPage(12);
        paginationInfo.setPageSize(boardVO.getPageSize());

        boardVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
        boardVO.setLastIndex(paginationInfo.getLastRecordIndex());
        boardVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

        Map<String, Object> map = bbsMngService.selectBoardArticles(boardVO, master.getBbsAttrbCode());//2011.09.07
        int totCnt = Integer.parseInt((String) map.get("resultCnt"));

        paginationInfo.setTotalRecordCount(totCnt);

        model.addAttribute("user", user);
        model.addAttribute("resultList", map.get("resultList"));
        model.addAttribute("resultCnt", map.get("resultCnt"));
        model.addAttribute("boardVO", boardVO);
        model.addAttribute("brdMstrVO", master);
        model.addAttribute("paginationInfo", paginationInfo);
        model.addAttribute("totCnt", totCnt);

        //return "egovframework/gntbsc/sub03/sub01_01";

        String requestUrl = (String) request.getAttribute(HandlerMapping.PATH_WITHIN_HANDLER_MAPPING_ATTRIBUTE);
        String returnUrl = "";
        System.out.println("url test start");
        System.out.println(requestUrl);
        System.out.println("url test end");
        if (requestUrl.equals("/sub03/sub01_01.do")) {
            returnUrl = "egovframework/gntbsc/sub03/sub01_01";
        } else if (requestUrl.equals("/sub03/sub01_01_test.do")) {
            returnUrl = "egovframework/gntbsc/sub03/sub01_01_test";
        } else {
            returnUrl = "egovframework/sub03/sub01_01";
        }

        return returnUrl;
    }

    @RequestMapping(value = {"/sub03/sub01_01v.do", "/sub03/sub01_01v_test.do"})
    public String get_sub03_page_01v(@ModelAttribute("searchVO") BoardVO boardVO, ModelMap model, HttpServletRequest request) throws Exception {

        int us_level = 5;
        LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
        if (user == null) {
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

        if (user != null) {
            System.out.println("user.getUs_id():" + user.getUs_id());
            boardVO.setLastUpdusrId(user.getUs_id());
        }
        BoardVO vo = bbsMngService.selectBoardArticle(boardVO);

        model.addAttribute("result", vo);
        //CommandMap의 형태로 개선????

        if (user != null) {
            model.addAttribute("sessionUniqId", user.getUs_id());
        }

        //----------------------------
        // template 처리 (기본 BBS template 지정  포함)
        //----------------------------
        BoardMasterVO master = new BoardMasterVO();

        master.setBbsId(boardVO.getBbsId());
        if (user != null) {
            master.setUniqId(user.getUs_id());
        }

        BoardMasterVO masterVo = bbsAttrbService.selectBBSMasterInf(master);

        model.addAttribute("brdMstrVO", masterVo);

        if (bbsCommentService != null) {
            if (bbsCommentService.canUseComment(boardVO.getBbsId())) {
                model.addAttribute("useComment", "true");
            }
        }

        FileVO fileVO = new FileVO();
        fileVO.setAtchFileId(vo.getAtchFileId());
        List<FileVO> file_result = fileMngService.selectFileInfs(fileVO);

        model.addAttribute("file_result", file_result);

        //return "egovframework/gntbsc/sub03/sub01_01_view";

        String requestUrl = (String) request.getAttribute(HandlerMapping.PATH_WITHIN_HANDLER_MAPPING_ATTRIBUTE);
        String returnUrl = "";
        if (requestUrl.equals("/sub03/sub01_01v.do")) {
            returnUrl = "egovframework/gntbsc/sub03/sub01_01_view";
        } else if (requestUrl.equals("/sub03/sub01_01v_test.do")) {
            returnUrl = "egovframework/gntbsc/sub03/sub01_01_view_test";
        } else {
            returnUrl = "egovframework/gntbsc/sub03/sub01_01_view";
        }

        return returnUrl;
    }

    @RequestMapping(value = "/sub03/sub01_01_view.do")
    public String view_sub03_page_011(ModelMap model, Locale locale) throws Exception {

        String lang_temp = (String) locale.getLanguage();
        model.addAttribute("lang_temp", lang_temp);

        return "egovframework/gntbsc/sub03/sub01_01_view";
    }

    @RequestMapping(value = "/sub03/sub01_01_view2.do")
    public String view_sub03_page_0112(ModelMap model, Locale locale) throws Exception {

        String lang_temp = (String) locale.getLanguage();
        model.addAttribute("lang_temp", lang_temp);

        return "egovframework/gntbsc/sub03/sub01_01_view2";
    }

    @RequestMapping(value = "/sub03/sub01_01_view3.do")
    public String view_sub03_page_0113(ModelMap model, Locale locale) throws Exception {

        String lang_temp = (String) locale.getLanguage();
        model.addAttribute("lang_temp", lang_temp);

        return "egovframework/gntbsc/sub03/sub01_01_view3";
    }

    @RequestMapping(value = "/sub03/sub01_01_view4.do")
    public String view_sub03_page_0114(ModelMap model, Locale locale) throws Exception {

        String lang_temp = (String) locale.getLanguage();
        model.addAttribute("lang_temp", lang_temp);

        return "egovframework/gntbsc/sub03/sub01_01_view4";
    }

    @RequestMapping(value = "/sub03/sub01_01_view5.do")
    public String view_sub03_page_0115(ModelMap model, Locale locale) throws Exception {

        String lang_temp = (String) locale.getLanguage();
        model.addAttribute("lang_temp", lang_temp);

        return "egovframework/gntbsc/sub03/sub01_01_view5";
    }

    @RequestMapping(value = "/sub03/sub01_01_view6.do")
    public String view_sub03_page_0116(ModelMap model, Locale locale) throws Exception {

        String lang_temp = (String) locale.getLanguage();
        model.addAttribute("lang_temp", lang_temp);

        return "egovframework/gntbsc/sub03/sub01_01_view6";
    }

    @RequestMapping(value = "/sub03/sub01_01_view7.do")
    public String view_sub03_page_0117(ModelMap model, Locale locale) throws Exception {

        String lang_temp = (String) locale.getLanguage();
        model.addAttribute("lang_temp", lang_temp);

        return "egovframework/gntbsc/sub03/sub01_01_view7";
    }

    @RequestMapping(value = "/sub03/sub01_01_view8.do")
    public String view_sub03_page_0118(ModelMap model, Locale locale) throws Exception {

        String lang_temp = (String) locale.getLanguage();
        model.addAttribute("lang_temp", lang_temp);

        return "egovframework/gntbsc/sub03/sub01_01_view8";
    }

    @RequestMapping(value = "/sub03/sub01_01_view9.do")
    public String view_sub03_page_0119(ModelMap model, Locale locale) throws Exception {

        String lang_temp = (String) locale.getLanguage();
        model.addAttribute("lang_temp", lang_temp);

        return "egovframework/gntbsc/sub03/sub01_01_view9";
    }

    @RequestMapping(value = "/sub03/sub01_01_view10.do")
    public String view_sub03_page_01110(ModelMap model, Locale locale) throws Exception {

        String lang_temp = (String) locale.getLanguage();
        model.addAttribute("lang_temp", lang_temp);

        return "egovframework/gntbsc/sub03/sub01_01_view10";
    }

    @RequestMapping(value = "/sub03/sub01_01_view11.do")
    public String view_sub03_page_01111(ModelMap model, Locale locale) throws Exception {

        String lang_temp = (String) locale.getLanguage();
        model.addAttribute("lang_temp", lang_temp);

        return "egovframework/gntbsc/sub03/sub01_01_view11";
    }

    @RequestMapping(value = "/sub03/sub01_01_view12.do")
    public String view_sub03_page_01112(ModelMap model, Locale locale) throws Exception {

        String lang_temp = (String) locale.getLanguage();
        model.addAttribute("lang_temp", lang_temp);

        return "egovframework/gntbsc/sub03/sub01_01_view12";
    }

    @RequestMapping(value = "/sub03/sub02_01.do")
    public String get_sub03_page_02(@ModelAttribute("searchVO") BoardVO boardVO, ModelMap model) throws Exception {

        int us_level = 5;
        LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
        if (user == null) {
            us_level = 5;
        } else {
            us_level = user.getUs_level();
        }
        model.addAttribute("us_level", us_level);

        boardVO.setBbsId("BBSMSTR_000000000307");

        BoardMasterVO vo = new BoardMasterVO();
        vo.setBbsId(boardVO.getBbsId());
        //vo.setUniqId(user.getUniqId());
        System.out.println("boardVO.getBbsId() : " + boardVO.getBbsId());

        BoardMasterVO master = bbsAttrbService.selectBBSMasterInf(vo);

        boardVO.setPageUnit(12);
        boardVO.setPageSize(10);

        PaginationInfo paginationInfo = new PaginationInfo();

        paginationInfo.setCurrentPageNo(boardVO.getPageIndex());
        paginationInfo.setRecordCountPerPage(12);
        paginationInfo.setPageSize(boardVO.getPageSize());

        boardVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
        boardVO.setLastIndex(paginationInfo.getLastRecordIndex());
        boardVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

        Map<String, Object> map = bbsMngService.selectBoardArticles(boardVO, master.getBbsAttrbCode());//2011.09.07
        int totCnt = Integer.parseInt((String) map.get("resultCnt"));

        paginationInfo.setTotalRecordCount(totCnt);

        model.addAttribute("user", user);
        model.addAttribute("resultList", map.get("resultList"));
        model.addAttribute("resultCnt", map.get("resultCnt"));
        model.addAttribute("boardVO", boardVO);
        model.addAttribute("brdMstrVO", master);
        model.addAttribute("paginationInfo", paginationInfo);
        model.addAttribute("totCnt", totCnt);

        return "egovframework/gntbsc/sub03/sub02_01";
    }

    @RequestMapping(value = "/sub03/sub02_01v.do")
    public String get_sub03_page_02v(@ModelAttribute("searchVO") BoardVO boardVO, ModelMap model) throws Exception {

        int us_level = 5;
        LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
        if (user == null) {
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

        if (user != null) {
            System.out.println("user.getUs_id():" + user.getUs_id());
            boardVO.setLastUpdusrId(user.getUs_id());
        }
        BoardVO vo = bbsMngService.selectBoardArticle(boardVO);

        model.addAttribute("result", vo);
        //CommandMap의 형태로 개선????

        if (user != null) {
            model.addAttribute("sessionUniqId", user.getUs_id());
        }

        //----------------------------
        // template 처리 (기본 BBS template 지정  포함)
        //----------------------------
        BoardMasterVO master = new BoardMasterVO();

        master.setBbsId(boardVO.getBbsId());
        if (user != null) {
            master.setUniqId(user.getUs_id());
        }

        BoardMasterVO masterVo = bbsAttrbService.selectBBSMasterInf(master);

        model.addAttribute("brdMstrVO", masterVo);

        if (bbsCommentService != null) {
            if (bbsCommentService.canUseComment(boardVO.getBbsId())) {
                model.addAttribute("useComment", "true");
            }
        }

        return "egovframework/gntbsc/sub03/sub02_01_view";
    }

    @RequestMapping(value = "/sub03/sub03_01.do")
    public String get_sub03_page_03(@ModelAttribute("searchVO") BoardVO boardVO, ModelMap model) throws Exception {

        int us_level = 5;
        LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
        if (user == null) {
            us_level = 5;
        } else {
            us_level = user.getUs_level();
        }
        model.addAttribute("us_level", us_level);

        boardVO.setBbsId("BBSMSTR_000000000309");

        BoardMasterVO vo = new BoardMasterVO();
        vo.setBbsId(boardVO.getBbsId());
        //vo.setUniqId(user.getUniqId());
        System.out.println("boardVO.getBbsId() : " + boardVO.getBbsId());

        BoardMasterVO master = bbsAttrbService.selectBBSMasterInf(vo);

        PaginationInfo paginationInfo = new PaginationInfo();
        paginationInfo.setRecordCountPerPage(12);
        boardVO.setFirstIndex(paginationInfo.getFirstRecordIndex());

        boardVO.setNoPaging(true); //페이징처리x

        System.out.println("boardVO.isNoPaging() start");
        System.out.println(boardVO.isNoPaging());
        System.out.println("boardVO.isNoPaging() end");

        Map<String, Object> map = bbsMngService.selectBoardArticles(boardVO, master.getBbsAttrbCode());//2011.09.07
        int totCnt = Integer.parseInt((String) map.get("resultCnt"));


        model.addAttribute("user", user);
        model.addAttribute("resultList", map.get("resultList"));
        model.addAttribute("resultCnt", map.get("resultCnt"));
        model.addAttribute("boardVO", boardVO);
        model.addAttribute("brdMstrVO", master);
        model.addAttribute("totCnt", totCnt);

        return "egovframework/gntbsc/sub03/sub03_01";
    }
}
