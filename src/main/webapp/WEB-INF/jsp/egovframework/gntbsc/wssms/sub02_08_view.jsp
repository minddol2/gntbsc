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
int m2 = 8;
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
	function onloading() {
		if ("<c:out value='${msg}'/>" != "") {
			alert("<c:out value='${msg}'/>");
		}
	}

	function fn_egov_select_BBSList(pageNo) {
		document.frm.pageIndex.value = pageNo;
		document.frm.action = "<c:url value='/sb02/sub02_08.do'/>";
		document.frm.submit();
	}
	
	function fn_egov_delete_BBS() {
        if (confirm('<spring:message code="common.delete.msg" />')) {
            document.frm.action = "<c:url value='/sb02/sub02_08_delete.do'/>";
            document.frm.submit();
        }   
    }
    
    function fn_egov_moveUpdt_BBS() {
        document.frm.action = "<c:url value='/sb02/sub02_08_modify.do'/>";
        document.frm.submit();          
    }
        
</script>	

<h4 class="tit_dot">기업소개 관리</h4>


<form name="frm" method="post" action="">
<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>">
<input type="hidden" name="bbsId" value="<c:out value='${result.bbsId}'/>" >
<input type="hidden" name="nttId" value="<c:out value='${result.nttId}'/>" >
<input type="hidden" name="parnts" value="<c:out value='${result.parnts}'/>" >
<input type="hidden" name="sortOrdr" value="<c:out value='${result.sortOrdr}'/>" >
<input type="hidden" name="replyLc" value="<c:out value='${result.replyLc}'/>" >
<input type="hidden" name="nttSj" value="<c:out value='${result.nttSj}'/>" >

<!-- 뷰 내용 -->
<div id="viewWrap">
	<div class="viewTop">
		<h4><c:out value="${result.nttSj}" /></h4>
		<ul>
			<li><span class="view">
				<c:out value="${result.ssWords}" />
				</span>
			</li>	
		</ul>
		<ul>
			<li><span class="view">대표자 : 
				<c:out value="${result.ceoName}" />
				</span>
			</li>	
		</ul>
		<ul>
			<li><span class="view">연락처 : 
				<c:out value="${result.telnum}" />
				</span>
			</li>	
		</ul>
		<ul>
			<li><span class="view">이메일 : 
				<c:out value="${result.email}" />
				</span>
			</li>	
		</ul>
		<ul>
			<li><span class="view">홈페이지 : 
				<c:out value="${result.homepage}" />
				</span>
			</li>	
		</ul>
		<ul>
			<li><span class="view">SNS : 
				<c:out value="${result.snslink}" />
				</span>
			</li>	
		</ul>
		<ul>
			<li><span class="view">
				<c:choose>
					<c:when test="${result.category eq 1}">
						예비관광
					</c:when>
					<c:when test="${result.category eq 2}">
						지역혁신
					</c:when>
					<c:when test="${result.category eq 3}">
						지역상생
					</c:when>
					<c:otherwise>
						비상주 협력기업
					</c:otherwise>
				</c:choose>
				</span>
			</li>	
			<li><span class="name"><c:out value="${result.ntcrNm}" /></span></li>
			<li><span class="date"><c:out value="${result.frstRegisterPnttm}" /></span></li>	
		</ul>
	</div>
	
	<c:if test="${not empty result.atchFileId}">
	<div class="v_attem">
		<ul>
			<c:import url="/cmm/fms/selectFileInfs.do" charEncoding="utf-8">
				<c:param name="param_atchFileId" value="${result.atchFileId}" />
			</c:import>
		</ul>
	</div>
	</c:if>
	
	<div class="v_contents">
		<c:if test="${(result.file_Extsn eq 'jpg') || (result.file_Extsn eq 'png')|| (result.file_Extsn eq 'gif')}">
			<img src="<c:url value='/cmm/fms/getImage.do?fileSn=${result.fileSn}&atchFileId=${result.atchFileId}'/>" alt="" />
		</c:if>
		<p><c:out value="${result.nttCn}" escapeXml="false" /></p>
	</div>
	
	<div class="v_contents">
		<p><c:out value="${result.nttAd}" escapeXml="false" /></p>
	</div>
	

	<div class="boardButton">
		<c:if test="${us_level le 2}">
			<span><a href="javascript:fn_egov_moveUpdt_BBS();">수정</a> </span>
			
			<span><a href="javascript:fn_egov_delete_BBS();">삭제</a> </span>
		</c:if>
		<span><a href="<c:url value='/sb02/sub02_08.do'/>">목록</a> </span> 
	</div>
</div>
<!--뷰 e-->
	
	


	<!-- 게시판 list end -->


<%@ include file="/WEB-INF/jsp/egovframework/gntbsc/wssms/footer.jsp" %>