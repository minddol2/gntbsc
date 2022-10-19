package egovframework.goncs.wssms;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.utl.sim.service.EgovClntInfo;
import egovframework.goncs.member.service.LoginVO;
import egovframework.goncs.member.service.MemlogService;
import egovframework.goncs.member.service.MemlogVO;
import egovframework.goncs.member.service.PageLogVO;
import egovframework.goncs.member.service.PagelogService;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class Sb04Controller {

	/** PagelogService */
	@Resource(name = "pagelogService")
	private PagelogService pagelogService;
	
	/** MemlogService */
	@Resource(name = "memlogService")
	private MemlogService memlogService;
	
	@Resource(name = "propertiesService")
    protected EgovPropertyService propertyService;
	
	/** log */
	private static final Logger LOGGER = LoggerFactory.getLogger(Sb04Controller.class);
	
	/* 접속로그 화면 */
	@RequestMapping(value = "/sb04/sub01.do")
	public String get_Sb04_sub041(@ModelAttribute("searchVO") PageLogVO searchVO, HttpServletRequest request, ModelMap model) throws Exception{
		
		// 1. Spring Security 사용자권한 처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			return "redirect:/wssms/LoginUsr.do";
		}
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		int m_level = user.getUs_level();
		if(m_level > 2) {
			return "redirect:/wssms/LoginUsr.do";
		}
		
		// 접속IP
		String userIp = EgovClntInfo.getClntIP(request);
		LOGGER.debug("userIp : " + userIp);	
		
		searchVO.setPageUnit(propertyService.getInt("pageUnit"));
		searchVO.setPageSize(propertyService.getInt("pageSize"));
		
		PaginationInfo paginationInfo = new PaginationInfo();
		
    	paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
    	paginationInfo.setRecordCountPerPage(20);
    	paginationInfo.setPageSize(searchVO.getPageSize());

    	searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
    	searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
    	searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
    	
    	List<PageLogVO> pagelog_list = pagelogService.selectPagelogList(searchVO);
    	int totCnt = pagelogService.selectPagelogListCnt(searchVO);
		
		model.addAttribute("searchVO", searchVO);
		model.addAttribute("pagelog_list", pagelog_list);
		model.addAttribute("totCnt", totCnt);
		
		paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);
        
        //사용자 로그 저장
        //String userIp = EgovClntInfo.getClntIP(request);
        PageLogVO pagelogvo = new PageLogVO();
        pagelogvo.setPage_name("사용자 목록");
        pagelogvo.setM_id(user.getUs_id());
        pagelogvo.setCom_ip(userIp);
        pagelogService.insertPagelog(pagelogvo);
        /////로그 저장 완료
        
		return "egovframework/gntbsc/wssms/sub04_01";
	}
	
	/* 접속로그 화면 */
	@RequestMapping(value = "/sb04/sub02.do")
	public String get_Sb04_sub042(@ModelAttribute("searchVO") MemlogVO searchVO, HttpServletRequest request, ModelMap model) throws Exception{
		
		// 1. Spring Security 사용자권한 처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			return "redirect:/wssms/LoginUsr.do";
		}
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		int m_level = user.getUs_level();
		if(m_level > 2) {
			return "redirect:/wssms/LoginUsr.do";
		}
		
		// 접속IP
		String userIp = EgovClntInfo.getClntIP(request);
		LOGGER.debug("userIp : " + userIp);	
		
		searchVO.setPageUnit(propertyService.getInt("pageUnit"));
		searchVO.setPageSize(propertyService.getInt("pageSize"));
		
		PaginationInfo paginationInfo = new PaginationInfo();
		
    	paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
    	paginationInfo.setRecordCountPerPage(20);
    	paginationInfo.setPageSize(searchVO.getPageSize());

    	searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
    	searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
    	searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
    	
    	List<MemlogVO> memlog_list = memlogService.selectMemlogList(searchVO);
    	int totCnt = memlogService.selectMemlogListCnt(searchVO);
		
		model.addAttribute("searchVO", searchVO);
		model.addAttribute("memlog_list", memlog_list);
		model.addAttribute("totCnt", totCnt);
		
		paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);
        
        //사용자 로그 저장
        //String userIp = EgovClntInfo.getClntIP(request);
        PageLogVO pagelogvo = new PageLogVO();
        pagelogvo.setPage_name("사용자로그 목록");
        pagelogvo.setM_id(user.getUs_id());
        pagelogvo.setCom_ip(userIp);
        pagelogService.insertPagelog(pagelogvo);
        /////로그 저장 완료
        
		return "egovframework/gntbsc/wssms/sub04_02";
	}
}
