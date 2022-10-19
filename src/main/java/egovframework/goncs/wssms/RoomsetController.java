package egovframework.goncs.wssms;

import java.net.URLDecoder;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.utl.fcc.service.EgovStringUtil;
import egovframework.com.utl.sim.service.EgovClntInfo;
import egovframework.goncs.RoomRent.service.RoomSetService;
import egovframework.goncs.RoomRent.service.RoomSetVO;
import egovframework.goncs.member.service.LoginVO;

@Controller
public class RoomsetController {

	@Resource(name = "roomSetService")
    private RoomSetService roomSetService;
	
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
	
	@RequestMapping("/sb03/sub02.do")
	public String get_sb03_sub02(HttpServletRequest request, ModelMap model, RedirectAttributes rttr) throws Exception {
		
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
		
		return "egovframework/gntbsc/wssms/sub03_02";
	}
	
	@RequestMapping("/sb03/sub03.do")
	public String get_sb03_sub03(HttpServletRequest request, ModelMap model, RedirectAttributes rttr) throws Exception {
		
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
		
		return "egovframework/gntbsc/wssms/sub03_03";
	}
	
	@RequestMapping("/sb03/sub04.do")
	public String get_sb03_sub04(HttpServletRequest request, ModelMap model, RedirectAttributes rttr) throws Exception {
		
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
		
		return "egovframework/gntbsc/wssms/sub03_04";
	}
	
	@RequestMapping("/sb03/sub05.do")
	public String get_sb03_sub05(HttpServletRequest request, ModelMap model, RedirectAttributes rttr) throws Exception {
		
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
		
		return "egovframework/gntbsc/wssms/sub03_05";
	}
	
	@RequestMapping("/sb03/sub06.do")
	public String get_sb03_sub06(HttpServletRequest request, ModelMap model, RedirectAttributes rttr) throws Exception {
		
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
		
		return "egovframework/gntbsc/wssms/sub03_06";
	}
	
	@RequestMapping("/sb03/sub07.do")
	public String get_sb03_sub07(HttpServletRequest request, ModelMap model, RedirectAttributes rttr) throws Exception {
		
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
		
		return "egovframework/gntbsc/wssms/sub03_07";
	}
	
	@RequestMapping("/sb03/sub08.do")
	public String get_sb03_sub08(HttpServletRequest request, ModelMap model, RedirectAttributes rttr) throws Exception {
		
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
		
		return "egovframework/gntbsc/wssms/sub03_08";
	}
	
	@RequestMapping(value = "/wssms/saveRoomRentAjax.do")
	public ModelAndView saveRoomid_RentAjax(@RequestParam("room_id") String room_id, @RequestParam("datexx") String datexx, 
			@RequestParam("rent_yn") String rent_yn, HttpServletRequest request) throws Exception {
		
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		
		
		String userIp = EgovClntInfo.getClntIP(request);
		
		room_id = URLDecoder.decode(room_id,"utf-8");
		datexx = URLDecoder.decode(datexx,"utf-8");
		rent_yn = URLDecoder.decode(rent_yn,"utf-8");
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("jsonView");
		
		RoomSetVO rvo = new RoomSetVO();
		RoomSetVO rvo_rlt = new RoomSetVO();
		rvo.setRoom_id(room_id);
		rvo.setDatexx(datexx);
		rvo_rlt = roomSetService.selectRoomSet_info(rvo);
		
		if(rvo_rlt == null) {
			rvo.setRent_yn(rent_yn);
			rvo.setSys_id(user.getUs_id());
			rvo.setCom_ip(userIp);
			roomSetService.insertRoomSet_info(rvo);
			
		} else {
			rvo.setRent_yn(rent_yn);
			rvo.setSys_id(user.getUs_id());
			rvo.setCom_ip(userIp);
			roomSetService.updateRoomSet_info(rvo);
		}
		
		return modelAndView;
	}
	
	@RequestMapping(value = "/wssms/saveRoomRentAllAjax.do")
	public ModelAndView saveRoomid_Rent_AllAjax(HttpServletRequest request) throws Exception {
		
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		
		String userIp = EgovClntInfo.getClntIP(request);
		
		String room_id = EgovStringUtil.clearXSS(request.getParameter("room_id"), "");
		String yearx = EgovStringUtil.clearXSS(request.getParameter("yearx"), "");
		String monthx = EgovStringUtil.clearXSS(request.getParameter("monthx"), "");
		String rent_yn = EgovStringUtil.clearXSS(request.getParameter("rent_yn"), "");
		String datexx = "";
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("jsonView");
		
		Calendar day = Calendar.getInstance();
		int nowYear = Integer.parseInt(yearx);
		int nowMonth = Integer.parseInt(monthx)-1;
		int nowDate = 1;
		day.set(nowYear, nowMonth, nowDate);
		// 이달의 마지막 날자 구하기 ( 아래 for 문에서 이용
		int lastDate = day.getActualMaximum(Calendar.DATE); 

		// 오늘 날자 기억해 두기
		String today = getDateString(day);

		int thisDate = day.get(Calendar.DATE);
		int thisMonth = day.get(Calendar.MONTH);
		nowMonth = thisMonth + 1;

		for ( int i = 1 ; i <= lastDate ; i ++ ) {
			
			String st_calmonth="";
			if(nowMonth<10){
				st_calmonth="0"+nowMonth;
			}else{
				st_calmonth=Integer.toString(nowMonth);
			}
			String st_caldate="";
			if(i<10){
				st_caldate="0"+i;
			}else{
				st_caldate=Integer.toString(i);
			}

			datexx = yearx+"-"+st_calmonth+"-"+st_caldate;
			
			RoomSetVO rvo = new RoomSetVO();
			RoomSetVO rvo_rlt = new RoomSetVO();
			rvo.setRoom_id(room_id);
			rvo.setDatexx(datexx);
			rvo_rlt = roomSetService.selectRoomSet_info(rvo);
			
			if(rvo_rlt == null) {
				rvo.setRent_yn(rent_yn);
				rvo.setSys_id(user.getUs_id());
				rvo.setCom_ip(userIp);
				roomSetService.insertRoomSet_info(rvo);
				
			} else {
				rvo.setRent_yn(rent_yn);
				rvo.setSys_id(user.getUs_id());
				rvo.setCom_ip(userIp);
				roomSetService.updateRoomSet_info(rvo);
			}
			
		}
		
		
		
		return modelAndView;
	}
		
	
}
