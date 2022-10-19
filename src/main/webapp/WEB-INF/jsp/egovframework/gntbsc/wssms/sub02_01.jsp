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
int m1 = 2;
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
function press(event) {
	if (event.keyCode==13) {
		fn_egov_select_BBSList('1');
	}
}

function fn_egov_inqire_BBS(nttId, bbsId) {
	 if(bbsId == "") return false; //20150508
	 document.submitParam.nttId.value = nttId;
	 document.submitParam.bbsId.value = bbsId;
	 document.submitParam.action = "<c:url value='/sb02/sub01_view.do'/>";
	 document.submitParam.submit();
}

function fn_egov_select_BBSList(pageNo) {
	document.frm.pageIndex.value = pageNo;
	document.frm.action = "<c:url value='/sb02/sub01.do'/>";
	document.frm.submit();
}
//-->
</script>

<h4 class="tit_dot">팝업관리</h4>



	<form name="frm" action="<c:url value='/sb02/sub01.do'/>" method="post">
		<input type="hidden" name="bbsId" value="<c:out value='${boardVO.bbsId}'/>" /> 
		<input type="hidden" name="nttId" value="0" /> 
		<input type="hidden" name="bbsTyCode" value="<c:out value='${brdMstrVO.bbsTyCode}'/>" /> 
		<input type="hidden" name="bbsAttrbCode" value="<c:out value='${brdMstrVO.bbsAttrbCode}'/>" /> 
		<input type="hidden" name="authFlag" value="<c:out value='${brdMstrVO.authFlag}'/>" /> 
		<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>" />

		<div class="searchTop">
			<div class="searchBox">
				<select name="searchCnd" id="searchCnd" title="검색 분류 목록">
					<option value="">선택</option>
					<option value="0"
						<c:if test="${searchVO.searchCnd == '0'}">selected="selected"</c:if>>제목</option>
					<option value="1"
						<c:if test="${searchVO.searchCnd == '1'}">selected="selected"</c:if>>글내용</option>
				</select> <span> <input type="text" name="searchWrd" id="searchWrd"
					value="<c:out value="${searchVO.searchWrd}"/>" title="검색어"
					placeholder="검색어를 입력해 주세요" />
					<button type="button"
						onclick="fn_egov_select_BBSList('1'); return false;">조회</button>
				</span>
			</div>
		</div>
	</form>
	<!-- 게시판 검색 end -->
			
			
					
			
	<div class="basicList">
		<ul>
			<li class="tit_li">
				<span class="none">번호</span>
				<span class="title">제목</span>
				<span class="name">기간</span>
				<span class="date">등록일</span>
			</li>
			<c:forEach var="result" items="${resultList}" varStatus="status">
			<li>
						<span class="none"><c:out value="${totCnt - ((searchVO.pageIndex-1) * 20 + status.count -1)}"/></span>
						<span class="title">
							<form name="subForm" method="post" action="<c:url value='/sb02/sub01_view.do'/>">
								<input type="hidden" name="bbsTyCode" value="<c:out value='${brdMstrVO.bbsTyCode}'/>" />
								<input type="hidden" name="bbsAttrbCode" value="<c:out value='${brdMstrVO.bbsAttrbCode}'/>" />
								<input type="hidden" name="authFlag" value="<c:out value='${brdMstrVO.authFlag}'/>" />
								<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
								<c:if test="${result.replyLc!=0}">
				    				<span style="float:left;">
						    			<c:forEach begin="0" end="${result.replyLc}" step="1">
							    			&nbsp;
							    		</c:forEach>
				    					<img src="<c:url value='/images/egovframework/com/cmm/icon/reply_arrow.gif'/>" alt="reply arrow">
				    				</span>
				    			</c:if>
			    				<span class="link">
			    					<a href="#"  onclick="fn_egov_inqire_BBS('${result.nttId}', '${result.bbsId }');"><c:out value="${result.nttSj}"/></a>
			    				</span>
			    			</form>
						</span>
						<span class="name"><c:out value="${result.ntceBgnde}"/>~<c:out value="${result.ntceEndde}"/></span>
						<span class="date"><c:out value="${result.frstRegisterPnttm}"/></span>
			</li>
			</c:forEach>
			<c:if test="${fn:length(resultList) == 0}">
				<li><span>자료가 없습니다.</span></li>
			</c:if>
		</ul>
	</div>
	
	<div class="boardButton">
		<span><a href="<c:url value='/sb02/sub01.do'/>">목록</a> </span> 
		<c:if test="${us_level le 2}">
		<span><a href="<c:url value='/sb02/sub01_write.do'/>?bbsId=<c:out value="${boardVO.bbsId}"/>">글쓰기</a> </span> 
		</c:if>
	</div>
	

	<div class="pageList">
		<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_select_BBSList" />
	</div>


<form name="submitParam" method="post">
	<input type="hidden" name="bbsId" /> 
	<input type="hidden" name="nttId" />
</form>

<form name="frm" action ="<c:url value='/sb02/sub01.do'/>" method="post">
<input type="hidden" name="bbsId" value="<c:out value='${boardVO.bbsId}'/>" />
<input type="hidden" name="nttId"  value="0" />
<input type="hidden" name="bbsTyCode" value="<c:out value='${brdMstrVO.bbsTyCode}'/>" />
<input type="hidden" name="bbsAttrbCode" value="<c:out value='${brdMstrVO.bbsAttrbCode}'/>" />
<input type="hidden" name="authFlag" value="<c:out value='${brdMstrVO.authFlag}'/>" />
<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
</form>

<!-- 게시판 list end -->


<%@ include file="/WEB-INF/jsp/egovframework/gntbsc/wssms/footer.jsp" %>