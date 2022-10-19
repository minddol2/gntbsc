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
int us_level = loginVO.getUs_level();
%>
<%@ include file="/WEB-INF/jsp/egovframework/gntbsc/wssms/menu_link.jsp" %>
<script type="text/javascript">

$(document).ready(function () {	
	$('.toggle-view .pop_btn').click(function () {
		var text = $('.toggle-view').children('.popzon');
		if (text.is(':hidden')) {
			text.slideDown('');
			$('.pop_btn').children('span').html('close');		
		} else {
			text.slideUp('');
			$('.pop_btn').children('span').html('open');		
		}		
	});
});

</script>

<div class="leftcon toggle-view"><!--메인레프트-->

	<div class="login_info popzon">
		<p class="tit"><%=loginVO.getUs_id()%></p>
		<p class="name"><%=loginVO.getUs_name()%>님, 어서오세요!</p>
		<p class="time"></p>
		<ul class="btn_li">
			<li><a href="<c:url value='/wssms/actionLogout.do'/>">로그아웃</a></li>
		</ul>
	
	</div>

	<nav id="sidemenu">
		<div class="pop_btn">
			<h2><%=mTitle[m1][0][0]%><span class="closs">open</span></h2>
		</div>
		<ul class="submenu">
		<%if( m1==0){%>
			

		<%} else if( m1==1){%>


			<% if(us_level <= 2) { %><li class="smenu"><a href="<c:url value='/'/><%=mLink[1][1][0]%>" <% if(m2==1) { out.println("class='on'"); } %>><%=mTitle[1][1][0]%></a></li><% } %>


		<%} else if( m1==2){%>

			<% if(us_level <= 2) { %>
				<li class="smenu"><a href="<c:url value='/'/><%=mLink[2][1][0]%>" <% if(m2==1) { out.println("class='on'"); } %>><%=mTitle[2][1][0]%></a></li>
				<li class="smenu"><a href="<c:url value='/'/><%=mLink[2][7][0]%>" <% if(m2==7) { out.println("class='on'"); } %>><%=mTitle[2][7][0]%></a></li>
				<li class="smenu"><a href="<c:url value='/'/><%=mLink[2][2][0]%>" <% if(m2==2) { out.println("class='on'"); } %>><%=mTitle[2][2][0]%></a></li>
				<li class="smenu"><a href="<c:url value='/'/><%=mLink[2][10][0]%>" <% if(m2==10) { out.println("class='on'"); } %>><%=mTitle[2][10][0]%></a></li>
				<li class="smenu"><a href="<c:url value='/'/><%=mLink[2][3][0]%>" <% if(m2==3) { out.println("class='on'"); } %>><%=mTitle[2][3][0]%></a></li>
				<li class="smenu"><a href="<c:url value='/'/><%=mLink[2][4][0]%>" <% if(m2==4) { out.println("class='on'"); } %>><%=mTitle[2][4][0]%></a></li>
				<li class="smenu"><a href="<c:url value='/'/><%=mLink[2][9][0]%>" <% if(m2==9) { out.println("class='on'"); } %>><%=mTitle[2][9][0]%></a></li>
				<li class="smenu"><a href="<c:url value='/'/><%=mLink[2][5][0]%>" <% if(m2==5) { out.println("class='on'"); } %>><%=mTitle[2][5][0]%></a></li>
				<li class="smenu"><a href="<c:url value='/'/><%=mLink[2][8][0]%>" <% if(m2==8) { out.println("class='on'"); } %>><%=mTitle[2][8][0]%></a></li>
				<li class="smenu"><a href="<c:url value='/'/><%=mLink[2][6][0]%>" <% if(m2==6) { out.println("class='on'"); } %>><%=mTitle[2][6][0]%></a></li>
			<% } %> 

		<%} else if( m1==3){%>

			<% if(us_level <= 2) { %>
				<li class="smenu"><a href="<c:url value='/'/><%=mLink[3][1][0]%>" <% if(m2==1) { out.println("class='on'"); } %>><%=mTitle[3][1][0]%></a></li>
				<li class="smenu"><a href="<c:url value='/'/><%=mLink[3][9][0]%>" <% if(m2==9) { out.println("class='on'"); } %>><%=mTitle[3][9][0]%></a></li>
				<li class="smenu"><a href="<c:url value='/'/><%=mLink[3][2][0]%>" <% if(m2==2) { out.println("class='on'"); } %>><%=mTitle[3][2][0]%></a></li>
				<li class="smenu"><a href="<c:url value='/'/><%=mLink[3][3][0]%>" <% if(m2==3) { out.println("class='on'"); } %>><%=mTitle[3][3][0]%></a></li>
				<li class="smenu"><a href="<c:url value='/'/><%=mLink[3][4][0]%>" <% if(m2==4) { out.println("class='on'"); } %>><%=mTitle[3][4][0]%></a></li>
				<li class="smenu"><a href="<c:url value='/'/><%=mLink[3][5][0]%>" <% if(m2==5) { out.println("class='on'"); } %>><%=mTitle[3][5][0]%></a></li>
				<li class="smenu"><a href="<c:url value='/'/><%=mLink[3][6][0]%>" <% if(m2==6) { out.println("class='on'"); } %>><%=mTitle[3][6][0]%></a></li>
				<li class="smenu"><a href="<c:url value='/'/><%=mLink[3][7][0]%>" <% if(m2==7) { out.println("class='on'"); } %>><%=mTitle[3][7][0]%></a></li>
				<li class="smenu"><a href="<c:url value='/'/><%=mLink[3][8][0]%>" <% if(m2==8) { out.println("class='on'"); } %>><%=mTitle[3][8][0]%></a></li>
			<% } %> 
			
		<%} else if( m1==4){%>

			<% if(us_level <= 2) { %><li class="smenu"><a href="<c:url value='/'/><%=mLink[4][1][0]%>" <% if(m2==1) { out.println("class='on'"); } %>><%=mTitle[4][1][0]%></a></li><% } %>
			<% if(us_level <= 2) { %><li class="smenu"><a href="<c:url value='/'/><%=mLink[4][2][0]%>" <% if(m2==2) { out.println("class='on'"); } %>><%=mTitle[4][2][0]%></a></li><% } %>
			<% if(us_level <= 2) { %><li class="smenu"><a href="<c:url value='/'/><%=mLink[4][3][0]%>" <% if(m2==3) { out.println("class='on'"); } %>><%=mTitle[4][3][0]%></a></li><% } %>
			<% if(us_level <= 2) { %><li class="smenu"><a href="<c:url value='/'/><%=mLink[4][4][0]%>" <% if(m2==4) { out.println("class='on'"); } %>><%=mTitle[4][4][0]%></a></li><% } %>

		<%} else if( m1==5){%>

			<% if(us_level <= 2) { %><li class="smenu"><a href="<c:url value='/'/><%=mLink[5][1][0]%>" <% if(m2==1) { out.println("class='on'"); } %>><%=mTitle[5][1][0]%></a></li><% } %>
			<% if(us_level <= 2) { %><li class="smenu"><a href="<c:url value='/'/><%=mLink[5][2][0]%>" <% if(m2==2) { out.println("class='on'"); } %>><%=mTitle[5][2][0]%></a></li><% } %>
			<% if(us_level <= 2) { %><li class="smenu"><a href="<c:url value='/'/><%=mLink[5][3][0]%>" <% if(m2==3) { out.println("class='on'"); } %>><%=mTitle[5][3][0]%></a></li><% } %>

		<%} else if( m1==6){%>

			<% if(us_level <= 2) { %><li class="smenu"><a href="<c:url value='/'/><%=mLink[6][1][0]%>" <% if(m2==1) { out.println("class='on'"); } %>><%=mTitle[6][1][0]%></a></li><% } %>
			<% if(us_level <= 2) { %><li class="smenu"><a href="<c:url value='/'/><%=mLink[6][2][0]%>" <% if(m2==2) { out.println("class='on'"); } %>><%=mTitle[6][2][0]%></a></li><% } %>

		<%}%>
		
		</ul>

    </nav>

<script>
//서브 left_menu
$(document).ready(function(){		
	$(".msub").click(function(){		
		var tg = $(this).siblings(".sub");		
		var dis = tg.css("display");		
		if(dis == "block"){
			$(this).removeClass("on");
			tg.slideUp(300);
		}		
		if(dis == "none"){
			$(".msub").removeClass("on");
			$(this).addClass("on");
			$(".sub").slideUp(300);
			tg.slideDown(300);
		}
		return false;
	});
});
</script>

</div>