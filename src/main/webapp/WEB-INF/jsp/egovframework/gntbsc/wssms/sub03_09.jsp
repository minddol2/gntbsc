<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="egovframework.com.cmm.service.EgovProperties" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="egovframework.goncs.RoomRent.service.RoomRentVO" %>
<%@ page import="egovframework.goncs.RoomRent.service.impl.RoomRentDAO" %>
<%@ page import="java.util.Collections" %> 
<%@ page import="java.util.List" %> 
<%@ page import="java.util.ArrayList" %> 
<%@ page import="java.util.Iterator" %> 
<%@ page import="java.util.Map" %> 
<%@ page import="org.springframework.context.ApplicationContext" %>  
<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils" %>
<%@ page import="org.springframework.beans.BeansException" %>


<%@ page import="java.util.Date"%>
<%@ page import="java.util.Calendar"%>

<%
String bodyckey = "false";
int m1 = 3;
int m2 = 9;
int m3 = 0;

String yester = (String) request.getAttribute("yester");
String after = (String) request.getAttribute("after");
String today = (String) request.getAttribute("today");
String st_calmonth = (String) request.getAttribute("st_calmonth");

int thisYear = (int) request.getAttribute("thisYear");
int thisMonth = (int) request.getAttribute("thisMonth");
int thisDate = (int) request.getAttribute("thisDate");
int thisDay = (int) request.getAttribute("thisDay");

int lastDate = (int) request.getAttribute("lastDate");

int nowYear = (int) request.getAttribute("nowYear");
int nowMonth = (int) request.getAttribute("nowMonth");
int nowDate = (int) request.getAttribute("nowDate");


Calendar day = Calendar.getInstance();

day.set(nowYear, nowMonth, nowDate);
%>

<jsp:include page="/WEB-INF/jsp/egovframework/gntbsc/wssms/top.jsp" flush="true" >
		<jsp:param name="bodyckey" value="<%=bodyckey%>"/>
</jsp:include>
<jsp:include page="/WEB-INF/jsp/egovframework/gntbsc/wssms/sub_top.jsp" flush="true" >
		<jsp:param name="bodyckey" value="<%=bodyckey%>"/>
		<jsp:param name="m1" value="<%=m1%>"/>
		<jsp:param name="m2" value="<%=m2%>"/>
		<jsp:param name="m3" value="<%=m3%>"/>
</jsp:include>

<script type="text/javascript">
<!--
function go_room_mon(datexx) {
	document.frm.datexx.value = datexx;
	document.frm.action = "<c:url value='/sb03/sub09.do'/>";
	document.frm.submit();
}

$(document).ready(function(){
	var resultMsg = '${resultMsg}';
	
	if(resultMsg != "") {
		alert(resultMsg);
	}
	
});

//-->
</script>

<form name="frm" action=""  method="post" >
	<input type="hidden" name="datexx" value=""/>
</form>


<h4 class="tit_dot">대관신청 승인내역</h4>

<div class="sc_control2"> 
	<h4 class="year"><%=thisYear%>년</h4><span><%=thisMonth%>월</span>
	<a href="javascript:go_room_mon('<%=yester%>');" class="prev" title="이전 달력"><img src="<c:url value='/img/btn_sc_prev.gif'/>" alt="이전 달력" /></a>
	<a href="javascript:go_room_mon('<%=after%>');" class="next" title="다음 달력"><img src="<c:url value='/img/btn_sc_next.gif'/>" alt="다음 달력" /></a> 
</div>

<table class="calender_b"  cellpadding="0" cellspacing="0" summary="회의실">
  <caption>
  회의실
  </caption>
  <colgroup>
  <col width="14%" />
  <col width="14%" />
  <col width="14%" />
  <col width="14%" />
  <col width="14%" />
  <col width="14%" />
  <col width="14%" />
  </colgroup>
  <thead>
    <tr>
      <th class="sun" scope="col">일</th>
      <th scope="col">월</th>
      <th scope="col">화</th>
      <th scope="col">수</th>
      <th scope="col">목</th>
      <th scope="col">금</th>
      <th class="sat" scope="col">토</th>
    </tr>
  </thead>
  <tbody>
<%
ApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(pageContext.getServletContext());

String today_class = "";
String tmp_field4 = "";
int ntt_id = 0;
for ( int i = 1 ; i <= lastDate ; i ++ ) {

	// 날자 변경
	day.set( Calendar.DATE, i ) ; 

	// 날자 다시 셋팅
	thisDate = day.get(Calendar.DATE); // 일
  
	String st_caldate="";
	if(thisDate<10){
		st_caldate="0"+thisDate;
	}else{
		st_caldate=Integer.toString(thisDate);
	}

	String link_page=thisYear+st_calmonth+st_caldate;
	int s_date=Integer.parseInt(link_page);
	String s_date1=thisYear+"-"+st_calmonth+"-"+st_caldate;

    thisDay = day.get(Calendar.DAY_OF_WEEK); // 요일 ( 일요일 : 1 ~ 토요일 : 7 )

	if ( thisDate == 1 ) {
		out.print("<tr>  ");
		for ( int j = 1 ; j < thisDay ; j ++ ) {
			out.print("<td></td>  "); 
		}
	}

	if(thisDay==1){
		if(link_page.equals(today)) {
			today_class = "class='sun today'";
		} else {
			today_class = "class='sun'";
		}
%>
      <td <%=today_class%> ><span><%=thisDate%></span>
        <ul>
<%
		RoomRentVO rvo = new RoomRentVO();
		rvo.setDatexx(s_date1);
		rvo.setStatus("2");
		
		List<RoomRentVO>	rent_result = ctx.getBean(RoomRentDAO.class).selectRoomRentList(rvo);
		Iterator<RoomRentVO> iter = rent_result.iterator();
		while (iter.hasNext()) {
			RoomRentVO rt_vo = (RoomRentVO)iter.next();
			String room_nm = "";
			if(rt_vo.getRoom_id1().equals("s1")) {
				room_nm = "소회의실1";
			} else if(rt_vo.getRoom_id1().equals("s2")) {
				room_nm = "소회의실2";
			} else if(rt_vo.getRoom_id1().equals("s3")) {
				room_nm = "소회의실3";
			} else if(rt_vo.getRoom_id1().equals("s4")) {
				room_nm = "소회의실4";
			} else if(rt_vo.getRoom_id1().equals("s5")) {
				room_nm = "소회의실5";
			} else if(rt_vo.getRoom_id1().equals("s6")) {
				room_nm = "소회의실6";
			} else if(rt_vo.getRoom_id1().equals("s7")) {
				room_nm = "대회의실";
			}
			
			if(rt_vo.getRoom_id2().equals("s1")) {
				room_nm = room_nm + ", 소회의실1";
			} else if(rt_vo.getRoom_id2().equals("s2")) {
				room_nm = room_nm + ", 소회의실2";
			} else if(rt_vo.getRoom_id2().equals("s3")) {
				room_nm = room_nm + ", 소회의실3";
			} else if(rt_vo.getRoom_id2().equals("s4")) {
				room_nm = room_nm + ", 소회의실4";
			} else if(rt_vo.getRoom_id2().equals("s5")) {
				room_nm = room_nm + ", 소회의실5";
			} else if(rt_vo.getRoom_id2().equals("s6")) {
				room_nm = room_nm + ", 소회의실6";
			} else if(rt_vo.getRoom_id2().equals("s7")) {
				room_nm = room_nm + ", 대회의실";
			}
			
			if(rt_vo.getRoom_id3().equals("s1")) {
				room_nm = room_nm + ", 소회의실1";
			} else if(rt_vo.getRoom_id3().equals("s2")) {
				room_nm = room_nm + ", 소회의실2";
			} else if(rt_vo.getRoom_id3().equals("s3")) {
				room_nm = room_nm + ", 소회의실3";
			} else if(rt_vo.getRoom_id3().equals("s4")) {
				room_nm = room_nm + ", 소회의실4";
			} else if(rt_vo.getRoom_id3().equals("s5")) {
				room_nm = room_nm + ", 소회의실5";
			} else if(rt_vo.getRoom_id3().equals("s6")) {
				room_nm = room_nm + ", 소회의실6";
			} else if(rt_vo.getRoom_id3().equals("s7")) {
				room_nm = room_nm + ", 대회의실";
			}
%>
			<li style="text-align:left; padding-left:15px; padding-bottom:5px;">
				<a href="<c:url value='/sb03/sub01_write.do'/>?idx=<%=rt_vo.getIdx()%>" onclick="window.open(this.href,'pop','width=700,height=600,scrollbars=yes'); return false;" >
			<strong>[<%=room_nm%>] <%=rt_vo.getTimexx()%>(<%=rt_vo.getCompany()%>)</strong>&nbsp;(<%=rt_vo.getPeople_cnt()%>명)
			</li>
<%	
		}
%>
        </ul>
	  </td>
<%
	} else if (thisDay==7) {
		if(link_page.equals(today)) {
			today_class = "class='sat today'";
		} else {
			today_class = "class='sat'";
		}
%>
      <td <%=today_class%> ><span><%=thisDate%></span>
        <ul>
<%
		RoomRentVO rvo2 = new RoomRentVO();
		rvo2.setDatexx(s_date1);
		rvo2.setStatus("2");
		
		List<RoomRentVO>	rent_result2 = ctx.getBean(RoomRentDAO.class).selectRoomRentList(rvo2);
		Iterator<RoomRentVO> iter = rent_result2.iterator();
		while (iter.hasNext()) {
			RoomRentVO rt_vo = (RoomRentVO)iter.next();
			String room_nm = "";
			if(rt_vo.getRoom_id1().equals("s1")) {
				room_nm = "소회의실1";
			} else if(rt_vo.getRoom_id1().equals("s2")) {
				room_nm = "소회의실2";
			} else if(rt_vo.getRoom_id1().equals("s3")) {
				room_nm = "소회의실3";
			} else if(rt_vo.getRoom_id1().equals("s4")) {
				room_nm = "소회의실4";
			} else if(rt_vo.getRoom_id1().equals("s5")) {
				room_nm = "소회의실5";
			} else if(rt_vo.getRoom_id1().equals("s6")) {
				room_nm = "소회의실6";
			} else if(rt_vo.getRoom_id1().equals("s7")) {
				room_nm = "대회의실";
			}
			
			if(rt_vo.getRoom_id2().equals("s1")) {
				room_nm = room_nm + ", 소회의실1";
			} else if(rt_vo.getRoom_id2().equals("s2")) {
				room_nm = room_nm + ", 소회의실2";
			} else if(rt_vo.getRoom_id2().equals("s3")) {
				room_nm = room_nm + ", 소회의실3";
			} else if(rt_vo.getRoom_id2().equals("s4")) {
				room_nm = room_nm + ", 소회의실4";
			} else if(rt_vo.getRoom_id2().equals("s5")) {
				room_nm = room_nm + ", 소회의실5";
			} else if(rt_vo.getRoom_id2().equals("s6")) {
				room_nm = room_nm + ", 소회의실6";
			} else if(rt_vo.getRoom_id2().equals("s7")) {
				room_nm = room_nm + ", 대회의실";
			}
			
			if(rt_vo.getRoom_id3().equals("s1")) {
				room_nm = room_nm + ", 소회의실1";
			} else if(rt_vo.getRoom_id3().equals("s2")) {
				room_nm = room_nm + ", 소회의실2";
			} else if(rt_vo.getRoom_id3().equals("s3")) {
				room_nm = room_nm + ", 소회의실3";
			} else if(rt_vo.getRoom_id3().equals("s4")) {
				room_nm = room_nm + ", 소회의실4";
			} else if(rt_vo.getRoom_id3().equals("s5")) {
				room_nm = room_nm + ", 소회의실5";
			} else if(rt_vo.getRoom_id3().equals("s6")) {
				room_nm = room_nm + ", 소회의실6";
			} else if(rt_vo.getRoom_id3().equals("s7")) {
				room_nm = room_nm + ", 대회의실";
			}
%>
			<li style="text-align:left; padding-left:15px; padding-bottom:5px;">
				<a href="<c:url value='/sb03/sub01_write.do'/>?idx=<%=rt_vo.getIdx()%>" onclick="window.open(this.href,'pop','width=700,height=600,scrollbars=yes'); return false;" >
			<strong>[<%=room_nm%>] <%=rt_vo.getTimexx()%>(<%=rt_vo.getCompany()%>)</strong>&nbsp;(<%=rt_vo.getPeople_cnt()%>명)
			</li>
<%	
		}
%>
        </ul>
	  </td>
<%
	} else {
		if(link_page.equals(today)) {
			today_class = "class='today'";
		} else {
			today_class = "class=''";
		}
%>
      <td <%=today_class%> ><span><%=thisDate%></span>
        <ul>
<%
		RoomRentVO rvo3 = new RoomRentVO();
		rvo3.setDatexx(s_date1);
		rvo3.setStatus("2");
		
		List<RoomRentVO>	rent_result3 = ctx.getBean(RoomRentDAO.class).selectRoomRentList(rvo3);
		Iterator<RoomRentVO> iter = rent_result3.iterator();
		while (iter.hasNext()) {
			RoomRentVO rt_vo = (RoomRentVO)iter.next();
			String room_nm = "";
			if(rt_vo.getRoom_id1().equals("s1")) {
				room_nm = "소회의실1";
			} else if(rt_vo.getRoom_id1().equals("s2")) {
				room_nm = "소회의실2";
			} else if(rt_vo.getRoom_id1().equals("s3")) {
				room_nm = "소회의실3";
			} else if(rt_vo.getRoom_id1().equals("s4")) {
				room_nm = "소회의실4";
			} else if(rt_vo.getRoom_id1().equals("s5")) {
				room_nm = "소회의실5";
			} else if(rt_vo.getRoom_id1().equals("s6")) {
				room_nm = "소회의실6";
			} else if(rt_vo.getRoom_id1().equals("s7")) {
				room_nm = "대회의실";
			}
			
			if(rt_vo.getRoom_id2().equals("s1")) {
				room_nm = room_nm + ", 소회의실1";
			} else if(rt_vo.getRoom_id2().equals("s2")) {
				room_nm = room_nm + ", 소회의실2";
			} else if(rt_vo.getRoom_id2().equals("s3")) {
				room_nm = room_nm + ", 소회의실3";
			} else if(rt_vo.getRoom_id2().equals("s4")) {
				room_nm = room_nm + ", 소회의실4";
			} else if(rt_vo.getRoom_id2().equals("s5")) {
				room_nm = room_nm + ", 소회의실5";
			} else if(rt_vo.getRoom_id2().equals("s6")) {
				room_nm = room_nm + ", 소회의실6";
			} else if(rt_vo.getRoom_id2().equals("s7")) {
				room_nm = room_nm + ", 대회의실";
			}
			
			if(rt_vo.getRoom_id3().equals("s1")) {
				room_nm = room_nm + ", 소회의실1";
			} else if(rt_vo.getRoom_id3().equals("s2")) {
				room_nm = room_nm + ", 소회의실2";
			} else if(rt_vo.getRoom_id3().equals("s3")) {
				room_nm = room_nm + ", 소회의실3";
			} else if(rt_vo.getRoom_id3().equals("s4")) {
				room_nm = room_nm + ", 소회의실4";
			} else if(rt_vo.getRoom_id3().equals("s5")) {
				room_nm = room_nm + ", 소회의실5";
			} else if(rt_vo.getRoom_id3().equals("s6")) {
				room_nm = room_nm + ", 소회의실6";
			} else if(rt_vo.getRoom_id3().equals("s7")) {
				room_nm = room_nm + ", 대회의실";
			}
%>
			<li style="text-align:left; padding-left:15px; padding-bottom:5px;">
				<a href="<c:url value='/sb03/sub01_write.do'/>?idx=<%=rt_vo.getIdx()%>" onclick="window.open(this.href,'pop','width=700,height=600,scrollbars=yes'); return false;" >
			<strong>[<%=room_nm%>] <%=rt_vo.getTimexx()%>(<%=rt_vo.getCompany()%>)</strong>&nbsp;(<%=rt_vo.getPeople_cnt()%>명)
			</li>
<%	
		}
%>
        </ul>
	  </td>
<%
	}

	if ( thisDate == lastDate ) {
		for ( int j = 0 ; j < 7 - thisDay ; j ++ ) {
			out.print("<td></td>  "); 
		}
	// 토요일인 경우에
	} else if ( thisDay == 7 ) {
		out.print("</tr> <tr>  ");
	}
}
%>

  </tbody>
</table>


<%@ include file="/WEB-INF/jsp/egovframework/gntbsc/wssms/footer.jsp" %>