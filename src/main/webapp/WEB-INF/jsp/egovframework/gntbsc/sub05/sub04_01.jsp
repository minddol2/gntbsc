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
int m1 = 5;
int m2 = 4;
int m3 = 1;

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

<form name="submitParam" method="post">
	<input type="hidden" name="bbsId" /> 
	<input type="hidden" name="nttId" />
	<input type="hidden" name="bbsTyCode" value="<c:out value='${brdMstrVO.bbsTyCode}'/>" />
	<input type="hidden" name="bbsAttrbCode" value="<c:out value='${brdMstrVO.bbsAttrbCode}'/>" />
	<input type="hidden" name="authFlag" value="<c:out value='${brdMstrVO.authFlag}'/>" />
	<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
</form>

<form name="subForm" method="post" action="<c:url value='/sub05/sub04_view.do'/>">
	<input type="hidden" name="bbsTyCode" value="<c:out value='${brdMstrVO.bbsTyCode}'/>" />
	<input type="hidden" name="bbsAttrbCode" value="<c:out value='${brdMstrVO.bbsAttrbCode}'/>" />
	<input type="hidden" name="authFlag" value="<c:out value='${brdMstrVO.authFlag}'/>" />
	<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
</form>								


<form name="frm" action="<c:url value='/sub05/sub04_01.do'/>" method="post">
	<input type="hidden" name="bbsId" value="<c:out value='${boardVO.bbsId}'/>" /> 
	<input type="hidden"	name="nttId" value="0" /> 
	<input type="hidden" name="bbsTyCode" value="<c:out value='${brdMstrVO.bbsTyCode}'/>" /> 
	<input type="hidden" name="bbsAttrbCode" value="<c:out value='${brdMstrVO.bbsAttrbCode}'/>" /> 
	<input type="hidden" name="authFlag" value="<c:out value='${brdMstrVO.authFlag}'/>" /> 
	<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>" />
	<input name="category" type="hidden" value="<c:out value='${searchVO.category}'/>" />

<div class="searchTop">
	<p class="list_info"><span><c:out value="${totCnt}"/></span>개의 게시물이 등록되어 있습니다</p>
	<div class="searchBox">				
		<select id="searchCnd" name="searchCnd" title="검색 분류 목록">
			<option value="">선택</option>
			<option value="0" <c:if test="${searchVO.searchCnd == '0'}">selected="selected"</c:if>>제목</option>
			<option value="1" <c:if test="${searchVO.searchCnd == '1'}">selected="selected"</c:if>>글내용</option>
		</select> 
		<span>					
		<label for="searchWrd" class="all-hidden"><span>검색어 입력</span></label>
		<input type="text" placeholder="검색어를 입력하세요" id="searchWrd" name="searchWrd" style="ime-mode:active;" title="검색어를 입력해주세요" value="<c:out value="${searchVO.searchWrd}"/>" />
		<button type="button" onclick="fn_egov_select_BBSList('1');">검색</button>
		</span>
	</div>
</div>

</form>

<div class="typebox mb">
	<ul class="tabs list04 long">
		<li class="<c:if test="${searchVO.category eq ''}">current</c:if>"><a href="javascript: egov_select_category('')">전체</a></li>
		<li class="<c:if test="${searchVO.category eq '2023'}">current</c:if>"><a href="javascript: egov_select_category('2023')">2023</a></li>
		<li class="<c:if test="${searchVO.category eq '2022'}">current</c:if>"><a href="javascript: egov_select_category('2022')">2022</a></li>
	</ul>
</div>

<div class="boardType01">
	<ul class="board_ul">
		<li class="title_li">
			<span class="select_btn"></span>	
			<div class="board_h5">					
				<span class="title">제목</span>
			</div>

			<div class="boardInfo">
				<span class="name">작성자</span>
				<span class="date">날짜</span>
			</div>
		</li>
		<c:forEach var="result" items="${resultList}" varStatus="status">
			<li class="noti_li">
				<span class="select_btn"></span>									
				<h5>							
					<a href="#" onclick="fn_egov_inqire_BBS('${result.nttId}', '${result.bbsId }');">
					<span class="notice"><c:out value="${totCnt - ((searchVO.pageIndex-1) * 10 + status.count -1)}"/></span>				
					<span class="title"><c:out value="${result.nttSj}"/></span>
					</a>
				</h5>
				<div class="boardInfo">
					<span class="name"><c:out value="${result.frstRegisterNm}"/></span>
					<span class="date"><c:out value="${result.frstRegisterPnttm}"/></span>
				</div>
			</li>
		</c:forEach>
		<c:if test="${fn:length(resultList) == 0}">
			<div class="tac pdbox mb">게시물이 없습니다.</div>
		</c:if>
	</ul>

</div>

<div class="pageList">
		<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_select_BBSList" />
</div>

			</div><!--con-->
		</div><!--subcon-->
	</div><!--subwrap-->


<script type="text/javascript">
<!--
function press(event) {
	if (event.keyCode==13) {
		fn_egov_select_BBSList('1');
	}
}

function fn_egov_inqire_BBS(nttId, bbsId) {
	 if(bbsId == "") return false; //20150508
	 document.submitParam.nttId.value = nttId;
	 document.submitParam.bbsId.value = bbsId;
	 document.submitParam.action = "<c:url value='/sub05/sub04_view.do'/>";
	 document.submitParam.submit();
}

function fn_egov_select_BBSList(pageNo) {
	document.frm.pageIndex.value = pageNo;
	document.frm.action = "<c:url value='/sub05/sub04_01.do'/>";
	document.frm.submit();
}

function egov_select_category(category) {
	document.frm.pageIndex.value = 1;
	document.frm.category.value = category;
	document.frm.action = "<c:url value='/sub05/sub04_01.do'/>";
	document.frm.submit();
}
//-->
</script>


<%@ include file="/WEB-INF/jsp/egovframework/gntbsc/inc/footer.jsp" %>