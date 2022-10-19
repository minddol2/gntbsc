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
int m2 = 5;
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

<script type="text/javascript">
	function onloading() {
		if ("<c:out value='${msg}'/>" != "") {
			alert("<c:out value='${msg}'/>");
		}
	}

	function fn_egov_select_BBSList(pageNo) {
		document.frm.pageIndex.value = pageNo;
		document.frm.action = "<c:url value='/sub05/sub05_01.do'/>";
		document.frm.submit();
	}
	    
</script>	


<form name="frm" method="post" action="">
<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>">
<input type="hidden" name="bbsId" value="<c:out value='${result.bbsId}'/>" >
<input type="hidden" name="nttId" value="<c:out value='${result.nttId}'/>" >
<input type="hidden" name="parnts" value="<c:out value='${result.parnts}'/>" >
<input type="hidden" name="sortOrdr" value="<c:out value='${result.sortOrdr}'/>" >
<input type="hidden" name="replyLc" value="<c:out value='${result.replyLc}'/>" >
<input type="hidden" name="nttSj" value="<c:out value='${result.nttSj}'/>" >


<div class="board_view bmb">

	<div class="board_view_top">			
		<h4 class="tit"><c:out value="${result.nttSj}" /></h4>
		
		<div class="info">
			<span class="each">작성일 : <c:out value="${result.frstRegisterPnttm}" /></span>
			<span class="each">조회 : <c:out value="${result.inqireCo}" /></span>
		</div>
	</div>


	<div class="board_view_con">
		<div class="editor_view">
			<c:out value="${result.nttCn}" escapeXml="false" />
		</div>
	</div>
	
	<div class="board_view_file">
		<p class="tit">첨부파일</p>
		<div class="file_box">					
			<c:import url="/cmm/fms/selectFileInfs.do" charEncoding="utf-8">
				<c:param name="param_atchFileId" value="${result.atchFileId}" />
			</c:import>		
		</div>
	</div>

	<div class="board_view_link">
		<p class="tit">관련링크</p>
		<div class="file_box">					
			<c:if test="${not empty result.link_url}">					
			<p class="link_each">
				<a href="<c:out value="${result.link_url}" />" target="_blank" title="링크주소1"><c:out value="${result.link_url}" /></a>
			</p>
			</c:if>	
		
			<c:if test="${empty result.link_url}">
			<p class="link_each">
				관련링크가 없습니다.
			</p>
			</c:if>	
		</div>
	</div>


</div>


<div class="boardButton">
	<ul>
		<li><span><a href="<c:url value='/sub05/sub05_01.do'/>">목록</a></span></li>
	</ul>
</div>



			</div><!--con-->
		</div><!--subcon-->
	</div><!--subwrap-->





<%@ include file="/WEB-INF/jsp/egovframework/gntbsc/inc/footer.jsp" %>