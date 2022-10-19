<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="egovframework.com.cmm.service.EgovProperties" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import ="egovframework.goncs.member.service.LoginVO" %>
<%
String bodyckey = "false";
int m1 = 2;
int m2 = 8;
int m3 = 0;

LoginVO loginVO = (LoginVO)session.getAttribute("loginVO"); 

String room_s1 = (String) request.getAttribute("room_s1");
String room_s2 = (String) request.getAttribute("room_s2");
String room_s3 = (String) request.getAttribute("room_s3");
String room_s4 = (String) request.getAttribute("room_s4");
String room_s5 = (String) request.getAttribute("room_s5");
String room_s6 = (String) request.getAttribute("room_s6");
String room_s7 = (String) request.getAttribute("room_s7");

String time0900 = (String) request.getAttribute("time0900");
String time0930 = (String) request.getAttribute("time0930");
String time1000 = (String) request.getAttribute("time1000");
String time1030 = (String) request.getAttribute("time1030");
String time1100 = (String) request.getAttribute("time1100");
String time1130 = (String) request.getAttribute("time1130");
String time1200 = (String) request.getAttribute("time1200");
String time1230 = (String) request.getAttribute("time1230");
String time1300 = (String) request.getAttribute("time1300");
String time1330 = (String) request.getAttribute("time1330");
String time1400 = (String) request.getAttribute("time1400");
String time1430 = (String) request.getAttribute("time1430");
String time1500 = (String) request.getAttribute("time1500");
String time1530 = (String) request.getAttribute("time1530");
String time1600 = (String) request.getAttribute("time1600");
String time1630 = (String) request.getAttribute("time1630");
String time1700 = (String) request.getAttribute("time1700");
String time1730 = (String) request.getAttribute("time1730");

%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>경남관광기업지원센터</title>
<meta charset="utf-8">
<meta name="viewport" content="width=1400px, user-scalable=yes"> <!--표준형-->
<meta name="format-detection" content="telephone=no, address=no, email=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta http-equiv="Expires" content="-1" /> 

<link rel="shortcut icon" href="<c:url value='/img/favicon.png" type="image/x-icon'/>" />
<link rel="stylesheet" media="all" href="<c:url value='/css2/font.css'/>" />

<link rel="stylesheet" type="text/css" href="<c:url value='/plugin/font-awesome/css/font-awesome.min.css'/>">
<link rel="stylesheet" media="all" href="<c:url value='/css2/style.css'/>" />
<link rel="stylesheet" media="all" href="<c:url value='/css2/program.css'/>" />
<link rel="stylesheet" media="all" href="<c:url value='/css2/layout.css'/>" />
<link rel="stylesheet" media="all" href="<c:url value='/css2/menu.css'/>" />
<link rel="stylesheet" media="all" href="<c:url value='/css2/board.css'/>" />
<link rel="stylesheet" media="all" href="<c:url value='/css2/category.css'/>" />
<link rel="stylesheet" media="all" href="<c:url value='/css2/graph.css'/>" />

<script type="text/javascript" src="<c:url value='/js/jquery-2.1.4.js'/>"></script>

<script type="text/javascript" src="<c:url value='/js/jquery-ui-1.7.2.custom.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/tytabs.jquery.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/menu.js'/>"></script> <!-- Resource jQuery -->
<script type="text/javascript" src="<c:url value='/js/common.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/modernizr.js'/>"></script> <!-- Modernizr -->
<script type="text/javascript" src="<c:url value='/SE2/js/HuskyEZCreator.js'/>" charset="utf-8"></script>

<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script type="text/javascript" src="<c:url value='/js/pg_script.js'/>"></script>
<script type="text/javascript">
<!--
$(document).ready(function(){	
	var resultMsg = '${resultMsg}';
	
	if(resultMsg != "") {
		alert(resultMsg);
	}
	
});

$(function() {    
	$( ".cal_date" ).datepicker({
		dateFormat: "yy-mm-dd",
		changeMonth: true,
		changeYear: true,
		showOtherMonths: true ,
		selectOtherMonths: true,
		showMonthAfterYear: true ,
		monthNamesShort: [ "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12" ],
		monthNames:[ "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12" ]
	}); 
	
});

function select_room(room_id) {
	var room_id1 = $("#room_id1").val();
	var room_id2 = $("#room_id2").val();
	var room_id3 = $("#room_id3").val();
	var rcnt = 0;
	var rcnt1 = 0;
	var rcnt2 = 0;
		
	if(room_id1 == room_id) {
		$("#room_id1").val("");
		room_id1 = "";
		
	} else if(room_id2 == room_id) {
		$("#room_id2").val("");
		room_id2 = "";
		
	} else if(room_id3 == room_id) {
		$("#room_id3").val("");
		room_id3 = "";
		
	} else if(room_id1 == "") {
		$("#room_id1").val(room_id);
		room_id1 = room_id;
		
	} else if(room_id2 == "") {
		$("#room_id2").val(room_id);
		room_id2 = room_id;
		
	} else if(room_id3 == "") {
		$("#room_id3").val(room_id);	
		room_id3 = room_id;
	}
	
	if( (room_id1 != "") && (room_id2 != "") && (room_id3 != "") && (room_id != "s7") ) {
		if( (room_id1 != room_id) && (room_id2 != room_id) && (room_id3 != room_id) ) {
			alert("대관은 최대3개까지 신청이 가능합니다.");
			$("#room_"+room_id).prop("checked", false);
			return false;
		}
	}
	
	if(room_id1 != "") {
		rcnt++;
	}
	if(room_id2 != "") {
		rcnt++;
	}
	if(room_id3 != "") {
		rcnt++;
	}
	if( (room_id1 == "s1") || (room_id2 == "s1") || (room_id3 == "s1") ) {
		rcnt1++;
	}
	if( (room_id1 == "s2") || (room_id2 == "s2") || (room_id3 == "s2") ) {
		rcnt1++;
	}
	if( (room_id1 == "s3") || (room_id2 == "s3") || (room_id3 == "s3") ) {
		rcnt1++;
	}
	
	if( (room_id1 == "s4") || (room_id2 == "s4") || (room_id3 == "s4") ) {
		rcnt2++;
	}
	if( (room_id1 == "s5") || (room_id2 == "s5") || (room_id3 == "s5") ) {
		rcnt2++;
	}
	if( (room_id1 == "s6") || (room_id2 == "s6") || (room_id3 == "s6") ) {
		rcnt2++;
	}
	
	if( ( (room_id1 == "s7") || (room_id2 == "s7") || (room_id3 == "s7") || (room_id == "s7") ) && (rcnt > 1) ) {
		alert("대회의실은 하나만 선택할 수 있습니다.");
		$("#room_"+room_id).prop("checked", false);
		if(room_id1 == room_id) {
			$("#room_id1").val("");
		} else if(room_id2 == room_id) {
			$("#room_id2").val("");
		} else if(room_id3 == room_id) {
			$("#room_id3").val("");
		}
		return false;
		
	} else if( (rcnt1 > 0) && (rcnt2 > 0) ) {
		alert("소회의실은 1~3 / 4~6끼리 중복선택가능합니다.");
		$("#room_"+room_id).prop("checked", false);
		
		if(room_id1 == room_id) {
			$("#room_id1").val("");
		} else if(room_id2 == room_id) {
			$("#room_id2").val("");
		} else if(room_id3 == room_id) {
			$("#room_id3").val("");
		}
		return false;
		
	} else if(rcnt > 3) {
		alert("대관은 최대3개까지 신청이 가능합니다.");
		$("#room_"+room_id).prop("checked", false);
		if(room_id1 == room_id) {
			$("#room_id1").val("");
		} else if(room_id2 == room_id) {
			$("#room_id2").val("");
		} else if(room_id3 == room_id) {
			$("#room_id3").val("");
		}
		return false;
	}
	
	return false;
	
}

function select_time(timexx) {
	var datexx  = $("#datexx").val();
	var ctimexx = $("#timexx").val();
	var j = 0;
	
	if(ctimexx.indexOf(timexx) > -1) {
		ctimexx = replaceAll(ctimexx, ","+timexx, "");
		ctimexx = replaceAll(ctimexx, timexx, "");
	} else {
		if(ctimexx == "") {
			ctimexx = timexx;
		} else {
			ctimexx = ctimexx + "," + timexx;
		}
	}
	$("#timexx").val(ctimexx);
	
}

function update_prc() {
	
	var idx = $("#idx").val();
	var datexx = $("#datexx").val();
	var timexx = $("#timexx").val();
	var room_id1 = $("#room_id1").val();
	var room_id2 = $("#room_id2").val();
	var room_id3 = $("#room_id3").val();
	var name = $("#name").val();
	var mobile = $("#mobile").val();
	var company = $("#company").val();
	var people_cnt = $("#people_cnt").val();
	var content1 = $("#content1").val();
	var content2 = $("#content2").val();
	var etc = $("#etc").val();
	var status = $("#status").val();
	
	if(datexx == "") {
		alert("날짜를 선택해 주세요");
		return;
	}
	if(timexx == "") {
		alert("시간을 선택해 주세요");
		return;
	}
	if( (room_id1=="") && (room_id2=="") && (room_id3=="") ) {
		alert("대관가능장소를 선택해 주세요");
		return;
	}
	if(name == "") {
		alert("예약자명을 입력해 주세요");
		return;
	}
	if(mobile == "") {
		alert("휴대폰번호를 입력해 주세요");
		return;
	}
	if(company == "") {
		alert("업체명을 입력해 주세요");
		return;
	}
	if(people_cnt == "") {
		alert("예약인원을 입력해 주세요");
		return;
	}
	if(content1 == "") {
		alert("사용목적을 입력해 주세요");
		return;
	}
	
	
	$.ajax({
    	url:"<c:url value='/rent/save_rent_up.do'/>",
    	data:{ "datexx": datexx,
    		"timexx": timexx, "room_id1": room_id1,
    		"room_id2": room_id2, "room_id3": room_id3,
    		"name": name, "mobile": mobile,
    		"company": company, "people_cnt": people_cnt,
    		"content1": content1, "content2": content2,
    		"etc": etc, "idx": idx, "status": status },
    	dataType:'json',
    	type:'POST',
    	success: function(response){
            //대여디비처리 성공시
    		if(response.result == "Y") {
    			alert("정상 수정되었습니다.");
    			opener.location.reload();
    			
    		} else {
    			alert("저장에 실패했습니다. 다시 시도해 주세요.");
    			return false;
    		}
        
        },
    	error:function(data){
    		//alert('rent err');   
   		}
	});
}


//-->
</script>
</head>

<body>
<div >

<h4 class="tit_dot">대관신청 상세</h4>

<form name="sfrm" action=""  method="post" >
<input type="hidden" name="idx" id="idx" value="<c:out value='${rentVO.idx}'/>" />
<input type="hidden" name="room_id1" id="room_id1" value="<c:out value='${rentVO.room_id1}'/>" />
<input type="hidden" name="room_id2" id="room_id2" value="<c:out value='${rentVO.room_id2}'/>" />
<input type="hidden" name="room_id3" id="room_id3" value="<c:out value='${rentVO.room_id3}'/>" />
<input type="hidden" name="timexx" id="timexx" value="<c:out value='${rentVO.timexx}'/>" />

<table class="dash_table tal bmb">
	<colgroup>
		<col width="25%"/>
		<col width="75%"/>
	</colgroup>
	<tr>
		<th>ROOM</th>
		<td>
			<input type="checkbox" name="room_s1" id="room_s1" value="s1" onclick="select_room('s1');" <% if(room_s1.equals("Y")) out.println("checked"); %>  /><label for="room_s1">소회의실1</label>&nbsp;&nbsp;
			<input type="checkbox" name="room_s2" id="room_s2" value="s2" onclick="select_room('s2');" <% if(room_s2.equals("Y")) out.println("checked"); %> /><label for="room_s2">소회의실2</label>&nbsp;&nbsp;
			<input type="checkbox" name="room_s3" id="room_s3" value="s3" onclick="select_room('s3');" <% if(room_s3.equals("Y")) out.println("checked"); %> /><label for="room_s3">소회의실3</label>&nbsp;&nbsp;
			<input type="checkbox" name="room_s4" id="room_s4" value="s4" onclick="select_room('s4');" <% if(room_s4.equals("Y")) out.println("checked"); %> /><label for="room_s4">소회의실4</label><br />
			<input type="checkbox" name="room_s5" id="room_s5" value="s5" onclick="select_room('s5');" <% if(room_s5.equals("Y")) out.println("checked"); %> /><label for="room_s5">소회의실5</label>&nbsp;&nbsp;
			<input type="checkbox" name="room_s6" id="room_s6" value="s6" onclick="select_room('s6');" <% if(room_s6.equals("Y")) out.println("checked"); %> /><label for="room_s6">소회의실6</label>&nbsp;&nbsp;
			<input type="checkbox" name="room_s7" id="room_s7" value="s7" onclick="select_room('s7');" <% if(room_s7.equals("Y")) out.println("checked"); %> /><label for="room_s7">대회의실</label>
		</td>
	</tr>
	<tr>
		<th>예약일자</th>
		<td>
			<input type="text" class="cal_date w20" name="datexx" id="datexx" value="<c:out value='${rentVO.datexx}'/>" />
		</td>
	</tr>
	<tr>
		<th>예약시간</th>
		<td>
			<input type="checkbox" id="timexx0900" value="0900" onclick="select_time('0900');" <% if(time0900.equals("Y")) out.println("checked"); %> /><label for="timexx0900">09:00~09:30</label>&nbsp;&nbsp;
			<input type="checkbox" id="timexx0930" value="0930" onclick="select_time('0930');" <% if(time0930.equals("Y")) out.println("checked"); %> /><label for="timexx0930">09:30~10:00</label>&nbsp;&nbsp;
			<input type="checkbox" id="timexx1000" value="1000" onclick="select_time('1000');" <% if(time1000.equals("Y")) out.println("checked"); %> /><label for="timexx1000">10:00~10:30</label>&nbsp;&nbsp;
			<input type="checkbox" id="timexx1030" value="1030" onclick="select_time('1030');" <% if(time1030.equals("Y")) out.println("checked"); %> /><label for="timexx1030">10:30~11:00</label><br />
			<input type="checkbox" id="timexx1100" value="1100" onclick="select_time('1100');" <% if(time1100.equals("Y")) out.println("checked"); %> /><label for="timexx1100">11:00~11:30</label>&nbsp;&nbsp;
			<input type="checkbox" id="timexx1130" value="1130" onclick="select_time('1130');" <% if(time1130.equals("Y")) out.println("checked"); %> /><label for="timexx1130">11:30~12:00</label>&nbsp;&nbsp;
			<input type="checkbox" id="timexx1200" value="1200" onclick="select_time('1200');" <% if(time1200.equals("Y")) out.println("checked"); %> /><label for="timexx1200">12:00~12:30</label>&nbsp;&nbsp;
			<input type="checkbox" id="timexx1230" value="1230" onclick="select_time('1230');" <% if(time1230.equals("Y")) out.println("checked"); %> /><label for="timexx1230">12:30~13:00</label><br />
			<input type="checkbox" id="timexx1300" value="1300" onclick="select_time('1300');" <% if(time1300.equals("Y")) out.println("checked"); %> /><label for="timexx1300">13:00~13:30</label>&nbsp;&nbsp;
			<input type="checkbox" id="timexx1330" value="1330" onclick="select_time('1330');" <% if(time1330.equals("Y")) out.println("checked"); %> /><label for="timexx1330">13:30~14:00</label>&nbsp;&nbsp;
			<input type="checkbox" id="timexx1400" value="1400" onclick="select_time('1400');" <% if(time1400.equals("Y")) out.println("checked"); %> /><label for="timexx1400">14:00~14:30</label>&nbsp;&nbsp;
			<input type="checkbox" id="timexx1430" value="1430" onclick="select_time('1430');" <% if(time1430.equals("Y")) out.println("checked"); %> /><label for="timexx1430">14:30~15:00</label><br />
			<input type="checkbox" id="timexx1500" value="1500" onclick="select_time('1500');" <% if(time1500.equals("Y")) out.println("checked"); %> /><label for="timexx1500">15:00~15:30</label>&nbsp;&nbsp;
			<input type="checkbox" id="timexx1530" value="1530" onclick="select_time('1530');" <% if(time1530.equals("Y")) out.println("checked"); %> /><label for="timexx1530">15:30~16:00</label>&nbsp;&nbsp;
			<input type="checkbox" id="timexx1600" value="1600" onclick="select_time('1600');" <% if(time1600.equals("Y")) out.println("checked"); %> /><label for="timexx1600">16:00~16:30</label>&nbsp;&nbsp;
			<input type="checkbox" id="timexx1630" value="1630" onclick="select_time('1630');" <% if(time1630.equals("Y")) out.println("checked"); %> /><label for="timexx1630">16:30~17:00</label><br />
			<input type="checkbox" id="timexx1700" value="1700" onclick="select_time('1700');" <% if(time1700.equals("Y")) out.println("checked"); %> /><label for="timexx1700">17:00~17:30</label>&nbsp;&nbsp;
			<input type="checkbox" id="timexx1730" value="1730" onclick="select_time('1730');" <% if(time1730.equals("Y")) out.println("checked"); %> /><label for="timexx1730">17:30~18:00</label>
		</td>
	</tr>
	<tr>
		<th>예약자</th>
		<td>
			<input type="text" class="w20" name="name" id="name" value="<c:out value='${rentVO.name}'/>" />
		</td>
	</tr>
	<tr>
		<th>휴대폰번호</th>
		<td>
			<input type="text" class="w20" name="mobile" id="mobile" value="<c:out value='${rentVO.mobile}'/>" onfocus="autoHypenPhone(this);" onkeyup="autoHypenPhone(this);" />
		</td>
	</tr>
	<tr>
		<th>업체명</th>
		<td>
			<input type="text" class="w40" name="company" id="company" value="<c:out value='${rentVO.company}'/>" />
		</td>
	</tr>
	<tr>
		<th>예약인원</th>
		<td>
			<input type="number" class="w10" name="people_cnt" id="people_cnt" value="<c:out value='${rentVO.people_cnt}'/>" />
		</td>
	</tr>
	<tr>
		<th>사용목적</th>
		<td>
			<input type="text" class="w80" name="content1" id="content1" value="<c:out value='${rentVO.content1}'/>" />
		</td>
	</tr>
	<tr>
		<th>필요기자재</th>
		<td>
			<input type="text" class="w80" name="content2" id="content2" value="<c:out value='${rentVO.content2}'/>" />
		</td>
	</tr>
	<tr>
		<th>문의사항</th>
		<td>
			<input type="text" class="w80" name="etc" id="etc" value="<c:out value='${rentVO.etc}'/>" />
		</td>
	</tr>
	<tr>
		<th>상태</th>
		<td>
			<select name="status" id="status" class="w20">
				<option value="1" <c:if test="${rentVO.status eq 1}">selected</c:if> >접수</option>
				<option value="2" <c:if test="${rentVO.status eq 2}">selected</c:if> >승인</option>
				<option value="3" <c:if test="${rentVO.status eq 3}">selected</c:if> >반려</option>
			</select>
		</td>
	</tr>
</table>


<div class="ok_btn bmb">
	<ul>
		<li><button type="button" class="btn_sumit2" onclick="update_prc();">저장</button></li>
		<li><a href="javascript:self.close();" class="btn_sumit4">닫기</a></li>
	</ul>
</div>

</form>

</div>

</body>

</html>
