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
int m2 = 5;
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

<!--회원정보수정-->
<script type="text/javascript">
function mem_without() {
	if($("input:checkbox[id='out']").is(":checked") == false) {
		alert("탈퇴약관에 동의해야 회원탈퇴가 가능합니다.");
		return;
	}
	
	if(confirm("탈퇴시 모든 정보가 복구 불가능함에 동의합니다. \n\n 회원 탈퇴 하시겠습니까?")) {
		location.replace("${pageContext.request.contextPath}/member/mem_Withdraw.do");
	}
}
</script>

<div class="ex_top mb">
	<h4 class="tit_nm mb20">홈페이지를 이용해주셔서 감사합니다.</h4>
	<ul class="dot_li mb20">
		<li>온라인회원 탈퇴 시 개인정보는 모두 DB에서 즉시 삭제처리되며, 재가입시 이용하시던 아이디는 다시 사용하실 수 없습니다.</li>
		<li>작성하신 작성한 게시물 등은 삭제되지 않으며, 탈퇴처리 후 자동으로 로그아웃 처리되오니 탈퇴하시기 전 작성하신 게시물은 직접 삭제해주시기 바랍니다.</li>
	</ul>	
</div>
<div class="agree_check mb20">
	<input type="checkbox" name="out" id="out">
	<label for="out">위 내용을 모두 확인하였으며, 탈퇴시 모든 정보가 복구 불가능함에 동의합니다.</label>
</div>

<div class="btn_li tac mb">
	<button type="button" class="btn_link" onclick="mem_without();">회원탈퇴</button>
</div>


<!--회원탈퇴 end-->


			</div><!--con-->
		</div><!--subcon-->
	</div><!--subwrap-->





<%@ include file="/WEB-INF/jsp/egovframework/gntbsc/inc/footer.jsp" %>