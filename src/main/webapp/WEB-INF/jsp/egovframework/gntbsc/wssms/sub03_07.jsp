<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="egovframework.com.cmm.service.EgovProperties" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="egovframework.goncs.RoomRent.service.RoomSetVO" %>
<%@ page import="egovframework.goncs.RoomRent.service.impl.RoomSetDAO" %>
<%@ page import="java.util.Collections" %> 
<%@ page import="org.springframework.context.ApplicationContext" %>  
<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils" %>
<%@ page import="org.springframework.beans.BeansException" %>


<%@ page import="java.util.Date"%>
<%@ page import="java.util.Calendar"%>

<%
String bodyckey = "false";
int m1 = 3;
int m2 = 7;
int m3 = 0;

String room_id = "s6";
String rent_yn = "N";

String yester = (String) request.getAttribute("yester");
String after = (String) request.getAttribute("after");
String today = (String) request.getAttribute("today");
String st_calmonth = (String) request.getAttribute("st_calmonth");

int thisYear = (int) request.getAttribute("thisYear");
int thisMonth = (int) request.getAttribute("thisMonth");
int thisDate = (int) request.getAttribute("thisDate");
int thisDay = (int) request.getAttribute("thisDay");

int lastDate = (int) request.getAttribute("lastDate");
//out.println("lastDate : " + lastDate);

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
	document.frm.action = "<c:url value='/sb03/sub07.do'/>";
	document.frm.submit();
}

function res_able2(room_id, datexx, rent_yn) {
	
	$.ajax({
        url:"<c:url value='/wssms/saveRoomRentAjax.do'/>",
        data:{ "room_id": room_id, "datexx":datexx, "rent_yn":rent_yn},
        dataType:'json',
        type:'POST',
        success: function(response){
            //alert(response);
            document.location.reload();
            
        },
        error:function(data){
        	return;
        }
    });
}

function change_month_state(room_id, yearx, monthx, rent_yn) {
	$.ajax({
        url:"<c:url value='/wssms/saveRoomRentAllAjax.do'/>",
        data:{ "room_id": room_id, "yearx":yearx, "monthx":monthx, "rent_yn":rent_yn},
        dataType:'json',
        type:'POST',
        success: function(response){
            //alert(response);
            document.location.reload();
            
        },
        error:function(data){
        	return;
        }
    });
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


<h4 class="tit_dot">소회의실6 설정</h4>

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
for ( int i_day = 1 ; i_day <= lastDate ; i_day ++ ) {

	// 날자 변경
	day.set( Calendar.DATE, i_day ) ; 

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
        	<li>
<%
		RoomSetVO roomsetvo = new RoomSetVO();
		RoomSetVO roomset_result = new RoomSetVO();
		roomsetvo.setRoom_id(room_id);
		roomsetvo.setDatexx(s_date1);
		
		try {
			roomset_result = ctx.getBean(RoomSetDAO.class).selectRoomSet_info(roomsetvo);
		} catch (BeansException e) {
			//isDBOK = false;
		} catch (Exception e) {
			//isDBOK = false;
		}
		if (roomset_result != null) {
			if(roomset_result.getRent_yn().equals("Y")) {
				out.println("<button type=\"button\" class=\"btn_sumit3 btn_src\" onclick=\"res_able2('"+room_id+"','"+s_date1+"','N')\">예약가능</button>");
			} else {
				out.println("<button type=\"button\" class=\"btn_sumit5 btn_src\" onclick=\"res_able2('"+room_id+"','"+s_date1+"','Y')\">예약불가</button>");
			}
		} else {
			out.println("<button type=\"button\" class=\"btn_sumit5 btn_src\" onclick=\"res_able2('"+room_id+"','"+s_date1+"','Y')\">예약불가</button>");
		}
%>
        	</li>
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
        	<li>
<%
		RoomSetVO roomsetvo2 = new RoomSetVO();
		RoomSetVO roomset_result2 = new RoomSetVO();
		roomsetvo2.setRoom_id(room_id);
		roomsetvo2.setDatexx(s_date1);

		try {
			roomset_result2 = ctx.getBean(RoomSetDAO.class).selectRoomSet_info(roomsetvo2);
		} catch (BeansException e) {
			//isDBOK = false;
		} catch (Exception e) {
			//isDBOK = false;
		}
		if (roomset_result2 != null) {
			if(roomset_result2.getRent_yn().equals("Y")) {
				out.println("<button type=\"button\" class=\"btn_sumit3 btn_src\" onclick=\"res_able2('"+room_id+"','"+s_date1+"','N')\">예약가능</button>");
			} else {
				out.println("<button type=\"button\" class=\"btn_sumit5 btn_src\" onclick=\"res_able2('"+room_id+"','"+s_date1+"','Y')\">예약불가</button>");
			}
		} else {
			out.println("<button type=\"button\" class=\"btn_sumit5 btn_src\" onclick=\"res_able2('"+room_id+"','"+s_date1+"','Y')\">예약불가</button>");
		}
%>
        	</li>
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
        	<li>
<%
		RoomSetVO roomsetvo3 = new RoomSetVO();
		RoomSetVO roomset_result3 = new RoomSetVO();
		roomsetvo3.setRoom_id(room_id);
		roomsetvo3.setDatexx(s_date1);

		try {
			roomset_result3 = ctx.getBean(RoomSetDAO.class).selectRoomSet_info(roomsetvo3);
		} catch (BeansException e) {
			//isDBOK = false;
		} catch (Exception e) {
			//isDBOK = false;
		}
		if (roomset_result3 != null) {
			if(roomset_result3.getRent_yn().equals("Y")) {
				out.println("<button type=\"button\" class=\"btn_sumit3 btn_src\" onclick=\"res_able2('"+room_id+"','"+s_date1+"','N')\">예약가능</button>");
			} else {
				out.println("<button type=\"button\" class=\"btn_sumit5 btn_src\" onclick=\"res_able2('"+room_id+"','"+s_date1+"','Y')\">예약불가</button>");
			}
		} else {
			out.println("<button type=\"button\" class=\"btn_sumit5 btn_src\" onclick=\"res_able2('"+room_id+"','"+s_date1+"','Y')\">예약불가</button>");
		}
%>
        	</li>
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

<br />
<div class="boardButton"> 
    <span><a href="#" onclick="change_month_state('<%=room_id%>','<%=thisYear%>','<%=thisMonth%>','Y')" >전체가능</a></span> 
	<span><a href="#" onclick="change_month_state('<%=room_id%>','<%=thisYear%>','<%=thisMonth%>','N')" >전체불가</a></span> 
</div>

<%@ include file="/WEB-INF/jsp/egovframework/gntbsc/wssms/footer.jsp" %>