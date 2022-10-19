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
int m1 = 6;
int m2 = 1;
int m3 = 0;

LoginVO loginVO = (LoginVO)session.getAttribute("loginVO"); 

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

function update_prc() {
	var frm = document.forms.sfrm;
	
	var counsel_gbn = "";
	var idx = $("#idx").val();
	var datexx = $("#datexx").val();
	var timexx = $("#timexx").val();
	var name = $("#name").val();
	var mobile = $("#mobile").val();
	var content1 = $("#content1").val();
	
	if($("#counsel_gbn").is(":checked")) {
		counsel_gbn = "1";
	} else if($("#counsel_gbn2").is(":checked")) {
		counsel_gbn = "2";
	}
	
	if(counsel_gbn == "") {
		alert("상담종류를 선택하세요");
		$("#counsel_gbn").focus();
		return;
	}
	if(datexx == "") {
		alert("날짜를 선택해 주세요");
		return;
	}
	if(timexx == "") {
		alert("시간을 선택해 주세요");
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
	if(content1 == "") {
		alert("사용목적을 입력해 주세요");
		return;
	}
	
	if(idx == "") {
		$("#idx").val("0");
	}
	
	frm.submit();
}


//-->
</script>
</head>

<body>
<div >

<h4 class="tit_dot">일자리상담신청 상세</h4>

<form name="sfrm" action="${pageContext.request.contextPath}/sb06/sub01_Updt.do"  method="post" enctype="multipart/form-data" >
<input type="hidden" name="idx" id="idx" value="<c:out value='${jobVO.idx}'/>" />

<table class="dash_table tal bmb">
	<colgroup>
		<col width="25%"/>
		<col width="75%"/>
	</colgroup>
	<tr>
		<th>구분</th>
		<td>
			<input type="radio" name="counsel_gbn" id="counsel_gbn" value="1" <c:if test="${'1' eq jobVO.counsel_gbn}">checked</c:if> /><label for="counsel_gbn">구인</label>&nbsp;&nbsp;
			<input type="radio" name="counsel_gbn" id="counsel_gbn2" value="2" <c:if test="${'2' eq jobVO.counsel_gbn}">checked</c:if> /><label for="counsel_gbn2">구직</label>&nbsp;&nbsp;
		</td>
	</tr>
	<tr>
		<th>예약일자</th>
		<td>
			<input type="text" class="cal_date w20" name="datexx" id="datexx" value="<c:out value='${jobVO.datexx}'/>" />
		</td>
	</tr>
	<tr>
		<th>예약시간</th>
		<td>
			<select name="timexx" title="일자리상담희망시간" size="1" class="w40" id="timexx">
						<option value="" <c:if test="${jobVO.timexx eq ''}">selected</c:if> >희망시간을 선택해주세요.</option>
						<option value="0900" <c:if test="${jobVO.timexx eq '0900'}">selected</c:if>>09:00~10:00</option>
						<option value="1000" <c:if test="${jobVO.timexx eq '1000'}">selected</c:if>>10:00~11:00</option>
						<option value="1100" <c:if test="${jobVO.timexx eq '1100'}">selected</c:if>>11:00~12:00</option>
						<option value="1300" <c:if test="${jobVO.timexx eq '1300'}">selected</c:if>>13:00~14:00</option>
						<option value="1400" <c:if test="${jobVO.timexx eq '1400'}">selected</c:if>>14:00~15:00</option>
						<option value="1500" <c:if test="${jobVO.timexx eq '1500'}">selected</c:if>>15:00~16:00</option>
						<option value="1600" <c:if test="${jobVO.timexx eq '1600'}">selected</c:if>>16:00~17:00</option>
						<option value="1700" <c:if test="${jobVO.timexx eq '1700'}">selected</c:if>>17:00~18:00</option>
					</select>
		</td>
	</tr>
	<tr>
		<th>예약자</th>
		<td>
			<input type="text" class="w40" name="name" id="name" value="<c:out value='${jobVO.name}'/>" />
		</td>
	</tr>
	<tr>
		<th>휴대폰번호</th>
		<td>
			<input type="text" class="w40" name="mobile" id="mobile" value="<c:out value='${jobVO.mobile}'/>" onfocus="autoHypenPhone(this);" onkeyup="autoHypenPhone(this);" />
		</td>
	</tr>
	<tr>
		<th>첨부1</th>
		<td>
			<c:if test="${!empty jobVO.userfile1}">
					<a href="#" class="btn_sumit" onclick="window.open(encodeURI('<c:url value='/download/downloadFile.do?'/>requestedFile=${jobVO.userfile1}&dFileName=${jobVO.userfile1}'))">다운로드</a>
					</c:if>
			<input type="file" name="userfile1" id="userfile1" class="input_txt" hname="첨부파일" title="첨부파일을 찾아 선택하세요" />
		</td>
	</tr>
	<tr>
		<th>첨부2</th>
		<td>
			<c:if test="${!empty jobVO.userfile2}">
					<a href="#" class="btn_sumit" onclick="window.open(encodeURI('<c:url value='/download/downloadFile.do?'/>requestedFile=${jobVO.userfile2}&dFileName=${jobVO.userfile2}'))">다운로드</a>
					</c:if>
			<input type="file" name="userfile2" id="userfile2" class="input_txt" hname="첨부파일" title="첨부파일을 찾아 선택하세요" />
		</td>
	</tr>
	<tr>
		<th>첨부3</th>
		<td>
			<c:if test="${!empty jobVO.userfile3}">
					<a href="#" class="btn_sumit" onclick="window.open(encodeURI('<c:url value='/download/downloadFile.do?'/>requestedFile=${jobVO.userfile3}&dFileName=${jobVO.userfile3}'))">다운로드</a>
					</c:if>
			<input type="file" name="userfile3" id="userfile3" class="input_txt" hname="첨부파일" title="첨부파일을 찾아 선택하세요" />
		</td>
	</tr>
	<tr>
		<th>문의사항</th>
		<td>
			<textarea name="content1" id="content1" class="w80" wrap="hard"><c:out value='${jobVO.content1}'/></textarea>
		</td>
	</tr>
	<tr>
		<th>상태</th>
		<td>
			<select name="status" id="status" class="w20">
				<option value="1" <c:if test="${jobVO.status eq 1}">selected</c:if> >접수</option>
				<option value="2" <c:if test="${jobVO.status eq 2}">selected</c:if> >승인</option>
				<option value="3" <c:if test="${jobVO.status eq 3}">selected</c:if> >반려</option>
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
