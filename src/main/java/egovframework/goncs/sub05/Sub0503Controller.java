package egovframework.goncs.sub05;

import java.util.Map;

import javax.annotation.Resource;

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
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class Sub0503Controller {

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
    
    @RequestMapping("/sub05/sub03_01.do")
    public String get_sub05_sub0301(@ModelAttribute("searchVO") BoardVO boardVO, ModelMap model) throws Exception {
    	
    	int us_level = 5;
    	LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
    	if(user == null) {
    		us_level = 5;
    	} else {
    		us_level = user.getUs_level();
    	}
		model.addAttribute("us_level", us_level);

    	boardVO.setBbsId("BBSMSTR_000000000303");
    	    	
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

    	Map<String, Object> map = bbsMngService.selectBoardArticleList_Faq(boardVO, master.getBbsAttrbCode());//2011.09.07
    	int totCnt = Integer.parseInt((String)map.get("resultCnt"));
    	
    	paginationInfo.setTotalRecordCount(totCnt);

    	model.addAttribute("user", user);
    	model.addAttribute("resultList", map.get("resultList"));
    	model.addAttribute("resultCnt", map.get("resultCnt"));
    	model.addAttribute("boardVO", boardVO);
    	model.addAttribute("brdMstrVO", master);
    	model.addAttribute("paginationInfo", paginationInfo);
    	model.addAttribute("totCnt", totCnt);

    	return "egovframework/gntbsc/sub05/sub03_01";
    }
}
