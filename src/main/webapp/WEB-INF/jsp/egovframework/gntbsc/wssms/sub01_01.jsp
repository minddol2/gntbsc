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
int m1 = 1;
int m2 = 1;
int m3 = 0;

int us_level = 5;
LoginVO loginVO = (LoginVO)session.getAttribute("loginVO");
if(loginVO != null) {
	us_level = loginVO.getUs_level();
}
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
$(document).ready(function(){
	var resultMsg = '${resultMsg}';
	
	if(resultMsg != "") {
		alert(resultMsg);
	}
	
	
});

function fn_egov_write(idx) {
	 document.submitParam.idx.value = idx;
	 document.submitParam.action = "<c:url value='/sb01/sub01_write.do'/>";
	 document.submitParam.submit();
}
	
function fn_egov_select_List(pageNo) {
	document.frm.pageIndex.value = pageNo;
	document.frm.action = "<c:url value='/sb01/sub01.do'/>";
	document.frm.submit();
}
	
function fn_egov_excel() {
	 document.frm.action = "<c:url value='/sb01/sub01_excel.do'/>";
	 document.frm.submit();
}

$(function(){
	//전체선택 체크박스 클릭
	$("#p1").click(function(){
		//만약 전체 선택 체크박스가 체크된상태일경우
		if($("#p1").prop("checked")) {
			//해당화면에 전체 checkbox들을 체크해준다
			$("input[type=checkbox]").prop("checked",true);
		// 전체선택 체크박스가 해제된 경우
		} else {
			//해당화면에 모든 checkbox들의 체크를해제시킨다.
			$("input[type=checkbox]").prop("checked",false);
		}
	});
})

function fn_egov_select_dele() {
	var item_cnt = 0;
	$("input[class=checkbox]:checked").each(function() {
		item_cnt++;
	});
	if(item_cnt == 0) {
		alert("삭제할 자료를 선택하세요.");

	} else if(confirm('선택한 자료를 삭제하시겠습니까? \n\n')) {
		document.delfrm.action = "<c:url value='/sb01/sub01_sdele.do'/>";
		document.delfrm.submit();
	}
}

//-->
</script>

<h4 class="tit_dot">사용자 목록</h4>

<form name="submitParam" method="post">
	<input type="hidden" name="idx" value=""  />
</form>


<form name="frm" action="<c:url value='/sb01/sub01.do'/>"  method="post" >
<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>

<div class="crewtop bmb">
	<table class="srch_table mb20">	
		<colgroup>
			<col width="10%">
			<col width="40%">
			<col width="10%">
			<col width="40%">
		</colgroup>
		<tbody>
			<tr>
				<th>아이디</th>
				<td><input type="text" class="w70" name="us_id" id="us_id" value="<c:out value='${searchVO.us_id}'/>" />				
				</td>		
				<th>이름</th>
				<td><input type="text" class="w70" name="us_name" id="us_name" value="<c:out value='${searchVO.us_name}'/>" />
				</td>
			</tr>				
			<tr>
				<th>회원구분</th>
				<td>
					<div class="txtin">
						<label class="mr10"><input type="radio" name="us_gbn" id="us_gbn" value=""  <c:if test="${searchVO.us_gbn == ''}">checked</c:if> /> 전체</label>
						<label class="mr10"><input type="radio" name="us_gbn" id="us_gbn1" value="1" <c:if test="${searchVO.us_gbn == '1'}">checked</c:if> /> 개인회원</label>
						<label class="mr10"><input type="radio" name="us_gbn" id="us_gbn2" value="3" <c:if test="${searchVO.us_gbn == '3'}">checked</c:if> /> 멘토회원</label>
						<label class="mr10"><input type="radio" name="us_gbn" id="us_gbn3" value="2" <c:if test="${searchVO.us_gbn == '2'}">checked</c:if> /> 기업/예비창업자</label>
					</div>
				</td>		
				<th>회원유형</th>
				<td>
					<div class="txtin">
						<label class="mr10"><input type="radio" name="us_buss_gbn" id="us_buss_gbn" value=""  <c:if test="${searchVO.us_buss_gbn == ''}">checked</c:if> /> 전체</label>
						<label class="mr10"><input type="radio" name="us_buss_gbn" id="us_buss_gbn" value="1" <c:if test="${searchVO.us_buss_gbn == '1'}">checked</c:if> /> 도내기업</label>
						<label class="mr10"><input type="radio" name="us_buss_gbn" id="us_buss_gbn" value="2" <c:if test="${searchVO.us_buss_gbn == '2'}">checked</c:if> /> 예비창업자</label>
						<label class="mr10"><input type="radio" name="us_buss_gbn" id="us_buss_gbn" value="3" <c:if test="${searchVO.us_buss_gbn == '3'}">checked</c:if> /> 입주기업</label>
					</div>
				</td>
			</tr>				
			<tr>
				<th>SMS수신동의</th>
				<td>
					<div class="txtin">
						<label class="mr10"><input type="radio" name="us_smschk" id="us_smschk" value=""  <c:if test="${searchVO.us_smschk == ''}">checked</c:if> /> 전체</label>
						<label class="mr10"><input type="radio" name="us_smschk" id="us_smschk" value="Y" <c:if test="${searchVO.us_smschk == 'Y'}">checked</c:if> /> 동의함</label>
						<label class="mr10"><input type="radio" name="us_smschk" id="us_smschk" value="N" <c:if test="${searchVO.us_smschk == 'N'}">checked</c:if> /> 동의안함</label>
					</div>
				</td>
				
				<th>이메일수신동의</th>
				<td>
					<div class="txtin">
						<label class="mr10"><input type="radio" name="us_mailchk" id="us_mailchk" value=""  <c:if test="${searchVO.us_mailchk == ''}">checked</c:if> /> 전체</label>
						<label class="mr10"><input type="radio" name="us_mailchk" id="us_mailchk" value="Y" <c:if test="${searchVO.us_mailchk == 'Y'}">checked</c:if> /> 동의함</label>
						<label class="mr10"><input type="radio" name="us_mailchk" id="us_mailchk" value="N" <c:if test="${searchVO.us_mailchk == 'N'}">checked</c:if> /> 동의안함</label>
					</div>
				</td>
				
			</tr>
			<tr>
				<th>일자리정보 수신동의</th>
				<td colspan="3">
					<div class="txtin">
						<label class="mr10"><input type="radio" name="us_workchk" id="us_workchk" value=""  <c:if test="${searchVO.us_workchk == ''}">checked</c:if> /> 전체</label>
						<label class="mr10"><input type="radio" name="us_workchk" id="us_workchk" value="Y" <c:if test="${searchVO.us_workchk == 'Y'}">checked</c:if> /> 동의함</label>
						<label class="mr10"><input type="radio" name="us_workchk" id="us_workchk" value="N" <c:if test="${searchVO.us_workchk == 'N'}">checked</c:if> /> 동의안함</label>
					</div>
				</td>
				
			</tr>
		</tbody>
	</table>
	<div class="ok_btn">
		<ul>
			<li><button type="button" class="btn_sumit2" onclick="fn_egov_select_List('1');">검색</button></li>
			<li><button type="button" class="btn_sumit2" onclick="init_frm();">전체</button></li>
		</ul>
	</div>	
</div>
</form>

<h4 class="tit_dot">검색결과</h4>
<div class="bgtab bgtab2">
	<div class="half">
		<h3 class="dpi mr10">검색</h3>
		<p class="dpi">총 <fmt:formatNumber value="${totCnt}" groupingUsed="true"/>건</p>
	</div>
	<div class="half">
		<ul class="dpi_li tar">
			<li><a href="#" class="btn_sumit2" onclick="fn_egov_excel()"/>엑셀다운로드</a></li>
			<li><a href="#" class="btn_sumit2" onclick="fn_egov_write('0');">추가</a></li>
			<li><a href="#" class="btn_sumit" onclick="fn_egov_select_dele();">선택삭제</a></li>
		</ul>
	</div>
</div>

<form name="delfrm" method="post">

<table class="comm_table tac bmb">
	<tr>
		<th>
			<input type="checkbox" class="checkbox" id="p1" />
		</th>
		<th>아이디</th>
		<th>담당자명</th>
		<th>구분</th>
		<th>연락처</th>
		<th>권한</th>
		<th>직급</th>
		<th>기업구분</th>
		<th>등록일자</th>
		<th>SMS수신</th>
		<th>메일수신</th>
		<th>일자리정보수신</th>
	</tr>
	<tbdoy>
	<c:forEach var="result" items="${mem_list}" varStatus="status">
	<tr class="HighlightableRow">
		<td>
			<input type="checkbox" name="idx" id="idx_<c:out value="${result.idx}"/>" class="checkbox" value="${result.idx}" />
			<c:out value="${status.count}"/>
		</td>
		<td style="font-weight:bold;"><a href="#" onclick="fn_egov_write('${result.idx}');"><c:out value="${result.us_id}"/></a></td>
		<td style="font-weight:bold;"><a href="#" onclick="fn_egov_write('${result.idx}');"><c:out value="${result.us_name}"/></a></td>
		<td style="font-weight:bold;">
			<c:choose>
				<c:when test="${result.us_gbn eq 1}">
					개인회원
				</c:when>
				<c:when test="${result.us_gbn eq 2}">
					기업/예비창업자
				</c:when>
				<c:otherwise>
					멘토회원
				</c:otherwise>
			</c:choose>
		</td>
		<td><a href="#" onclick="fn_egov_write('${result.idx}');"><c:out value="${result.us_phone}"/></a></td>
		<td style="font-weight:bold;">
			<a href="#" onclick="fn_egov_write('${result.idx}');">
			<c:choose>
				<c:when test="${result.us_level eq 1}">
					최고관리자
				</c:when>
				<c:when test="${result.us_level eq 2}">
					일반관리자
				</c:when>
				<c:when test="${result.us_level eq 3}">
					사용자
				</c:when>
				<c:otherwise>
					<span style="color:blue;">비회원</span>
				</c:otherwise>
			</c:choose>
			</a>
		</td>
		<td><a href="#" onclick="fn_egov_write('${result.idx}');"><c:out value="${result.us_position}"/></a></td>
		<td>
			<c:choose>
				<c:when test="${result.us_gbn eq 2}">
					<c:choose>
						<c:when test="${result.us_buss_gbn eq 1}">
							도내기업
						</c:when>
						<c:when test="${result.us_buss_gbn eq 2}">
							예비창업자
						</c:when>
						<c:otherwise>
							입주기업
						</c:otherwise>
					</c:choose>
				</c:when>
				<c:otherwise>
				</c:otherwise>
			</c:choose>
		</td>
		<td><a href="#" onclick="fn_egov_write('${result.idx}');"><c:out value="${result.us_regdate}"/></a></td>
		<td>
			<c:choose>
				<c:when test="${result.us_smschk eq 'Y'}">
					동의
				</c:when>
				<c:otherwise>
					동의안함
				</c:otherwise>
			</c:choose>
		</td>
		<td>
			<c:choose>
				<c:when test="${result.us_mailchk eq 'Y'}">
					동의
				</c:when>
				<c:otherwise>
					동의안함
				</c:otherwise>
			</c:choose>
		</td>
		<td>
			<c:choose>
				<c:when test="${result.us_workchk eq 'Y'}">
					동의
				</c:when>
				<c:otherwise>
					동의안함
				</c:otherwise>
			</c:choose>
		</td>
	</tr>
	</c:forEach>
	<c:if test="${fn:length(mem_list) == 0}">
	<tr>
		<td colspan="12">일치하는 자료가 없습니다.</td>
	</tr>	
	</c:if>
	</tbdoy>
</table>

</form>

<div class="pageList">
	<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_select_List" />
</div>

<%@ include file="/WEB-INF/jsp/egovframework/gntbsc/wssms/footer.jsp" %>