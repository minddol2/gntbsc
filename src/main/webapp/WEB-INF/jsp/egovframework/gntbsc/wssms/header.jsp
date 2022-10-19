<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="egovframework.com.utl.fcc.service.EgovStringUtil" %>
<%@ page import ="egovframework.goncs.member.service.LoginVO" %>

<%@ include file="/WEB-INF/jsp/egovframework/gntbsc/wssms/menu_link.jsp" %>

<%
LoginVO loginVO  = (LoginVO)session.getAttribute("loginVO"); 
int us_level = loginVO.getUs_level();
%>
	<div id="header">				
		<div class="headerwrap">
			<div id="headerin">
				<h1><a href="<c:url value='/'/><%=mLink[0][1][0]%>" class="logo"><img src="<c:url value='/'/>img/logo_w.png" alt="로고"/></a></h1>
				<nav class="gnb">
					<ul>
					
					<% if(us_level <= 2) { %>
					   <li class="menu">
							<a href="<c:url value='/'/><%=mLink[1][1][0]%>" class="m"><%=mTitle[1][0][0]%></a>      
							 <div class="sub sub1">
								<div class="subList clearfix">							
									<ul>
										<% if(us_level <= 1) { %><li><a href="<c:url value='/'/><%=mLink[1][1][0]%>"><%=mTitle[1][1][0]%></a></li><% } %>
									</ul>
								</div> <!--.g2 .subList-->
							  </div> <!--.sub-->						
						</li> <!--.menu.g1-->
					<% } %>						
						
					<% if(us_level <= 2) { %>
						<li class="menu g1">
							<a href="<c:url value='/'/><%=mLink[2][2][0]%>" class="m"><%=mTitle[2][0][0]%></a>      
							 <div class="sub sub2">
								<div class="subList clearfix">							
									<ul>
										<li><a href="<c:url value='/'/><%=mLink[2][1][0]%>"><%=mTitle[2][1][0]%></a></li>
										<li><a href="<c:url value='/'/><%=mLink[2][7][0]%>"><%=mTitle[2][7][0]%></a></li>
										<li><a href="<c:url value='/'/><%=mLink[2][2][0]%>"><%=mTitle[2][2][0]%></a></li>
										<li><a href="<c:url value='/'/><%=mLink[2][10][0]%>"><%=mTitle[2][10][0]%></a></li>
										<li><a href="<c:url value='/'/><%=mLink[2][3][0]%>"><%=mTitle[2][3][0]%></a></li>
										<li><a href="<c:url value='/'/><%=mLink[2][4][0]%>"><%=mTitle[2][4][0]%></a></li>
										<li><a href="<c:url value='/'/><%=mLink[2][9][0]%>"><%=mTitle[2][9][0]%></a></li>
										<li><a href="<c:url value='/'/><%=mLink[2][5][0]%>"><%=mTitle[2][5][0]%></a></li>
										<li><a href="<c:url value='/'/><%=mLink[2][8][0]%>"><%=mTitle[2][8][0]%></a></li>
										<li><a href="<c:url value='/'/><%=mLink[2][6][0]%>"><%=mTitle[2][6][0]%></a></li>
									</ul>
								</div> <!--.g2 .subList-->
							  </div> <!--.sub-->						
						</li> <!--.menu.g1-->
					<% } %>		
					
					<% if(us_level <= 2) { %>
						<li class="menu">
							<a href="<c:url value='/'/><%=mLink[3][0][0]%>" class="m"><%=mTitle[3][0][0]%></a>      
							 <div class="sub sub3">
								<div class="subList clearfix">						
									<ul>
										<li><a href="<c:url value='/'/><%=mLink[3][1][0]%>"><%=mTitle[3][1][0]%></a></li>
										<li><a href="<c:url value='/'/><%=mLink[3][2][0]%>"><%=mTitle[3][2][0]%></a></li>
										<li><a href="<c:url value='/'/><%=mLink[3][3][0]%>"><%=mTitle[3][3][0]%></a></li>
										<li><a href="<c:url value='/'/><%=mLink[3][4][0]%>"><%=mTitle[3][4][0]%></a></li>
										<li><a href="<c:url value='/'/><%=mLink[3][5][0]%>"><%=mTitle[3][5][0]%></a></li>
										<li><a href="<c:url value='/'/><%=mLink[3][6][0]%>"><%=mTitle[3][6][0]%></a></li>
										<li><a href="<c:url value='/'/><%=mLink[3][7][0]%>"><%=mTitle[3][7][0]%></a></li>
										<li><a href="<c:url value='/'/><%=mLink[3][8][0]%>"><%=mTitle[3][8][0]%></a></li>

									</ul>
								</div> <!--.g2 .subList-->
							  </div> <!--.sub-->						
						</li> <!--.menu.g1-->
					<% } %>	

					<% if(us_level <= 2) { %>
						<li class="menu">
							<a href="<c:url value='/'/><%=mLink[5][0][0]%>" class="m"><%=mTitle[5][0][0]%></a>      
							 <div class="sub sub4">
								<div class="subList clearfix">						
									<ul>
										<li><a href="<c:url value='/'/><%=mLink[5][1][0]%>"><%=mTitle[5][1][0]%></a></li>
										<li><a href="<c:url value='/'/><%=mLink[5][2][0]%>"><%=mTitle[5][2][0]%></a></li>
										<li><a href="<c:url value='/'/><%=mLink[5][3][0]%>"><%=mTitle[5][3][0]%></a></li>

									</ul>
								</div> <!--.g2 .subList-->
							  </div> <!--.sub-->						
						</li> <!--.menu.g1-->
					<% } %>					

					<% if(us_level <= 2) { %>
						<li class="menu">
							<a href="<c:url value='/'/><%=mLink[6][0][0]%>" class="m"><%=mTitle[6][0][0]%></a>      
							 <div class="sub sub5">
								<div class="subList clearfix">						
									<ul>
										<li><a href="<c:url value='/'/><%=mLink[6][1][0]%>"><%=mTitle[6][1][0]%></a></li>
										<li><a href="<c:url value='/'/><%=mLink[6][2][0]%>"><%=mTitle[6][2][0]%></a></li>
									</ul>
								</div> <!--.g2 .subList-->
							  </div> <!--.sub-->						
						</li> <!--.menu.g1-->
					<% } %>	
					
					<% if(us_level <= 2) { %>
						<li class="menu">
							<a href="<c:url value='/'/><%=mLink[4][0][0]%>" class="m"><%=mTitle[4][0][0]%></a>      
							 <div class="sub sub6">
								<div class="subList clearfix">						
									<ul>
										<li><a href="<c:url value='/'/><%=mLink[4][1][0]%>"><%=mTitle[4][1][0]%></a></li>
										<li><a href="<c:url value='/'/><%=mLink[4][2][0]%>"><%=mTitle[4][2][0]%></a></li>
										<li><a href="<c:url value='/'/><%=mLink[4][3][0]%>"><%=mTitle[4][3][0]%></a></li>
										<li><a href="<c:url value='/'/><%=mLink[4][4][0]%>"><%=mTitle[4][4][0]%></a></li>

									</ul>
								</div> <!--.g2 .subList-->
							  </div> <!--.sub-->						
						</li> <!--.menu.g1-->
					<% } %>		
					




						
						<li class="menu last">
							<a href="<c:url value='/wssms/actionLogout.do'/>" class="btn_gnb gnb02">로그아웃</a>
							<a href="<c:url value='/'/>" class="btn_gnb gnb01" target="_blank">홈페이지</a>
							
						</li> <!--.menu.g1-->


					  
					  
					</ul>
				</nav>
			</div>

		</div>
	</div>



	