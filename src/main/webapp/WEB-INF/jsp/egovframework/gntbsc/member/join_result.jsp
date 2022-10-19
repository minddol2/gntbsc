<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
String lang_mode = (String) request.getAttribute("lang_temp");

String is_main = "";
int m1 = 11;
int m2 = 2;
int m3 = 3;
%>

<jsp:include page="/WEB-INF/jsp/egovframework/gntbsc/inc/top.jsp" flush="true" >
	<jsp:param name="is_main" value="<%=is_main%>"/>
</jsp:include>

<jsp:include page="/WEB-INF/jsp/egovframework/gntbsc/inc/sub_top.jsp" flush="true" >
		<jsp:param name="m1" value="<%=m1%>"/>
		<jsp:param name="m2" value="<%=m2%>"/>
		<jsp:param name="m3" value="<%=m3%>"/>
</jsp:include>

<!--회원가입완료-->
<script type="text/javascript">
$(document).ready(function(){	
	var resultMsg = '${resultMsg}';
	
	if(resultMsg != "") {
		alert(resultMsg);
	}
	
	fnInit();
});

function do_login() {
    if (document.loginForm.m_id.value =="") {
        alert('아이디를 입력해 주세요.');
        return false;
    } 
    if (document.loginForm.m_pw.value =="") {
        alert('비밀번호를 입력해 주세요.');
        return false;
    } 
    document.loginForm.action="<c:url value='/member/actionLogin.do'/>";
    return true;
    
}

function fnInit() {
    getid(document.loginForm);
}
</script>

	<div class="joinstep bmb">
		<ul class="list03">
			<li><span class="st">Step <em>01</em></span><span class="txt">약관동의</span></li>
			<li><span class="st">Step <em>02</em></span><span class="txt">회원정보입력</span></li>
			<li class="on"><span class="st">Step <em>03</em></span><span class="txt">회원가입완료</span></li>
		</ul>
	</div>


	<div class="txt_top mb">
		<h3 class="mb10">회원가입이 <span class="mEnter">완료되었습니다.</span></h3>
		<p>정보 보안을 위해 <span class="mEnter">다시 한번 로그인 해주세요.</span></p>
	</div>

	<div class="mem_login bmb">
		<div class="login_box result_join">
			<form action="<c:url value='/member/actionLogin.do'/>" method="post" id="contentForm" name="loginForm" onsubmit="return do_login();">
				<fieldset>
					<legend>로그인하기</legend>
					<div class="login_form">
						<ul>
							<li><label for="m_id">아이디</label> <input id="m_id" name="m_id" type="text" class="input_txt" placeholder="아이디" title="" /></li>
							<li><label for="m_pw">비밀번호</label> <input id="m_pw" name="m_pw" type="password" class="input_txt" placeholder="비밀번호" title="비밀번호 입력" /></li>
						</ul>                            
						
						<button type="submit" class="btn btn-login">로그인</button>
					</div>
				</fieldset>
			</form>			
		</div>	
	</div>

<!--회원가입완료 end-->


			</div><!--con-->
		</div><!--subcon-->
	</div><!--subwrap-->





<%@ include file="/WEB-INF/jsp/egovframework/gntbsc/inc/footer.jsp" %>