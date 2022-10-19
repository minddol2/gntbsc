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

<% if(m2==2) { %>

<div class="typebox">
	<ul class="tabs list03">				
		<li class="<% if(m3==1) out.println("current"); %>"><a href="<c:url value='/'/><%=mLink[2][2][1]%>">지원프로그램</a></li>
		<li class="<% if(m3==2) out.println("current"); %>"><a href="<c:url value='/'/><%=mLink[2][2][2]%>">교육 및 컨설팅</a></li>
		<li class="<% if(m3==3) out.println("current"); %>"><a href="<c:url value='/'/><%=mLink[2][2][3]%>">인플루언서양성</a></li>
	</ul>
</div>
<%} else if( m2==3){%>

<div class="typebox mb">
	<ul class="tabs list04 long">				
		<li class="<% if(m3==1) out.println("current"); %>"><a href="<c:url value='/'/><%=mLink[2][3][1]%>">관광기업 창업 및 <span>육성 지원</span></a></li>
		<li class="<% if(m3==2) out.println("current"); %>"><a href="<c:url value='/'/><%=mLink[2][3][2]%>">관광기업 교육 <span>아카데미 운영</span></a></li>
		<li class="<% if(m3==3) out.println("current"); %>"><a href="<c:url value='/'/><%=mLink[2][3][3]%>">관광일자리 <span>허브 구축 및 운영</span></a></li>
		<li class="<% if(m3==4) out.println("current"); %>"><a href="<c:url value='/'/><%=mLink[2][3][4]%>">지역 관광산업 <span>활성화 지원</span></a></li>
	</ul>
</div>


<% } %>

