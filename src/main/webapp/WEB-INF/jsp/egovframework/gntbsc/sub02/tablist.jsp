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
	<ul class="tabs list05 long">
		<li class="<% if(m3==1) out.println("current"); %>"><a href="<c:url value='/'/><%=mLink[2][3][1]%>">관광스타트업 <span>발굴 및 육성</span></a></li>
		<li class="<% if(m3==2) out.println("current"); %>"><a href="<c:url value='/'/><%=mLink[2][3][2]%>">지역 기반 <span>관광산업 개선</span></a></li>
		<li class="<% if(m3==3) out.println("current"); %>"><a href="<c:url value='/'/><%=mLink[2][3][3]%>">협력 네트워크 <span>강화</span></a></li>
		<li class="<% if(m3==4) out.println("current"); %>"><a href="<c:url value='/'/><%=mLink[2][3][4]%>">관광인재육성 및 <span>일자리 창출</span></a></li>
		<li class="<% if(m3==5) out.println("current"); %>"><a href="<c:url value='/'/><%=mLink[2][3][5]%>">지역센터 <span>거버넌스 체계화</span></a></li>
	</ul>
</div>


<% } %>

