<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="egovframework.com.utl.fcc.service.EgovStringUtil" %>
<%
int m1 = EgovStringUtil.zeroConvert(EgovStringUtil.clearXSS(request.getParameter("m1"),""));
int m2 = EgovStringUtil.zeroConvert(EgovStringUtil.clearXSS(request.getParameter("m2"),""));
int m3 = EgovStringUtil.zeroConvert(EgovStringUtil.clearXSS(request.getParameter("m3"),""));
%>
<%@ include file="/WEB-INF/jsp/egovframework/gntbsc/wssms/menu_link.jsp" %>
<div class="subcon">

	<jsp:include page="/WEB-INF/jsp/egovframework/gntbsc/wssms/left.jsp" flush="true" >
		<jsp:param name="m1" value="<%=m1%>"/>
		<jsp:param name="m2" value="<%=m2%>"/>
		<jsp:param name="m3" value="<%=m3%>"/>
	</jsp:include>

	
	<div class="con">
		<h3 class="sub_h3"><%=mTitle[m1][0][0]%> <span><%=mTitle[m1][m2][m3]%></span></h3>
		<ul class="path">
			<li>HOME</li>
			<li><%=mTitle[m1][0][0]%></li>
			<li><%=mTitle[m1][m2][0]%></li>					
		</ul>		
