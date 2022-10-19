package egovframework.goncs.wssms;

import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import egovframework.com.cmm.service.EgovProperties;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.utl.fcc.service.EgovDateUtil;
import egovframework.com.utl.fcc.service.EgovStringUtil;
import egovframework.com.utl.sim.service.EgovClntInfo;
import egovframework.goncs.RoomRent.service.RoomRentVO;
import egovframework.goncs.member.service.LoginVO;
import egovframework.goncs.member.service.MemlogService;
import egovframework.goncs.member.service.MemlogVO;
import egovframework.goncs.member.service.PageLogVO;
import egovframework.goncs.member.service.PagelogService;
import egovframework.goncs.sub04.SmsSend24;
import egovframework.goncs.sub04.service.JcounselService;
import egovframework.goncs.sub04.service.JcounselVO;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class Sb0601Controller {

	/** JcounselService */
	@Resource(name = "jcounselService")
	private JcounselService jcounselService;
	
	/** PagelogService */
	@Resource(name = "pagelogService")
	private PagelogService pagelogService;
	
	/** MemlogService */
	@Resource(name = "memlogService")
	private MemlogService memlogService;
	
	@Resource(name = "propertiesService")
    protected EgovPropertyService propertyService;
	
	@Resource(name = "egovFileIdGnrService")
	private EgovIdGnrService idgenService;
	
	private static final Logger LOGGER = LoggerFactory.getLogger(Sb0601Controller.class);
	
	public String getDateString(Calendar day) {
		String str = "" + day.get(Calendar.YEAR); // 년;

		int thisMonth = day.get(Calendar.MONTH) + 1; // 월 ( 0 ~ 11 )= 0;

		if ( thisMonth < 10 ) {
			str += "0";
		}

		str += "" + thisMonth ;

		int thisDate = day.get(Calendar.DATE) ; // 월 ( 0 ~ 11 )= 0;

		if ( thisDate < 10 ) {
			str += "0";
		}

		str += "" + thisDate ;

		return str;
	}
	
	public int getMonthNum(int month){
		return month + 1 ;
	}
	
	//상담신청 리스트
	@RequestMapping(value = "/sb06/sub01.do")
	public String wssm_sb06_sub01(HttpServletRequest request, ModelMap model, Locale locale, RedirectAttributes rttr) throws Exception{

		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			rttr.addFlashAttribute("resultMsg", "로그인 후 이용이 가능합니다.");		
			return "redirect:/wssms/LoginUsr.do";
		}
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		int us_level = user.getUs_level();
		model.addAttribute("user", user);
		int m_level = user.getUs_level();
		if(m_level > 2) {
			return "redirect:/wssms/LoginUsr.do";
		}
		
		java.text.SimpleDateFormat formatter2 = new java.text.SimpleDateFormat ("yyyy-MM-dd", java.util.Locale.KOREA);
        String datexx = formatter2.format(new java.util.Date());
		
		String sdate = EgovStringUtil.clearXSS(request.getParameter("sdate"),"");
		String edate = EgovStringUtil.clearXSS(request.getParameter("edate"),"");
		String status = EgovStringUtil.clearXSS(request.getParameter("status"),"");
		String name = EgovStringUtil.clearXSS(request.getParameter("name"),"");
		String mobile = EgovStringUtil.clearXSS(request.getParameter("mobile"),"");
		
		if(sdate.equals("")) {
			sdate = EgovDateUtil.addYearMonthDay(datexx, 0, 0, -5);
			sdate = EgovDateUtil.formatDate(sdate,"-");
		}
		if(edate.equals("")) edate = datexx;
		
		JcounselVO searchVO = new JcounselVO();
		searchVO.setSdate(sdate);
		searchVO.setEdate(edate);
		searchVO.setStatus(status);
		searchVO.setName(name);
		searchVO.setMobile(mobile);
		
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
		List<JcounselVO> job_list = jcounselService.selectJcounselListw(searchVO);
		totCnt = jcounselService.selectJcounselListCnt(searchVO);
		
		model.addAttribute("searchVO", searchVO);
		model.addAttribute("job_list", job_list);
		model.addAttribute("totCnt", totCnt);
		
		paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);
		
        //사용자 로그 저장
        String userIp = EgovClntInfo.getClntIP(request);
        PageLogVO pagelogvo = new PageLogVO();
        pagelogvo.setPage_name("일자리 상담신청 목록");
        pagelogvo.setM_id(user.getUs_id());
        pagelogvo.setCom_ip(userIp);
        pagelogService.insertPagelog(pagelogvo);
        /////로그 저장 완료
        
        return "egovframework/gntbsc/wssms/sub06_01";
		
	}
	
	//신청 상세
	@RequestMapping(value = "/sb06/sub01_write.do")
	public String wssm_sb06_sub01w(HttpServletRequest request, ModelMap model, Locale locale, RedirectAttributes rttr) throws Exception{
		
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			rttr.addFlashAttribute("resultMsg", "로그인 후 이용이 가능합니다.");		
			return "redirect:/wssms/LoginUsr.do";
		}
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		int us_level = user.getUs_level();
		model.addAttribute("user", user);
		int m_level = user.getUs_level();
		if(m_level > 2) {
			return "redirect:/wssms/LoginUsr.do";
		}
		
		String idx = EgovStringUtil.clearXSS(request.getParameter("idx"),"");
		if(idx.equals("")) idx = "0";
		
		JcounselVO searchVO = new JcounselVO();
		JcounselVO jobVO = new JcounselVO();
		searchVO.setIdx(Integer.parseInt(idx));
		
		if(!idx.equals("0")) {
			jobVO = jcounselService.selectJcounsel(searchVO);
			model.addAttribute("jobVO", jobVO);
		} else {
			model.addAttribute("jobVO", jobVO);
		}
				
		return "egovframework/gntbsc/wssms/sub06_01_write";
		
	}
	
	//상담신청 저장
	@RequestMapping(value = "/sb06/sub01_Updt.do")
	public String save_wssm_sb06_sub01w(MultipartHttpServletRequest request, ModelMap model, RedirectAttributes rttr) throws Exception{
		// 1. Spring Security 사용자권한 처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			rttr.addFlashAttribute("resultMsg", "로그인 후 이용이 가능합니다.");		
			rttr.addFlashAttribute("go_url", "job");		
			return "redirect:/member/login.do";
		}
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		int m_level = user.getUs_level();
		model.addAttribute("user", user);
		
		String userIp = EgovClntInfo.getClntIP(request);
		LOGGER.debug("userIp : " + userIp);
		
		JcounselVO jcvo = new JcounselVO();
		
		String idx = EgovStringUtil.clearXSS(request.getParameter("idx"),"");
		jcvo.setIdx(Integer.parseInt(idx));
		jcvo.setCounsel_gbn(EgovStringUtil.clearXSS(request.getParameter("counsel_gbn"),""));
		jcvo.setDatexx(EgovStringUtil.clearXSS(request.getParameter("datexx"),""));
		jcvo.setTimexx(EgovStringUtil.clearXSS(request.getParameter("timexx"),""));
		jcvo.setName(EgovStringUtil.clearXSS(request.getParameter("name"),""));
		jcvo.setMobile(EgovStringUtil.clearXSS(request.getParameter("mobile"),""));
		jcvo.setContent1(EgovStringUtil.clearXSS(request.getParameter("content1"),""));
		jcvo.setStatus(EgovStringUtil.clearXSS(request.getParameter("status"),""));
		jcvo.setCom_ip(userIp);
		jcvo.setRefuse_txt("");
		jcvo.setSys_id(user.getUs_id());
		
		if( (request == null) || (request.getParameter("datexx").equals("")) || (request.getParameter("mobile").equals("")) ) { 
			rttr.addFlashAttribute("resultMsg", "입력항목을 확인하세요");
			return "redirect:/sb06/sub01_write.do";
		}
		
		//첨부파일 업로드
		boolean isLocal = false;
		String requestUrl = new String(request.getRequestURL());
		//System.out.println(requestUrl);		
		if (requestUrl.contains("localhost") || requestUrl.contains("127.0.0.1")) {
			isLocal = true;
		}
		String fullFileName1 = "";
		String fileExt1   = "";
		String fullFileName2 = "";
		String fileExt2   = "";
		String fullFileName3 = "";
		String fileExt3   = "";
		String filePath = EgovProperties.getProperty("Globals.fileStorePath");
		
		if (isLocal) {
			filePath = "F:/workspace/gntbsc/src/main/webapp/egovframework/upload";
		}	
		System.out.println("단계4");
		//첨부1
		MultipartFile file1 = request.getFile( "userfile1" );
		if(file1.isEmpty() == false) {
			String orgFileNm1 = file1.getOriginalFilename();
			fileExt1   = orgFileNm1.substring(orgFileNm1.lastIndexOf('.')+1).toLowerCase();
			if (fileExt1.equals("gif")||fileExt1.equals("jpeg")||fileExt1.equals("jpg")||fileExt1.equals("png")||fileExt1.equals("bmp")||fileExt1.equals("hwp")||fileExt1.equals("xls")||fileExt1.equals("xlsx")||fileExt1.equals("pdf")||fileExt1.equals("doc")||fileExt1.equals("docx")||fileExt1.equals("txt")||fileExt1.equals("mp4")||fileExt1.equals("zip")||fileExt1.equals("rar")||fileExt1.equals("gz")||fileExt1.equals("tar")) {
				String file_id = idgenService.getNextStringId();
				fullFileName1 = file_id + "." + fileExt1;
				try {
					file1.transferTo(new File(filePath + File.separator + fullFileName1));
					jcvo.setUserfile1(fullFileName1);
				}
				catch (Exception e) {
					e.printStackTrace();
				}
			} else {
				rttr.addFlashAttribute("resultMsg", orgFileNm1 + "업로드가 불가능한 확장자입니다.");	
			}
			
		}
		//첨부2
		MultipartFile file2 = request.getFile( "userfile2" );
		if(file2.isEmpty() == false) {
			String orgFileNm2 = file2.getOriginalFilename();
			fileExt2   = orgFileNm2.substring(orgFileNm2.lastIndexOf('.')+1).toLowerCase();
			if (fileExt2.equals("gif")||fileExt2.equals("jpeg")||fileExt2.equals("jpg")||fileExt2.equals("png")||fileExt2.equals("bmp")||fileExt2.equals("hwp")||fileExt2.equals("xls")||fileExt2.equals("xlsx")||fileExt2.equals("pdf")||fileExt2.equals("doc")||fileExt2.equals("docx")||fileExt2.equals("txt")||fileExt2.equals("mp4")||fileExt2.equals("zip")||fileExt2.equals("rar")||fileExt2.equals("gz")||fileExt2.equals("tar")) {
				String file_id = idgenService.getNextStringId();
				fullFileName2 = file_id + "." + fileExt2;
				try {
					file2.transferTo(new File(filePath + File.separator + fullFileName2));
					jcvo.setUserfile2(fullFileName2);
				}
				catch (Exception e) {
					e.printStackTrace();
				}
			} else {
				rttr.addFlashAttribute("resultMsg", orgFileNm2 + "업로드가 불가능한 확장자입니다.");	
			}
			
		}	
		//첨부3
		MultipartFile file3 = request.getFile( "userfile3" );
		if(file3.isEmpty() == false) {
			String orgFileNm3 = file3.getOriginalFilename();
			fileExt3   = orgFileNm3.substring(orgFileNm3.lastIndexOf('.')+1).toLowerCase();
			if (fileExt3.equals("gif")||fileExt3.equals("jpeg")||fileExt3.equals("jpg")||fileExt3.equals("png")||fileExt3.equals("bmp")||fileExt3.equals("hwp")||fileExt3.equals("xls")||fileExt3.equals("xlsx")||fileExt3.equals("pdf")||fileExt3.equals("doc")||fileExt3.equals("docx")||fileExt3.equals("txt")||fileExt3.equals("mp4")||fileExt3.equals("zip")||fileExt3.equals("rar")||fileExt3.equals("gz")||fileExt3.equals("tar")) {
				String file_id = idgenService.getNextStringId();
				fullFileName3 = file_id + "." + fileExt3;
				try {
					file3.transferTo(new File(filePath + File.separator + fullFileName3));
					jcvo.setUserfile3(fullFileName3);
				}
				catch (Exception e) {
					e.printStackTrace();
				}
			} else {
				rttr.addFlashAttribute("resultMsg", orgFileNm3 + "업로드가 불가능한 확장자입니다.");	
			}
			
		}
		
		jcounselService.updateJcounsel_info(jcvo);
		
		if(jcvo.getStatus().equals("2")) {
			SmsSend24.AuthSms();
			
			SmsSend24.Cafe24SmsSend(jcvo.getMobile(), jcvo.getDatexx() + "일 " + jcvo.getTimexx() + "시 상담신청이 승인되었습니다. -경남관광기업지원센터");
		}
		
		//사용자 로그 저장
        //String userIp = EgovClntInfo.getClntIP(request);
		MemlogVO memlogvo = new MemlogVO();
		memlogvo.setGubunx("일자리 지원 상담 신청");
		memlogvo.setSubject("작업자:"+user.getUs_name() + " ID: " + jcvo.getUs_id() + " 신청자: " + jcvo.getName() + " 신청일: " + jcvo.getDatexx());
		memlogvo.setM_id(user.getUs_id());
		memlogvo.setCom_ip(userIp);
		memlogService.insertMemlog(memlogvo);
        /////로그 저장 완료
		
		rttr.addFlashAttribute("resultMsg", "정상 저장되었습니다");
		return "redirect:/sb06/sub01_write.do";
		
	}
	
	//선택 삭제
	@RequestMapping(value = "/sb06/sub01_sdele.do")
	public String dele_wssSb06_01s(@RequestParam("idx") String[] idxs, HttpServletRequest request, RedirectAttributes rttr) throws Exception{
		
		// 1. Spring Security 사용자권한 처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			rttr.addFlashAttribute("resultMsg", "로그인 후 이용이 가능합니다.");		
			return "redirect:/wssms/LoginUsr.do";
		}
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		int us_level = user.getUs_level();
		int m_level = user.getUs_level();
		if(m_level > 2) {
			return "redirect:/wssms/LoginUsr.do";
		}
		
		String pageIndex = EgovStringUtil.clearXSS(request.getParameter("pageIndex"),"");
		String sdate = EgovStringUtil.clearXSS(request.getParameter("sdate"),"");
		String edate = EgovStringUtil.clearXSS(request.getParameter("edate"),"");
		String status = EgovStringUtil.clearXSS(request.getParameter("status"),"");
		String name = EgovStringUtil.clearXSS(request.getParameter("name"),"");
		String mobile = EgovStringUtil.clearXSS(request.getParameter("mobile"),"");
		
		JcounselVO job_result = new JcounselVO();
	
		//참여자인지 체크
		int totCnt = 0;
		int memCnt = 0;
		String del_list = "";
		for(int j=0; j < idxs.length; j++) {
			int idx = Integer.parseInt(idxs[j]);
			int del_pass = 0;
			
			job_result = jcounselService.selectJcounsel3(idx);

			//System.out.println("삭제할 자료 : " + bi_code);
			if(job_result == null) {
				rttr.addFlashAttribute("resultMsg", "삭제할 자료가 없습니다");
				del_pass = 1;
			}
						
			//삭제
			if(del_pass == 0) {
				jcounselService.deleteJcounsel(idx);
				
				del_list = del_list + ", " + idx;
			}

		}

        //System.out.println("단계8");
		//사용자 로그 저장
        String userIp = EgovClntInfo.getClntIP(request);
        MemlogVO memlogvo = new MemlogVO();
		memlogvo.setGubunx("일자리상담신청 선택삭제");
		memlogvo.setSubject("작업자:"+user.getUs_name() + " 삭제내용:" + del_list);
		memlogvo.setM_id(user.getUs_id());
		memlogvo.setCom_ip(userIp);
		memlogService.insertMemlog(memlogvo);
        /////로그 저장 완료
	
		rttr.addFlashAttribute("pageIndex", pageIndex);
		rttr.addFlashAttribute("sdate", sdate);
		rttr.addFlashAttribute("edate", edate);
		rttr.addFlashAttribute("status", status);
		rttr.addFlashAttribute("name", name);
		rttr.addFlashAttribute("mobile", mobile);
		
        //System.out.println("단계9");
        return "redirect:/sb06/sub01.do";
	}
	
	//상태변경
	@RequestMapping(value = "/sb06/sub01_schange.do")
	public String change_wssSb06_01s(@RequestParam("idx") String[] idxs, HttpServletRequest request, ModelMap model, RedirectAttributes rttr) throws Exception{
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			rttr.addFlashAttribute("resultMsg", "로그인 후 이용이 가능합니다.");		
			return "redirect:/wssms/LoginUsr.do";
		}
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		int us_level = user.getUs_level();
		String sys_id = user.getUs_id();
		String userIp = EgovClntInfo.getClntIP(request);
		int m_level = user.getUs_level();
		if(m_level > 2) {
			return "redirect:/wssms/LoginUsr.do";
		}
		
		String pageIndex = EgovStringUtil.clearXSS(request.getParameter("pageIndex"),"");
		String sdate = EgovStringUtil.clearXSS(request.getParameter("sdate"),"");
		String edate = EgovStringUtil.clearXSS(request.getParameter("edate"),"");
		String status = EgovStringUtil.clearXSS(request.getParameter("status"),"");
		String name = EgovStringUtil.clearXSS(request.getParameter("name"),"");
		String mobile = EgovStringUtil.clearXSS(request.getParameter("mobile"),"");
		
		JcounselVO job_result = new JcounselVO();
		
		String cstate = EgovStringUtil.clearXSS(request.getParameter("cstate"),"");
		
		//참여자인지 체크
		int totCnt = 0;
		int memCnt = 0;
		String del_list = "";
		for(int j=0; j < idxs.length; j++) {
			int idx = Integer.parseInt(idxs[j]);
			int del_pass = 0;
			
			job_result = jcounselService.selectJcounsel3(idx);

			//System.out.println("삭제할 자료 : " + bi_code);
			if(job_result == null) {
				rttr.addFlashAttribute("resultMsg", "상태변경할 자료가 없습니다");
				del_pass = 1;
			}
						
			//삭제
			if(del_pass == 0) {
				
				JcounselVO jcvo = new JcounselVO();
				jcvo.setIdx(idx);
				jcvo.setStatus(cstate);
				if(cstate.equals("3")) {
					jcvo.setRefuse_txt("내부사정으로 상담신청이 취소되었습니다.");
					
					SmsSend24.AuthSms();
					
					SmsSend24.Cafe24SmsSend(job_result.getMobile(), job_result.getDatexx() + "일 상담신청이 반려되었습니다. -경남관광기업지원센터");
					
				} else if(cstate.equals("2")) {
					
					SmsSend24.AuthSms();
					
					SmsSend24.Cafe24SmsSend(job_result.getMobile(), job_result.getDatexx() + "일 " + job_result.getTimexx() + "시 상담신청이 승인되었습니다. -경남관광기업지원센터");
					
				}
				
				jcvo.setSys_id(sys_id);
				jcvo.setCom_ip(userIp);
				
				jcounselService.changeJcounsel_info(jcvo);
				
				del_list = del_list + ", " + idx;
			}

		}

        //System.out.println("단계8");
		//사용자 로그 저장
        //String userIp = EgovClntInfo.getClntIP(request);
        MemlogVO memlogvo = new MemlogVO();
		memlogvo.setGubunx("일자리상담신청 상태변경");
		memlogvo.setSubject("신청자:"+job_result.getName() + " 날짜:" + job_result.getDatexx() + " 상태:"+cstate);
		memlogvo.setM_id(user.getUs_id());
		memlogvo.setCom_ip(userIp);
		memlogService.insertMemlog(memlogvo);
        /////로그 저장 완료
	
		rttr.addFlashAttribute("pageIndex", pageIndex);
		rttr.addFlashAttribute("sdate", sdate);
		rttr.addFlashAttribute("edate", edate);
		rttr.addFlashAttribute("status", status);
		rttr.addFlashAttribute("name", name);
		rttr.addFlashAttribute("mobile", mobile);		
		
		
		return "redirect:/sb06/sub01.do";
	}
		
	//승인 내역
	@RequestMapping("/sb06/sub02.do")
	public String get_sb06_sub02(HttpServletRequest request, ModelMap model, RedirectAttributes rttr) throws Exception {
		
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
		
		String resultMsg = "";
		Map<String, ?> redirectMap = RequestContextUtils.getInputFlashMap(request);
		if(redirectMap != null) {
			resultMsg = (String)redirectMap.get("resultMsg");
		}
		model.addAttribute("resultMsg", resultMsg);
		
		String[] weekDayx = { "일", "월", "화", "수", "목", "금", "토", "토" };
		
		Calendar day = Calendar.getInstance();
		
		// 변수 선언및 오늘 날자 
		int thisYear = day.get(Calendar.YEAR); // 년;
		int thisMonth = day.get(Calendar.MONTH); // 월 ( 0 ~ 11 );
		int thisDate = day.get(Calendar.DATE); // 일
		int thisDay = day.get(Calendar.DAY_OF_WEEK); // 요일 ( 일요일 : 1 ~ 토요일 : 7 )
		
		// 오늘 날자 기억해 두기
		String today = getDateString(day);
		
		String setDate = request.getParameter("datexx");
		
		int nowYear = thisYear;
		int nowMonth = thisMonth;
		int nowDate = thisDate;

		if ( setDate != null ) {
			if( setDate.indexOf("-") != -1) {
				nowYear = Integer.parseInt(setDate.substring(0,4));
				nowMonth = Integer.parseInt(setDate.substring(5,7)) - 1;
				nowDate = Integer.parseInt(setDate.substring(8,10));
			}  else {
				nowYear = Integer.parseInt(setDate.substring(0,4));
				nowMonth = Integer.parseInt(setDate.substring(4,6)) - 1;
				nowDate = Integer.parseInt(setDate.substring(6,8));
			}
			day.set(nowYear, nowMonth, nowDate);

		} else {
			setDate = today;
		}

		// 변수 선언및 오늘 날자 
		thisYear = day.get(Calendar.YEAR); // 년;
		thisMonth = day.get(Calendar.MONTH)+1; // 월 ( 0 ~ 11 );
		thisDate = day.get(Calendar.DATE); // 일
		thisDay = day.get(Calendar.DAY_OF_WEEK); // 요일 ( 일요일 : 1 ~ 토요일 : 7 )

		// 오늘 날자 기억해 두기
		today = getDateString(day);
		
		DecimalFormat df = new DecimalFormat("00");
		Calendar calendar = Calendar.getInstance(); 
		String yearq = Integer.toString(calendar.get(Calendar.YEAR)); //년도를 구한다
		String monthq = df.format(calendar.get(Calendar.MONTH)+1); //달을 구한다
		String dayq = df.format(calendar.get(Calendar.DATE)); //날짜를 구한다
		String ondate = yearq + "-" + monthq + "-" + dayq;


		// 이달의 마지막 날자 구하기 ( 아래 for 문에서 이용
		int lastDate = day.getActualMaximum(Calendar.DATE); 

		// 지난달 구하기
		day.add(Calendar.MONTH, -1);
		String yester = getDateString(day);

		// 다음달 구하기
		day.add(Calendar.MONTH, +2);
		String after = getDateString(day);

		// 원래 날자로 복귀
		day.add(Calendar.MONTH, -1);
		int calmonth = getMonthNum(day.get(Calendar.MONTH));
		String st_calmonth="";
		if(calmonth<10){
			st_calmonth="0"+calmonth;
		}else{
			st_calmonth=Integer.toString(calmonth);
		}

		String date01 = thisYear + "-" + st_calmonth + "-01";
		String date02 = thisYear + "-12-31";
		
		model.addAttribute("yester", yester);
		model.addAttribute("after", after);
		model.addAttribute("thisYear", thisYear);
		model.addAttribute("thisMonth", thisMonth);
		model.addAttribute("thisDate", thisDate);
		model.addAttribute("thisDay", thisDay);
		model.addAttribute("lastDate", lastDate);

		model.addAttribute("nowYear", nowYear);
		model.addAttribute("nowMonth", nowMonth);
		model.addAttribute("nowDate", nowDate);
		
		model.addAttribute("today", today);
		model.addAttribute("st_calmonth", st_calmonth);
		
		return "egovframework/gntbsc/wssms/sub06_02";
	}
	
}
