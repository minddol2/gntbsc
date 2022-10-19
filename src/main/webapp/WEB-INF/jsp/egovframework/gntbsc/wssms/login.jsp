<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
String bodyckey = "true";
%>

<jsp:include page="/WEB-INF/jsp/egovframework/gntbsc/wssms/top.jsp" flush="true" >
		<jsp:param name="bodyckey" value="<%=bodyckey%>"/>
</jsp:include>

<div class="loginWrap">
	<div class="logobox">
		<h1><img src="<c:url value='/img/logo_w.png'/>" alt="경남관광기업지원센터"/></h1>
	</div>
	<div class="login">
		<h3>로그인이 필요합니다.</h3>

		<form name="loginForm" id="loginForm" action="<c:url value='/wssms/actionLogin.do'/>" method="post" onsubmit="return actionLogin();">
		<ul class="input_txt">
			
			<li><label for="m_id">아이디</label>
			<input type="text" name="us_id" id="us_id" hname="이름" value="" option="idpass" maxlength="25" placeholder="아이디를 입력해주세요." frequired="required" /></li>
			<li><label for="m_pw">패스워드</label>
			<input type="password" name="us_pw" id="us_pw" hname="비밀번호" placeholder="비밀번호를 입력해주세요." frequired="required" value="" />
			</li>
		</ul>
		<input type="submit" class="btn_sumit btn_sumit3 mb10" value="로그인"/>
		</form>

	</div>		
</div>

<script type="text/javaScript" language="javascript">
$(document).ready(function(){	
	var resultMsg = '${resultMsg}';
	
	if(resultMsg != "") {
		alert(resultMsg);
	}
	
	fnInit();
});

function actionLogin() {

    if (document.loginForm.us_id.value =="") {
        alert('아이디를 입력해 주세요.');
        return false;
    } 
    
    if (document.loginForm.us_pw.value =="") {
        alert('비밀번호를 입력해 주세요.');
        return false;
    } 
    
    document.loginForm.action="<c:url value='/wssms/actionLogin.do'/>";
    return true;
    
}

function fnInit() {

    getid(document.loginForm);
    // 포커스
    //document.loginForm.rdoSlctUsr.focus();
}

</script>

<p class="log_foot">Copyright ⓒ <b>2020 경남관광기업지원센터. All rights reserved.</p>


</div><!--wrap-->