<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="egovframework.com.utl.fcc.service.EgovStringUtil" %>

<%
int m1 = EgovStringUtil.zeroConvert(EgovStringUtil.clearXSS(request.getParameter("m1"),""));
int m2 = EgovStringUtil.zeroConvert(EgovStringUtil.clearXSS(request.getParameter("m2"),""));
int m3 = EgovStringUtil.zeroConvert(EgovStringUtil.clearXSS(request.getParameter("m3"),""));
%>
<%@ include file="/WEB-INF/jsp/egovframework/gntbsc/inc/menu_link.jsp" %>

	<div id="sub_visual" class="sub0<?=$m1?>">
		<div class="pdinner">		
			<h2 class="tit_h2 motion01"><%=mTitle[m1][0][0]%></h2>			
			<p>지역의 관광산업 발굴육성과 관광 일자리 연계</p>
		</div>			
	</div>
	
	<div class="subwrap">
		<div class="leftmenu">
			<jsp:include page="/WEB-INF/jsp/egovframework/gntbsc/inc/left_menu.jsp" flush="true" >
				<jsp:param name="m1" value="<%=m1%>"/>
				<jsp:param name="m2" value="<%=m2%>"/>
				<jsp:param name="m3" value="<%=m3%>"/>
			</jsp:include>

		</div>
		
		<div class="sub_con">	
			<jsp:include page="/WEB-INF/jsp/egovframework/gntbsc/inc/sub_menu.jsp" flush="true" >
				<jsp:param name="m1" value="<%=m1%>"/>
				<jsp:param name="m2" value="<%=m2%>"/>
				<jsp:param name="m3" value="<%=m3%>"/>
			</jsp:include>
			<div class="sub_title">
				<h3><%=mTitle[m1][m2][0]%></h3>
				<!--<ul>
					<li><a href="#sns_link" class="litebox"><img src="<c:url value='/img/sns_link.png'/>" alt=""/></a></li>
				</ul>-->
			</div>

			<div class="con">


			
	