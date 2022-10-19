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
int m1 = 4;
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
<script type="text/javascript">
<!--
function fn_egov_select_List(pageNo) {
	document.frm.pageIndex.value = pageNo;
	document.frm.action = "<c:url value='/sb04/sub04.do'/>";
	document.frm.submit();
}

function fn_egov_excel() {
	 document.excelfrm.action = "<c:url value='/sb04/sub04_excel.do'/>";
	 document.excelfrm.submit();
}

$(document).ready(function(){
	var resultMsg = '${resultMsg}';
	
	if(resultMsg != "") {
		alert(resultMsg);
	}
	
});

//-->
</script>

<h4 class="tit_dot">월별방문자 조회</h4>

<form name="excelfrm" method="get">
	<input type="hidden" name="sdatex" value="<c:out value="${searchVO.sdatex}"/>"  />
	<input type="hidden" name="edatex" value="<c:out value="${searchVO.edatex}"/>"  />
</form>

<form name="frm" action="<c:url value='/sb04/sub04.do'/>"  method="post" >
<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>

<table class="dash_table tal mb">
	<colgroup>
		<col width="10%"/>
		<col width="90%"/>
	</colgroup>
	<tr>
		<th>기간</th>
		<td>
			<select name="syear" id="syear" class="w10">
				<option value="0">년도선택</option>
				<c:forEach var="i" begin="2020" end="2040">
				<option value="<c:out value='${i}'/>" <c:if test="${i eq searchVO.syear}">selected="selected"</c:if>><c:out value='${i}'/>년</option>
				</c:forEach>
			</select>
			<select name="smon" id="smon" class="w10">
				<option>월선택</option>
				<c:forEach var="i" begin="1" end="12">
				<option value="<c:out value='${i}'/>" <c:if test="${i eq searchVO.smon}">selected="selected"</c:if>><c:out value='${i}'/>월</option>
				</c:forEach>
			</select>
			~
			<select name="eyear" id="eyear" class="w10">
				<option value="0">년도선택</option>
				<c:forEach var="i" begin="2020" end="2040">
				<option value="<c:out value='${i}'/>" <c:if test="${i eq searchVO.eyear}">selected="selected"</c:if>><c:out value='${i}'/>년</option>
				</c:forEach>
			</select>
			<select name="emon" id="emon" class="w10">
				<option>월선택</option>
				<c:forEach var="i" begin="1" end="12">
				<option value="<c:out value='${i}'/>" <c:if test="${i eq searchVO.emon}">selected="selected"</c:if>><c:out value='${i}'/>월</option>
				</c:forEach>
			</select>
		</td>
	</tr>
</table>
<div class="ok_btn bmb">
	<ul>
		<li><button type="button" class="btn_sumit2 btn_src" onclick="fn_egov_select_List('1')">검색</button></li>
	</ul>
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
			<li><a href="#" class="btn_sumit" onclick="fn_egov_excel();">엑셀다운로드</a></li>
		</ul>
	</div>
</div>

<table class="comm_table tac bmb">
	<colgroup>
		<col width="15%"/>
		<col width="15%"/>
		<col width="*"/>
	</colgroup>
	<tr>
		<th>접속월</th>
		<th>방문수</th>
		<th></th>
	</tr>
	<tbdoy>
	<c:set var = "per_x" value = "0" />
	<c:forEach var="result" items="${ct_list}" varStatus="status">
	<tr class="HighlightableRow">
		<td><c:out value="${result.ct_datex}"/></td>
		<td><fmt:formatNumber value="${result.ct_cnt}" groupingUsed="true"/></td>
		<td>
			<c:choose>
				<c:when test="${result.ct_cnt gt 0}">
					<c:choose>
						<c:when test="${t_cnt gt 0}">
							<c:set var= "per_x" value="${result.ct_cnt / t_cnt * 100}"/>
							<div class="result">
							<p class="bar"> <span style="width:${per_x}%"> </span> </p>
            				<p class="resultTxt"> <span><fmt:formatNumber value="${per_x}" groupingUsed="true"/></span>% </p>
            				</div>
						</c:when>
						<c:otherwise>
							<div class="result">
							<p class="bar"> <span style="width:0%"> </span> </p>
							<p class="resultTxt"> <span>0</span>% </p>
							</div>
						</c:otherwise>
					</c:choose>
				</c:when>
				<c:otherwise>
					<div class="result">
					<p class="bar"> <span style="width:0%"> </span> </p>
					<p class="resultTxt"> <span>0</span>% </p>
					</div>
				</c:otherwise>
			</c:choose>
			
		</td>
	</tr>
	</c:forEach>
	<tr class="HighlightableRow">
		<td>합계</td>
		<td><fmt:formatNumber value="${t_cnt}" groupingUsed="true"/></td>
		<td></td>
	</tr>
	<c:if test="${fn:length(ct_list) == 0}">
	<tr>
		<td colspan="3">접속자료가 없습니다.</td>
	</tr>	
	</c:if>
	</tbdoy>
</table>


<%@ include file="/WEB-INF/jsp/egovframework/gntbsc/wssms/footer.jsp" %>