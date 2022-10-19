<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import ="egovframework.goncs.member.service.LoginVO" %>
<%
LoginVO loginVO = (LoginVO)session.getAttribute("loginVO"); 
String bodyckey = "false";
int us_level = loginVO.getUs_level();
%>

<jsp:include page="/WEB-INF/jsp/egovframework/gntbsc/wssms/top.jsp" flush="true" >
		<jsp:param name="bodyckey" value="<%=bodyckey%>"/>
</jsp:include>

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
				<li><a href="<c:url value='/wssms/actionLogout.do'/>" title="로그아웃">로그아웃</a></li>
				
			</ul>
			<!--
			<ul class="info_edit">
				<li><a href="#"></a></li>
				<li><a href="<c:url value='/wssms/actionLogout.do'/>" title="로그아웃">로그아웃</a></li>
			</ul>-->
		</div>

		<nav id="sidemenu">
			<div class="pop_btn">
				<h2>빠른메뉴바로가기 <span class="closs">open</span></h2>
			</div>

		</nav>


	</div><!--메인레프트-->


	<div class="main">
		<div class="main_top">
			<h3>경남관광기업지원센터  <br/> 관리시스템에 오신걸 환영합니다.</h3>
		</div>



	<script type="text/javascript">
		$(document).ready(function(){
				$("#tabsholder").tytabs({
										tabinit:"1",
										fadespeed:"fast"
								});
				$("#tabsholder2").tytabs({
							prefixtabs:"tabz",
							prefixcontent:"contentz",
							classcontent:"tabscontent",
							tabinit:"1",
							catchget:"tab2",
							fadespeed:"fast"
							});
					});
	</script>


<%@ include file="/WEB-INF/jsp/egovframework/gntbsc/wssms/footer.jsp" %>