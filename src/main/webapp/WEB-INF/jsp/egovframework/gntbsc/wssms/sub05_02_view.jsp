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
int m1 = 5;
int m2 = 2;
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

<link rel="stylesheet" href="//code.jquery.com/ui/1.10.1/themes/base/jquery-ui.css" />  
<script src="//code.jquery.com/ui/1.10.1/jquery-ui.js"></script> 
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
	
	if(frm.us_name.value == "") {
		alert("이름을 입력하세요.");
		frm.us_name.focus();
		return;
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
	 document.submitParam.action = "<c:url value='/sb05/sub02.do'/>";
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

<h4 class="tit_dot">멘토상세보기</h4>
<div class="info_detail list05 mb">	
	<dl class="ing">
		<dt>접수완료</dt> <!--접수완료-->
		<dd><fmt:formatNumber value="${mem2_result.cam_cnt}" groupingUsed="true"/> <span>건</span></dd>
	</dl>	
	<dl class="ing">
		<dt>상담 중</dt> <!--상담중-->
		<dd><fmt:formatNumber value="${mem2_result.pap_cnt}" groupingUsed="true"/> <span>건</span></dd>
	</dl>	
	<dl>
		<dt>누적 멘토링 수</dt>
		<dd><fmt:formatNumber value="${mem_result.mento_cnt}" groupingUsed="true"/> <span>건 (화상<fmt:formatNumber value="${mem_result.cam_cnt}" groupingUsed="true"/>/ 서면 <fmt:formatNumber value="${mem_result.pap_cnt}" groupingUsed="true"/>/ 대면 <fmt:formatNumber value="${mem_result.man_cnt}" groupingUsed="true"/>)</span></dd>
	</dl>	
	<dl>
		<dt>멘토링 평가 건수</dt>
		<dd><fmt:formatNumber value="${mem_result.end_cnt}" groupingUsed="true"/> <span>건</span></dd>
	</dl>
	<dl>
		<dt>평점</dt>
		<dd><fmt:formatNumber value="${mem_result.avg_point}" groupingUsed="true"/> <span>점</span></dd>
	</dl>
</div>

<form name="sfrm" action="${pageContext.request.contextPath}/sb05/sub02_Updt.do"  method="post" >
<input type="hidden" name="idx" value="<c:out value='${mem_result.idx}'/>" />
<input type="hidden" name="us_id" value="<c:out value='${mem_result.us_id}'/>" />
<input type="hidden" name="o_mentoyn" value="<c:out value='${mem_result.o_mentoyn}'/>" />
<input name="us_gbn" id="us_gbn" type="hidden" value="<c:out value='${mem_result.us_gbn}'/>" />

<div class="perinfo bmb">
	<table class="comm_table mb">
		<colgroup>
			<col width="10%">
			<col width="40%">
			<col width="10%">
			<col width="40%">
		</colgroup>
		<tbody>
			<tr>
				<th>회원명</th>
				<td><input type="text" name="us_name" id="us_name" value="<c:out value='${mem_result.us_name}'/>" class="w60"/></td>
				<th>회원등급</th>
				<td>
					<div class="txtin">
						<label class="mr10"><input type="radio" name="us_mentoyn" id="us_mentoyn" value="N" <c:if test="${mem_result.us_mentoyn eq 'N'}">checked</c:if>/> 대기</label>
						<label class="mr10"><input type="radio" name="us_mentoyn" id="us_mentoyn2" value="Y" <c:if test="${mem_result.us_mentoyn eq 'Y'}">checked</c:if>/> 멘토</label>
					</div>
				</td>
			</tr>
			<tr>
				<th>아이디</th>
				<td><c:out value="${mem_result.us_id}"/></td>
				<th>연락처</th>
				<td><input type="text" name="us_phone" id="us_phone" value="<c:out value='${mem_result.us_phone}'/>" class="w60"/></td>
			</tr>		
			<tr>
				<th>E-mail</th>
				<td><input type="text" name="us_email" id="us_email" value="<c:out value='${mem_result.us_email}'/>" class="w60"/></td>			
				<th>소속</th>
				<td><input type="text" name="us_company" id="us_company" value="<c:out value='${mem_result.us_company}'/>" class="w80"/></td>
			</tr>
			
			<tr>
				<th>SMS 수신</th>
				<td>
					<div class="txtin">
						<label class="mr10"><input type="radio" name="us_smschk" id="us_smschk" value="Y" <c:if test="${mem_result.us_smschk eq 'Y'}">checked</c:if>/> 허용</label>
						<label class="mr10"><input type="radio" name="us_smschk" id="us_smschk2" value="N" <c:if test="${mem_result.us_smschk eq 'N'}">checked</c:if>/> 거부</label>
					</div>
				</td>
				<th>E-mail 수신</th>
				<td>
					<div class="txtin">
						<label class="mr10"><input type="radio" name="us_mailchk" id="us_mailchk" value="Y" <c:if test="${mem_result.us_mailchk eq 'Y'}">checked</c:if>/> 허용</label>
						<label class="mr10"><input type="radio" name="us_mailchk" id="us_mailchk2" value="N" <c:if test="${mem_result.us_mailchk eq 'N'}">checked</c:if>/> 거부</label>
					</div>
				</td>
			</tr>
			<tr>
				<th>가입일자</th>
				<td><c:out value='${mem_result.us_regdate}'/></td>
				<th>멘토승인일자</th>
				<td><c:out value='${mem_result.us_mento_date}'/></td>
			</tr>			
			<tr>		
				<th>전문분야1</th>
				<td colspan="3">
					<select name="us_major11" title="대분류" size="1" class="w20" id="us_major11" onchange="change_major('us_major11','us_major12')">
						<option value="0" <c:if test="${mem_result.us_major11 eq 0}">selected</c:if>>전체</option>
						<option value="1" <c:if test="${mem_result.us_major11 eq 1}">selected</c:if>>창업</option>
						<option value="2" <c:if test="${mem_result.us_major11 eq 2}">selected</c:if>>마케팅/홍보</option>
						<option value="3" <c:if test="${mem_result.us_major11 eq 3}">selected</c:if>>투자</option>
						<option value="4" <c:if test="${mem_result.us_major11 eq 4}">selected</c:if>>경영심화</option>
						<option value="5" <c:if test="${mem_result.us_major11 eq 5}">selected</c:if>>관광</option>
						<option value="6" <c:if test="${mem_result.us_major11 eq 6}">selected</c:if>>제품디자인</option>
					</select>
					<select name="us_major12" title="소분류" size="1" class="w30" id="us_major12" onchange="check_major12();">
						<option value="">전체</option>
						<c:forEach var="result" items="${min_list1}" varStatus="status">
						<option value="<c:out value='${result.code}'/>" <c:if test="${result.code eq mem_result.us_major12}">selected</c:if>><c:out value='${result.cd_name}'/></option>
						</c:forEach>
					</select>
					<input type="text" name="us_major1_etc" class="w80" id="us_major1_etc" style="display:none;" value="<c:out value='${mem_result.us_major1_etc}'/>" placeholder="기타 소분류 입력"/>
				</td>
			</tr>
			<tr>
				<th>전문분야2</th>
				<td colspan="3">
					<select name="us_major21" title="대분류" size="1" class="w20" id="us_major21" onchange="change_major('us_major21','us_major22')">
						<option value="0" <c:if test="${mem_result.us_major21 eq 0}">selected</c:if>>전체</option>
						<option value="1" <c:if test="${mem_result.us_major21 eq 1}">selected</c:if>>창업</option>
						<option value="2" <c:if test="${mem_result.us_major21 eq 2}">selected</c:if>>마케팅/홍보</option>
						<option value="3" <c:if test="${mem_result.us_major21 eq 3}">selected</c:if>>투자</option>
						<option value="4" <c:if test="${mem_result.us_major21 eq 4}">selected</c:if>>경영심화</option>
						<option value="5" <c:if test="${mem_result.us_major21 eq 5}">selected</c:if>>관광</option>
						<option value="6" <c:if test="${mem_result.us_major21 eq 6}">selected</c:if>>제품디자인</option>
					</select>
					<select name="us_major22" title="소분류" size="1" class="w30" id="us_major22" onchange="check_major22">
						<option value="">전체</option>
						<c:forEach var="result2" items="${min_list2}" varStatus="status">
						<option value="<c:out value='${result2.code}'/>" <c:if test="${result2.code eq mem_result.us_major22}">selected</c:if>><c:out value='${result2.cd_name}'/></option>
						</c:forEach>
					</select>
					<input type="text" name="us_major2_etc" class="w80" id="us_major2_etc" style="display:none;" value="<c:out value='${mem_result.us_major2_etc}'/>" placeholder="기타 소분류 입력"/>
				</td>
			</tr>
		</tbody>
	</table>
	<div class="ok_btn">
		<ul>
			<li><button type="button" class="btn_sumit2" onclick="update_prc();">저장</button></li>
			<li><a href="javascript:fn_egov_select_List();" class="btn_sumit">목록</a></li>
		</ul>
	</div>
</div>

</form>


<%@ include file="/WEB-INF/jsp/egovframework/gntbsc/wssms/footer.jsp" %>