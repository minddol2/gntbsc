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
String lang_mode = (String) request.getAttribute("lang_temp");

String is_main = "";
int m1 = 4;
int m2 = 1;
int m3 = 2;

int us_level = 5;
LoginVO loginVO = (LoginVO)session.getAttribute("loginVO");
if(loginVO != null) {
	us_level = loginVO.getUs_level();
}
%>

<jsp:include page="/WEB-INF/jsp/egovframework/gntbsc/inc/top.jsp" flush="true" >
	<jsp:param name="is_main" value="<%=is_main%>"/>
</jsp:include>

<jsp:include page="/WEB-INF/jsp/egovframework/gntbsc/inc/sub_top.jsp" flush="true" >
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

function fn_egov_select_List(pageNo) {
	document.frm.pageIndex.value = pageNo;
	document.frm.action = "<c:url value='/sub04/sub01_02.do'/>";
	document.frm.submit();
}
	
//-->
</script>

<div class="typebox mb">
	<ul class="tabs list03">				
		<li><a href="<c:url value='/sub04/sub01_01.do'/>">상담신청안내</a></li>
		<li class="current"><a href="<c:url value='/sub04/sub01_02.do'/>">전문 멘토단</a></li>
		<c:if test="${applicationFlag}">
            <li><a href="<c:url value='/sub04/sub01_03.do'/>">상담신청</a></li>
        </c:if>
	</ul>
</div>

<h4 class="tit_dot mb20">분야별 전문 멘토단</h4>

<form name="frm" action="<c:url value='/sub04/sub01_02.do'/>"  method="post" >
<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>

<div class="searchTop">
	<p class="list_info"><span><!--<fmt:formatNumber value="${totCnt}" groupingUsed="true"/>-->27</span>명의 컨설턴트가 등록되어 있습니다.</p>
	<div class="searchBox">				
		<select id="searchCnd" name="searchCnd" title="검색 분류 목록">
			<option value="4" <c:if test="${searchVO.searchCnd == '4'}">selected</c:if>>전체</option>
			<option value="3" <c:if test="${searchVO.searchCnd == '3'}">selected</c:if>>전문분야</option>
			<option value="1" <c:if test="${searchVO.searchCnd == '1'}">selected</c:if>>성명</option>
		</select> 
		<span>					
		<label for="searchWrd" class="all-hidden"><span>검색어 입력</span></label>
		<input type="text" placeholder="검색어를 입력하세요" id="searchWrd" name="searchWrd" style="ime-mode:active;" title="검색어를 입력해주세요" value="<c:out value="${searchVO.searchWrd}"/>" />
		<button type="button" onclick="fn_egov_select_List('1');">검색</button>
		</span>
	</div>
</div>

</form>

<table class="comm_table bd_table counsel_table tac">
	<caption>분야별 컨설턴트를 소개하는 표입니다.</caption>
	<thead>
		<tr>
			<th scope="col" rowspan="2">No</th>
			<th scope="col" colspan="2">전문분야</th>
			<th scope="col" rowspan="2">이름</th>
			<th scope="col" rowspan="2">소속</th>			
		</tr>
		<tr>
			<th scope="col">대분류</th>
			<th scope="col">소분류</th>			
		</tr>
	</thead>
	<tbody>
		<c:set var="m_count" value="1" />
		<c:set var="m_major1" value="" />
		<c:set var="m_major2" value="" />
		<c:forEach var="result" items="${mem_list}" varStatus="status">
		<tr>
			<td class="bgc">
				<c:out value="${m_count}"/>
			</td>
			<c:choose>
				<c:when test="${result.us_major11_nm eq m_major1}">
					
				</c:when>
				<c:otherwise>
					<td rowspan="${result.us_major11_cnt}">
						<c:out value="${result.us_major11_nm}"/>
						<c:set var= "m_major1" value="${result.us_major11_nm}"/>
					</td>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${result.us_major12_nm eq m_major2}">
					
				</c:when>
				<c:otherwise>
					<td rowspan="${result.us_major12_cnt}">
						<c:out value="${result.us_major12_nm}"/>
						<c:set var= "m_major2" value="${result.us_major12_nm}"/>
					</td>
				</c:otherwise>
			</c:choose>
			<td><c:out value="${result.us_name}"/></td>
			<td><c:out value="${result.us_company}"/></td>
		</tr>
		<c:set var= "m_count" value="${m_count + 1}"/>
		</c:forEach>
		<c:if test="${fn:length(mem_list) == 0}">
		<tr>
			<td colspan="5">일치하는 자료가 없습니다.</td>
		</tr>	
		</c:if>
	</tbody>
</table>


			</div><!--con-->
		</div><!--subcon-->
	</div><!--subwrap-->




<%@ include file="/WEB-INF/jsp/egovframework/gntbsc/inc/footer.jsp" %>