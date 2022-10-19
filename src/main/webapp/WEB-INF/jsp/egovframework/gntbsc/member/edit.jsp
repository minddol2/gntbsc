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
int m2 = 4;
int m3 = 2;
%>

<jsp:include page="/WEB-INF/jsp/egovframework/gntbsc/inc/top.jsp" flush="true" >
	<jsp:param name="is_main" value="<%=is_main%>"/>
</jsp:include>

<jsp:include page="/WEB-INF/jsp/egovframework/gntbsc/inc/sub_top.jsp" flush="true" >
		<jsp:param name="m1" value="<%=m1%>"/>
		<jsp:param name="m2" value="<%=m2%>"/>
		<jsp:param name="m3" value="<%=m3%>"/>
</jsp:include>

<jsp:include page="/WEB-INF/jsp/egovframework/gntbsc/member/tablist.jsp" flush="true" >
		<jsp:param name="m1" value="<%=m1%>"/>
		<jsp:param name="m2" value="<%=m2%>"/>
		<jsp:param name="m3" value="<%=m3%>"/>
</jsp:include>


<!--회원가입 양식-->
<script type="text/javascript" src="<c:url value='/js/pg_script.js'/>"></script>  
<script type="text/javaScript" language="javascript">
var pwCheckx = /^(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9])(?=.*[0-9]).{8,16}$/;

function pwcheck() {
	var pwd = $('[name="us_pw"]').val();
	
	
	if(pwd.length<8 || pwd.length>20) {
		$("#pw_txt").html("비밀번호는 8자이상 20자 이하로 설정해 주세요.");
		$("#pw_check").val("N");
		$("#us_pw").focus();
		return false;
	} else if(!pwCheckx.test(pwd)) {
		$("#pw_txt").html("비밀번호는 영문,숫자,특수문자의 조합으로 입력해주세요.");
		$("#pw_check").val("N");
		$("#us_pw").focus();
		return false;
	} else {
		$("#pw_txt").html("사용가능한 비밀번호입니다.");
		$("#pw_check").val("Y");
		return false;
	}

}

function pwcheck2() {
	var pwd = $("#us_pw").val();
	var m_pwd = $("#us_pwd").val();

	if(pwd != m_pwd) {
		$("#pw_txt2").html("비밀번호가 일치하지않습니다.");
		$("#pw_check2").val("N");
		$("#us_pwd").focus();
		return false;
	} else {
		$("#pw_txt2").html("비밀번호가 일치합니다.");
		$("#pw_check2").val("Y");
		return false;
	}

}

function update_prc() {
	if(validateCheck()){
		
		if(validateCheck() == false){
			alert("입력 항목을 확인해 주세요.");
            return;
		}
		
		if(confirm("수정 하시겠습니까?")) {
			$("#sfrm").submit();	
		}
	} 
	
}

function validateCheck(){
	var passwd =  $('[name="us_pw"]').val();
	var hpNo =  $('[name="us_phone"]').val();
	
	var numCheck = /^[0-9]*$/;
	var emailCheck = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;;
		
	if($('[name="us_name"]').val() == ''){
		alert("이름을 입력해 주세요.");
		$('[name="us_name"]').focus();
		return false;
	}	
   	if($('[name="us_phone"]').val() == ''){
   		alert("휴대폰번호를 확인해 주세요.");
		return false;
   	}
	if($('[name="us_email"]').val() == ''){
		alert("이메일을 입력해 주세요.");
		$('[name="us_email"]').focus();
		return false;
	}
	if(!emailCheck.test($('[name="us_email"]').val())){
		alert("이메일을 입력해 주세요.");
		$('[name="us_email"]').focus();
		return;
	}
	if(passwd != "") {
		if($('[name="pw_check"]').val() != 'Y'){
			alert("비밀번호를 확인해 주세요.");
			return false;
		}	

		if($('[name="pw_check2"]').val() != 'Y'){
			alert("비밀번호를 확인해 주세요.");
			return false;
		}	
		
		if($('[name="us_pw"]').val() == '' ){
			$("#pw_txt").html("비밀번호를 입력해 주세요.");
			$('[name="us_pw"]').focus();
			return false;
		}
			
		if($('[name="us_pwd"]').val() == ''){
			$("#pw_txt").html("비밀번호를 입력해 주세요.");
			$('[name="us_pwd"]').focus();
			return false;
		}
			
		if($('[name="us_pw"]').val() != $('[name="us_pwd"]').val()){
			$("#pw_txt2").html("비밀번호를 확인해 주세요.");
			$('[name="us_pwd"]').focus();
			return false;
		}
	    	
	   	if((passwd.length < 8) || (passwd.length > 20)){
			$("#pw_txt").html("비밀번호는 영문,숫자,특수문자의 조합으로 입력해주세요.");
			return false;
	   	}
	    	
	   	if(!pwCheckx.test(passwd)){
			$("#pw_txt").html("비밀번호는 영문,숫자,특수문자의 조합으로 입력해주세요.");
			return false;
	   	}
	}

	return true;
}
</script>


	
<form name="sfrm" id="sfrm" action="${pageContext.request.contextPath}/member/edit_Updt.do"  method="post" >
<input name="pw_check" id="pw_check" type="hidden" value="N" />
<input name="pw_check2" id="pw_check2" type="hidden" value="N" />
<input name="us_gbn" id="us_gbn" type="hidden" value="<c:out value='${memvo.us_gbn}'/>" />

	<div class="form_box join_form">
		<ul class="mb20">							
			<li><span class="fm_list">이름 <b class="redTxt">*</b></span>
				<span class="fm_txt"><label for="us_name" class="blind">이름</label>
				<input type="text" name="us_name" class="input_txt" id="us_name" hname="Name" value="<c:out value='${memvo.us_name}'/>" frequired="required"/></span>
			</li>
		
			<li><span class="fm_list">아이디 <b class="redTxt">*</b></span>
				<span class="fm_txt"><label for="" class="blind">아이디</label>
				<c:out value='${memvo.us_id}'/>
				</span>
			</li>
			<li><span class="fm_list">비밀번호 <b class="redTxt">*</b></span>
				<span class="fm_txt"><label for="us_pw" class="blind">비밀번호</label>
				<input type="password" class="input_txt mid_input"  id="us_pw" name="us_pw" hname="us_pw" value="" onKeyUp="pwcheck();" />
				<span class="textin redTxt" id="pw_txt"><!--비밀번호가 맞지 않습니다.--></span>
				</span>
			</li>
			<li><span class="fm_list">비밀번호 확인<b class="redTxt">*</b></span>
				<span class="fm_txt"><label for="us_pwd" class="blind">비밀번호 확인</label>
				<input type="password" class="input_txt mid_input"  id="us_pwd" name="us_pwd" hname="us_pwd" value="" onKeyUp="pwcheck2();" />
				<span class="textin redTxt" id="pw_txt2"><!--비밀번호가 맞지 않습니다.--></span>
				</span>
			</li>
			<li><span class="fm_list">연락처 <b class="redTxt">*</b></span>
				 <span class="fm_txt"><label for="us_phone" class="blind">아이디</label>
				 <input type="text" name="us_phone" class="input_txt" id="us_phone" hname="us_phone" value="<c:out value='${memvo.us_phone}'/>" onfocus="autoHypenPhone(this);" onkeyup="autoHypenPhone(this);" />
				</span>
			</li>			
		
			<li><span class="fm_list">이메일 <b class="redTxt">*</b></span>
				<span class="fm_txt"><label for="us_email" class="blind">Email</label>
				<input type="text" name="us_email" class="input_txt mid_input" id="us_email" hname="us_email" value="<c:out value='${memvo.us_email}'/>" /></span>
			</li>	
		</ul>		
		<div class="agree_check mb20">
			<input type="checkbox" name="us_smschk" id="us_smschk" value="Y" <c:if test="${memvo.us_smschk eq 'Y'}">checked</c:if> />
			<label for="us_smschk">SMS 수신동의 [선택]</label>
		</div>
		<div class="agree_check mb20">
			<input type="checkbox" name="us_mailchk" id="us_mailchk" value="Y" <c:if test="${memvo.us_mailchk eq 'Y'}">checked</c:if> />
			<label for="us_mailchk">이메일 수신동의 [선택]</label>
		</div>
	</div>

	<p class="redTxt bmb">회의실 대관 예약 안내 등 승인/반려 문자는 SMS 수신 동의를 하신분들에게만 전송됩니다. </p>

	<div class="btn_li tac mb">
		<ul>
			<li><button type="button" class="btn_link" onclick="update_prc();">회원정보수정</button></li>
			<li><a class="btn_link btn_gr" href="<c:url value='/'/>">취소</a></li>
		</ul>
	</div>
</form>



<!-- 회원가입 양식 end-->

			</div><!--con-->
		</div><!--subcon-->
	</div><!--subwrap-->





<%@ include file="/WEB-INF/jsp/egovframework/gntbsc/inc/footer.jsp" %>