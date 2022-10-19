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

<% if(m2==4) { %>

<div class="typebox mb">
	<ul class="tabs list03">				
		<li class="<% if(m3==1) out.println("current"); %>"><a href="<c:url value='/'/><%=mLink[11][4][1]%>"><%=mTitle[11][4][1]%></a></li>
		<li class="<% if(m3==3) out.println("current"); %>"><a href="<c:url value='/'/><%=mLink[11][4][3]%>"><%=mTitle[11][4][3]%></a></li>
		<li class="<% if(m3==2) out.println("current"); %>"><a href="<c:url value='/'/><%=mLink[11][4][2]%>"><%=mTitle[11][4][2]%></a></li>
	</ul>
</div>
<%} else if( m2==3){%>




<% } %>

