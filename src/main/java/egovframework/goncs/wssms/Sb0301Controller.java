package egovframework.goncs.wssms;

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
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.utl.fcc.service.EgovDateUtil;
import egovframework.com.utl.fcc.service.EgovStringUtil;
import egovframework.com.utl.sim.service.EgovClntInfo;
import egovframework.goncs.RoomRent.service.RoomRentService;
import egovframework.goncs.RoomRent.service.RoomRentVO;
import egovframework.goncs.RoomRent.service.RoomSetService;
import egovframework.goncs.member.service.LoginVO;
import egovframework.goncs.member.service.MemlogService;
import egovframework.goncs.member.service.MemlogVO;
import egovframework.goncs.member.service.PageLogVO;
import egovframework.goncs.member.service.PagelogService;
import egovframework.goncs.sub04.SmsSend24;
import egovframework.goncs.sub04.Sub04Controller;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class Sb0301Controller {

	@Resource(name = "roomSetService")
    private RoomSetService roomSetService;
	
	@Resource(name = "roomRentService")
    private RoomRentService roomRentService;
	
	/** PagelogService */
	@Resource(name = "pagelogService")
	private PagelogService pagelogService;
	
	/** MemlogService */
	@Resource(name = "memlogService")
	private MemlogService memlogService;
	
	@Resource(name = "propertiesService")
    protected EgovPropertyService propertyService;
	
	private static final Logger LOGGER = LoggerFactory.getLogger(Sb0301Controller.class);
	
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
	
	//대관신청 리스트
	@RequestMapping(value = "/sb03/sub01.do")
	public String wssm_sb03_sub01(HttpServletRequest request, ModelMap model, Locale locale, RedirectAttributes rttr) throws Exception{

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
		
		RoomRentVO searchVO = new RoomRentVO();
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
		List<RoomRentVO> rent_list = roomRentService.selectRoomRentListw(searchVO);
		totCnt = roomRentService.selectRoomRentListCnt(searchVO);
		
		model.addAttribute("searchVO", searchVO);
		model.addAttribute("rent_list", rent_list);
		model.addAttribute("totCnt", totCnt);
		
		paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);
		
        //사용자 로그 저장
        String userIp = EgovClntInfo.getClntIP(request);
        PageLogVO pagelogvo = new PageLogVO();
        pagelogvo.setPage_name("대관신청 목록");
        pagelogvo.setM_id(user.getUs_id());
        pagelogvo.setCom_ip(userIp);
        pagelogService.insertPagelog(pagelogvo);
        /////로그 저장 완료
        
        return "egovframework/gntbsc/wssms/sub03_01";
		
	}
	
	//신청 상세
	@RequestMapping(value = "/sb03/sub01_write.do")
	public String wssm_sb03_sub01w(HttpServletRequest request, ModelMap model, Locale locale, RedirectAttributes rttr) throws Exception{
		
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
		
		RoomRentVO searchVO = new RoomRentVO();
		RoomRentVO rentVO = new RoomRentVO();
		searchVO.setIdx(Integer.parseInt(idx));
		
		if(!idx.equals("0")) {
			rentVO = roomRentService.selectRoomRent(searchVO);
			model.addAttribute("rentVO", rentVO);
		} else {
			model.addAttribute("rentVO", rentVO);
		}
		
		String room_s1 = "N";
		String room_s2 = "N";
		String room_s3 = "N";
		String room_s4 = "N";
		String room_s5 = "N";
		String room_s6 = "N";
		String room_s7 = "N";
		
		String time0900 = "N";
		String time0930 = "N";
		String time1000 = "N";
		String time1030 = "N";
		String time1100 = "N";
		String time1130 = "N";
		String time1200 = "N";
		String time1230 = "N";
		String time1300 = "N";
		String time1330 = "N";
		String time1400 = "N";
		String time1430 = "N";
		String time1500 = "N";
		String time1530 = "N";
		String time1600 = "N";
		String time1630 = "N";
		String time1700 = "N";
		String time1730 = "N";
		
		if(rentVO != null) {
			if(rentVO.getRoom_id1().equals("s1")) {
				room_s1 = "Y";
			} else if(rentVO.getRoom_id1().equals("s2")) {
				room_s2 = "Y";
			} else if(rentVO.getRoom_id1().equals("s3")) {
				room_s3 = "Y";
			} else if(rentVO.getRoom_id1().equals("s4")) {
				room_s4 = "Y";
			} else if(rentVO.getRoom_id1().equals("s5")) {
				room_s5 = "Y";
			} else if(rentVO.getRoom_id1().equals("s6")) {
				room_s6 = "Y";
			} else if(rentVO.getRoom_id1().equals("s7")) {
				room_s7 = "Y";
			}
			
			if(rentVO.getRoom_id2().equals("s1")) {
				room_s1 = "Y";
			} else if(rentVO.getRoom_id2().equals("s2")) {
				room_s2 = "Y";
			} else if(rentVO.getRoom_id2().equals("s3")) {
				room_s3 = "Y";
			} else if(rentVO.getRoom_id2().equals("s4")) {
				room_s4 = "Y";
			} else if(rentVO.getRoom_id2().equals("s5")) {
				room_s5 = "Y";
			} else if(rentVO.getRoom_id2().equals("s6")) {
				room_s6 = "Y";
			} else if(rentVO.getRoom_id2().equals("s7")) {
				room_s7 = "Y";
			}
			
			if(rentVO.getRoom_id3().equals("s1")) {
				room_s1 = "Y";
			} else if(rentVO.getRoom_id3().equals("s2")) {
				room_s2 = "Y";
			} else if(rentVO.getRoom_id3().equals("s3")) {
				room_s3 = "Y";
			} else if(rentVO.getRoom_id3().equals("s4")) {
				room_s4 = "Y";
			} else if(rentVO.getRoom_id3().equals("s5")) {
				room_s5 = "Y";
			} else if(rentVO.getRoom_id3().equals("s6")) {
				room_s6 = "Y";
			} else if(rentVO.getRoom_id3().equals("s7")) {
				room_s7 = "Y";
			}
			
			if(rentVO.getTimexx().indexOf("0900") > -1) {
				time0900 = "Y";
			}
			if(rentVO.getTimexx().indexOf("0930") > -1) {
				time0930 = "Y";
			}
			if(rentVO.getTimexx().indexOf("1000") > -1) {
				time1000 = "Y";
			}
			if(rentVO.getTimexx().indexOf("1030") > -1) {
				time1030 = "Y";
			}
			if(rentVO.getTimexx().indexOf("1100") > -1) {
				time1100 = "Y";
			}
			if(rentVO.getTimexx().indexOf("1130") > -1) {
				time1130 = "Y";
			}
			if(rentVO.getTimexx().indexOf("1200") > -1) {
				time1200 = "Y";
			}
			if(rentVO.getTimexx().indexOf("1230") > -1) {
				time1230 = "Y";
			}
			if(rentVO.getTimexx().indexOf("1300") > -1) {
				time1300 = "Y";
			}
			if(rentVO.getTimexx().indexOf("1330") > -1) {
				time1330 = "Y";
			}
			if(rentVO.getTimexx().indexOf("1400") > -1) {
				time1400 = "Y";
			}
			if(rentVO.getTimexx().indexOf("1430") > -1) {
				time1430 = "Y";
			}
			if(rentVO.getTimexx().indexOf("1500") > -1) {
				time1500 = "Y";
			}
			if(rentVO.getTimexx().indexOf("1530") > -1) {
				time1530 = "Y";
			}
			if(rentVO.getTimexx().indexOf("1600") > -1) {
				time1600 = "Y";
			}
			if(rentVO.getTimexx().indexOf("1630") > -1) {
				time1630 = "Y";
			}
			if(rentVO.getTimexx().indexOf("1700") > -1) {
				time1700 = "Y";
			}
			if(rentVO.getTimexx().indexOf("1730") > -1) {
				time1730 = "Y";
			}
		}
		
		model.addAttribute("room_s1", room_s1);
		model.addAttribute("room_s2", room_s2);
		model.addAttribute("room_s3", room_s3);
		model.addAttribute("room_s4", room_s4);
		model.addAttribute("room_s5", room_s5);
		model.addAttribute("room_s6", room_s6);
		model.addAttribute("room_s7", room_s7);
		
		model.addAttribute("time0900", time0900);
		model.addAttribute("time0930", time0930);
		model.addAttribute("time1000", time1000);
		model.addAttribute("time1030", time1030);
		model.addAttribute("time1100", time1100);
		model.addAttribute("time1130", time1130);
		model.addAttribute("time1200", time1200);
		model.addAttribute("time1230", time1230);
		model.addAttribute("time1300", time1300);
		model.addAttribute("time1330", time1330);
		model.addAttribute("time1400", time1400);
		model.addAttribute("time1430", time1430);
		model.addAttribute("time1500", time1500);
		model.addAttribute("time1530", time1530);
		model.addAttribute("time1600", time1600);
		model.addAttribute("time1630", time1630);
		model.addAttribute("time1700", time1700);
		model.addAttribute("time1730", time1730);
		
		return "egovframework/gntbsc/wssms/sub03_01_write";
		
	}
	
	//선택삭제
	@RequestMapping(value = "/sb03/sub01_sdele.do")
	public String dele_wssSb03_01s(@RequestParam("idx") String[] idxs, HttpServletRequest request, RedirectAttributes rttr) throws Exception{
		
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
		
		RoomRentVO rent_result = new RoomRentVO();
	
		//참여자인지 체크
		int totCnt = 0;
		int memCnt = 0;
		String del_list = "";
		for(int j=0; j < idxs.length; j++) {
			int idx = Integer.parseInt(idxs[j]);
			int del_pass = 0;
			
			rent_result = roomRentService.selectRoomRent3(idx);

			//System.out.println("삭제할 자료 : " + bi_code);
			if(rent_result == null) {
				rttr.addFlashAttribute("resultMsg", "삭제할 자료가 없습니다");
				del_pass = 1;
			}
						
			//삭제
			if(del_pass == 0) {
				roomRentService.deleteRoomRent(idx);
				
				del_list = del_list + ", " + idx;
			}

		}

        //System.out.println("단계8");
		//사용자 로그 저장
        String userIp = EgovClntInfo.getClntIP(request);
        MemlogVO memlogvo = new MemlogVO();
		memlogvo.setGubunx("대관신청 선택삭제");
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
        return "redirect:/sb03/sub01.do";
	}
	
	//신청 상태 변경
	@RequestMapping(value = "/sb03/sub01_schange.do")
	public String change_wssSb03_01s(@RequestParam("idx") String[] idxs, HttpServletRequest request, ModelMap model, RedirectAttributes rttr) throws Exception{
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
		
		RoomRentVO rent_result = new RoomRentVO();
		
		String cstate = EgovStringUtil.clearXSS(request.getParameter("cstate"),"");
		
		//참여자인지 체크
		int totCnt = 0;
		int memCnt = 0;
		String del_list = "";
		for(int j=0; j < idxs.length; j++) {
			int idx = Integer.parseInt(idxs[j]);
			int del_pass = 0;
			
			rent_result = roomRentService.selectRoomRent3(idx);

			//System.out.println("삭제할 자료 : " + bi_code);
			if(rent_result == null) {
				rttr.addFlashAttribute("resultMsg", "상태변경할 자료가 없습니다");
				del_pass = 1;
			}
						
			//삭제
			if(del_pass == 0) {
				
				RoomRentVO rvo = new RoomRentVO();
				rvo.setIdx(idx);
				rvo.setStatus(cstate);
				if(cstate.equals("3")) {
					rvo.setRefuse_txt("내부사정으로 대관이 취소되었습니다.");
					
					SmsSend24.AuthSms();
					
					SmsSend24.Cafe24SmsSend(rent_result.getMobile(), rent_result.getDatexx() + "일 대관신청이 반려되었습니다. -경남관광기업지원센터");
					
				} else if(cstate.equals("2")) {
					
					SmsSend24.AuthSms();
					
					SmsSend24.Cafe24SmsSend(rent_result.getMobile(), rent_result.getDatexx() + "일 대관신청이 승인되었습니다. -경남관광기업지원센터");
					
				}
				
				rvo.setSys_id(sys_id);
				rvo.setCom_ip(userIp);
				
				roomRentService.changeRoomRent_info(rvo);
				
				del_list = del_list + ", " + idx;
			}

		}

        //System.out.println("단계8");
		//사용자 로그 저장
        //String userIp = EgovClntInfo.getClntIP(request);
        MemlogVO memlogvo = new MemlogVO();
		memlogvo.setGubunx("대관신청 상태변경");
		memlogvo.setSubject("신청자:"+rent_result.getName() + " 날짜:" + rent_result.getDatexx() + " 상태:"+cstate);
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
		
		
		return "redirect:/sb03/sub01.do";
	}
	
	@RequestMapping("/sb03/sub09.do")
	public String get_sb03_sub09(HttpServletRequest request, ModelMap model, RedirectAttributes rttr) throws Exception {
		
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
		
		return "egovframework/gntbsc/wssms/sub03_09";
	}
	
	
}
