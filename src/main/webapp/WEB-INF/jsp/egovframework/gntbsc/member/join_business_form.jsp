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

<div class="joinstep mb">
	<ul class="list03">
		<li><span class="st">Step <em>01</em></span><span class="txt">약관동의</span></li>
		<li class="on"><span class="st">Step <em>02</em></span><span class="txt">회원정보입력</span></li>
		<li><span class="st">Step <em>03</em></span><span class="txt">회원가입완료</span></li>
	</ul>
</div>

<h3 class="tit_line">기업/예비창업자 회원가입</h3>

<h4 class="tit_dot mb20">기본정보</h4>


<form name="actFrm" id="actFrm" action="${pageContext.request.contextPath}/member/MemAddAction.do"  method="post" >
<input type="hidden" name="id_check" id="id_check" value="N" />
<input name="pw_check" id="pw_check" type="hidden" value="N" />
<input name="pw_check2" id="pw_check2" type="hidden" value="N" />
<input type="hidden" name="us_gbn" id="us_gbn" value="<%=us_gbn%>" />
<input type="hidden" name="us_makeyear" id="us_makeyear" value="" />
<input type="hidden" name="us_addrxx" id="us_addrxx" value="" />

<div class="form_box join_form">
	<ul class="mb">							
		<li><span class="fm_list">이름 <b class="redTxt">*</b></span>
			<span class="fm_txt"><label for="us_name" class="blind">이름</label>
			<input type="text" name="us_name" class="input_txt" id="us_name" hname="us_name" value="" frequired="required"/></span>
		</li>
	
		<li><span class="fm_list">아이디 <b class="redTxt">*</b></span>
			<span class="fm_txt"><label for="us_id" class="blind">아이디</label>
			<input type="text" class="input_txt" id="us_id" name="us_id" hname="us_id" value="" onkeyup="idDupChk();"/>
			 <span class="textin redTxt" id="id_txt"><!--중복된 아이디입니다.--></span>
			</span>
		</li>
		<li><span class="fm_list">비밀번호 <b class="redTxt">*</b></span>
			<span class="fm_txt"><label for="us_pw" class="blind">비밀번호</label>
			<input type="password" class="input_txt mid_input" id="us_pw" name="us_pw" hname="us_pw" value="" onkeyup="pwcheck();"/>
			<span class="textin redTxt" id="pw_txt"><!--비밀번호가 맞지 않습니다.--></span>
			</span>
		</li>
		<li><span class="fm_list">비밀번호 확인<b class="redTxt">*</b></span>
			<span class="fm_txt"><label for="us_pwd" class="blind">비밀번호 확인</label>
			<input type="password" class="input_txt mid_input" id="us_pwd" name="us_pwd" hname="us_pwd" value="" onkeyup="pwcheck2();"/>
			<span class="textin redTxt" id="pw_txt2"><!--비밀번호가 맞지 않습니다.--></span>
			</span>
		</li>
		<li><span class="fm_list">연락처 <b class="redTxt">*</b></span>
			 <span class="fm_txt"><label for="us_phone" class="blind">아이디</label>
			 <input type="text" name="us_phone" class="input_txt" id="us_phone" hname="us_phone" value="" onfocus="autoHypenPhone(this);" onkeyup="autoHypenPhone(this);"/>
			</span>
		</li>			
	
		<li><span class="fm_list">이메일 <b class="redTxt">*</b></span>
			<span class="fm_txt"><label for="us_email" class="blind">Email</label>
			<input type="text" name="us_email" class="input_txt mid_input" id="us_email" hname="us_email" value=""/></span>
		</li>	
	</ul>

</div>
<h4 class="tit_dot mb20">추가정보</h4>
<div class="form_box join_form">
	<ul class="mb20">
		<li>
			<span class="fm_list">회원구분 <b class="redTxt">*</b></span>
			<span class="fm_txt btn_change">
				<label for="us_buss_gbn" class="blind">회원구분</label>
				<input type="radio" name="us_buss_gbn" class="op0" id="us_buss_gbn" value="1" onclick="change_buss_gbn('1');" checked /><label for="us_buss_gbn" class="radio_label">도내기업</label> 
				<input type="radio" name="us_buss_gbn" class="op0" id="us_buss_gbn2" value="2" onclick="change_buss_gbn('2');"  /><label for="us_buss_gbn2" class="radio_label">예비창업자</label> <!--예비창업자선택시 추가정보 입력필드 달라짐 -->
				<input type="radio" name="us_buss_gbn" class="op0" id="us_buss_gbn3" value="3" onclick="change_buss_gbn('3');"  /><label for="us_buss_gbn3" class="radio_label">입주기업</label> 
				
			</span>
		</li>
		<li>
			<span class="fm_list">기업명 <b class="redTxt">*</b></span>
			<span class="fm_txt"><label for="us_company" class="blind">기업명</label>
			<input type="text" name="us_company" class="input_txt" id="us_company" hname="" value="" frequired="required"/></span>
		</li>
		<li>
			<span class="fm_list">직급 <b class="redTxt">*</b></span>
			<span class="fm_txt"><label for="us_position" class="blind">직급</label>
			<input type="text" name="us_position" class="input_txt" id="us_position" hname="" value="" frequired="required"/></span>
		</li>
		<li id="saupno_id">
			<span class="fm_list">사업자번호 <b class="redTxt">*</b></span>
			<span class="fm_txt"><label for="us_saupno" class="blind">사업자번호</label>
			<input type="text" name="us_saupno" class="input_txt" id="us_saupno" hname="" value="" frequired="required" onkeyup="javascript:checkNumber(this);"/></span>
		</li>
		<li id="makeyear_id">
			<span class="fm_list">설립연도 <b class="redTxt">*</b></span>
			<span class="fm_txt"><label for="us_makeyear1" class="blind">설립연도</label>
			<input type="text" name="us_makeyear1" class="input_txt" id="us_makeyear1" maxlength="4" hname="" value="" frequired="required" onkeyup="javascript:checkNumber(this);"/></span>
		</li>
		<li id="makeyear_id2" style="display:none;">
			<span class="fm_list">사업자등록 예정일 <b class="redTxt">*</b></span>
			<span class="fm_txt"><label for="us_makeyear2" class="blind">사업자등록 예정일</label>
			<input type="text" name="us_makeyear2" class="input_txt" id="us_makeyear2" hname="" value="" frequired="required" /></span>
		</li>
		<li>
			<span class="fm_list">기업유형 <b class="redTxt">*</b></span>
			<span class="fm_txt">
					
				<input type="text" name="us_uptaex" class="input_txt busi_type_in" id="us_uptaex" hname="" value="" frequired="required" placeholder="업종/업태입력"/>
			</span>
		</li>
		<li id="address_id">
			<span class="fm_list">소재지 <b class="redTxt">*</b></span>
			<span class="fm_txt inauto">
				<label for="us_zipcod" class="blind">소재지</label>
				<input type="text" name="us_zipcod" class="input_txt w-col04" id="us_zipcod" hname="우편번호" value="" option="" frequired="required" readonly/>
				<button type="button" onclick="searchzip();" class="ad-btn" title="새창열림">우편번호 검색</button>
				<div id="wrap_zip" style="display:none;border:1px solid; height:250px;margin:5px 0;position:relative">
				<img src="//t1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼"></div>					
				<input type="text" name="us_addrxx1" class="input_txt mt10 w-col01" id="us_addrxx1" hname="주소" value="" style="ime-mode:active;" frequired="required" readonly/> 
				<input type="text" name="us_addres" class="input_txt mt10 w60" id="us_addres" hname="상세주소" value="" style="ime-mode:active;" frequired="required"/> <span class="sp_txt mt10">나머지주소</span>
			</span>
		</li>
		<li id="address_id2" style="display:none;">
			<span class="fm_list">소재지(도시까지만 기재) <b class="redTxt">*</b></span>
			<span class="fm_txt">
					
				<input type="text" name="us_addrxx" class="input_txt busi_type_in" id="us_addrxx" hname="" value="" frequired="required" placeholder="도시까지만 기재  ex:창원 / 통영"/>
			</span>
		</li>			
	</ul>
	<div class="agree_check mb20">
		<input type="checkbox" name="us_smschk" id="us_smschk" value="Y" checked="">
		<label for="us_smschk">SMS 수신동의 [선택]</label>
	</div>
	<div class="agree_check mb20">
		<input type="checkbox" name="us_mailchk" id="us_mailchk" value="Y" checked="">
		<label for="us_mailchk">이메일 수신동의 [선택]</label>
	</div>
</div>
<p class="redTxt bmb">문자알람은 SMS 수신 동의를 하신분들에게만 전송됩니다. </p>
<div class="btn_li tac mb">
	<button type="button" class="btn_link" onclick="memjoin()">다음단계</button>
</div>
</form>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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

//우편번호
function searchzip() {
	// 현재 scroll 위치를 저장해놓는다.
	var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
	new daum.Postcode({
		oncomplete: function(data) {
			// 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			// 각 주소의 노출 규칙에 따라 주소를 조합한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var fullAddr = data.address; // 최종 주소 변수
			var extraAddr = ''; // 조합형 주소 변수

			// 기본 주소가 도로명 타입일때 조합한다.
			if(data.addressType === 'R'){
				//법정동명이 있을 경우 추가한다.
				if(data.bname !== ''){
					extraAddr += data.bname;
				}
				// 건물명이 있을 경우 추가한다.
				if(data.buildingName !== ''){
					extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				}
				// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
				fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
			}

			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			document.getElementById('us_zipcod').value = data.zonecode; //5자리 새우편번호 사용
			document.getElementById('us_addrxx1').value = fullAddr;

			// iframe을 넣은 element를 안보이게 한다.
			// (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
			document.getElementById('wrap_zip').style.display = 'none';

			// 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
			document.body.scrollTop = currentScroll;
		},
		// 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
		onresize : function(size) {
			document.getElementById('wrap_zip').style.height = size.height+'px';
		},
		width : '100%',
		height : '100%'
	}).embed(document.getElementById('wrap_zip'));

	// iframe을 넣은 element를 보이게 한다.
	document.getElementById('wrap_zip').style.display = 'block';
}

function foldDaumPostcode() {
	// iframe을 넣은 element를 안보이게 한다.
	document.getElementById('wrap_zip').style.display = 'none';
}

function change_buss_gbn(gbn) {
	
	if( (gbn=="1") || (gbn=="3") ) {
		$("#saupno_id").show();
		$("#makeyear_id").show();
		$("#address_id").show();
		
		$("#makeyear_id2").hide();
		$("#address_id2").hide();
	} else {
		$("#makeyear_id2").show();
		$("#address_id2").show();
		
		$("#saupno_id").hide();
		$("#makeyear_id").hide();
		$("#address_id").hide();
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
	var us_buss_gbn = "";
	
	var idCheck = /^[A-za-z0-9]{6,15}$/g;
	var emailCheck = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	
	if($("#us_buss_gbn").is(":checked")) {
		us_buss_gbn = "1";
	} else if($("#us_buss_gbn2").is(":checked")) {
		us_buss_gbn = "2";
	} else if($("#us_buss_gbn3").is(":checked")) {
		us_buss_gbn = "3";
	} 

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
   		alert("연락처를 확인해 주세요.");
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
	
	if(us_buss_gbn == "") {
		alert("회원구분을 선택하세요.");
		$("#us_buss_gbn").focus();
		return false;
	}
	if($('[name="us_company"]').val() == ''){
		alert("기업명을 입력해 주세요.");
		$('[name="us_company"]').focus();
		return false;
	}
	if($('[name="us_position"]').val() == ''){
		alert("직급을 입력해 주세요.");
		$('[name="us_position"]').focus();
		return false;
	}

	if( (us_buss_gbn == "1") || (us_buss_gbn == "3") ) {
		if($('[name="us_saupno"]').val() == ''){
			alert("사업자등록번호를 입력해 주세요.");
			$('[name="us_saupno"]').focus();
			return false;
		}
		if($('[name="us_makeyear1"]').val() == ''){
			alert("설립년도를 입력해 주세요.");
			$('[name="us_makeyear1"]').focus();
			return false;
		}
		if($('[name="us_uptaex"]').val() == ''){
			alert("기업유형을 입력해 주세요.");
			$('[name="us_uptaex"]').focus();
			return false;
		}
		if($('[name="us_addrxx1"]').val() == ''){
			alert("소재지를 입력해 주세요.");
			$('[name="us_addrxx1"]').focus();
			return false;
		}
		if($('[name="us_addres"]').val() == ''){
			alert("소재지를 입력해 주세요.");
			$('[name="us_addres"]').focus();
			return false;
		}
		$('[name="us_makeyear"]').val($('[name="us_makeyear1"]').val());
		$('[name="us_addrxx"]').val($('[name="us_addrxx1"]').val());
	} else if(us_buss_gbn == "2") {
		if($('[name="us_makeyear2"]').val() == ''){
			alert("사업자등록 예정일을 입력해 주세요.");
			$('[name="us_makeyear2"]').focus();
			return false;
		}
		if($('[name="us_uptaex"]').val() == ''){
			alert("기업유형을 입력해 주세요.");
			$('[name="us_uptaex"]').focus();
			return false;
		}
		if($('[name="us_addrxx2"]').val() == ''){
			alert("소재지(도시까지만 기재)를 입력해 주세요.");
			$('[name="us_addrxx2"]').focus();
			return false;
		}
		$('[name="us_makeyear"]').val($('[name="us_makeyear2"]').val());
		$('[name="us_addrxx"]').val($('[name="us_addrxx2"]').val());
	}
	
	return true;
}
</script>


			</div><!--con-->
		</div><!--subcon-->
	</div><!--subwrap-->





<%@ include file="/WEB-INF/jsp/egovframework/gntbsc/inc/footer.jsp" %>