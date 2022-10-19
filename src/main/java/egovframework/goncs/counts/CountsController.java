package egovframework.goncs.counts;

import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.apache.poi.ss.util.CellRangeAddress;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.utl.sim.service.EgovClntInfo;
import egovframework.goncs.counts.service.CountsService;
import egovframework.goncs.counts.service.CountsVO;
import egovframework.goncs.member.service.LoginVO;
import egovframework.goncs.member.service.PageLogVO;
import egovframework.goncs.member.service.PagelogService;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class CountsController {

	/** PagelogService */
	@Resource(name = "pagelogService")
	private PagelogService pagelogService;
	
	/** countsService */
	@Resource(name = "countsService")
	private CountsService countsService;
	
	@Resource(name = "propertiesService")
    protected EgovPropertyService propertyService;
	
	/** log */
	private static final Logger LOGGER = LoggerFactory.getLogger(CountsController.class);
	
	/* 일바별 방문자 화면 */
	@RequestMapping(value = "/sb04/sub03.do")
	public String get_Sb04_sub043(@ModelAttribute("searchVO") CountsVO searchVO, HttpServletRequest request, ModelMap model, RedirectAttributes rttr) throws Exception{
		
		// 1. Spring Security 사용자권한 처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			rttr.addFlashAttribute("resultMsg", "로그인 후 이용이 가능합니다.");		
			return "redirect:/wssms/LoginUsr.do";
		}
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		int us_level = user.getUs_level();
		model.addAttribute("user", user);
		
		String resultMsg = "";
		Map<String, ?> redirectMap = RequestContextUtils.getInputFlashMap(request);
		if(redirectMap != null) {
			resultMsg = (String)redirectMap.get("resultMsg");
		}
		model.addAttribute("resultMsg", resultMsg);
		
		String strdat = searchVO.getStrdat();
		if(strdat.equals("")) {
			java.text.SimpleDateFormat formatter1 = new java.text.SimpleDateFormat ("yyyy-MM-dd", java.util.Locale.KOREA);
			strdat = formatter1.format(new java.util.Date());
			searchVO.setStrdat(strdat);
		}
		String enddat = searchVO.getEnddat();
		if(enddat.equals("")) {
			java.text.SimpleDateFormat formatter1 = new java.text.SimpleDateFormat ("yyyy-MM-dd", java.util.Locale.KOREA);
			enddat = formatter1.format(new java.util.Date());
			searchVO.setEnddat(enddat);
		}
		
		searchVO.setPageUnit(propertyService.getInt("pageUnit"));
		searchVO.setPageSize(propertyService.getInt("pageSize"));
		
		PaginationInfo paginationInfo = new PaginationInfo();
		
    	paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
    	paginationInfo.setRecordCountPerPage(20);
    	paginationInfo.setPageSize(searchVO.getPageSize());

    	searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
    	searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
    	searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
    	
		List<CountsVO> ct_list = countsService.selectCountsList(searchVO);
		int t_cnt = countsService.selectCountsListCnt(searchVO);
		int totCnt = countsService.selectCountsListPage(searchVO);
		
		model.addAttribute("searchVO", searchVO);
		model.addAttribute("ct_list", ct_list);
		model.addAttribute("totCnt", totCnt);
		model.addAttribute("t_cnt", t_cnt);
		
		paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);
		
		//사용자 로그 저장
        String userIp = EgovClntInfo.getClntIP(request);
        PageLogVO pagelogvo = new PageLogVO();
        pagelogvo.setPage_name("일자별 방문자 조회 목록");
        pagelogvo.setM_id(user.getUs_id());
        pagelogvo.setCom_ip(userIp);
        pagelogService.insertPagelog(pagelogvo);
        /////로그 저장 완료
		
		return "egovframework/gntbsc/wssms/sub04_03";
	}
	
	/* 일자별방문자 엑셀 다운로드 */
	@RequestMapping(value = "/sb04/sub03_excel.do")
	public void excel_Sb04_sub043(@ModelAttribute("searchVO") CountsVO searchVO, HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		int us_level = user.getUs_level();
				
		// 접속IP
		String userIp = EgovClntInfo.getClntIP(request);
		LOGGER.debug("userIp : " + userIp);
		
		//사용자 로그 저장
		//String userIp = EgovClntInfo.getClntIP(request);
        PageLogVO pagelogvo = new PageLogVO();
        pagelogvo.setPage_name("일자별 방문자 엑셀 다운로드");
        pagelogvo.setM_id(user.getUs_id());
        pagelogvo.setCom_ip(userIp);
        pagelogService.insertPagelog(pagelogvo);
        /////로그 저장 완료
		
        List<CountsVO> ct_list = countsService.selectCountsListXls(searchVO);
		
		// 워크북 생성
		Workbook wb = new HSSFWorkbook();
		Sheet sheet = wb.createSheet("일자별방문자");
		Row row = null;
		Cell cell = null;
		int rowNo = 0;
	
		// 헤더 생성
		row = sheet.createRow(rowNo++);
		cell = row.createCell(0);
		cell.setCellValue("접속일자");
		cell = row.createCell(1);
		cell.setCellValue("방문수");
		cell = row.createCell(2);

		// 데이터 부분 생성
		for(CountsVO vo : ct_list) {
			row = sheet.createRow(rowNo++);

			cell = row.createCell(0);
			cell.setCellValue(vo.getCt_datexx());
			cell = row.createCell(1);
			cell.setCellValue(vo.getCt_cnt());
		}
		
		// 엑셀 출력
		String xls_file_name = URLEncoder.encode("일자별방문자.xls","utf-8");
		response.setContentType("application/vnd.ms-excel");
		response.setHeader("Content-Disposition", "attachment;filename="+xls_file_name);
				
		wb.write(response.getOutputStream());
				
	}
	
	/* 월별 방문자 화면 */
	@RequestMapping(value = "/sb04/sub04.do")
	public String get_Sb04_sub044(@ModelAttribute("searchVO") CountsVO searchVO, HttpServletRequest request, ModelMap model, RedirectAttributes rttr) throws Exception{
		
		// 1. Spring Security 사용자권한 처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			rttr.addFlashAttribute("resultMsg", "로그인 후 이용이 가능합니다.");		
			return "redirect:/wssms/LoginUsr.do";
		}
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		int us_level = user.getUs_level();
		model.addAttribute("user", user);
		
		String resultMsg = "";
		Map<String, ?> redirectMap = RequestContextUtils.getInputFlashMap(request);
		if(redirectMap != null) {
			resultMsg = (String)redirectMap.get("resultMsg");
		}
		model.addAttribute("resultMsg", resultMsg);
		
		String syear = searchVO.getStrdat();
		String smon = searchVO.getStrdat();
		String sdatex = "";
		if(syear.equals("")) {
			java.text.SimpleDateFormat formatter1 = new java.text.SimpleDateFormat ("yyyy", java.util.Locale.KOREA);
			syear = formatter1.format(new java.util.Date());
			searchVO.setSyear(syear);
		}
		if(smon.equals("")) {
			java.text.SimpleDateFormat formatter2 = new java.text.SimpleDateFormat ("MM", java.util.Locale.KOREA);
			smon = formatter2.format(new java.util.Date());
			searchVO.setSmon(smon);
		}
		sdatex = syear + "-" + smon;
		searchVO.setCt_datex(sdatex);
		
		String eyear = searchVO.getStrdat();
		String emon = searchVO.getStrdat();
		String edatex = "";
		if(eyear.equals("")) {
			java.text.SimpleDateFormat formatter1 = new java.text.SimpleDateFormat ("yyyy", java.util.Locale.KOREA);
			eyear = formatter1.format(new java.util.Date());
			searchVO.setEyear(eyear);
		}
		if(emon.equals("")) {
			java.text.SimpleDateFormat formatter2 = new java.text.SimpleDateFormat ("MM", java.util.Locale.KOREA);
			emon = formatter2.format(new java.util.Date());
			searchVO.setEmon(emon);
		}
		edatex = eyear + "-" + emon;
		searchVO.setCt_datex(edatex);
		
		List<CountsVO> ct_list = countsService.selectCountsList2(searchVO);
		int t_cnt = countsService.selectCountsListCnt2(searchVO);

		model.addAttribute("searchVO", searchVO);
		model.addAttribute("ct_list", ct_list);
		model.addAttribute("t_cnt", t_cnt);
		
		//사용자 로그 저장
        String userIp = EgovClntInfo.getClntIP(request);
        PageLogVO pagelogvo = new PageLogVO();
        pagelogvo.setPage_name("요일별 방문자 조회 목록");
        pagelogvo.setM_id(user.getUs_id());
        pagelogvo.setCom_ip(userIp);
        pagelogService.insertPagelog(pagelogvo);
        /////로그 저장 완료
		
		return "egovframework/gntbsc/wssms/sub04_04";
	}
	
	/* 월별 엑셀 다운로드 */
	@RequestMapping(value = "/sb04/sub04_excel.do")
	public void excel_Sb04_sub044(@ModelAttribute("searchVO") CountsVO searchVO, HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		int us_level = user.getUs_level();
				
		// 접속IP
		String userIp = EgovClntInfo.getClntIP(request);
		LOGGER.debug("userIp : " + userIp);
		
		//사용자 로그 저장
        PageLogVO pagelogvo = new PageLogVO();
        pagelogvo.setPage_name("월별 방문자 조회 엑셀다운");
        pagelogvo.setM_id(user.getUs_id());
        pagelogvo.setCom_ip(userIp);
        pagelogService.insertPagelog(pagelogvo);
        /////로그 저장 완료
		
        List<CountsVO> ct_list = countsService.selectCountsList2(searchVO);
		
		// 워크북 생성
		Workbook wb = new HSSFWorkbook();
		Sheet sheet = wb.createSheet("월별방문자");
		Row row = null;
		Cell cell = null;
		int rowNo = 0;
	
		// 헤더 생성
		row = sheet.createRow(rowNo++);
		cell = row.createCell(0);
		cell.setCellValue("접속월");
		cell = row.createCell(1);
		cell.setCellValue("방문수");
		cell = row.createCell(2);

		// 데이터 부분 생성
		for(CountsVO vo : ct_list) {
			row = sheet.createRow(rowNo++);

			cell = row.createCell(0);
			cell.setCellValue(vo.getCt_datex());
			cell = row.createCell(1);
			cell.setCellValue(vo.getCt_cnt());
		}
		
		// 엑셀 출력
		String xls_file_name = URLEncoder.encode("월별방문자.xls","utf-8");
		response.setContentType("application/vnd.ms-excel");
		response.setHeader("Content-Disposition", "attachment;filename="+xls_file_name);
				
		wb.write(response.getOutputStream());
				
	}
	
	
}
