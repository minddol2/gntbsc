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

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="<c:url value='/js/pg_script.js'/>"></script> 
<script type="text/javaScript">
$(document).ready(function(){	
	var resultMsg = '${resultMsg}';
	
	if(resultMsg != "") {
		alert(resultMsg);
	}
		
	var etc1 = '${mem_result.us_major1_etc}';
	var etc2 = '${mem_result.us_major2_etc}';
	
	if(etc1 != "") {
		$("#us_major1_etc").show();
	}
	if(etc2 != "") {
		$("#us_major2_etc").show();
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
		alert("이름을 입력하세요.");
		frm.us_name.focus();
		return;
	}
	if(frm.us_level.value == "") {
		alert("권한을 선택하세요.");
		frm.us_level.focus();
		return;
	}
	if($('[name="us_position"]').val() == ''){
		alert("직급을 입력해 주세요.");
		$('[name="us_position"]').focus();
		return false;
	}

	if($('[name="us_major11"]').val() == ''){
		alert("전문분야 대분류를 선택해 주세요.");
		$('[name="us_major11"]').focus();
		return false;
	}
	if($('[name="us_major12"]').val() == ''){
		alert("전문분야 소분류를 선택해 주세요.");
		$('[name="us_major12"]').focus();
		return false;
	}
	if( ($("#us_major12 option:checked").text() == '기타') && ($('[name="us_major1_etc"]').val() == '') ){
		alert("기타 소분류를 입력해 주세요.");
		$('[name="us_major1_etc"]').focus();
		return false;
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


function change_major(major1, major2) {
	var major1 = $("#"+major1).val();
	
	$.ajax({
		url : "<c:url value='/member/selectMajorCodeAjax.do'/>",
		data : {
			"maxcod" : major1
		},
		dataType : 'json',
		type : 'POST',
		success : function(response) {
			//alert(response);
			optionitem = response.optionlist;
			$("#" + major2).empty().append(optionitem);

		},
		error : function(data) {
			return;
		}
	});
}

function check_major12() {
	var major12 = $("#us_major12 option:checked").text();
	
	if(major12 == "기타") {
		$("#us_major1_etc").show();
	} else {
		$("#us_major1_etc").val("");
		$("#us_major1_etc").hide();
	}
	
}

function check_major22() {
	var major22 = $("#us_major22 option:checked").text();
	
	if(major22 == "기타") {
		$("#us_major2_etc").show();
	} else {
		$("#us_major2_etc").val("");
		$("#us_major2_etc").hide();
	}
	
}
</script>

<form name="submitParam" method="post">
</form>

<h4 class="tit_dot">멘토 등록/수정</h4>

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
		<th>이름</th>
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

<h4 class="tit_dot">추가정보</h4>
<table class="dash_table tal bmb">
	<colgroup>
		<col width="25%"/>
		<col width="75%"/>
	</colgroup>	
	<tr>
		<th>전문분야(1지망)</th>
		<td>
			<select name="us_major11" id="us_major11" class="w30" onchange="change_major('us_major11','us_major12')">
				<option value="0" <c:if test="${mem_result.us_major11 eq 0}">selected</c:if>>대분류선택</option>
				<option value="1" <c:if test="${mem_result.us_major11 eq 1}">selected</c:if>>창업</option>
				<option value="2" <c:if test="${mem_result.us_major11 eq 2}">selected</c:if>>마케팅/홍보</option>
				<option value="3" <c:if test="${mem_result.us_major11 eq 3}">selected</c:if>>투자</option>
				<option value="4" <c:if test="${mem_result.us_major11 eq 4}">selected</c:if>>경영심화</option>
				<option value="5" <c:if test="${mem_result.us_major11 eq 5}">selected</c:if>>관광</option>
				<option value="6" <c:if test="${mem_result.us_major11 eq 6}">selected</c:if>>제품디자인</option>
			</select>	
			<select name="us_major12" title="소분류" id="us_major12" class="w30" onchange="check_major12();" > <!--창업선택시-->
				<option value="0">소분류선택</option>
				<c:forEach var="result" items="${min_list1}" varStatus="status">
					<option value="<c:out value='${result.code}'/>" <c:if test="${result.code eq mem_result.us_major12}">selected</c:if>><c:out value='${result.cd_name}'/></option>
				</c:forEach>
			</select>	
			<input type="text" name="us_major1_etc" class="w80" id="us_major1_etc" style="display:none;" value="<c:out value='${mem_result.us_major1_etc}'/>" placeholder="기타 소분류 입력"/>
		</td>
	</tr>
	<tr>
		<th>전문분야(1지망)</th>
		<td>
			<select name="us_major21" id="us_major21" class="w30" onchange="change_major('us_major21','us_major22')">
				<option value="0" <c:if test="${mem_result.us_major21 eq 0}">selected</c:if>>대분류선택</option>
				<option value="1" <c:if test="${mem_result.us_major21 eq 1}">selected</c:if>>창업</option>
				<option value="2" <c:if test="${mem_result.us_major21 eq 2}">selected</c:if>>마케팅/홍보</option>
				<option value="3" <c:if test="${mem_result.us_major21 eq 3}">selected</c:if>>투자</option>
				<option value="4" <c:if test="${mem_result.us_major21 eq 4}">selected</c:if>>경영심화</option>
				<option value="5" <c:if test="${mem_result.us_major21 eq 5}">selected</c:if>>관광</option>
				<option value="6" <c:if test="${mem_result.us_major21 eq 6}">selected</c:if>>제품디자인</option>
			</select>	
			<select name="us_major22" title="소분류" id="us_major22" class="w30" onchange="check_major22" > <!--창업선택시-->
				<option value="0">소분류선택</option>
				<c:forEach var="result" items="${min_list2}" varStatus="status">
					<option value="<c:out value='${result.code}'/>" <c:if test="${result.code eq mem_result.us_major22}">selected</c:if>><c:out value='${result.cd_name}'/></option>
				</c:forEach>
			</select>	
			<input type="text" name="us_major2_etc" class="w80" id="us_major2_etc" style="display:none;" value="<c:out value='${mem_result.us_major2_etc}'/>" placeholder="기타 소분류 입력"/>
		</td>
	</tr>
	<tr>
		<th>소속</th>
		<td>
			<input type="text" class="w30" name="us_company" id="us_company" value="<c:out value='${mem_result.us_company}'/>" />
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