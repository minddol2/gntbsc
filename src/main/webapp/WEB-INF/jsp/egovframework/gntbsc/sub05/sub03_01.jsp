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
int m2 = 3;
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


<form name="frm" action="<c:url value='/sub05/sub03_01.do'/>" method="post">
	<input type="hidden" name="bbsId" value="<c:out value='${boardVO.bbsId}'/>" /> 
	<input type="hidden"	name="nttId" value="0" /> 
	<input type="hidden" name="bbsTyCode" value="<c:out value='${brdMstrVO.bbsTyCode}'/>" /> 
	<input type="hidden" name="bbsAttrbCode" value="<c:out value='${brdMstrVO.bbsAttrbCode}'/>" /> 
	<input type="hidden" name="authFlag" value="<c:out value='${brdMstrVO.authFlag}'/>" /> 
	<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>" />
			
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

<div class="acco_info bmb">
	<div class="responsive-tabs">

		<c:forEach var="result" items="${resultList}" varStatus="status">
			<h4><b class="cate"></b> <c:out value="${result.nttSj}"/><i></i></h4>
			<div class="qna_answer">
				<c:out value="${result.nttCn}" escapeXml="false" />
			</div>
			<!--첨부파일 view start-->
			<c:if test="${not empty result.atchFileId}">
				<div class="v_attem">
					<ul>
						<c:import url="/cmm/fms/selectFileInfs.do" charEncoding="utf-8">
							<c:param name="param_atchFileId" value="${result.atchFileId}" />
						</c:import>
					</ul>
				</div>
			</c:if>
			<!--첨부파일 view end-->
		</c:forEach>
		<c:if test="${fn:length(resultList) == 0}">
			<div class="tac pdbox mb">게시물이 없습니다.</div>
		</c:if>
	</div>
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
	 document.submitParam.action = "<c:url value='/sub05/sub02_view.do'/>";
	 document.submitParam.submit();
}

function fn_egov_select_BBSList(pageNo) {
	document.frm.pageIndex.value = pageNo;
	document.frm.action = "<c:url value='/sub05/sub02_01.do'/>";
	document.frm.submit();
}
//-->
</script>


<%@ include file="/WEB-INF/jsp/egovframework/gntbsc/inc/footer.jsp" %>