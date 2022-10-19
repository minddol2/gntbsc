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
String us_gbn	 = "";
if(loginVO == null) {
	us_gbn	 = "";
} else {
	us_gbn	 = loginVO.getUs_gbn();
}
%>
<%@ include file="/WEB-INF/jsp/egovframework/gntbsc/inc/menu_link.jsp" %>

<div id="sidemenu">
	<h2><span>Tourism business<br/> Support Center</span><%=mTitle[m1][0][0]%></h2>
	<ul class="leftmenu snblist">
		<% if(m1==1) { %>

		<li><a class="<% if(m2==1) out.println("active"); %>" href="<c:url value='/'/><%=mLink[1][1][0]%>"><%=mTitle[1][1][0]%></a></li>
		<li><a class="<% if(m2==2) out.println("active"); %>" href="<c:url value='/'/><%=mLink[1][2][0]%>"><%=mTitle[1][2][0]%></a></li>
		<li><a class="<% if(m2==3) out.println("active"); %>" href="<c:url value='/'/><%=mLink[1][3][0]%>"><%=mTitle[1][3][0]%></a></li>
		<li><a class="<% if(m2==4) out.println("active"); %>" href="<c:url value='/'/><%=mLink[1][4][0]%>"><%=mTitle[1][4][0]%></a></li>	
	

		<%} else if( m1==2){%>

		<li><a class="<% if(m2==1) out.println("active"); %>" href="<c:url value='/'/><%=mLink[2][1][0]%>"><%=mTitle[2][1][0]%></a></li>
		<li>
			<a class="sub_li <% if(m2==3) out.println("active"); %>" href="#"><%=mTitle[2][3][0]%></a>
			<ul class="sub has_sub <% if(m2==3) out.println("on"); %>">
				<li <% if(m2==3 && m3==1) out.println("class='select'"); %> ><a href="<c:url value='/'/><%=mLink[2][3][1]%>"><%=mTitle[2][3][1]%></a></li>
				<li <% if(m2==3 && m3==2) out.println("class='select'"); %> ><a href="<c:url value='/'/><%=mLink[2][3][2]%>"><%=mTitle[2][3][2]%></a></li>
				<li <% if(m2==3 && m3==3) out.println("class='select'"); %> ><a href="<c:url value='/'/><%=mLink[2][3][3]%>"><%=mTitle[2][3][3]%></a></li>
				<li <% if(m2==3 && m3==4) out.println("class='select'"); %> ><a href="<c:url value='/'/><%=mLink[2][3][4]%>"><%=mTitle[2][3][4]%></a></li>
			</ul>	
		
		</li>
		<!--<li><a class="<% if(m2==4) out.println("active"); %>" href="<c:url value='/'/><%=mLink[2][4][0]%>"><%=mTitle[2][4][0]%></a></li>-->
		<li><a class="<% if(m2==5) out.println("active"); %>" href="<c:url value='/'/><%=mLink[2][5][0]%>"><%=mTitle[2][5][0]%></a></li>
	
		<%} else if( m1==3){%>

		<li><a class="<% if(m2==1) out.println("active"); %>" href="<c:url value='/'/><%=mLink[3][1][0]%>"><%=mTitle[3][1][0]%></a></li>
		<li><a class="<% if(m2==2) out.println("active"); %>" href="<c:url value='/'/><%=mLink[3][2][0]%>"><%=mTitle[3][2][0]%></a></li>

		<%} else if( m1==4){%>

		<li><a class="<% if(m2==1) out.println("active"); %>" href="<c:url value='/'/><%=mLink[4][1][0]%>"><%=mTitle[4][1][0]%></a></li>
		<li><a class="<% if(m2==2) out.println("active"); %>" href="<c:url value='/'/><%=mLink[4][2][0]%>"><%=mTitle[4][2][0]%></a></li>		
		<li><a class="<% if(m2==3) out.println("active"); %>" href="<c:url value='/'/><%=mLink[4][3][0]%>"><%=mTitle[4][3][0]%></a></li>

		<%} else if( m1==5){%>

		<li><a class="<% if(m2==1) out.println("active"); %>" href="<c:url value='/'/><%=mLink[5][1][0]%>"><%=mTitle[5][1][0]%></a></li>
		<li><a class="<% if(m2==5) out.println("active"); %>" href="<c:url value='/'/><%=mLink[5][5][0]%>"><%=mTitle[5][5][0]%></a></li>
		<li><a class="<% if(m2==2) out.println("active"); %>" href="<c:url value='/'/><%=mLink[5][2][0]%>"><%=mTitle[5][2][0]%></a></li>
		<li><a class="<% if(m2==3) out.println("active"); %>" href="<c:url value='/'/><%=mLink[5][3][0]%>"><%=mTitle[5][3][0]%></a></li>
		<li><a class="<% if(m2==4) out.println("active"); %>" href="<c:url value='/'/><%=mLink[5][4][0]%>"><%=mTitle[5][4][0]%></a></li>
		<li><a class="<% if(m2==6) out.println("active"); %>" href="<%=mLink[5][6][0]%>" target="_blank" class="ic_link"><%=mTitle[5][6][0]%></a></li>

		
		<%} else if( m1==10){%>

		<li><a class="<% if(m2==1) out.println("active"); %>" href="<c:url value='/'/><%=mLink[10][1][0]%>"><%=mTitle[10][1][0]%></a></li>
		<li><a class="<% if(m2==2) out.println("active"); %>" href="<c:url value='/'/><%=mLink[10][2][0]%>"><%=mTitle[10][2][0]%></a></li>
		<li><a class="<% if(m2==3) out.println("active"); %>" href="<c:url value='/'/><%=mLink[10][3][0]%>"><%=mTitle[10][3][0]%></a></li>
		
		<%} else if( m1==11){%>
		
		<% if(loginVO == null) { %>
			<li><a class="<% if(m2==1) out.println("active"); %>" href="<c:url value='/'/><%=mLink[11][1][0]%>"><%=mTitle[11][1][0]%></a></li>
			<li><a class="<% if(m2==2) out.println("active"); %>" href="<c:url value='/'/><%=mLink[11][2][0]%>"><%=mTitle[11][2][0]%></a></li>
			<li><a class="<% if(m2==3) out.println("active"); %>" href="<c:url value='/'/><%=mLink[11][3][0]%>"><%=mTitle[11][3][0]%></a></li>
		<% } else {  %>
			<li><a class="<% if(m2==6) out.println("active"); %>" href="<c:url value='/'/><%=mLink[11][6][0]%>"><%=mTitle[11][6][0]%></a></li>
			<li>
				<a class="sub_li <% if(m2==4) out.println("active"); %>" href="#"><%=mTitle[11][4][0]%></a>
				<ul class="sub has_sub <% if(m2==4) out.println("on"); %>">
					<li <% if(m2==4 && m3==1) out.println("class='select'"); %> ><a href="<c:url value='/'/><%=mLink[11][4][1]%>"><%=mTitle[11][4][1]%></a></li>
					<li <% if(m2==4 && m3==3) out.println("class='select'"); %> ><a href="<c:url value='/'/><%=mLink[11][4][3]%>"><%=mTitle[11][4][3]%></a></li>
					<li <% if(m2==4 && m3==2) out.println("class='select'"); %> ><a href="<c:url value='/'/><%=mLink[11][4][2]%>"><%=mTitle[11][4][2]%></a></li>
				</ul>	
			</li>
			<% if( (loginVO != null) && (us_gbn.equals("3")) ) { %>
			<li><a class="<% if(m2==7) out.println("active"); %>" href="<c:url value='/'/><%=mLink[11][7][0]%>"><%=mTitle[11][7][0]%></a></li>
			<% } %>
			<li><a class="<% if(m2==5) out.println("active"); %>" href="<c:url value='/'/><%=mLink[11][5][0]%>"><%=mTitle[11][5][0]%></a></li>
		<% } %>

		<% } %>
	</ul>
</div>


<script>
//left_menu
		$(document).ready(function(){		
			$(".sub_li").click(function(){		
				var tg = $(this).siblings(".sub");		
				var dis = tg.css("display");		
				if(dis == "block"){
					$(this).removeClass("on");
					tg.slideUp(300);
				}		
				if(dis == "none"){
					$(".sub_li").removeClass("on");
					$(this).addClass("on");
					$(".sub").slideUp(300);
					tg.slideDown(300);
				}
				return false;
			});
		});
</script>