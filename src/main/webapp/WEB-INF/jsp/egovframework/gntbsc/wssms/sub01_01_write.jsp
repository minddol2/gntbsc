<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="egovframework.com.cmm.service.EgovProperties" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
String bodyckey = "false";
int m1 = 1;
int m2 = 1;
int m3 = 0;
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

<script type="text/javaScript">
$(document).ready(function(){	
	var resultMsg = '${resultMsg}';
	
	if(resultMsg != "") {
		alert(resultMsg);
	}
		
});

function update_prc(){
	var frm = document.forms.sfrm;
	
	if(frm.us_id.value == "") {
		alert("아이디를 입력하세요.");
		frm.us_id.focus();
		return;
	}
	if(frm.us_name.value == "") {
		alert("담당자명을 입력하세요.");
		frm.us_name.focus();
		return;
	}
	if(frm.us_position.value == "") {
		alert("직급을 입력하세요.");
		frm.us_position.focus();
		return;
	}
	if(frm.us_level.value == "") {
		alert("권한을 선택하세요.");
		frm.us_level.focus();
		return;
	}
	
	if(frm.idx.value == "") {
		frm.idx.value = "0";
	}
	
	frm.submit();
	
}

function fn_egov_select_List() {
	 document.submitParam.action = "<c:url value='/sb01/sub01.do'/>";
	 document.submitParam.submit();
}

</script>

<form name="submitParam" method="post">
</form>

<h4 class="tit_dot">사용자 등록/수정</h4>

<form name="sfrm" action="${pageContext.request.contextPath}/sb01/sub01_Updt.do"  method="post" >
<input type="hidden" name="idx" value="<c:out value='${mem_result.idx}'/>" />

<table class="dash_table tal bmb">
	<colgroup>
		<col width="25%"/>
		<col width="75%"/>
	</colgroup>
	<tr>
		<th>아이디</th>
		<td>
			<input type="text" class="w20" name="us_id" id="us_id" value="<c:out value='${mem_result.us_id}'/>" />
		</td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td>
			<input type="password" class="w20" name="us_pw" id="us_pw" value="" />
		</td>
	</tr>
	<tr>
		<th>담당자명</th>
		<td>
			<input type="text" class="w30" name="us_name" id="us_name" value="<c:out value='${mem_result.us_name}'/>" />
		</td>
	</tr>
	<tr>
		<th>연락처</th>
		<td>
			<input type="text" class="w30" name="us_phone" id="us_phone" value="<c:out value='${mem_result.us_phone}'/>" />
		</td>
	</tr>
	<tr>
		<th>E-mail</th>
		<td>
			<input type="text" class="w30" name="us_email" id="us_email" value="<c:out value='${mem_result.us_email}'/>" />
		</td>
	</tr>
	<tr>
		<th>SMS 수신</th>
		<td>
			<input type="checkbox" class="w30" name="us_smschk" id="us_smschk" value="Y" <c:if test="${mem_result.us_smschk eq 'Y'}">checked</c:if> />
		</td>
	</tr>
	<tr>
		<th>이메일 수신</th>
		<td>
			<input type="checkbox" class="w30" name="us_mailchk" id="us_mailchk" value="Y" <c:if test="${mem_result.us_mailchk eq 'Y'}">checked</c:if> />
		</td>
	</tr>
	<tr>
		<th>일자리정보 수신</th>
		<td>
			<input type="checkbox" class="w30" name="us_workchk" id="us_workchk" value="Y" <c:if test="${mem_result.us_workchk eq 'Y'}">checked</c:if> />
		</td>
	</tr>
	<tr>
		<th>직급</th>
		<td>
			<input type="text" class="w30" name="us_position" id="us_position" value="<c:out value='${mem_result.us_position}'/>" />
		</td>
	</tr>
	<tr>
		<th>권한</th>
		<td>
			<select name="us_level" id="us_level" class="w20">
				<option value="1" <c:if test="${mem_result.us_level eq 1}">selected</c:if> >최고관리자</option>
				<option value="2" <c:if test="${mem_result.us_level eq 2}">selected</c:if> >일반관리자</option>
				<option value="3" <c:if test="${mem_result.us_level eq 3}">selected</c:if> >정회원</option>
				<option value="5" <c:if test="${mem_result.us_level eq 5}">selected</c:if> >비회원</option>
			</select>
		</td>
	</tr>
	<tr>
		<th>구분</th>
		<td>
			<select name="us_gbn" id="us_gbn" class="w20">
				<option value="1" <c:if test="${mem_result.us_gbn eq 1}">selected</c:if> >개인회원</option>
				<option value="2" <c:if test="${mem_result.us_gbn eq 2}">selected</c:if> >기업/예비창업자</option>
				<option value="3" <c:if test="${mem_result.us_gbn eq 3}">selected</c:if> >멘토회원</option>
			</select>
		</td>
	</tr>
</table>


<div class="ok_btn bmb">
	<ul>
		<li><button type="button" class="btn_sumit2" onclick="update_prc();">저장</button></li>
		<li><a href="javascript:fn_egov_select_List();" class="btn_sumit4">목록</a></li>
	</ul>
</div>

</form>


<%@ include file="/WEB-INF/jsp/egovframework/gntbsc/wssms/footer.jsp" %>