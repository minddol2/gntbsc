package egovframework.goncs.wssms;

import java.net.URLEncoder;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.utl.fcc.service.EgovStringUtil;
import egovframework.com.utl.sim.service.EgovClntInfo;
import egovframework.com.utl.sim.service.EgovFileScrty;
import egovframework.goncs.bbs.service.BBSCommentService;
import egovframework.goncs.bbs.service.BoardMasterVO;
import egovframework.goncs.bbs.service.BoardVO;
import egovframework.goncs.member.service.LoginVO;
import egovframework.goncs.member.service.McodeService;
import egovframework.goncs.member.service.McodeVO;
import egovframework.goncs.member.service.MemberService;
import egovframework.goncs.member.service.MemberVO;
import egovframework.goncs.member.service.MemlogService;
import egovframework.goncs.member.service.MemlogVO;
import egovframework.goncs.memto.service.MemtoService;
import egovframework.goncs.memto.service.MemtoVO;
import egovframework.goncs.memto.service.MentoComentService;
import egovframework.goncs.memto.service.MentoComentVO;
import egovframework.goncs.memto.service.MtSurveyService;
import egovframework.goncs.memto.service.MtSurveyVO;
import egovframework.goncs.memto.service.StatisService;
import egovframework.goncs.memto.service.StatisVO;
import egovframework.goncs.sub04.SmsSend24;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class Sb0501Controller {

	@Resource(name = "EgovFileMngService")
    private EgovFileMngService fileMngService;

    @Resource(name = "EgovFileMngUtil")
    private EgovFileMngUtil fileUtil;

    @Resource(name = "propertiesService")
    protected EgovPropertyService propertyService;
   
    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;
    
    /** MemtoService */
	@Resource(name = "memtoService")
	private MemtoService memtoService;
	
	/** McodeService */
	@Resource(name = "mcodeService")
	private McodeService mcodeService;
	
	/** MemberService */
	@Resource(name = "memberService")
	private MemberService memberService;
	
	/** MemlogService */
	@Resource(name = "memlogService")
	private MemlogService memlogService;
	
	/** MentoComentService */
	@Resource(name = "mentoComentService")
	private MentoComentService mentoComentService;
	
	/** MtSurveyService */
	@Resource(name = "mtSurveyService")
	private MtSurveyService mtSurveyService;
	
	/** StatisService */
	@Resource(name = "statisService")
	private StatisService statisService;
    
    @Autowired
    private DefaultBeanValidator beanValidator;
    
    //상담신청 목록
    @RequestMapping("/sb05/sub01.do")
    public String get_sb05_sub0501(@ModelAttribute("searchVO") MemtoVO searchVO, HttpServletRequest request, ModelMap model) throws Exception {
    	
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
		
		searchVO.setPageUnit(propertyService.getInt("pageUnit"));
		searchVO.setPageSize(propertyService.getInt("pageSize"));
		
		PaginationInfo paginationInfo = new PaginationInfo();
		
    	paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
    	paginationInfo.setRecordCountPerPage(20);
    	paginationInfo.setPageSize(searchVO.getPageSize());

    	searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
    	searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
    	searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
    	int totCnt = 0;
		List<MemtoVO> memto_list = memtoService.selectMemtoList(searchVO);
		totCnt = memtoService.selectMemtoListCnt(searchVO);
		
		model.addAttribute("searchVO", searchVO);
		model.addAttribute("memto_list", memto_list);
		model.addAttribute("totCnt", totCnt);
		
		paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);
        
        //접수
        MemtoVO mvo = new MemtoVO();
        int cntss = memtoService.selectMemtoListCnt(mvo);
        mvo.setStatus("1");
        int cnt1 = memtoService.selectMemtoListCnt(mvo);
        //접수완료
        mvo.setStatus("2");
        int cnt2 = memtoService.selectMemtoListCnt(mvo);
        //상담중
        mvo.setStatus("3");
        int cnt3 = memtoService.selectMemtoListCnt(mvo);
        //상담완료
        mvo.setStatus("4");
        int cnt4 = memtoService.selectMemtoListCnt(mvo);
        //처리완료
        Calendar day = Calendar.getInstance();
		int thisYear = day.get(Calendar.YEAR); // 년;
		int thisMonth = day.get(Calendar.MONTH); // 월 ( 0 ~ 11 );
		int thisDate = day.get(Calendar.DATE);
		
		String nMonth = "";
		if((thisMonth+1) < 10) {
			nMonth = "0" + Integer.toString(thisMonth+1);
		} else {
			nMonth = Integer.toString(thisMonth+1);
		}
        
        day.set(thisYear, thisMonth, thisDate);
        int lastDate = day.getActualMaximum(Calendar.DATE); 
		// 변수 선언및 오늘 날자 
		String sdate1 = Integer.toString(thisYear) + "-" + nMonth + "-01";
		String sdate2 = Integer.toString(thisYear) + "-" + nMonth + "-" + Integer.toString(lastDate);
		System.out.println("sdate1 : " + sdate1);
		System.out.println("sdate2 : " + sdate2);
        mvo.setStatus("5");
        mvo.setSdate(sdate1);
        mvo.setEdate(sdate2);
        int cnt5 = memtoService.selectMemtoListCnt(mvo);
        
        model.addAttribute("cntss", cntss);
        model.addAttribute("cnt1", cnt1);
        model.addAttribute("cnt2", cnt2);
        model.addAttribute("cnt3", cnt3);
        model.addAttribute("cnt4", cnt4);
        model.addAttribute("cnt5", cnt5);
        model.addAttribute("sdate1", sdate1);
        model.addAttribute("sdate2", sdate2);
        
        if( (!searchVO.getUs_major11().equals("")) && (!searchVO.getUs_major11().equals("0")) ) {
        	List<McodeVO> min_list1 = mcodeService.selectMcodeList(Integer.parseInt(searchVO.getUs_major11()));
        }

    	return "egovframework/gntbsc/wssms/sub05_01";
    }
    
    @RequestMapping("/sb05/sub01_modi.do")
    public String get_sb05_sub0501_modi(ModelMap model) throws Exception {
    	
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

    	return "egovframework/gntbsc/wssms/sub05_01_modify";
    }
    
    @RequestMapping("/sb05/sub01_view.do")
    public String get_sb05_sub0501_view(@ModelAttribute("searchVO") MemtoVO searchVO, HttpServletRequest request, ModelMap model) throws Exception {
    	
    	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			return "redirect:/wssms/LoginUsr.do";
		}
    	LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
    	int us_level = user.getUs_level();
		model.addAttribute("user", user);
		model.addAttribute("us_level", us_level);
		int m_level = user.getUs_level();
		if(m_level > 2) {
			return "redirect:/wssms/LoginUsr.do";
		}
		
		int idx = searchVO.getIdx();
		MemtoVO memto_result = new MemtoVO();
		
		memtoService.changeMemto_hit(idx);
		
		memto_result = memtoService.selectMemto(idx);
		
		model.addAttribute("searchVO", searchVO);
		model.addAttribute("memto_result", memto_result);
		
		//댓글
		String counsel_idx = Integer.toString(idx);
		MentoComentVO mcvo = new MentoComentVO();
		mcvo.setCounsel_idx(counsel_idx);
		
		List<MentoComentVO> coment_list = mentoComentService.selectMentoComentList(counsel_idx);
		int cmtCnt = mentoComentService.selectMentoComentListCnt(counsel_idx);
		
		model.addAttribute("coment_list", coment_list);
		model.addAttribute("cmtCnt", cmtCnt);	
		
		//리뷰
		MtSurveyVO msvo = new MtSurveyVO();
		msvo = mtSurveyService.selectMtSurvey2(counsel_idx);
		model.addAttribute("msvo", msvo);

    	return "egovframework/gntbsc/wssms/sub05_01_view";
    }
    
    //멘토링 방식 저장
    @RequestMapping(value = "/sb05/updateMentoGbn.do")
	public ModelAndView update_Sb05_mentoGbn(HttpServletRequest request) throws Exception {
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("jsonView");
		
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		String userIp = EgovClntInfo.getClntIP(request);
		
		String idx = EgovStringUtil.clearXSS(request.getParameter("idx"),"");
		String memto_gbn = EgovStringUtil.clearXSS(request.getParameter("memto_gbn"),"");
		String room_gbn = EgovStringUtil.clearXSS(request.getParameter("room_gbn"),"");
		String room_wdate = EgovStringUtil.clearXSS(request.getParameter("room_wdate"),"");
		String room_wtime1 = EgovStringUtil.clearXSS(request.getParameter("room_wtime1"),"");
		String room_wtime2 = EgovStringUtil.clearXSS(request.getParameter("room_wtime2"),"");
		
		if(!memto_gbn.equals("2") && !memto_gbn.equals("3") ) {
			room_gbn = "N";
			room_wdate = "";
			room_wtime1 = "";
			room_wtime2 = "";
		}
		
		MemtoVO mvo = new MemtoVO();
		mvo.setIdx(Integer.parseInt(idx));
		mvo.setMemto_gbn(memto_gbn);
		mvo.setRoom_gbn(room_gbn);
		mvo.setRoom_wdate(room_wdate);
		mvo.setRoom_wtime1(room_wtime1);
		mvo.setRoom_wtime2(room_wtime2);
		mvo.setSys_id(user.getUs_id());
		mvo.setCom_ip(userIp);
	
		memtoService.updateMemto_gbn(mvo);
		
		modelAndView.addObject("optionlist", "OK");
			
		return modelAndView;
	}
    
    //멘토지정
    @RequestMapping(value = "/sb05/updateMentos.do")
	public ModelAndView update_Sb04_mentos(@RequestParam("idx") int idx, @RequestParam("mento") String mento, @RequestParam("mobile") String mobile, HttpServletRequest request) throws Exception {
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("jsonView");
		
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		String userIp = EgovClntInfo.getClntIP(request);
		
		MemtoVO mvo = new MemtoVO();
		mvo.setIdx(idx);
		mvo.setMemto(mento);
		mvo.setStatus("2");
		mvo.setCom_ip(userIp);
		mvo.setSys_id(user.getUs_id());
		memtoService.changeMemto_info(mvo);
		
		//SmsSend24.AuthSms();
		
		//SmsSend24.Cafe24SmsSend(mobile, "상담신청이 매칭되었습니다. 홈페이지를 확인해 주세요. -경남관광기업지원센터");
		
		modelAndView.addObject("optionlist", "OK");
			
		return modelAndView;
	}
    
    //상담현황 선택 삭제
    @RequestMapping(value = "/sb05/sub01_sdele.do")
	public String dele_sb05_sub01_sdele(@RequestParam("idx") String[] idxs, HttpServletRequest request, ModelMap model, RedirectAttributes rttr) throws Exception{
		
		// 1. Spring Security 사용자권한 처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			return "redirect:/wssms/LoginUsr.do";
		}
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		
		MemtoVO mento_result = new MemtoVO();
		
		//참여자인지 체크
		int totCnt = 0;
		int memCnt = 0;
		String del_list = "";
		for(int j=0; j < idxs.length; j++) {
			int idx = Integer.parseInt(idxs[j]);
			int del_pass = 0;
			
			mento_result = memtoService.selectMemto(idx);

			//System.out.println("삭제할 자료 : " + bi_code);
			if(mento_result == null) {
				rttr.addFlashAttribute("resultMsg", "삭제할 자료가 없습니다");
				del_pass = 1;
			}
						
			//삭제
			if(del_pass == 0) {
				memtoService.deleteMemto(idx);
				
				del_list = del_list + ", " + idx;
			}

		}

        //System.out.println("단계8");
		//사용자 로그 저장
        String userIp = EgovClntInfo.getClntIP(request);
        MemlogVO memlogvo = new MemlogVO();
		memlogvo.setGubunx("상담신청 선택삭제 처리");
		memlogvo.setSubject("작업자:"+user.getUs_name() + " 삭제내용:" + del_list);
		memlogvo.setM_id(user.getUs_id());
		memlogvo.setCom_ip(userIp);
		memlogService.insertMemlog(memlogvo);
        /////로그 저장 완료
	
        //System.out.println("단계9");
        return "redirect:/sb05/sub01.do";
	}
    
    //상담현황 엑셀 다운로드
    @RequestMapping(value = "/sb05/sub01_excel.do")
	public void excel_sb05_sub0501(@ModelAttribute("searchVO") MemtoVO searchVO, HttpServletRequest request, HttpServletResponse response) throws Exception{
		
        List<MemtoVO> mento_list;
        mento_list = memtoService.selectMemtoXls(searchVO);
        int totCnt = memtoService.selectMemtoListCnt(searchVO);
        //int totCnt = 3;
		
		// 워크북 생성
		Workbook wb = new HSSFWorkbook();
		Sheet sheet = wb.createSheet("상담신청현황");
		Row row = null;
		Cell cell = null;
		int rowNo = 0;
		int row_count = 0;
	
		// 헤더 생성
		if(!searchVO.getSdate().equals("")) {
			row = sheet.createRow(rowNo++);
			cell = row.createCell(0);
			cell.setCellValue("검색 기간 : " + searchVO.getSdate() + "~" + searchVO.getEdate());

			row = sheet.createRow(rowNo++);
		}

		row = sheet.createRow(rowNo++);
		cell = row.createCell(0);
		cell.setCellValue("No");
		cell = row.createCell(1);
		cell.setCellValue("제목");
		cell = row.createCell(2);
		cell.setCellValue("작성일");
		cell = row.createCell(3);
		cell.setCellValue("작성자");
		cell = row.createCell(4);
		cell.setCellValue("상담유형");
		cell = row.createCell(5);
		cell.setCellValue("기업유형");
		cell = row.createCell(6);
		cell.setCellValue("담당멘토");
		cell = row.createCell(7);
		cell.setCellValue("멘토링방식");
		cell = row.createCell(8);
		cell.setCellValue("비고");
		cell = row.createCell(9);
		cell.setCellValue("멘토평점");
		cell = row.createCell(10);
		cell.setCellValue("시스템평점");

		// 데이터 부분 생성
		for(MemtoVO rq_vo : mento_list) {
			row = sheet.createRow(rowNo++);
			
			cell = row.createCell(0);
			cell.setCellValue(totCnt);
			cell = row.createCell(1);
			cell.setCellValue(rq_vo.getTitle());
			cell = row.createCell(2);
			cell.setCellValue(rq_vo.getReg_date());
			cell = row.createCell(3);
			cell.setCellValue(rq_vo.getUs_name());
			cell = row.createCell(4);
			cell.setCellValue(rq_vo.getUs_major11_nm());
			cell = row.createCell(5);
			if(rq_vo.getUs_buss_gbn().equals("1")) {
				cell.setCellValue("도내");
			} else if(rq_vo.getUs_buss_gbn().equals("1")) {
				cell.setCellValue("예비창업자");
			} else {
				cell.setCellValue("입주");
			}
			cell = row.createCell(6);
			cell.setCellValue(rq_vo.getMemto_nm());
			cell = row.createCell(7);
			if(rq_vo.getMemto_gbn().equals("1")) {
				cell.setCellValue("서면");
			} else if(rq_vo.getMemto_gbn().equals("2")) {
				if(rq_vo.getRoom_gbn() == null) {
					cell.setCellValue("화상사용안함" + " " + rq_vo.getRoom_date() + " " + rq_vo.getRoom_time1() + "~" + rq_vo.getRoom_time2() + " 참석인원" + rq_vo.getAtt_cnt() + "명");
				} else if(rq_vo.getRoom_gbn().equals("Y")) {
					cell.setCellValue("화상" + " " + rq_vo.getRoom_date() + " " + rq_vo.getRoom_time1() + "~" + rq_vo.getRoom_time2() 	+ " 참석인원" + rq_vo.getAtt_cnt() + "명");
				} else {
					cell.setCellValue("화상사용안함" + " " + rq_vo.getRoom_date() + " " + rq_vo.getRoom_time1() + "~" + rq_vo.getRoom_time2() + " 참석인원" + rq_vo.getAtt_cnt() + "명");
				}
			} else if(rq_vo.getMemto_gbn().equals("3")) {
				if(rq_vo.getRoom_gbn() == null) {
					cell.setCellValue("대면사용안함" + " " + rq_vo.getRoom_date() + " " + rq_vo.getRoom_time1() + "~" + rq_vo.getRoom_time2() + " 참석인원" + rq_vo.getAtt_cnt() + "명");
				} else if(rq_vo.getRoom_gbn().equals("Y")) {
					cell.setCellValue("대면" + " " + rq_vo.getRoom_date() + " " + rq_vo.getRoom_time1() + "~" + rq_vo.getRoom_time2() 	+ " 참석인원" + rq_vo.getAtt_cnt() + "명");
				} else {
					cell.setCellValue("대면사용안함" + " " + rq_vo.getRoom_date() + " " + rq_vo.getRoom_time1() + "~" + rq_vo.getRoom_time2() + " 참석인원" + rq_vo.getAtt_cnt() + "명");
				}
			}
			cell = row.createCell(8);
			if(rq_vo.getStatus().equals("1")) {
				cell.setCellValue("접수");
			} else if(rq_vo.getStatus().equals("2")) {
				cell.setCellValue("접수완료");
			} else if(rq_vo.getStatus().equals("3")) {
				cell.setCellValue("상담중");
			} else if(rq_vo.getStatus().equals("4")) {
				cell.setCellValue("상담완료");
			} else {
				cell.setCellValue("처리완료");
			}
			cell = row.createCell(9);
			DecimalFormat fm2 = new DecimalFormat("#.##");
			double point1 = rq_vo.getPoint();
			cell.setCellValue(fm2.format(point1));
			cell = row.createCell(10);
			double point2 = rq_vo.getPoint2();
			cell.setCellValue(fm2.format(point2));
			
			totCnt--;
		}
		
		// 엑셀 출력
		String xls_file_name = URLEncoder.encode("상담신청현황.xls","utf-8");
		response.setContentType("application/vnd.ms-excel");
		response.setHeader("Content-Disposition", "attachment;filename="+xls_file_name);
				
		wb.write(response.getOutputStream());
				
	}
    
    //멘토관리
    @RequestMapping("/sb05/sub02.do")
    public String get_sb05_sub0502(@ModelAttribute("searchVO") MemberVO searchVO, HttpServletRequest request, ModelMap model) throws Exception {
    	
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
		
		searchVO.setUs_gbn("3");
		
		searchVO.setPageUnit(propertyService.getInt("pageUnit"));
		searchVO.setPageSize(propertyService.getInt("pageSize"));
		
		PaginationInfo paginationInfo = new PaginationInfo();
		
    	paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
    	paginationInfo.setRecordCountPerPage(50);
    	paginationInfo.setPageSize(searchVO.getPageSize());

    	searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
    	searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
    	searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
    	int totCnt = 0;
		List<MemberVO> mem_list = memberService.selectMemberListm(searchVO);
		totCnt = memberService.selectMemberListCnt(searchVO);
		
		model.addAttribute("searchVO", searchVO);
		model.addAttribute("mem_list", mem_list);
		model.addAttribute("totCnt", totCnt);

		paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);
		
		Calendar day = Calendar.getInstance();
		int thisYear = day.get(Calendar.YEAR); // 년;
		int thisMonth = day.get(Calendar.MONTH); // 월 ( 0 ~ 11 );
		int thisDate = day.get(Calendar.DATE);
		
		String nMonth = "";
		if((thisMonth+1) < 10) {
			nMonth = "0" + Integer.toString(thisMonth+1);
		} else {
			nMonth = Integer.toString(thisMonth+1);
		}
        
        day.set(thisYear, thisMonth, thisDate);
        int lastDate = day.getActualMaximum(Calendar.DATE); 
		// 변수 선언및 오늘 날자 
		String sdate1 = Integer.toString(thisYear) + "-" + nMonth + "-01";
		String sdate2 = Integer.toString(thisYear) + "-" + nMonth + "-" + Integer.toString(lastDate);
		
		model.addAttribute("sdate1", sdate1);
		model.addAttribute("sdate2", sdate2);
		
		//전체 멘토
		MemberVO mmvo = new MemberVO();
		mmvo.setUs_gbn("3");
		int tCnt = memberService.selectMemberListCnt(mmvo);
		
		model.addAttribute("tCnt", tCnt);
		
		if( (!searchVO.getUs_major11().equals("")) && (!searchVO.getUs_major11().equals("0")) ) {
			List<McodeVO> min_list1 = mcodeService.selectMcodeList(Integer.parseInt(searchVO.getUs_major11()));
		
			model.addAttribute("min_list1", min_list1);
		}
		

    	return "egovframework/gntbsc/wssms/sub05_02";
    }
    
    //멘토 엑셀 다운로드
    @RequestMapping(value = "/sb05/sub02_excel.do")
	public void excel_sb05_sub0502(@ModelAttribute("searchVO") MemberVO searchVO, HttpServletRequest request, HttpServletResponse response) throws Exception{
		
    	searchVO.setUs_gbn("3");
    	
        List<MemberVO> men_list;
        men_list = memberService.selectMemberListXlsm(searchVO);
        int totCnt = memberService.selectMemberListCnt(searchVO);
		
		// 워크북 생성
		Workbook wb = new HSSFWorkbook();
		Sheet sheet = wb.createSheet("멘토목록");
		Row row = null;
		Cell cell = null;
		int rowNo = 0;
		int row_count = 0;
	
		// 헤더 생성
		row = sheet.createRow(rowNo++);
		cell = row.createCell(0);
		cell.setCellValue("No");
		cell = row.createCell(1);
		cell.setCellValue("아이디");
		cell = row.createCell(2);
		cell.setCellValue("유형");
		cell = row.createCell(3);
		cell.setCellValue("이름");
		cell = row.createCell(4);
		cell.setCellValue("휴대전화");
		cell = row.createCell(5);
		cell.setCellValue("구분");
		cell = row.createCell(6);
		cell.setCellValue("전문분야");
		cell = row.createCell(7);
		cell.setCellValue("화상");
		cell = row.createCell(8);
		cell.setCellValue("서면");
		cell = row.createCell(9);
		cell.setCellValue("대면");
		cell = row.createCell(10);
		cell.setCellValue("총건수");
		cell = row.createCell(11);
		cell.setCellValue("평가건수");
		cell = row.createCell(12);
		cell.setCellValue("평점");
		cell = row.createCell(13);

		// 데이터 부분 생성
		int idx = 0;
		for(MemberVO rq_vo : men_list) {
			row = sheet.createRow(rowNo++);
			
			cell = row.createCell(0);
			cell.setCellValue(totCnt);
			cell = row.createCell(1);
			cell.setCellValue(rq_vo.getUs_id());
			cell = row.createCell(2);
			if(rq_vo.getUs_mentoyn().equals("N")) {
				cell.setCellValue("대기");
			} else {
				cell.setCellValue("승인");
			}
			cell = row.createCell(3);
			cell.setCellValue(rq_vo.getUs_name());
			cell = row.createCell(4);
			cell.setCellValue(rq_vo.getUs_phone());
			cell = row.createCell(5);
			cell.setCellValue(rq_vo.getUs_major11_nm() + " " + rq_vo.getUs_major12_nm());
			cell = row.createCell(6);
			cell.setCellValue(rq_vo.getUs_major12_nm() + " " + rq_vo.getUs_major22_nm());
			cell = row.createCell(7);
			cell.setCellValue(rq_vo.getCam_cnt());
			cell = row.createCell(8);
			cell.setCellValue(rq_vo.getPap_cnt());
			cell = row.createCell(9);
			cell.setCellValue(rq_vo.getMan_cnt());
			cell = row.createCell(10);
			cell.setCellValue(rq_vo.getMento_cnt());
			cell = row.createCell(11);
			cell.setCellValue(rq_vo.getEnd_cnt());
			cell = row.createCell(12);
			DecimalFormat fm2 = new DecimalFormat("#.##");
			double avg_point = rq_vo.getAvg_point();
			cell.setCellValue(fm2.format(avg_point));
			
			totCnt--;
		}
		
		// 엑셀 출력
		String xls_file_name = URLEncoder.encode("멘토리스트.xls","utf-8");
		response.setContentType("application/vnd.ms-excel");
		response.setHeader("Content-Disposition", "attachment;filename="+xls_file_name);
				
		wb.write(response.getOutputStream());
				
	}
    
    //멘토 선택 승인
    @RequestMapping(value = "/sb05/sub02_schange.do")
	public String change_ReqpcSub02s(@RequestParam("idx") String[] idxs, HttpServletRequest request, ModelMap model, RedirectAttributes rttr) throws Exception{
	
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
		
		MemberVO men_result = new MemberVO();
		
		//존재하는지 체크
		int totCnt = 0;
		int memCnt = 0;
		String del_list = "";
		for(int j=0; j < idxs.length; j++) {
			int idx = Integer.parseInt(idxs[j]);
			int del_pass = 0;
			
			men_result = memberService.selectMember(idx);

			//System.out.println("상태수정할 자료 : " + idx);
			if(men_result == null) {
				rttr.addFlashAttribute("resultMsg", "상태변경할 자료가 없습니다");
				del_pass = 1;
			} else {
				if(men_result.getUs_mentoyn().equals("Y")) {
					del_pass = 1;
				}
			}
			
						
			//상태 수정
			if(del_pass == 0) {
				
				MemberVO rqvo = new MemberVO();
				rqvo.setIdx(idx);
				rqvo.setUs_mentoyn("Y");
					
				if(del_pass == 0) {
					memberService.updateMember_mento(idx);
					
				}
				
				del_list = del_list + ", " + men_result.getUs_name();
			}

		}		
		
		//사용자 로그 저장
        String userIp = EgovClntInfo.getClntIP(request);
        MemlogVO memlogvo = new MemlogVO();
		memlogvo.setGubunx("멘토 선택 승인");
		memlogvo.setSubject("작업자:"+user.getUs_name() + " 처리내용:" + del_list);
		memlogvo.setM_id(user.getUs_id());
		memlogvo.setCom_ip(userIp);
		memlogService.insertMemlog(memlogvo);
        /////로그 저장 완료
		
		return "redirect:/sb05/sub02.do";
		
    }
    
    //멘토 개인회원 승인
    @RequestMapping(value = "/sb05/sub02_schange2.do")
	public String change_ReqpcSub02s2(@RequestParam("idx") String[] idxs, HttpServletRequest request, ModelMap model, RedirectAttributes rttr) throws Exception{
	
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
		
		MemberVO men_result = new MemberVO();
		
		//존재하는지 체크
		int totCnt = 0;
		int memCnt = 0;
		String del_list = "";
		for(int j=0; j < idxs.length; j++) {
			int idx = Integer.parseInt(idxs[j]);
			int del_pass = 0;
			
			men_result = memberService.selectMember(idx);

			//System.out.println("상태수정할 자료 : " + idx);
			if(men_result == null) {
				rttr.addFlashAttribute("resultMsg", "상태변경할 자료가 없습니다");
				del_pass = 1;
			} else {
				if(men_result.getUs_mentoyn().equals("Y")) {
					del_pass = 1;
				}
			}
			
						
			//상태 수정
			if(del_pass == 0) {
									
				if(del_pass == 0) {
					memberService.updateMember_mento1(idx);
					
				}
				
				del_list = del_list + ", " + men_result.getUs_name();
			}

		}		
		
		//사용자 로그 저장
        String userIp = EgovClntInfo.getClntIP(request);
        MemlogVO memlogvo = new MemlogVO();
		memlogvo.setGubunx("멘토 선택 개인회원 승인");
		memlogvo.setSubject("작업자:"+user.getUs_name() + " 처리내용:" + del_list);
		memlogvo.setM_id(user.getUs_id());
		memlogvo.setCom_ip(userIp);
		memlogService.insertMemlog(memlogvo);
        /////로그 저장 완료
		
		return "redirect:/sb05/sub02.do";
		
    }
    
    //멘토 상세
    @RequestMapping("/sb05/sub02_view.do")
    public String get_sb05_sub0502_view(@ModelAttribute("searchVO") MemberVO searchVO, HttpServletRequest request, ModelMap model, RedirectAttributes rttr) throws Exception {
    	
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
		
		String resultMsg = "";
		Map<String, ?> redirectMap = RequestContextUtils.getInputFlashMap(request);
		if(redirectMap != null) {
			resultMsg = (String)redirectMap.get("resultMsg");
		}
		model.addAttribute("resultMsg", resultMsg);
		
		MemberVO mem_result = new MemberVO();
		mem_result = memberService.selectMember_mentos(searchVO.getIdx());
		model.addAttribute("mem_result", mem_result);
		
		MemberVO mem2_result = new MemberVO();
		mem2_result = memberService.selectMember_mento(mem_result.getUs_id());
		model.addAttribute("mem2_result", mem2_result);
		
		
		model.addAttribute("searchVO", searchVO);
		
		List<McodeVO> min_list1 = mcodeService.selectMcodeList(Integer.parseInt(mem_result.getUs_major11()));
		
		List<McodeVO> min_list2 = mcodeService.selectMcodeList(Integer.parseInt(mem_result.getUs_major21()));
		
		model.addAttribute("min_list1", min_list1);
		model.addAttribute("min_list2", min_list2);

    	return "egovframework/gntbsc/wssms/sub05_02_view";
    }
    
    //멘토저장
    @RequestMapping(value = "/sb05/sub02_Updt.do")
	public String save_Sb05_sub02(@ModelAttribute("searchVO") MemberVO searchVO, HttpServletRequest request, ModelMap model, RedirectAttributes rttr) throws Exception{
		
		// 1. Spring Security 사용자권한 처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			rttr.addFlashAttribute("resultMsg", "로그인 후 이용이 가능합니다.");		
			return "redirect:/wssms/LoginUsr.do";
		}
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		int m_level = user.getUs_level();
		model.addAttribute("user", user);
		if(m_level > 2) {
			return "redirect:/wssms/LoginUsr.do";
		}
		
		// 접속IP
		String userIp = EgovClntInfo.getClntIP(request);
		
		searchVO.setUs_name(EgovStringUtil.clearXSS(searchVO.getUs_name(),""));
		searchVO.setUs_position(EgovStringUtil.clearXSS(searchVO.getUs_position(),""));
		
		if( (searchVO == null) || (searchVO.getUs_id().equals("")) || (searchVO.getUs_name().equals("")) ) { 
			
			rttr.addFlashAttribute("resultMsg", "아이디를 확인하세요");
			return "redirect:/sb05/sub02_view.do";
		}
		
		searchVO.setUs_level(3);
		memberService.updateMember3(searchVO);
		
		//사용자 로그 저장
        //String userIp = EgovClntInfo.getClntIP(request);
		MemlogVO memlogvo = new MemlogVO();
		memlogvo.setGubunx("사용자 등록/수정 저장 처리");
		memlogvo.setSubject("작업자:"+user.getUs_name() + " ID: " + searchVO.getUs_id() + " 이름: " + searchVO.getUs_name() + " 권한:" + searchVO.getUs_level());
		memlogvo.setM_id(user.getUs_id());
		memlogvo.setCom_ip(userIp);
		memlogService.insertMemlog(memlogvo);
        /////로그 저장 완료
		
        rttr.addFlashAttribute("resultMsg", "정상 등록되었습니다");
		return "redirect:/sb05/sub02.do";
	}
    
    //신청통계
    @RequestMapping("/sb05/sub03.do")
    public String get_sb05_sub0503(HttpServletRequest request, ModelMap model) throws Exception {
    	
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
		
		String sdate = EgovStringUtil.clearXSS(request.getParameter("sdate"),"");
		String edate = EgovStringUtil.clearXSS(request.getParameter("edate"),"");

		
		StatisVO svo = new StatisVO();
		svo.setSdate(sdate);
		svo.setEdate(edate);

		//상담유형별
		StatisVO svo1 = new StatisVO();
		svo1 = statisService.selectStatis1(svo);
		
		model.addAttribute("svo1", svo1);
		
		//상세
		svo.setUs_major11("1");
		List<StatisVO> svo2 = statisService.selectStatis2List(svo);
		model.addAttribute("svo2", svo2);
		
		svo.setUs_major11("2");
		List<StatisVO> svo3 = statisService.selectStatis2List(svo);
		model.addAttribute("svo3", svo3);
		
		svo.setUs_major11("3");
		List<StatisVO> svo4 = statisService.selectStatis2List(svo);
		model.addAttribute("svo4", svo4);
		
		svo.setUs_major11("4");
		List<StatisVO> svo5 = statisService.selectStatis2List(svo);
		model.addAttribute("svo5", svo5);
		
		svo.setUs_major11("5");
		List<StatisVO> svo6 = statisService.selectStatis2List(svo);
		model.addAttribute("svo6", svo6);
		
		svo.setUs_major11("6");
		List<StatisVO> svo7 = statisService.selectStatis2List(svo);
		model.addAttribute("svo7", svo7);
		
		
		Calendar day = Calendar.getInstance();
		int thisYear = day.get(Calendar.YEAR); // 년;
		int thisMonth = day.get(Calendar.MONTH); // 월 ( 0 ~ 11 );
		int thisDate = day.get(Calendar.DATE);
		
		String nMonth = "";
		if((thisMonth+1) < 10) {
			nMonth = "0" + Integer.toString(thisMonth+1);
		} else {
			nMonth = Integer.toString(thisMonth+1);
		}
        
        day.set(thisYear, thisMonth, thisDate);
        int lastDate = day.getActualMaximum(Calendar.DATE); 
		// 변수 선언및 오늘 날자 
		String sdate1 = Integer.toString(thisYear) + "-" + nMonth + "-01";
		String sdate2 = Integer.toString(thisYear) + "-" + nMonth + "-" + Integer.toString(lastDate);
		
		model.addAttribute("sdate1", sdate1);
		model.addAttribute("sdate2", sdate2);
		model.addAttribute("searchVO", svo);

    	return "egovframework/gntbsc/wssms/sub05_03";
    }
    
    //통계 엑셀
    @RequestMapping(value = "/sb05/sub03_excel.do")
	public void excel_sb05_sub0503(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
    	String sdate = EgovStringUtil.clearXSS(request.getParameter("sdate"),"");
		String edate = EgovStringUtil.clearXSS(request.getParameter("edate"),"");
    	
		// 워크북 생성
		Workbook wb = new HSSFWorkbook();
		Sheet sheet = wb.createSheet("신청통계");
		Row row = null;
		Cell cell = null;
		int rowNo = 0;
		int row_count = 0;
	
		// 헤더 생성
		row = sheet.createRow(rowNo++);
    	cell = row.createCell(0);
    	cell.setCellValue("상담유형별");
    	cell = row.createCell(1);
    	cell.setCellValue("검색기간");
    	cell = row.createCell(2);
    	cell.setCellValue(sdate);
    	cell = row.createCell(3);
    	cell.setCellValue(edate);
    	
		row = sheet.createRow(rowNo++);
		cell = row.createCell(0);
		cell.setCellValue("창업");
		cell = row.createCell(1);
		cell.setCellValue("마케팅/홍보");
		cell = row.createCell(2);
		cell.setCellValue("투자");
		cell = row.createCell(3);
		cell.setCellValue("경영심화");
		cell = row.createCell(4);
		cell.setCellValue("관광");
		cell = row.createCell(5);
		cell.setCellValue("제품디자인");
		
		StatisVO svo = new StatisVO();
		svo.setSdate(sdate);
		svo.setEdate(edate);

		//상담유형별
		StatisVO svo1 = new StatisVO();
		svo1 = statisService.selectStatis1(svo);
		
		row = sheet.createRow(rowNo++);
		cell = row.createCell(0);
		cell.setCellValue(svo1.getS_item1());
		cell = row.createCell(1);
		cell.setCellValue(svo1.getS_item2());
		cell = row.createCell(2);
		cell.setCellValue(svo1.getS_item3());
		cell = row.createCell(3);
		cell.setCellValue(svo1.getS_item4());
		cell = row.createCell(4);
		cell.setCellValue(svo1.getS_item5());
		cell = row.createCell(5);
		cell.setCellValue(svo1.getS_item7());
		
		row = sheet.createRow(rowNo++);
		cell = row.createCell(0);
		cell.setCellValue("총 합계:");
		cell = row.createCell(1);
		cell.setCellValue(svo1.getS_item6());
		
		//상세 
		svo.setUs_major11("1");
		List<StatisVO> svo2 = statisService.selectStatis2List(svo);
		
		svo.setUs_major11("2");
		List<StatisVO> svo3 = statisService.selectStatis2List(svo);
		
		svo.setUs_major11("3");
		List<StatisVO> svo4 = statisService.selectStatis2List(svo);
		
		svo.setUs_major11("4");
		List<StatisVO> svo5 = statisService.selectStatis2List(svo);
		
		svo.setUs_major11("5");
		List<StatisVO> svo6 = statisService.selectStatis2List(svo);
				
		svo.setUs_major11("6");
		List<StatisVO> svo7 = statisService.selectStatis2List(svo);
				
		//창업
		row = sheet.createRow(rowNo++);
    	cell = row.createCell(0);
    	cell.setCellValue("");
		
    	row = sheet.createRow(rowNo++);
    	cell = row.createCell(0);
    	cell.setCellValue("상담유형상세");
    	cell = row.createCell(1);
    	cell.setCellValue("검색기간");
    	cell = row.createCell(2);
    	cell.setCellValue(sdate);
    	cell = row.createCell(3);
    	cell.setCellValue(edate);
    	
		row = sheet.createRow(rowNo++);
		cell = row.createCell(0);
		cell.setCellValue("창업");
		cell = row.createCell(1);
		cell.setCellValue("");
		cell = row.createCell(2);
		cell.setCellValue("통계");
		cell = row.createCell(3);
		cell.setCellValue("");
		cell = row.createCell(4);
		cell.setCellValue("");
		
		row = sheet.createRow(rowNo++);
		cell = row.createCell(0);
		cell.setCellValue("");
		cell = row.createCell(1);
		cell.setCellValue("");
		cell = row.createCell(2);
		cell.setCellValue("전체");
		cell = row.createCell(3);
		cell.setCellValue("도내기업");
		cell = row.createCell(4);
		cell.setCellValue("입주기업");
		cell = row.createCell(5);
		cell.setCellValue("예비창업자");
		cell = row.createCell(6);
		cell.setCellValue("서면");
		cell = row.createCell(7);
		cell.setCellValue("화상");
		cell = row.createCell(8);
		cell.setCellValue("대면");
		
		// 데이터 부분 생성
		int t_hap1 = 0;
		int t_hap2 = 0;
		int t_hap3 = 0;
		int t_hap4 = 0;
		int t_hap5 = 0;
		int t_hap6 = 0;
		int t_hap7 = 0;
		for(StatisVO rq_vo : svo2) {
			row = sheet.createRow(rowNo++);
			cell = row.createCell(0);
			cell.setCellValue("");
			cell = row.createCell(1);
			cell.setCellValue(rq_vo.getUs_major12_nm());
			cell = row.createCell(2);
			cell.setCellValue(rq_vo.getS_item1());
			cell = row.createCell(3);
			cell.setCellValue(rq_vo.getS_item2());
			cell = row.createCell(4);
			cell.setCellValue(rq_vo.getS_item3());
			cell = row.createCell(5);
			cell.setCellValue(rq_vo.getS_item4());
			cell = row.createCell(6);
			cell.setCellValue(rq_vo.getS_item5());
			cell = row.createCell(7);
			cell.setCellValue(rq_vo.getS_item6());
			cell = row.createCell(8);
			cell.setCellValue(rq_vo.getS_item7());
			
			t_hap1 = t_hap1 + rq_vo.getS_item1();
			t_hap2 = t_hap2 + rq_vo.getS_item2();
			t_hap3 = t_hap3 + rq_vo.getS_item3();
			t_hap4 = t_hap4 + rq_vo.getS_item4();
			t_hap5 = t_hap5 + rq_vo.getS_item5();
			t_hap6 = t_hap6 + rq_vo.getS_item6();
			t_hap7 = t_hap7 + rq_vo.getS_item7();
		}
		
		row = sheet.createRow(rowNo++);
		cell = row.createCell(0);
		cell.setCellValue("합계");
		cell = row.createCell(1);
		cell.setCellValue("");
		cell = row.createCell(2);
		cell.setCellValue(t_hap1);
		cell = row.createCell(3);
		cell.setCellValue(t_hap2);
		cell = row.createCell(4);
		cell.setCellValue(t_hap3);
		cell = row.createCell(5);
		cell.setCellValue(t_hap4);
		cell = row.createCell(6);
		cell.setCellValue(t_hap5);
		cell = row.createCell(7);
		cell.setCellValue(t_hap6);
		cell = row.createCell(8);
		cell.setCellValue(t_hap7);
		
		//마케팅/홍보
		row = sheet.createRow(rowNo++);
    	cell = row.createCell(0);
    	cell.setCellValue("");
		
    	row = sheet.createRow(rowNo++);
    	cell = row.createCell(0);
    	cell.setCellValue("상담유형상세");
    	cell = row.createCell(1);
    	cell.setCellValue("검색기간");
    	cell = row.createCell(2);
    	cell.setCellValue(sdate);
    	cell = row.createCell(3);
    	cell.setCellValue(edate);
    	
		row = sheet.createRow(rowNo++);
		cell = row.createCell(0);
		cell.setCellValue("마케팅/홍보");
		cell = row.createCell(1);
		cell.setCellValue("");
		cell = row.createCell(2);
		cell.setCellValue("통계");
		cell = row.createCell(3);
		cell.setCellValue("");
		cell = row.createCell(4);
		cell.setCellValue("");
		
		row = sheet.createRow(rowNo++);
		cell = row.createCell(0);
		cell.setCellValue("");
		cell = row.createCell(1);
		cell.setCellValue("");
		cell = row.createCell(2);
		cell.setCellValue("전체");
		cell = row.createCell(3);
		cell.setCellValue("도내기업");
		cell = row.createCell(4);
		cell.setCellValue("입주기업");
		cell = row.createCell(5);
		cell.setCellValue("예비창업자");
		cell = row.createCell(6);
		cell.setCellValue("서면");
		cell = row.createCell(7);
		cell.setCellValue("화상");
		cell = row.createCell(8);
		cell.setCellValue("대면");
		
		// 데이터 부분 생성
		t_hap1 = 0;
		t_hap2 = 0;
		t_hap3 = 0;
		t_hap4 = 0;
		t_hap5 = 0;
		t_hap6 = 0;
		t_hap7 = 0;
		for(StatisVO rq_vo : svo3) {
			row = sheet.createRow(rowNo++);
			cell = row.createCell(0);
			cell.setCellValue("");
			cell = row.createCell(1);
			cell.setCellValue(rq_vo.getUs_major12_nm());
			cell = row.createCell(2);
			cell.setCellValue(rq_vo.getS_item1());
			cell = row.createCell(3);
			cell.setCellValue(rq_vo.getS_item2());
			cell = row.createCell(4);
			cell.setCellValue(rq_vo.getS_item3());
			cell = row.createCell(5);
			cell.setCellValue(rq_vo.getS_item4());
			cell = row.createCell(6);
			cell.setCellValue(rq_vo.getS_item5());
			cell = row.createCell(7);
			cell.setCellValue(rq_vo.getS_item6());
			cell = row.createCell(8);
			cell.setCellValue(rq_vo.getS_item7());
			
			t_hap1 = t_hap1 + rq_vo.getS_item1();
			t_hap2 = t_hap2 + rq_vo.getS_item2();
			t_hap3 = t_hap3 + rq_vo.getS_item3();
			t_hap4 = t_hap4 + rq_vo.getS_item4();
			t_hap5 = t_hap5 + rq_vo.getS_item5();
			t_hap6 = t_hap6 + rq_vo.getS_item6();
			t_hap7 = t_hap7 + rq_vo.getS_item7();
		}
		row = sheet.createRow(rowNo++);
		cell = row.createCell(0);
		cell.setCellValue("합계");
		cell = row.createCell(1);
		cell.setCellValue("");
		cell = row.createCell(2);
		cell.setCellValue(t_hap1);
		cell = row.createCell(3);
		cell.setCellValue(t_hap2);
		cell = row.createCell(4);
		cell.setCellValue(t_hap3);
		cell = row.createCell(5);
		cell.setCellValue(t_hap4);
		cell = row.createCell(6);
		cell.setCellValue(t_hap5);
		cell = row.createCell(7);
		cell.setCellValue(t_hap6);
		cell = row.createCell(8);
		cell.setCellValue(t_hap7);		
		
		//투자
		row = sheet.createRow(rowNo++);
    	cell = row.createCell(0);
    	cell.setCellValue("");
		
    	row = sheet.createRow(rowNo++);
    	cell = row.createCell(0);
    	cell.setCellValue("상담유형상세");
    	cell = row.createCell(1);
    	cell.setCellValue("검색기간");
    	cell = row.createCell(2);
    	cell.setCellValue(sdate);
    	cell = row.createCell(3);
    	cell.setCellValue(edate);
    	
		row = sheet.createRow(rowNo++);
		cell = row.createCell(0);
		cell.setCellValue("투자");
		cell = row.createCell(1);
		cell.setCellValue("");
		cell = row.createCell(2);
		cell.setCellValue("통계");
		cell = row.createCell(3);
		cell.setCellValue("");
		cell = row.createCell(4);
		cell.setCellValue("");
		
		row = sheet.createRow(rowNo++);
		cell = row.createCell(0);
		cell.setCellValue("");
		cell = row.createCell(1);
		cell.setCellValue("");
		cell = row.createCell(2);
		cell.setCellValue("전체");
		cell = row.createCell(3);
		cell.setCellValue("도내기업");
		cell = row.createCell(4);
		cell.setCellValue("입주기업");
		cell = row.createCell(5);
		cell.setCellValue("예비창업자");
		cell = row.createCell(6);
		cell.setCellValue("서면");
		cell = row.createCell(7);
		cell.setCellValue("화상");
		cell = row.createCell(8);
		cell.setCellValue("대면");
		
		// 데이터 부분 생성
		t_hap1 = 0;
		t_hap2 = 0;
		t_hap3 = 0;
		t_hap4 = 0;
		t_hap5 = 0;
		t_hap6 = 0;
		t_hap7 = 0;
		for(StatisVO rq_vo : svo4) {
			row = sheet.createRow(rowNo++);
			cell = row.createCell(0);
			cell.setCellValue("");
			cell = row.createCell(1);
			cell.setCellValue(rq_vo.getUs_major12_nm());
			cell = row.createCell(2);
			cell.setCellValue(rq_vo.getS_item1());
			cell = row.createCell(3);
			cell.setCellValue(rq_vo.getS_item2());
			cell = row.createCell(4);
			cell.setCellValue(rq_vo.getS_item3());
			cell = row.createCell(5);
			cell.setCellValue(rq_vo.getS_item4());
			cell = row.createCell(6);
			cell.setCellValue(rq_vo.getS_item5());
			cell = row.createCell(7);
			cell.setCellValue(rq_vo.getS_item6());
			cell = row.createCell(8);
			cell.setCellValue(rq_vo.getS_item7());
			
			t_hap1 = t_hap1 + rq_vo.getS_item1();
			t_hap2 = t_hap2 + rq_vo.getS_item2();
			t_hap3 = t_hap3 + rq_vo.getS_item3();
			t_hap4 = t_hap4 + rq_vo.getS_item4();
			t_hap5 = t_hap5 + rq_vo.getS_item5();
			t_hap6 = t_hap6 + rq_vo.getS_item6();
			t_hap7 = t_hap7 + rq_vo.getS_item7();
		}
		row = sheet.createRow(rowNo++);
		cell = row.createCell(0);
		cell.setCellValue("합계");
		cell = row.createCell(1);
		cell.setCellValue("");
		cell = row.createCell(2);
		cell.setCellValue(t_hap1);
		cell = row.createCell(3);
		cell.setCellValue(t_hap2);
		cell = row.createCell(4);
		cell.setCellValue(t_hap3);
		cell = row.createCell(5);
		cell.setCellValue(t_hap4);
		cell = row.createCell(6);
		cell.setCellValue(t_hap5);
		cell = row.createCell(7);
		cell.setCellValue(t_hap6);
		cell = row.createCell(8);
		cell.setCellValue(t_hap7);	
		
		//경영심화
		row = sheet.createRow(rowNo++);
    	cell = row.createCell(0);
    	cell.setCellValue("");
		
    	row = sheet.createRow(rowNo++);
    	cell = row.createCell(0);
    	cell.setCellValue("상담유형상세");
    	cell = row.createCell(1);
    	cell.setCellValue("검색기간");
    	cell = row.createCell(2);
    	cell.setCellValue(sdate);
    	cell = row.createCell(3);
    	cell.setCellValue(edate);
    	
		row = sheet.createRow(rowNo++);
		cell = row.createCell(0);
		cell.setCellValue("경영심화");
		cell = row.createCell(1);
		cell.setCellValue("");
		cell = row.createCell(2);
		cell.setCellValue("통계");
		cell = row.createCell(3);
		cell.setCellValue("");
		cell = row.createCell(4);
		cell.setCellValue("");
		
		row = sheet.createRow(rowNo++);
		cell = row.createCell(0);
		cell.setCellValue("");
		cell = row.createCell(1);
		cell.setCellValue("");
		cell = row.createCell(2);
		cell.setCellValue("전체");
		cell = row.createCell(3);
		cell.setCellValue("도내기업");
		cell = row.createCell(4);
		cell.setCellValue("입주기업");
		cell = row.createCell(5);
		cell.setCellValue("예비창업자");
		cell = row.createCell(6);
		cell.setCellValue("서면");
		cell = row.createCell(7);
		cell.setCellValue("화상");
		cell = row.createCell(8);
		cell.setCellValue("대면");
		
		// 데이터 부분 생성
		t_hap1 = 0;
		t_hap2 = 0;
		t_hap3 = 0;
		t_hap4 = 0;
		t_hap5 = 0;
		t_hap6 = 0;
		t_hap7 = 0;
		for(StatisVO rq_vo : svo5) {
			row = sheet.createRow(rowNo++);
			cell = row.createCell(0);
			cell.setCellValue("");
			cell = row.createCell(1);
			cell.setCellValue(rq_vo.getUs_major12_nm());
			cell = row.createCell(2);
			cell.setCellValue(rq_vo.getS_item1());
			cell = row.createCell(3);
			cell.setCellValue(rq_vo.getS_item2());
			cell = row.createCell(4);
			cell.setCellValue(rq_vo.getS_item3());
			cell = row.createCell(5);
			cell.setCellValue(rq_vo.getS_item4());
			cell = row.createCell(6);
			cell.setCellValue(rq_vo.getS_item5());
			cell = row.createCell(7);
			cell.setCellValue(rq_vo.getS_item6());
			cell = row.createCell(8);
			cell.setCellValue(rq_vo.getS_item7());
			
			t_hap1 = t_hap1 + rq_vo.getS_item1();
			t_hap2 = t_hap2 + rq_vo.getS_item2();
			t_hap3 = t_hap3 + rq_vo.getS_item3();
			t_hap4 = t_hap4 + rq_vo.getS_item4();
			t_hap5 = t_hap5 + rq_vo.getS_item5();
			t_hap6 = t_hap6 + rq_vo.getS_item6();
			t_hap7 = t_hap7 + rq_vo.getS_item7();
		}
		row = sheet.createRow(rowNo++);
		cell = row.createCell(0);
		cell.setCellValue("합계");
		cell = row.createCell(1);
		cell.setCellValue("");
		cell = row.createCell(2);
		cell.setCellValue(t_hap1);
		cell = row.createCell(3);
		cell.setCellValue(t_hap2);
		cell = row.createCell(4);
		cell.setCellValue(t_hap3);
		cell = row.createCell(5);
		cell.setCellValue(t_hap4);
		cell = row.createCell(6);
		cell.setCellValue(t_hap5);
		cell = row.createCell(7);
		cell.setCellValue(t_hap6);
		cell = row.createCell(8);
		cell.setCellValue(t_hap7);	
		
		
		//관광
		row = sheet.createRow(rowNo++);
    	cell = row.createCell(0);
    	cell.setCellValue("");
		
    	row = sheet.createRow(rowNo++);
    	cell = row.createCell(0);
    	cell.setCellValue("상담유형상세");
    	cell = row.createCell(1);
    	cell.setCellValue("검색기간");
    	cell = row.createCell(2);
    	cell.setCellValue(sdate);
    	cell = row.createCell(3);
    	cell.setCellValue(edate);
    	
		row = sheet.createRow(rowNo++);
		cell = row.createCell(0);
		cell.setCellValue("관광");
		cell = row.createCell(1);
		cell.setCellValue("");
		cell = row.createCell(2);
		cell.setCellValue("통계");
		cell = row.createCell(3);
		cell.setCellValue("");
		cell = row.createCell(4);
		cell.setCellValue("");
		
		row = sheet.createRow(rowNo++);
		cell = row.createCell(0);
		cell.setCellValue("");
		cell = row.createCell(1);
		cell.setCellValue("");
		cell = row.createCell(2);
		cell.setCellValue("전체");
		cell = row.createCell(3);
		cell.setCellValue("도내기업");
		cell = row.createCell(4);
		cell.setCellValue("입주기업");
		cell = row.createCell(5);
		cell.setCellValue("예비창업자");
		cell = row.createCell(6);
		cell.setCellValue("서면");
		cell = row.createCell(7);
		cell.setCellValue("화상");
		cell = row.createCell(8);
		cell.setCellValue("대면");
		
		// 데이터 부분 생성
		t_hap1 = 0;
		t_hap2 = 0;
		t_hap3 = 0;
		t_hap4 = 0;
		t_hap5 = 0;
		t_hap6 = 0;
		t_hap7 = 0;
		for(StatisVO rq_vo : svo6) {
			row = sheet.createRow(rowNo++);
			cell = row.createCell(0);
			cell.setCellValue("");
			cell = row.createCell(1);
			cell.setCellValue(rq_vo.getUs_major12_nm());
			cell = row.createCell(2);
			cell.setCellValue(rq_vo.getS_item1());
			cell = row.createCell(3);
			cell.setCellValue(rq_vo.getS_item2());
			cell = row.createCell(4);
			cell.setCellValue(rq_vo.getS_item3());
			cell = row.createCell(5);
			cell.setCellValue(rq_vo.getS_item4());
			cell = row.createCell(6);
			cell.setCellValue(rq_vo.getS_item5());
			cell = row.createCell(7);
			cell.setCellValue(rq_vo.getS_item6());
			cell = row.createCell(8);
			cell.setCellValue(rq_vo.getS_item7());
			
			t_hap1 = t_hap1 + rq_vo.getS_item1();
			t_hap2 = t_hap2 + rq_vo.getS_item2();
			t_hap3 = t_hap3 + rq_vo.getS_item3();
			t_hap4 = t_hap4 + rq_vo.getS_item4();
			t_hap5 = t_hap5 + rq_vo.getS_item5();
			t_hap6 = t_hap6 + rq_vo.getS_item6();
			t_hap7 = t_hap7 + rq_vo.getS_item7();
		}
		row = sheet.createRow(rowNo++);
		cell = row.createCell(0);
		cell.setCellValue("합계");
		cell = row.createCell(1);
		cell.setCellValue("");
		cell = row.createCell(2);
		cell.setCellValue(t_hap1);
		cell = row.createCell(3);
		cell.setCellValue(t_hap2);
		cell = row.createCell(4);
		cell.setCellValue(t_hap3);
		cell = row.createCell(5);
		cell.setCellValue(t_hap4);
		cell = row.createCell(6);
		cell.setCellValue(t_hap5);
		cell = row.createCell(7);
		cell.setCellValue(t_hap6);
		cell = row.createCell(8);
		cell.setCellValue(t_hap7);	
		
		//제품디자인
		row = sheet.createRow(rowNo++);
    	cell = row.createCell(0);
    	cell.setCellValue("");
		
    	row = sheet.createRow(rowNo++);
    	cell = row.createCell(0);
    	cell.setCellValue("상담유형상세");
    	cell = row.createCell(1);
    	cell.setCellValue("검색기간");
    	cell = row.createCell(2);
    	cell.setCellValue(sdate);
    	cell = row.createCell(3);
    	cell.setCellValue(edate);
    	
		row = sheet.createRow(rowNo++);
		cell = row.createCell(0);
		cell.setCellValue("제품디자인");
		cell = row.createCell(1);
		cell.setCellValue("");
		cell = row.createCell(2);
		cell.setCellValue("통계");
		cell = row.createCell(3);
		cell.setCellValue("");
		cell = row.createCell(4);
		cell.setCellValue("");
		
		row = sheet.createRow(rowNo++);
		cell = row.createCell(0);
		cell.setCellValue("");
		cell = row.createCell(1);
		cell.setCellValue("");
		cell = row.createCell(2);
		cell.setCellValue("전체");
		cell = row.createCell(3);
		cell.setCellValue("도내기업");
		cell = row.createCell(4);
		cell.setCellValue("입주기업");
		cell = row.createCell(5);
		cell.setCellValue("예비창업자");
		cell = row.createCell(6);
		cell.setCellValue("서면");
		cell = row.createCell(7);
		cell.setCellValue("화상");
		cell = row.createCell(8);
		cell.setCellValue("대면");
		
		// 데이터 부분 생성
		t_hap1 = 0;
		t_hap2 = 0;
		t_hap3 = 0;
		t_hap4 = 0;
		t_hap5 = 0;
		t_hap6 = 0;
		t_hap7 = 0;
		for(StatisVO rq_vo : svo7) {
			row = sheet.createRow(rowNo++);
			cell = row.createCell(0);
			cell.setCellValue("");
			cell = row.createCell(1);
			cell.setCellValue(rq_vo.getUs_major12_nm());
			cell = row.createCell(2);
			cell.setCellValue(rq_vo.getS_item1());
			cell = row.createCell(3);
			cell.setCellValue(rq_vo.getS_item2());
			cell = row.createCell(4);
			cell.setCellValue(rq_vo.getS_item3());
			cell = row.createCell(5);
			cell.setCellValue(rq_vo.getS_item4());
			cell = row.createCell(6);
			cell.setCellValue(rq_vo.getS_item5());
			cell = row.createCell(7);
			cell.setCellValue(rq_vo.getS_item6());
			cell = row.createCell(8);
			cell.setCellValue(rq_vo.getS_item7());
			
			t_hap1 = t_hap1 + rq_vo.getS_item1();
			t_hap2 = t_hap2 + rq_vo.getS_item2();
			t_hap3 = t_hap3 + rq_vo.getS_item3();
			t_hap4 = t_hap4 + rq_vo.getS_item4();
			t_hap5 = t_hap5 + rq_vo.getS_item5();
			t_hap6 = t_hap6 + rq_vo.getS_item6();
			t_hap7 = t_hap7 + rq_vo.getS_item7();
		}
		row = sheet.createRow(rowNo++);
		cell = row.createCell(0);
		cell.setCellValue("합계");
		cell = row.createCell(1);
		cell.setCellValue("");
		cell = row.createCell(2);
		cell.setCellValue(t_hap1);
		cell = row.createCell(3);
		cell.setCellValue(t_hap2);
		cell = row.createCell(4);
		cell.setCellValue(t_hap3);
		cell = row.createCell(5);
		cell.setCellValue(t_hap4);
		cell = row.createCell(6);
		cell.setCellValue(t_hap5);
		cell = row.createCell(7);
		cell.setCellValue(t_hap6);
		cell = row.createCell(8);
		cell.setCellValue(t_hap7);

		// 엑셀 출력
		String xls_file_name = URLEncoder.encode("신청통계.xls","utf-8");
		response.setContentType("application/vnd.ms-excel");
		response.setHeader("Content-Disposition", "attachment;filename="+xls_file_name);
				
		wb.write(response.getOutputStream());
				
	}
    
    //상담글 상태변경 
    @RequestMapping(value = "/memto/changeStatusAjax.do")
	public ModelAndView change_mentoStatusAjax(@RequestParam("idx") int idx, @RequestParam("status") String status, HttpServletRequest request) throws Exception {
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("jsonView");
		
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			modelAndView.addObject("result", "N");
		}
		
		String userIp = EgovClntInfo.getClntIP(request);
		
		MemtoVO mtvo = new MemtoVO();
		mtvo.setIdx(idx);
		mtvo.setStatus(status);
		mtvo.setCom_ip(userIp);
		if(status.equals("3")) {
			memtoService.changeMemto_coment(idx);
		}
		memtoService.changeMemto_info(mtvo);
		
		if(status.equals("2")) {

			MemtoVO memto_result = new MemtoVO();
			memto_result = memtoService.selectMemto(idx);
			String mobile = memto_result.getMemto_mobile();
			
			SmsSend24.AuthSms();
			
			SmsSend24.Cafe24SmsSend(mobile, "상담신청이 매칭되었습니다. 홈페이지를 확인해 주세요. -경남관광기업지원센터");
		}
		
		if(status.equals("4")) {
			MemtoVO memto_result = new MemtoVO();
			memto_result = memtoService.selectMemto(idx);
			String mobile = memto_result.getUs_mobile();
			
			SmsSend24.AuthSms();
			
			SmsSend24.Cafe24SmsSend(mobile, "상담신청이 완료되었습니다. 홈페이지에서 설문조사를 작성해 주세요. -경남관광기업지원센터");
		}
		
		modelAndView.addObject("result", "Y");
			
		return modelAndView;
	}
    
}
