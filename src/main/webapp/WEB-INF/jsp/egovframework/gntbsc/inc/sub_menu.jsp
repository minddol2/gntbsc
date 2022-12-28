<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="egovframework.com.utl.fcc.service.EgovStringUtil" %>
<%@ page import ="egovframework.goncs.member.service.LoginVO" %>

<%
int m1 = EgovStringUtil.zeroConvert(EgovStringUtil.clearXSS(request.getParameter("m1"),""));
int m2 = EgovStringUtil.zeroConvert(EgovStringUtil.clearXSS(request.getParameter("m2"),""));
int m3 = EgovStringUtil.zeroConvert(EgovStringUtil.clearXSS(request.getParameter("m3"),""));

LoginVO loginVO  = (LoginVO)session.getAttribute("loginVO"); 
%>
<%@ include file="/WEB-INF/jsp/egovframework/gntbsc/inc/menu_link.jsp" %>
				<!--2차메뉴_S -->
	<div id="sub_drop" class="">
		<ul class="nav inner">
		
			<li class="dropdown home">
				<a href="<c:url value='/'/>"><img src="../img/ic_home.png" alt="메인으로"/></a>
			</li>

			<li class="dropdown">
				<a class="dropbtn"><%=mTitle[m1][0][0]%></a>
				<ul class="dropmenu sub-menu">		
					<li><a href="<c:url value='/'/><%=mLink[1][1][0]%>"><%=mTitle[1][0][0]%></a></li>
					<li><a href="<c:url value='/'/><%=mLink[2][1][0]%>"><%=mTitle[2][0][0]%></a></li>
					<li><a href="<c:url value='/'/><%=mLink[3][1][0]%>"><%=mTitle[3][0][0]%></a></li>
					<li><a href="<c:url value='/'/><%=mLink[4][1][0]%>"><%=mTitle[4][0][0]%></a></li>
					<li><a href="<c:url value='/'/><%=mLink[5][1][0]%>"><%=mTitle[5][0][0]%></a></li>	
				</ul>
			</li> 
			<li class="dropdown deph02">
				<a class="dropbtn"><%=mTitle[m1][m2][0]%></a>
				<ul class="dropmenu sub-menu">
					<% if(m1==1) { %>

						<li><a href="<c:url value='/'/><%=mLink[1][1][0]%>"><%=mTitle[1][1][0]%></a></li>
						<li><a href="<c:url value='/'/><%=mLink[1][2][0]%>"><%=mTitle[1][2][0]%></a></li>
						<li><a href="<c:url value='/'/><%=mLink[1][3][0]%>"><%=mTitle[1][3][0]%></a></li>
						<li><a href="<c:url value='/'/><%=mLink[1][4][0]%>"><%=mTitle[1][4][0]%></a></li>

					<%} else if( m1==2){%>

						<!--<li><a href="<c:url value='/'/><%=mLink[2][1][0]%>"><%=mTitle[2][1][0]%></a></li>
						<li><a href="<c:url value='/'/><%=mLink[2][2][0]%>"><%=mTitle[2][2][0]%></a></li>-->
						<li><a href="<c:url value='/'/><%=mLink[2][3][0]%>"><%=mTitle[2][3][0]%></a></li>
						<li><a href="<c:url value='/'/><%=mLink[2][4][0]%>"><%=mTitle[2][4][0]%></a></li>
						<li><a href="<c:url value='/'/><%=mLink[2][5][0]%>"><%=mTitle[2][5][0]%></a></li>



					<%} else if( m1==3){%>

						<li><a href="<c:url value='/'/><%=mLink[3][1][0]%>"><%=mTitle[3][1][0]%></a></li>
						<li><a href="<c:url value='/'/><%=mLink[3][2][0]%>"><%=mTitle[3][2][0]%></a></li>
						<li><a href="<c:url value='/'/><%=mLink[3][3][0]%>"><%=mTitle[3][3][0]%></a></li>


					<%} else if( m1==4){%>

						<li><a href="<c:url value='/'/><%=mLink[4][1][0]%>"><%=mTitle[4][1][0]%></a></li>
						<li><a href="<c:url value='/'/><%=mLink[4][2][0]%>"><%=mTitle[4][2][0]%></a></li>
						<li><a href="<c:url value='/'/><%=mLink[4][3][0]%>"><%=mTitle[4][3][0]%></a></li>

					<%} else if( m1==5){%>
	
						<li><a href="<c:url value='/'/><%=mLink[5][1][0]%>"><%=mTitle[5][1][0]%></a></li>
						<li><a href="<c:url value='/'/><%=mLink[5][5][0]%>"><%=mTitle[5][5][0]%></a></li>
						<li><a href="<c:url value='/'/><%=mLink[5][2][0]%>"><%=mTitle[5][2][0]%></a></li>
						<li><a href="<c:url value='/'/><%=mLink[5][3][0]%>"><%=mTitle[5][3][0]%></a></li>
						<li><a href="<c:url value='/'/><%=mLink[5][4][0]%>"><%=mTitle[5][4][0]%></a></li>
						<li><a class="ic_link" target="_blank" href="<%=mLink[5][6][0]%>"><%=mTitle[5][6][0]%></a></li>


				
					<%} else if( m1==10){%>
	
						<li><a href="<c:url value='/'/><%=mLink[10][1][0]%>"><%=mTitle[10][1][0]%></a></li>
						<li><a href="<c:url value='/'/><%=mLink[10][2][0]%>"><%=mTitle[10][2][0]%></a></li>
						<li><a href="<c:url value='/'/><%=mLink[10][3][0]%>"><%=mTitle[10][3][0]%></a></li>

					<%} else if( m1==11){%>

					<% if(loginVO == null) { %>
						<li><a href="<c:url value='/'/><%=mLink[11][1][0]%>"><%=mTitle[11][1][0]%></a></li>
						<li><a href="<c:url value='/'/><%=mLink[11][2][0]%>"><%=mTitle[11][2][0]%></a></li>
						<li><a href="<c:url value='/'/><%=mLink[11][3][0]%>"><%=mTitle[11][3][0]%></a></li>	
						
					<% } else {  %>
					<li><a href="<c:url value='/'/><%=mLink[11][6][0]%>"><%=mTitle[11][6][0]%></a></li>
					<li><a href="<c:url value='/'/><%=mLink[11][4][0]%>"><%=mTitle[11][4][0]%></a></li>					
					<li><a href="<c:url value='/'/><%=mLink[11][5][0]%>"><%=mTitle[11][5][0]%></a></li>
					
				
					<% } %>


						
		
					<% } %>
				</ul>
				<script src="<c:url value='/js/jquery-tab-nav.js'/>"></script>
				<script>
				;(function($) {
					$('.nav').tabNav();
				})(jQuery);
				</script>

			</li>
		</ul>	
	</div>

