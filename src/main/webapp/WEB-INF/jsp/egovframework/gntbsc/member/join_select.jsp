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

function join_select(aa) {
	$("#mem_gbn").val(aa);
	document.forms.selectFrm.submit();
}
</script>


<div class="txt_top mb">
	<h3 class="mb10">회원 유형 선택</h3>
	<p>회원별 맞춤 서비스를 위해 <span class="mEnter">회원가입 유형을 선택해주세요</span></p>
</div>

<div class="join_select mb">	
	<div class="box">
		<h4><img src="<c:url value='/img/ic_join01.png'/>" alt="개인"/><span>개인 회원</span></h4>
		<p>개인 회원으로<br/> 가입합니다.</p>
	
		<a href="#1" class="btn_sumit" onclick="join_select('1');">회원가입</a>			

	</div>

	<div class="box">
		<h4><img src="<c:url value='/img/ic_join02.png'/>" alt="기업"/><span>기업/예비창업자 회원</span></h4>
		<p>도내기업이나 예비창업자일 경우 <br/>기업회원으로 가입해주세요.</p>
	
		<a href="#2" class="btn_sumit" onclick="join_select('2');">회원가입</a>			

	</div>

	<div class="box">
		<h4><img src="<c:url value='/img/ic_join03.png'/>" alt="멘토"/><span>멘토 회원</span></h4>
		<p>멘토단으로 선정된 경우<br/> 멘토 회원으로 가입해주세요. </p>
	
		<a href="#3" class="btn_sumit" onclick="join_select('3');">회원가입</a>			

	</div>
</div>

<form id="selectFrm" name="selectFrm" method="post" action="<c:url value='/member/join_agree.do'/>">
	<input type="hidden" name="mem_gbn" id="mem_gbn" value="" />
</form>

<!--회원가입 end-->

			</div><!--con-->
		</div><!--subcon-->
	</div><!--subwrap-->





<%@ include file="/WEB-INF/jsp/egovframework/gntbsc/inc/footer.jsp" %>