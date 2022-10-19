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
int m3 = 3;

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

function fn_egov_view(idx) {
	 document.submitParam.idx.value = idx;
	 document.submitParam.action = "<c:url value='/sub04/sub01_03_view.do'/>";
	 document.submitParam.submit();
}

function fn_egov_write() {
	 document.submitParam.action = "<c:url value='/sub04/sub01_03_write.do'/>";
	 document.submitParam.submit();
}

function fn_egov_select_List(pageNo) {
	document.frm.pageIndex.value = pageNo;
	document.frm.action = "<c:url value='/sub04/sub01_03.do'/>";
	document.frm.submit();
}
	
//-->
</script>

<form name="submitParam" method="post">
	<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"  />
	<input type="hidden" name="idx" value=""  />
</form>

<div class="typebox mb">
	<ul class="tabs list03">				
		<li><a href="<c:url value='/sub04/sub01_01.do'/>">상담신청안내</a></li>
		<li><a href="<c:url value='/sub04/sub01_02.do'/>">전문 멘토단</a></li>
		<li class="current"><a href="<c:url value='/sub04/sub01_03.do'/>">상담신청</a></li>
	</ul>
</div>

<form name="frm" action="<c:url value='/sub04/sub01_03.do'/>"  method="post" >
<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>

<div class="searchTop">
	<p class="list_info"><span><fmt:formatNumber value="${totCnt}" groupingUsed="true"/></span>개의 글이 등록되어있습니다.</p>
	<div class="searchBox">				
		<select id="searchCnd" name="searchCnd" title="검색 분류 목록">
			<option value="0" <c:if test="${searchVO.searchCnd == '0'}">selected</c:if>>전체</option>
			<option value="4" <c:if test="${searchVO.searchCnd == '4'}">selected</c:if>>문의분야</option>
			<option value="5" <c:if test="${searchVO.searchCnd == '5'}">selected</c:if>>제목</option>
		</select> 
		<span>					
		<label for="searchWrd" class="all-hidden"><span>검색어 입력</span></label>
		<input type="text" placeholder="검색어를 입력하세요" id="searchWrd" name="searchWrd" style="ime-mode:active;" title="검색어를 입력해주세요" value="<c:out value="${searchVO.searchWrd}"/>" />
		<button type="button" onclick="fn_egov_select_List('1');">검색</button>
		</span>
	</div>
</div>
</form>
<!--p style="color:red; margin-bottom:10px;font-size: 20px; font-weight: bold;">멘토링 프로그램은 일시적으로 운영이 중단됩니다. (2021. 12. 3. ~ 2022. 3월까지 중단 예정)</p>
-->
<div class="board_anwser secret_anwser">
	<ul class="board_ul">
		<li class="title_li">
			<span class="select_btn">번호</span>		
			<div class="board_h5">					
				<span class="title">제목</span>
			</div>
			<div class="boardInfo">
				<span class="name">작성자</span>
				<span class="date">날짜</span>
				<span class="aw_status">진행과정</span>
			</div>
		</li>

		<c:forEach var="result" items="${memto_list}" varStatus="status">
		<li>
			<span class="select_btn"></span>
			<h5>
				<a href="#" onclick="fn_egov_view('${result.idx}');">			
					<span class="num"><c:out value="${result.idx}"/></span><span class="title"><span class="cate">[<c:out value="${result.us_major11_nm}"/>]</span> <c:out value="${result.title}"/></span>
				</a>
			</h5>
			<div class="boardInfo">
				<span class="name">
					<c:choose>
						<c:when test="${result.us_id eq ''}">
							<c:out value="${result.us_namex}"/>
						</c:when>
						<c:when test="${result.us_id eq user.us_id}">
							<c:out value="${result.us_name}"/>
						</c:when>
						<c:otherwise>
							<c:out value="${result.us_namex}"/>
						</c:otherwise>
					</c:choose>
				</span>
				<span class="date">
					<fmt:parseDate var="dateString" value="${result.reg_date}" pattern="yyyy-MM-dd" />
					<fmt:formatDate value="${dateString}" pattern="yyyy.MM.dd" />
				</span>
				<c:choose>
					<c:when test="${result.status eq 1}">
						<span class="aw_status s01"><b>접수</b></span>
					</c:when>
					<c:when test="${result.status eq 2}">
						<span class="aw_status s02"><b>접수완료</b></span>
					</c:when>
					<c:when test="${result.status eq 3}">
						<span class="aw_status s03"><b>상담중</b></span>
					</c:when>
					<c:when test="${result.status eq 4}">
						<span class="aw_status s04"><b>상담완료</b></span>
					</c:when>
					<c:otherwise>
						<span class="aw_status s05"><b>처리완료</b></span>
					</c:otherwise>
				</c:choose>
			</div>
		</li>
		</c:forEach>
				
	</ul>
</div>
<div class="boardButton">
	<ul>
		<li><span><a href="#" onclick="fn_egov_select_List('1');">목록</a></span></li>
		<li><span><a href="#" onclick="fn_egov_write('0');">글쓰기</a></span></li>
	</ul>
</div>

<div class="pageList">
	<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_select_List" />
</div>



			</div><!--con-->
		</div><!--subcon-->
	</div><!--subwrap-->




<%@ include file="/WEB-INF/jsp/egovframework/gntbsc/inc/footer.jsp" %>