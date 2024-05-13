<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="egovframework.com.utl.fcc.service.EgovStringUtil" %>
<%@ page import ="egovframework.goncs.member.service.LoginVO" %>

<%@ include file="/WEB-INF/jsp/egovframework/gntbsc/inc/menu_link.jsp" %>

<%
LoginVO loginVO  = (LoginVO)session.getAttribute("loginVO"); 
%>
	<div id="header">
		<div class="bg">
		</div>

		<div id="hs1">
			<div class="d_container">			
				<div id="d_gnb">
					<ul>						
						<li class="d2"><a href="<%=mLink[0][2][0]%>"><%=mTitle[0][2][0]%></a></li>
						<li class="d3"><a href="<%=mLink[0][3][0]%>" target="_blank"><%=mTitle[0][3][0]%></a></li>
						<li class="d0"><a href="<%=mLink[0][4][0]%>" target="_blank"><%=mTitle[0][4][0]%></a></li>

<!--로그인 회원가입-->
						<% if(loginVO == null) { %>
						<li class="d4 mbtn"><a href="<c:url value='/'/><%=mLink[11][1][0]%>"><%=mTitle[11][1][0]%></a></li>
						<li class="d5 mbtn"><a href="<c:url value='/'/><%=mLink[11][2][0]%>"><%=mTitle[11][2][0]%></a></li>
<!--로그인 회원가입 end-->

<!--마이페이지 로그아웃-->
						<% } else {  %>
						<% if(loginVO.getUs_gbn().equals("3")) {  %>
							<li class="dmtor mbtn pc_ver"><a href="<c:url value='/'/><%=mLink[11][7][0]%>"><%=mTitle[11][7][0]%></a></li>
						<% }  %>
						<li class="d6 mbtn"><a href="<c:url value='/'/><%=mLink[11][4][0]%>"><%=mTitle[11][4][0]%></a></li>
						<li class="d7 mbtn"><a href="<c:url value='/'/><%=mLink[11][6][0]%>"><%=mTitle[11][6][0]%></a></li>
						<% } %>
<!--마이페이지 로그아웃 end-->
					</ul>
					<div class="close">
						<span></span>
					</div>
				</div>
			</div>
		</div>


		<div id="hs2">
			<div class="d_container">
				<div id="d_lnb_btn">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
				</div>
				<h1><a href="<c:url value='/'/>"><img src="<c:url value='/img/logo.png'/>" alt="경남관광기업지원센터" /></a></h1>
				<div id="d_lnb">
					<div id="d_lnb_bg">
						<div class="d_container">
						</div>
						<div class="shadow">
						</div>
					</div>
					<ul>


						<li class="d1"><a href="<c:url value='/'/><%=mLink[1][0][0]%>" class="flip"><%=mTitle[1][0][0]%> <i></i></a>
							<div class="sub">
								<dl>
									<dd><a href="<c:url value='/'/><%=mLink[1][1][0]%>"><%=mTitle[1][1][0]%></a></dd>
									<dd><a href="<c:url value='/'/><%=mLink[1][2][0]%>"><%=mTitle[1][2][0]%></a></dd>
									<dd><a href="<c:url value='/'/><%=mLink[1][3][0]%>"><%=mTitle[1][3][0]%></a></dd>
									<dd><a href="<c:url value='/'/><%=mLink[1][4][0]%>"><%=mTitle[1][4][0]%></a></dd>

								</dl>
							</div>
						</li>
						<li class="d2"><a href="<c:url value='/'/><%=mLink[2][0][0]%>" class="flip"><%=mTitle[2][0][0]%> <i></i></a>
							<div class="sub">
								<dl>
									<dd><a href="<c:url value='/'/><%=mLink[2][1][0]%>"><%=mTitle[2][1][0]%></a></dd>
									<!--<dd><a href="<c:url value='/'/><%=mLink[2][2][0]%>"><%=mTitle[2][2][0]%></a></dd>-->
									<dd><a href="<c:url value='/'/><%=mLink[2][3][0]%>"><%=mTitle[2][3][0]%></a></dd>
									<!--<dd><a href="<c:url value='/'/><%=mLink[2][4][0]%>"><%=mTitle[2][4][0]%></a></dd>-->
									<dd><a href="<c:url value='/'/><%=mLink[2][5][0]%>"><%=mTitle[2][5][0]%></a></dd>

								</dl>
							</div>
						</li>
						<li class="d3"><a href="<c:url value='/'/><%=mLink[3][0][0]%>" class="flip"><%=mTitle[3][0][0]%> <i></i></a>
							<div class="sub">
								<dl>
									<dd><a href="<c:url value='/'/><%=mLink[3][1][0]%>"><%=mTitle[3][1][0]%></a></dd>
									<dd><a href="<c:url value='/'/><%=mLink[3][2][0]%>"><%=mTitle[3][2][0]%></a></dd>
									<dd><a href="<c:url value='/'/><%=mLink[3][3][0]%>"><%=mTitle[3][3][0]%></a></dd>
								</dl>
							</div>
						</li>
						<li class="d4"><a href="<c:url value='/'/><%=mLink[4][0][0]%>" class="flip"><%=mTitle[4][0][0]%> <i></i></a>
							<div class="sub">
								<dl>
									<dd><a href="<c:url value='/'/><%=mLink[4][1][0]%>"><%=mTitle[4][1][0]%></a></dd>
									<dd><a href="<c:url value='/'/><%=mLink[4][2][0]%>"><%=mTitle[4][2][0]%></a></dd>
									<dd><a href="<c:url value='/'/><%=mLink[4][3][0]%>"><%=mTitle[4][3][0]%></a></dd>
								</dl>
							</div>
						</li>
						<li class="d5"><a href="<c:url value='/'/><%=mLink[5][0][0]%>" class="flip"><%=mTitle[5][0][0]%> <i></i></a>
							<div class="sub">
								<dl>
									<dd><a href="<c:url value='/'/><%=mLink[5][1][0]%>"><%=mTitle[5][1][0]%></a></dd>
									<dd><a href="<c:url value='/'/><%=mLink[5][5][0]%>"><%=mTitle[5][5][0]%></a></dd>
									<dd><a href="<c:url value='/'/><%=mLink[5][2][0]%>"><%=mTitle[5][2][0]%></a></dd>
									<dd><a href="<c:url value='/'/><%=mLink[5][3][0]%>"><%=mTitle[5][3][0]%></a></dd>
									<dd><a href="<c:url value='/'/><%=mLink[5][4][0]%>"><%=mTitle[5][4][0]%></a></dd>
									<dd><a target="_blank" class="ic_link" href="<%=mLink[5][6][0]%>"><%=mTitle[5][6][0]%></a></dd>
								</dl>
							</div>
						</li>
						<% if( (loginVO != null) && (loginVO.getUs_gbn().equals("3")) ) {  %>
						<li class="d6 mo_ver mentor_i">
							<a href="<c:url value='/'/><%=mLink[11][7][0]%>" class="mo_ver mentor_i"><%=mTitle[11][7][0]%> </a>
						</li>
						<% } %>





						<li class="tail">
							<!--<a class="litebox g1" href="#ready"><img src="<c:url value='/img/ic_facebook.png'/>" alt="페이스북"/></a-->
							<a class="g2" href="<%=mLink[0][2][0]%>" target="_blank"><img src="<c:url value='/img/ic_insta.png'/>" alt="인스타그램"/></a>
							<a class="g3" href="<%=mLink[0][3][0]%>" target="_blank"><img src="<c:url value='/img/ic_blog.png'/>" alt="블로그"/></a>
							<a class="g4" href="<%=mLink[0][4][0]%>" target="_blank"><img src="<c:url value='/img/ic_youtube.png'/>" alt="유튜브"/></a>
								
						</li>		
					</ul>
				</div>
			
			</div>
			<div id="d_lnb_mask">
			</div>
		</div>
		
		<script type="text/javascript">
			function mentor_center() {
				location.href = "${pageContext.request.contextPath}/member/mentor_list.do";
			}
		</script>
		
		
	</div>

