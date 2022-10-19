<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
String lang_mode = (String) request.getAttribute("lang_temp");

String mem_gbn = (String) request.getAttribute("mem_gbn");

String is_main = "";
int m1 = 11;
int m2 = 2;
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

<!--회원가입-->
<script type="text/javaScript">
$(document).ready(function(){	
	var resultMsg = '${resultMsg}';
	
	if(resultMsg != "") {
		alert(resultMsg);
	}
	
});

function check_join1() {
	var frm = document.forms.actFrm;
	   
	if($("input:checkbox[id='check01']").is(":checked") == false) {
		alert("서비스 이용약관에 동의해 주세요.");
		return;
	}
	if($("input:checkbox[id='check02']").is(":checked") == false) {
		alert("개인 보호 수집에 동의해 주세요.");
		return;
	}
	   
	frm.submit();
}
</script>


	<div class="joinstep mb">
		<ul class="list03">
			<li class="on"><span class="st">Step <em>01</em></span><span class="txt">약관동의</span></li>
			<li><span class="st">Step <em>02</em></span><span class="txt">회원정보입력</span></li>
			<li><span class="st">Step <em>03</em></span><span class="txt">회원가입완료</span></li>
		</ul>
	</div>


	<h3 class="tit_line">회원가입</h3>

<form id="actFrm" name="actFrm" method="post" action="<c:url value='/member/joinFrm.do'/>">
<input type="hidden" name="mem_gbn" id="mem_gbn" value="<%=mem_gbn%>" />

	<h4 class="tit_nm mb20">서비스이용약관</h4>
	<div class="agreebox">
		<%@ include file="/WEB-INF/jsp/egovframework/gntbsc/inc/terms.jsp" %>
	</div>
	<div class="agree_check mb">
		<input type="checkbox" name="privacy_agree" id="check01" />
		<label for="check01">약관을 읽었으며 이에 동의합니다.</label>
	</div>


	<h4 class="tit_nm mb20">개인정보수집·이용동의</h4>
	<div class="agreebox">
	

		<%@ include file="/WEB-INF/jsp/egovframework/gntbsc/inc/privacy.jsp" %>
	</div>
	<div class="agree_check mb">
		<input type="checkbox" name="privacy_agree2" id="check02" />
		<label for="check02">약관을 읽었으며 이에 동의합니다.</label>
	</div>


	<div class="btn_li tac mb">
		<button type="button" class="btn_link" onclick="check_join1();">회원가입</button>
	</div>
	
</form>

<!--회원가입 end-->

			</div><!--con-->
		</div><!--subcon-->
	</div><!--subwrap-->





<%@ include file="/WEB-INF/jsp/egovframework/gntbsc/inc/footer.jsp" %>