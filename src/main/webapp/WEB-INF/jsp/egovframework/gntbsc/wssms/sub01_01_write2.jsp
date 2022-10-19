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
	
	var us_buss_gbn = '${mem_result.us_buss_gbn}';
	
	change_buss_gbn(us_buss_gbn);
		
});

function update_prc(){
	var frm = document.forms.sfrm;
	var us_buss_gbn = "1";
	
	if($("#us_buss_gbn").is(":checked")) {
		us_buss_gbn = "1";
	} else if($("#us_buss_gbn2").is(":checked")) {
		us_buss_gbn = "2";
	} else if($("#us_buss_gbn3").is(":checked")) {
		us_buss_gbn = "3";
	} 
	
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
	if(us_buss_gbn == "") {
		alert("회원구분을 선택하세요.");
		$("#us_buss_gbn").focus();
		return false;
	}
	if($('[name="us_company"]').val() == ''){
		alert("기업명을 입력해 주세요.");
		$('[name="us_company"]').focus();
		return false;
	}
	if($('[name="us_position"]').val() == ''){
		alert("직급을 입력해 주세요.");
		$('[name="us_position"]').focus();
		return false;
	}

	if( (us_buss_gbn == "1") || (us_buss_gbn == "3") ) {
		if($('[name="us_saupno"]').val() == ''){
			alert("사업자등록번호를 입력해 주세요.");
			$('[name="us_saupno"]').focus();
			return false;
		}
		if($('[name="us_makeyear1"]').val() == ''){
			alert("설립년도를 입력해 주세요.");
			$('[name="us_makeyear1"]').focus();
			return false;
		}
		if($('[name="us_uptaex"]').val() == ''){
			alert("기업유형을 입력해 주세요.");
			$('[name="us_uptaex"]').focus();
			return false;
		}
		if($('[name="us_addrxx"]').val() == ''){
			alert("소재지를 입력해 주세요.");
			$('[name="us_addrxx"]').focus();
			return false;
		}
		if($('[name="us_addres"]').val() == ''){
			alert("소재지를 입력해 주세요.");
			$('[name="us_addres"]').focus();
			return false;
		}
		$('[name="us_makeyear"]').val($('[name="us_makeyear1"]').val());
		
	} else if(us_buss_gbn == "2") {
		if($('[name="us_makeyear2"]').val() == ''){
			alert("사업자등록 예정일을 입력해 주세요.");
			$('[name="us_makeyear2"]').focus();
			return false;
		}
		if($('[name="us_uptaex"]').val() == ''){
			alert("기업유형을 입력해 주세요.");
			$('[name="us_uptaex"]').focus();
			return false;
		}
		if($('[name="us_addrxx"]').val() == ''){
			alert("소재지(도시까지만 기재)를 입력해 주세요.");
			$('[name="us_addrxx"]').focus();
			return false;
		}
		$('[name="us_makeyear"]').val($('[name="us_makeyear2"]').val());
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

//우편번호
function searchzip() {
	// 현재 scroll 위치를 저장해놓는다.
	var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
	new daum.Postcode({
		oncomplete: function(data) {
			// 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			// 각 주소의 노출 규칙에 따라 주소를 조합한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var fullAddr = data.address; // 최종 주소 변수
			var extraAddr = ''; // 조합형 주소 변수

			// 기본 주소가 도로명 타입일때 조합한다.
			if(data.addressType === 'R'){
				//법정동명이 있을 경우 추가한다.
				if(data.bname !== ''){
					extraAddr += data.bname;
				}
				// 건물명이 있을 경우 추가한다.
				if(data.buildingName !== ''){
					extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				}
				// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
				fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
			}

			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			document.getElementById('us_zipcod').value = data.zonecode; //5자리 새우편번호 사용
			document.getElementById('us_addrxx').value = fullAddr;

			// iframe을 넣은 element를 안보이게 한다.
			// (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
			document.getElementById('wrap_zip').style.display = 'none';

			// 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
			document.body.scrollTop = currentScroll;
		},
		// 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
		onresize : function(size) {
			document.getElementById('wrap_zip').style.height = size.height+'px';
		},
		width : '100%',
		height : '100%'
	}).embed(document.getElementById('wrap_zip'));

	// iframe을 넣은 element를 보이게 한다.
	document.getElementById('wrap_zip').style.display = 'block';
}

function foldDaumPostcode() {
	// iframe을 넣은 element를 안보이게 한다.
	document.getElementById('wrap_zip').style.display = 'none';
}

function change_buss_gbn(gbn) {
	
	if( (gbn=="1") || (gbn=="3") ) {
		$("#saupno_id").show();
		$("#makeyear_id").show();
		$("#address_id").show();
		
		$("#makeyear_id2").hide();
		$("#address_id2").hide();
	} else {
		$("#makeyear_id2").show();
		$("#address_id2").show();
		
		$("#saupno_id").hide();
		$("#makeyear_id").hide();
		$("#address_id").hide();
	}
	
}
</script>

<form name="submitParam" method="post">
</form>

<h4 class="tit_dot">기업/예비창업자 등록/수정</h4>

<form name="sfrm" action="${pageContext.request.contextPath}/sb01/sub01_Updt.do"  method="post" >
<input type="hidden" name="idx" value="<c:out value='${mem_result.idx}'/>" />
<input name="us_makeyear" id="us_makeyear" type="hidden" value="<c:out value='${mem_result.us_makeyear}'/>" />

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
		<th>회원구분</th>
		<td>
			<input type="radio" class="w30" name="us_buss_gbn" id="us_buss_gbn" value="1" <c:if test="${mem_result.us_buss_gbn eq '1'}">checked</c:if> onclick="change_buss_gbn('1')" /><label for="us_buss_gbn">도내기업</label>&nbsp;
			<input type="radio" class="w30" name="us_buss_gbn" id="us_buss_gbn2" value="2" <c:if test="${mem_result.us_buss_gbn eq '2'}">checked</c:if> onclick="change_buss_gbn('2')" /><label for="us_buss_gbn2">예비창업자</label>&nbsp;
			<input type="radio" class="w30" name="us_buss_gbn" id="us_buss_gbn3" value="3" <c:if test="${mem_result.us_buss_gbn eq '3'}">checked</c:if> onclick="change_buss_gbn('3')" /><label for="us_buss_gbn3">입주기업</label>			
		</td>
	</tr>
	<tr>
		<th>기업명</th>
		<td>
			<input type="text" class="w30" name="us_company" id="us_company" value="<c:out value='${mem_result.us_company}'/>" />
		</td>
	</tr>
	<tr>
		<th>직급</th>
		<td>
			<input type="text" class="w30" name="us_position" id="us_position" value="<c:out value='${mem_result.us_position}'/>" />
		</td>
	</tr>
	<tr id="saupno_id">
		<th>사업자번호</th>
		<td>
			<input type="text" class="w30" name="us_saupno" id="us_saupno" value="<c:out value='${mem_result.us_saupno}'/>" onkeyup="javascript:checkNumber(this);" />
		</td>
	</tr>
	<tr id="makeyear_id">
		<th>설립연도</th>
		<td>
			<input type="text" class="w30" name="us_makeyear1" id="us_makeyear1" maxlength="4" value="<c:out value='${mem_result.us_makeyear}'/>" onkeyup="javascript:checkNumber(this);" />
		</td>
	</tr>
	<tr id="makeyear_id2" style="display:none;">
		<th>사업자등록 예정일</th>
		<td>
			<input type="text" class="w30" name="us_makeyear2" id="us_makeyear2" value="<c:out value='${mem_result.us_makeyear}'/>" />
		</td>
	</tr>
	<tr>
		<th>기업유형</th>
		<td>
			<input type="text" class="w30" name="us_uptaex" id="us_uptaex" value="<c:out value='${mem_result.us_uptaex}'/>" />
		</td>
	</tr>
	<tr>
		<th>소재지</th>
		<td>
			<input type="text" class="w20" name="us_zipcod" id="us_zipcod" value="<c:out value='${mem_result.us_zipcod}'/>" readonly />
			<a href="javascript:searchzip();" class="btn_sumit3 ml10">주소 찾기</a>
			<div id="wrap_zip" style="display:none;border:1px solid; height:250px;margin:5px 0;position:relative">
			<img src="//t1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼"></div>
			<input type="text" class="w80" name="us_addrxx" id="us_addrxx" value="<c:out value='${mem_result.us_addrxx}'/>" /><br />
			<input type="text" class="w80" name="us_addres" id="us_addres" value="<c:out value='${mem_result.us_addres}'/>" />
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