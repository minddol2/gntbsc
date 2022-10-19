<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import ="egovframework.goncs.member.service.LoginVO" %>
<%@ page import="java.util.Collections" %> 
<%@ page import="java.util.Date"%>
<%@ page import="java.util.Calendar"%>
<%
String lang_mode = (String) request.getAttribute("lang_temp");

String is_main = "";
int m1 = 4;
int m2 = 2;
int m3 = 1;

String thisYear = (String) request.getAttribute("thisYear");
String thisMonth = (String) request.getAttribute("thisMonth");
String thisdayx = (String) request.getAttribute("thisdayx");
String today = (String) request.getAttribute("today");

LoginVO loginVO  = (LoginVO)session.getAttribute("loginVO"); 
%>

<jsp:include page="/WEB-INF/jsp/egovframework/gntbsc/inc/top.jsp" flush="true" >
	<jsp:param name="is_main" value="<%=is_main%>"/>
</jsp:include>

<jsp:include page="/WEB-INF/jsp/egovframework/gntbsc/inc/sub_top.jsp" flush="true" >
		<jsp:param name="m1" value="<%=m1%>"/>
		<jsp:param name="m2" value="<%=m2%>"/>
		<jsp:param name="m3" value="<%=m3%>"/>
</jsp:include>

<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script type="text/javascript" src="<c:url value='/js/pg_script.js'/>"></script>
<script type="text/javascript">
$(document).ready(function(){	
	var resultMsg = '${resultMsg}';
	
	if(resultMsg != "") {
		alert(resultMsg);
	}

});

function show_sd(){ 
	$("#datexx").datepicker('show');
} 

$(function() {    
	$( "#datexx" ).datepicker({
		dateFormat: "yy-mm-dd",
		changeMonth: true,
		changeYear: true,
		showOtherMonths: true ,
		selectOtherMonths: true,
		showMonthAfterYear: true ,
		minDate: "+1",
		monthNamesShort: [ "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12" ],
		monthNames:[ "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12" ],
		beforeShowDay: function(date){
			var day = date.getDay();
			//return [(day != 0)];
			return [(day != 0 && day != 6)];
		}
	}); 
	
});

function job_proc() {
	var frm = document.forms.job_frm;
	var counsel_gbn = "";
	var datexx = $("#datexx").val();
	var timexx = $("#timexx").val();
	var name = $("#name").val();
	var mobile = $("#mobile").val();
	var content1 = $("#content1").val();
	
	if($("#counsel_gbn").is(":checked")) {
		counsel_gbn = "1";
	} else if($("#counsel_gbn2").is(":checked")) {
		counsel_gbn = "2";
	}
	
	if(counsel_gbn == "") {
		alert("상담종류를 선택하세요");
		$("#counsel_gbn").focus();
		return;
	}
	if(datexx == "") {
		alert("상담희망 날짜를 입력하세요");
		$("#datexx").focus();
		return;
	}
	if(timexx == "") {
		alert("상담희망 시간을 입력하세요");
		$("#timexx").focus();
		return;
	}
	if(name == "") {
		alert("예약자명을 입력하세요");
		$("#name").focus();
		return;
	}
	if(mobile == "") {
		alert("휴대폰번호를 입력하세요");
		$("#mobile").focus();
		return;
	}
	if($("#userfile1").val() == "") {
		alert("서식파일을 첨부해 주세요");
		$("#userfile1").focus();
		return;
	}
	if( (content1 == "") || (content1.length < 10) ) {
		alert("문의사항(10자이상)을 입력하세요");
		$("#content1").focus();
		return;
	}
	
	if(confirm("신청 하시겠습니까?")) {
		frm.submit();
	}
	
}
</script>



<div class="typebox mb">
	<ul class="tabs list02">				
		<li class="current"><a href="<c:url value='/sub04/sub02_01.do'/>"> 일자리지원창구</a></li>
		<li><a href="<c:url value='/member/myjob.do'/>">예약확인</a></li>
	</ul>
</div>

<!--대관신청-->
<h4 class="tit_dot mb20">일자리상담신청 유의사항</h4>
<div class="pointbox mb">
	<ul class="dot_li">
		<li><span class="ppTxt fwb">구인/구직신청서</span>를 반드시 첨부해주세요.</li>
		<li><span class="ppTxt fwb">상담예약 신청은 상담일 전일</span>까지 가능하며, 당일 상담예약 신청은 유선으로 연락주시기 바랍니다.</li>
		<li>주말 및 공휴일은 예약신청 할수 없으며 <span class="ppTxt fwb">확정된 방문 시간을 꼭 준수</span>하여 주시기 바랍니다.</li>
		<li>아래 상담 신청은 희망시간이며, <span class="ppTxt fwb">승인 문자를 받으신 분에 한하여 상담이 가능</span>합니다.</li>
	</ul>
</div>



	
<div class="jobcounsel mb">

<form name="job_frm" method="post" id="job_frm" action="${pageContext.request.contextPath}/sub04/job_Updt.do" enctype="multipart/form-data" >
	
	<div class="form_box">
		<h5>일자리상담 예약신청서</h5>
		<ul>
			<li><span class="fm_list">상담종류 <b class="ppTxt">*</b></span>
				<span class="fm_txt">
					<ul class="select_li">
						<li class="fullcheck job_counsel01" id="">	
							<input type="radio" name="counsel_gbn" id="counsel_gbn" value="1" />
							<label for="counsel_gbn">
								<dl>
									<dt>구&nbsp;&nbsp;인</dt>
									<dd>인력 연결이 필요합니다.</dd>
								</dl>
							</label>		
						</li>
						<li class="fullcheck job_counsel02" id="">	
							<input type="radio" name="counsel_gbn" id="counsel_gbn2" value="2"  />
							<label for="counsel_gbn2">
								<dl>
									<dt>구&nbsp;&nbsp;직</dt>
									<dd>일자리 연결이 필요합니다.</dd>
								</dl>
							</label>		
						</li>
						
					</ul>
				
				</span>
			</li>
			<li><span class="fm_list">희망날짜 <b class="ppTxt">*</b></span>
				<span class="fm_txt">
					<input type="text" name="datexx" class="input_txt date_in" id="datexx" value="" readonly/><button type="button" class="btn_cal" onclick="show_sd();">날짜선택</button>
					
				</span>
			</li>
			<li><span class="fm_list">상담희망시간 <b class="ppTxt">*</b></span>
				<span class="fm_txt">
					<select name="timexx" title="일자리상담희망시간" size="1" class="couns_time" id="timexx">
						<option value="0">희망시간을 선택해주세요.</option>
						<option value="0900">09:00~10:00</option>
						<option value="1000">10:00~11:00</option>
						<option value="1100">11:00~12:00</option>
						<option value="1300">13:00~14:00</option>
						<option value="1400">14:00~15:00</option>
						<option value="1500">15:00~16:00</option>
						<option value="1600">16:00~17:00</option>
						<option value="1700">17:00~18:00</option>
					</select>
					
				</span>
			</li>
			
			<li><span class="fm_list">예약자명 <b class="ppTxt">*</b></span>
				<span class="fm_txt"><label for="name" class="blind">예약자명</label>
				<input type="text" name="name" class="input_txt" id="name" hname="예약자명" value="<%=loginVO.getUs_name()%>" option="" maxlength="25" frequired="required" title="예약자명 입력" /></span>
			</li>				
			<li><span class="fm_list">휴대폰번호 <b class="ppTxt">*</b></span>
				<span class="fm_txt"><label for="mobile" class="blind">휴대폰번호</label>
				<input type="text" name="mobile" class="input_txt" id="mobile" hname="휴대폰번호" value="<%=loginVO.getUs_phone()%>" option="" frequired="required" onfocus="autoHypenPhone(this);" onkeyup="autoHypenPhone(this);" title="휴대폰번호 입력" />
				 <div><span class="redTxt fss">승인/반려문자 전송을위해 정확히 입력해주세요.</span></div></span>
			</li>	

			<li><span class="fm_list">서식파일 <b class="ppTxt">*</b></span>
				<span class="fm_txt">
				<label for="" class="blind">서식파일</label>
				<div class="filebox">
					<input class="upload-name" value="구인/구직신청서를 첨부해주세요."/>
					<label for="userfile1" class="file_label">첨부파일</label>
					<input type="file" name="userfile1" id="userfile1" class="upload-hidden"/>
				</div>
				
				 </span>
			</li>	
			<li><span class="fm_list">기타첨부파일</span>
				<span class="fm_txt">
				<label for="" class="blind">기타첨부파일</label>
				<div class="filebox">
					<input class="upload-name" value="상담에 필요한 서식을 첨부해주세요. ex)이력서, 자기소개서등"/>
					<label for="userfile2" class="file_label">첨부파일</label>
					<input type="file" name="userfile2" id="userfile2" class="upload-hidden"/>
				</div>
				
				 </span>
			</li>
			<li><span class="fm_list">기타첨부파일</span>
				<span class="fm_txt">
				<label for="" class="blind">기타첨부파일</label>
				<div class="filebox">
					<input class="upload-name" value="상담에 필요한 서식을 첨부해주세요. ex)이력서, 자기소개서등"/>
					<label for="userfile3" class="file_label">첨부파일</label>
					<input type="file" name="userfile3" id="userfile3" class="upload-hidden"/>
				</div>
				
				 </span>
			</li>
			
			<li><span class="fm_list">문의사항</span>
				<span class="fm_txt"><label for="etc" class="blind">문의사항</label>
				<textarea name="content1" id="content1" class="textarea" wrap="hard"></textarea>
				</span>
			</li>
		</ul>
	</div>
	<div class="agree_warp mb20">
		<div class="agree_check">
			<input type="checkbox" name="privacy_agree1" id="agree_check01">
			<label for="agree_check01">개인정보수집이용동의</label>
			<a href="#privacy01" class="txt_info litebox">전문보기</a>
		</div>
		
	</div>
</div>


<div id="privacy01" class="no-display popinfo">
	<h1>개인정보 수집이용약관</h1>
	<div class="popcon">
		<%@ include file="/WEB-INF/jsp/egovframework/gntbsc/inc/privacy.jsp" %>
	</div>
</div>


<div class="tac mb">
	<a href="#" class="btn_rd btn_big" onclick="job_proc();">일자리상담 접수</a>
</div>
</form>


<!--대관신청 끝-->

<script>
$(document).ready(function(){ 
	var fileTarget = $('.filebox .upload-hidden'); 
	fileTarget.on('change', function(){ // 값이 변경되면 
		if(window.FileReader){ // modern browser 
			var filename = $(this)[0].files[0].name; 
		} else { // old IE 
			var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출 
		} 
		// 추출한 파일명 삽입 
		$(this).siblings('.upload-name').val(filename);
	}); 

	$("#deptCd").change(function(){
		//alert($(this).find("option:selected").data('deptnm'));
		$("#deptNm").val($(this).find("option:selected").data('deptnm'));
	});
});

</script>

			</div><!--con-->
		</div><!--subcon-->
	</div><!--subwrap-->





<%@ include file="/WEB-INF/jsp/egovframework/gntbsc/inc/footer.jsp" %>