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
int m3 = 2;

String us_gbn = (String) request.getAttribute("us_gbn");
%>

<jsp:include page="/WEB-INF/jsp/egovframework/gntbsc/inc/top.jsp" flush="true" >
	<jsp:param name="is_main" value="<%=is_main%>"/>
</jsp:include>

<jsp:include page="/WEB-INF/jsp/egovframework/gntbsc/inc/sub_top.jsp" flush="true" >
		<jsp:param name="m1" value="<%=m1%>"/>
		<jsp:param name="m2" value="<%=m2%>"/>
		<jsp:param name="m3" value="<%=m3%>"/>
</jsp:include>

<!--회원가입 양식-->
<script type="text/javascript" src="<c:url value='/js/pg_script.js'/>"></script>  
<script type="text/javaScript" language="javascript">
var pwCheckx = /^(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9])(?=.*[0-9]).{8,16}$/;

function idDupChk(){
	var userId =  $('[name="us_id"]').val();
	var idCheck = /^[A-za-z0-9]{6,15}$/g;
	if(!idCheck.test(userId)){
		$("#id_txt").html("아이디는 영문 또는 숫자조합으로 6~15자 이내로 만들어 주세요.");
		$('[name="us_id"]').focus();
		return;
	}
	
	if(userId.substring(0,3) == "010"){
		$("#id_txt").html("아이디는 영문 또는 숫자조합으로 6~15자 이내로 만들어 주세요.");
		$('[name="us_id"]').focus();
		return;
	}
	$.ajax({
        url:"<c:url value='/mem/checkIdDupAjax.do'/>",
        data:{ "userId": userId},
        dataType:'json',
        type:'POST',
        success: function(response){
            //console.log(response);
        	if(response.resultMessage == 'N'){
				$('[name="id_check"]').val('N');
				$("#id_txt").html("사용할 수 없는 아이디 입니다.");
				return false;
			}else if(response.resultMessage == 'Y'){
				$('[name="id_check"]').val('Y');
				$("#id_txt").html("사용 가능한 아이디 입니다.");
			}else{
				$('[name="id_check"]').val('N');
				$("#id_txt").html("사용할 수 없는 아이디 입니다.");
				return false;
			}
            
        },
        error:function(data){
    		alert('err');   
       }
    });
	
}

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

function memjoin(){
	if(validateCheck()){
		
		if(validateCheck() == false){
			alert("입력 항목을 확인해 주세요.");
            return;
		}
		
		if(confirm("가입 하시겠습니까?")) {
			$("#actFrm").submit();	
		}
	} 
}

function validateCheck(){
	var userId =  $('[name="us_id"]').val();
	var passwd =  $('[name="us_pw"]').val();
	var hpNo =  $('[name="us_phone"]').val();
	var email =  $('[name="us_email"]').val();
	
	var idCheck = /^[A-za-z0-9]{6,15}$/g;
	var emailCheck = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;;

	if($('[name="us_name"]').val() == ''){
		alert("이름을 입력해 주세요.");
		$('[name="us_name"]').focus();
		return false;
	}	
	
	if(!idCheck.test(userId)){
		alert("아이디를 확인하세요.");
		$('[name="us_id"]').focus();
		return false;
	}
	
	if(userId.substring(0,3) == "010"){
		alert("아이디를 확인하세요.");
		$('[name="us_id"]').focus();
		return false;
	}
	$.ajax({
        url:"<c:url value='/mem/checkIdDupAjax.do'/>",
        data:{ "userId": userId},
        dataType:'json',
        type:'POST',
        success: function(response){
            //console.log(response);
        	if(response.resultMessage == 'N'){
				$('[name="id_check"]').val('N');
				return false;
			}else if(response.resultMessage == 'Y'){
				$('[name="id_check"]').val('Y');
			}else{
				$('[name="id_check"]').val('N');
				return false;
			}
            
        },
        error:function(data){
    		alert('err');  
    		//console.log(data);
       }
    });
		
	if($('[name="id_check"]').val() != 'Y'){
		alert("사용 불가능한 아이디 입니다.");
		return false;
	}	

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
	if($('[name="us_email"]').val() == ''){
		alert("이메일을 입력해 주세요.");
		$('[name="us_email"]').focus();
		return false;
	}
	
	return true;
}
</script>

	<div class="joinstep mb">
		<ul class="list03">
			<li><span class="st">Step <em>01</em></span><span class="txt">약관동의</span></li>
			<li class="on"><span class="st">Step <em>02</em></span><span class="txt">회원정보입력</span></li>
			<li><span class="st">Step <em>03</em></span><span class="txt">회원가입완료</span></li>
		</ul>
	</div>


	<h3 class="tit_line">회원가입</h3>
	
<form name="actFrm" id="actFrm" action="${pageContext.request.contextPath}/member/MemAddAction.do"  method="post" >
<input type="hidden" name="id_check" id="id_check" value="N" />
<input name="pw_check" id="pw_check" type="hidden" value="N" />
<input name="pw_check2" id="pw_check2" type="hidden" value="N" />
<input type="hidden" name="us_gbn" id="us_gbn" value="<%=us_gbn%>" />

	<div class="form_box join_form">
		<ul class="mb20">							
			<li><span class="fm_list">이름 <b class="redTxt">*</b></span>
				<span class="fm_txt"><label for="us_name" class="blind">이름</label>
				<input type="text" name="us_name" class="input_txt" id="us_name" hname="us_name" value="" frequired="required" /></span>
			</li>
		
			<li><span class="fm_list">아이디 <b class="redTxt">*</b></span>
				<span class="fm_txt"><label for="us_id" class="blind">아이디</label>
				<input type="text" class="input_txt"  id="us_id" name="us_id" hname="us_id" value="" onkeyUp="idDupChk();" />
				 <span class="textin redTxt" id="id_txt"><!--중복된 아이디입니다.--></span>
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
				 <input type="text" name="us_phone" class="input_txt" id="us_phone" hname="us_phone" value="" onfocus="autoHypenPhone(this);" onkeyup="autoHypenPhone(this);" />
				</span>
			</li>			
		
			<li><span class="fm_list">이메일 <b class="redTxt">*</b></span>
				<span class="fm_txt"><label for="us_email" class="blind">Email</label>
				<input type="text" name="us_email" class="input_txt mid_input" id="us_email" hname="us_email" value="" /></span>
			</li>	
		</ul>		
		<div class="agree_check mb20">
			<input type="checkbox" name="us_smschk" id="us_smschk" value="Y" checked />
			<label for="us_smschk">SMS 수신동의 [선택]</label>
		</div>
		<div class="agree_check mb20">
			<input type="checkbox" name="us_mailchk" id="us_mailchk" value="Y" checked />
			<label for="us_mailchk">이메일 수신동의 [선택]</label>
		</div>
		<div class="agree_check mb20">
			<input type="checkbox" name="us_workchk" id="us_workchk" value="Y" checked />
			<label for="us_workchk">일자리정보 수신동의 [선택]</label>
		</div>
	</div>

	<p class="redTxt bmb">회의실 대관 예약 안내 등 승인/반려 문자는 SMS 수신 동의를 하신분들에게만 전송됩니다. </p>

	<div class="btn_li tac mb">
		<button type="button" class="btn_link" onclick="memjoin();">다음단계</button>
	</div>
</form>


<!-- 회원가입 양식 end-->

			</div><!--con-->
		</div><!--subcon-->
	</div><!--subwrap-->





<%@ include file="/WEB-INF/jsp/egovframework/gntbsc/inc/footer.jsp" %>