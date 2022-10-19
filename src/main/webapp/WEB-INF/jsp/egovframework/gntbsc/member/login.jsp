<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
String lang_mode = (String) request.getAttribute("lang_temp");
String go_url = (String) request.getAttribute("go_url");

String is_main = "";
int m1 = 11;
int m2 = 1;
int m3 = 1;
%>

<jsp:include page="/WEB-INF/jsp/egovframework/gntbsc/inc/top.jsp" flush="true" >
	<jsp:param name="is_main" value="<%=is_main%>"/>
</jsp:include>

<jsp:include page="/WEB-INF/jsp/egovframework/gntbsc/inc/sub_top.jsp" flush="true" >
		<jsp:param name="m1" value="<%=m1%>"/>
		<jsp:param name="m2" value="<%=m2%>"/>
		<jsp:param name="m3" value="<%=m3%>"/>
</jsp:include>

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

<div class="txt_top mb">
	<h3 class="mb10">로그인이 필요한 <span class="mEnter">서비스입니다.</span></h3>
	<p>홈페이지의 다양한 정보와 맞춤 서비스를 <span class="mEnter">이용하시려면 회원가입을 진행해주세요.</span></p>
</div>

<div class="mem_login bmb">
	<div class="login_box">
		<form action="<c:url value='/member/actionLogin.do'/>" method="post" id="contentForm" name="loginForm" onsubmit="return do_login();">
		<input type="hidden" name="go_url" value="<%=go_url%>" />
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
		<ul class="log_lst">
			<li><a href="<c:url value='/member/search.do'/>">아이디/비밀번호 찾기</a></li>
		</ul>
	</div>		

	<div class="join_box">
		<div class="inner">
			<p>회원가입을 하시면 대관신청 및 일자리 상담 등<br/> 다양한 서비스를 이용할수 있습니다.</p>
			<a href="<c:url value='/member/join.do'/>" class="btn_join">회원가입</a>
		</div>
	</div>
</div>


			</div><!--con-->
		</div><!--subcon-->
	</div><!--subwrap-->





<%@ include file="/WEB-INF/jsp/egovframework/gntbsc/inc/footer.jsp" %>