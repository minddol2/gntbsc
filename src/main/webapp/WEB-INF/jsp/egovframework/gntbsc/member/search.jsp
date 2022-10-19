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
int m2 = 3;
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

<script type="text/javascript" src="<c:url value='/js/pg_script.js'/>"></script>  
<script type="text/javascript">
function check_id() {
	var name = $("#name1").val();
	var email = $("#email1").val();
	var phone = $("#phone1").val();
	
    if (document.actFrm1.name.value =="") {
        alert('이름을 입력해 주세요.');
        return;
    } 
    if (document.actFrm1.email.value =="") {
        alert('이메일을 입력해 주세요.');
        return;
    } 
    if (document.actFrm1.phone.value =="") {
        alert('휴대폰번호를 입력해 주세요.');
        return;
    } 
    
    $.ajax({
    	url:"<c:url value='/member/search_id.do'/>",
    	data:{ "name": name, "email": email, "phone": phone},
    	dataType:'json',
    	type:'POST',
    	success: function(response){
            //대여디비처리 성공시
            if(response.resultMsg == "N") {
            	alert("일치하는 정보가 없습니다. 정보를 확인해 주세요.");
				return false;
            	
			} else {
				$("#result_id").show();
            	$("#result_id2").html(response.resultMsg);
			}
        
        },
    	error:function(data){
    		//alert('rent err');   
   		}
	});
    
}

function check_pass() {
	var name = $("#name2").val();
	var m_id = $("#m_id2").val();
	var email = $("#email2").val();
	
    if (document.actFrm2.name.value =="") {
        alert('이름을 입력해 주세요.');
        return;
    } 
    if (document.actFrm2.m_id.value =="") {
        alert('아이디를 입력해 주세요.');
        return;
    } 
    if (document.actFrm2.email.value =="") {
        alert('이메일을 입력해 주세요.');
        return;
    } 
    
    $.ajax({
    	url:"<c:url value='/member/search_idpw.do'/>",
    	data:{ "name": name, "email": email, "m_id": m_id},
    	dataType:'json',
    	type:'POST',
    	success: function(response){
            //대여디비처리 성공시
            if(response.resultMsg == "N") {
            	alert("일치하는 정보가 없습니다. 정보를 확인해 주세요.");
				return false;
            	
			} else {
				alert("가입한 이메일로 임시비밀번호를 발송했습니다.");
				return false;
			}
        
        },
    	error:function(data){
    		//alert('rent err');   
   		}
	});
    
    
}

</script>
<!--아이디 비밀번호찾기-->


	<div class="txt_top mb">
		<h3 class="mb10">아이디/비밀번호찾기</span></h3>
		<p>회원가입시 입력하신 정보를 정확하게 입력해주세요.</span></p>
	</div>

	<div class="Identity mb" id="tabsholder">
		<ul class="tabs list03">
			<li id="tab1">아이디찾기</li>
			<li id="tab2">비밀번호찾기</li>
		</ul>

		<div id="content1" class="tabscontent">			
			<form name="actFrm1" id="actFrm1" action="<c:url value='/member/search_id.do'/>" method="post" >
			<ul class="input_li mb20">
				<li><span class="tit">이름</span><input type="text" name="name" id="name1" value=""/></li>
				<li><span class="tit">이메일주소</span><input type="text" name="email" id="email1" value=""/></li>
				<li><span class="tit">휴대폰번호</span><input type="text" name="phone" id="phone1" value="" onfocus="autoHypenPhone(this);" onkeyup="autoHypenPhone(this);"/></li>				
			</ul>
			<a class="btn_link" href="javascript:check_id();">아이디찾기</a>

			<div class="result_txt" id="result_id" style="display:none;">
				<p class="mb20">고객님의 아이디는 <span id="result_id2">test11</span>입니다.</p>
				<a class="btn_link" href="<c:url value='/member/login.do'/>">로그인하기</a>
			</div>
			</form>

		</div>

		<div id="content2" class="tabscontent">
			<form name="actFrm2" id="actFrm2" action="<c:url value='/member/search_pass.do'/>" method="post" >
			<ul class="input_li mb20">
				<li><span class="tit">이름</span><input type="text" name="name" id="name2" value=""/></li>
				<li><span class="tit">아이디</span><input type="text" name="m_id" id="m_id2" value=""/></li>
				<li><span class="tit">이메일주소</span><input type="text" name="email" id="email2" value=""/></li>				
			</ul>
			<a class="btn_link" href="javascript:check_pass();">임시비밀번호 발송</a>
			</form>
		</div>
		
	</div>


<script> 
	$(document).ready(function(){
		$("#tabsholder").tytabs({
							tabinit:"1",
							fadespeed:"fast"
					});			
		
		var resultMsg = '${resultMsg}';
		
		if(resultMsg != "") {
			alert(resultMsg);
		}
		
		});
</script> 



<!--아이디 비밀번호찾기 end-->



			</div><!--con-->
		</div><!--subcon-->
	</div><!--subwrap-->





<%@ include file="/WEB-INF/jsp/egovframework/gntbsc/inc/footer.jsp" %>