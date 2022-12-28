<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import ="egovframework.goncs.member.service.LoginVO" %>
<%
	String lang_mode = (String) request.getAttribute("lang_temp");

	String is_main = "";
	int m1 = 3;
	int m2 = 1;
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

<form name="subForm" method="post" action="<c:url value='/sub03/sub01_01v.do'/>">
	<input type="hidden" name="bbsTyCode" value="<c:out value='${brdMstrVO.bbsTyCode}'/>" />
	<input type="hidden" name="bbsAttrbCode" value="<c:out value='${brdMstrVO.bbsAttrbCode}'/>" />
	<input type="hidden" name="authFlag" value="<c:out value='${brdMstrVO.authFlag}'/>" />
	<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
</form>

<form name="frm" action="<c:url value='/sub03/sub01_01.do'/>" method="post">
	<input type="hidden" name="bbsId" value="<c:out value='${boardVO.bbsId}'/>" />
	<input type="hidden"	name="nttId" value="0" />
	<input type="hidden" name="bbsTyCode" value="<c:out value='${brdMstrVO.bbsTyCode}'/>" />
	<input type="hidden" name="bbsAttrbCode" value="<c:out value='${brdMstrVO.bbsAttrbCode}'/>" />
	<input type="hidden" name="authFlag" value="<c:out value='${brdMstrVO.authFlag}'/>" />
	<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>" />
	<input name="category" type="hidden" value="<c:out value='${searchVO.category}'/>" />
	<input name="category2" type="hidden" value="<c:out value='${searchVO.category2}'/>" />

	<div class="searchTop">
		<p class="list_info">기업이름 혹은 기업정보로 검색하세요.</p>
		<div class="searchBox">
			<select id="searchCnd" name="searchCnd" title="검색 분류 목록">
				<option value="">선택</option>
				<option value="0" <c:if test="${searchVO.searchCnd == '0'}">selected</c:if>>기업이름</option>
				<option value="1" <c:if test="${searchVO.searchCnd == '1'}">selected</c:if>>내용</option>
			</select>
			<span>
		<label for="searchWrd" class="all-hidden"><span>검색어 입력</span></label>
		<input type="text" placeholder="검색어를 입력하세요" id="searchWrd" name="searchWrd" style="ime-mode:active;" title="검색어를 입력해주세요" value="<c:out value="${searchVO.searchWrd}"/>" />
		<button type="button" onclick="fn_egov_select_BBSList('1');">검색</button>
		</span>
		</div>
	</div>
</form>

<ul class="board_category2">
	<li><a href="javascript:egov_select_category('');" <c:if test="${searchVO.category == ''}">class="on"</c:if>>전체보기</a></li>
	<li><a href="javascript:egov_select_category('1');" <c:if test="${searchVO.category == '1'}">class="on"</c:if>>ICT/플랫폼</a></li>
	<li><a href="javascript:egov_select_category('2');" <c:if test="${searchVO.category == '2'}">class="on"</c:if>>로컬푸드</a></li>
	<li><a href="javascript:egov_select_category('3');" <c:if test="${searchVO.category == '3'}">class="on"</c:if>>관광상품</a></li>
	<li><a href="javascript:egov_select_category('4');" <c:if test="${searchVO.category == '4'}">class="on"</c:if>>관광체험·레저</a></li>
	<li><a href="javascript:egov_select_category('5');" <c:if test="${searchVO.category == '5'}">class="on"</c:if>>관광콘텐츠</a></li>
</ul>

<div class="center_board2">
	<ul>
		<c:forEach var="result" items="${resultList}" varStatus="status">
			<li>
				<a href="#" onclick="fn_egov_inqire_BBS('${result.nttId}', '${result.bbsId }');">
					<div class="photo">
						<c:choose>
							<c:when test="${result.classfication eq 1}">
								<span class="cate cate01">예비관광</span>
							</c:when>
							<c:when test="${result.classfication eq 2}">
								<span class="cate cate02">지역혁신</span>
							</c:when>
							<c:when test="${result.classfication eq 3}">
								<span class="cate cate03">지역상생</span>
							</c:when>
							<c:when test="${result.classfication eq 4}">
								<span class="cate cate04">비상주 협력기업</span>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${empty result.atchFileId}">
								<img src="<c:url value='/img/business_logo03.jpg'/>" alt="" />
							</c:when>
							<c:otherwise>
								<img src="<c:url value='/cmm/fms/getImage.do?fileSn=${result.fileSn}&atchFileId=${result.atchFileId}'/>" alt="" />
							</c:otherwise>
						</c:choose>
					</div>
					<div class="info">
						<dl>
							<dt><c:out value="${result.nttSj}"/></dt>
							<dd class="txt"><c:out value='${fn:substring(result.nttCn.replaceAll("\\\<.*?\\\>",""),0, 100)}' /></dd>
							<dd class="tag"><c:out value="${result.ssWords}"/></dd>
						</dl>
					</div>
				</a>
			</li>
		</c:forEach>

	</ul>
</div>

<div class="pageList">
	<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_select_BBSList" />
</div>

<form name="submitParam" method="get">
	<input type="hidden" name="bbsId" />
	<input type="hidden" name="nttId" />
</form>

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
		document.submitParam.action = "<c:url value='/sub03/sub01_01v.do'/>";
		document.submitParam.submit();
	}

	function fn_egov_select_BBSList(pageNo) {
		document.frm.pageIndex.value = pageNo;
		document.frm.action = "<c:url value='/sub03/sub01_01.do'/>";
		document.frm.submit();
	}

	function egov_select_category(category) {
		document.frm.pageIndex.value = 1;
		document.frm.category.value = category;
		document.frm.category2.value = category;
		document.frm.action = "<c:url value='/sub03/sub01_01.do'/>";
		document.frm.submit();
	}
	//-->
</script>

</div><!--con-->
</div><!--subcon-->
</div><!--subwrap-->





<%@ include file="/WEB-INF/jsp/egovframework/gntbsc/inc/footer.jsp" %>