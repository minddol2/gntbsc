<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="egovframework.com.cmm.service.EgovProperties" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import ="egovframework.goncs.member.service.LoginVO" %>
<%
String lang_mode = (String) request.getAttribute("lang_temp");

String is_main = "";
int m1 = 4;
int m2 = 1;
int m3 = 3;

int us_level = 5;
LoginVO loginVO = (LoginVO)session.getAttribute("loginVO");
if(loginVO != null) {
	us_level = loginVO.getUs_level();
}
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
<script type="text/javascript" src="<c:url value='/SE2/js/HuskyEZCreator.js'/>" charset="utf-8"></script>
<script type="text/javascript">
$(document).ready(function(){	
	var resultMsg = '${resultMsg}';
	
	if(resultMsg != "") {
		alert(resultMsg);
	}
	
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

});

function show_sd(){ 
	$("#room_date").datepicker('show');
} 

$(function() {    
	$( "#room_date" ).datepicker({
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
			return [(day != 0 && day != 6)];
		}
	}); 
	
});

function fn_egov_select_List() {
	 document.submitParam.action = "<c:url value='/sub04/sub01_03.do'/>";
	 document.submitParam.submit();
}

function change_major(major1, major2) {
	var major1 = $("#"+major1).val();
	
	$.ajax({
		url : "<c:url value='/member/selectMajorCodeAjax.do'/>",
		data : {
			"maxcod" : major1
		},
		dataType : 'json',
		type : 'POST',
		success : function(response) {
			//alert(response);
			optionitem = response.optionlist;
			$("#" + major2).empty().append(optionitem);

		},
		error : function(data) {
			return;
		}
	});
}

function change_hmemto() {
	var us_major11 = $("#us_major11").val();
	var us_major12 = $("#us_major12").val();
	
	$.ajax({
		url : "<c:url value='/member/selectMemtoCodeAjax.do'/>",
		data : {
			"us_major11" : us_major11, "us_major12" : us_major12 
		},
		dataType : 'json',
		type : 'POST',
		success : function(response) {
			//alert(response);
			optionitem = response.optionlist;
			$("#hope_memto").empty().append(optionitem);

		},
		error : function(data) {
			return;
		}
	});
	
}

function check_memto_gbn(gbn) {
	if(gbn == "2") {
		$("#room_gbn_id").show();
		$("#room_date_id").show();
		$("#att_cnt_id").show();
	} else if(gbn == "3") {
		$("#room_gbn_id").show();
		$("#room_date_id").show();
		$("#att_cnt_id").show();
	} else {
		$("#room_gbn_id").hide();
		$("#room_date_id").hide();
		$("#att_cnt_id").hide();
		$("#room_date").val();
		$("#room_time1").val("0930");
		$("#room_time2").val("1030");
	}
}

function update_prc() {
	var frm = document.forms.sfrm;
	
	if(oEditors.getById["contentx"]){
    	oEditors.getById["contentx"].exec("UPDATE_CONTENTS_FIELD", []);
	}
	
	var us_major11 = $("#us_major11").val();
	var us_major12 = $("#us_major12").val();
	var us_major1_etc = $("#us_major1_etc").val();
	var hope_memto = $("#hope_memto").val();
	var memto_gbn = "";
	var room_gbn = "";
	var room_date = $("#room_date").val();
	var room_time1 = $("#room_time1").val();
	var room_time2 = $("#room_time2").val();
	var title = $("#title").val();
	var att_cnt = $("#att_cnt").val();
	
	if($("#memto_gbn").is(":checked")) {
		memto_gbn = "1";
	} else if($("#memto_gbn2").is(":checked")) {
		memto_gbn = "2";
	} else if($("#memto_gbn3").is(":checked")) {
		memto_gbn = "3";
	}
	
	if($("#room_gbn").is(":checked")) {
		room_gbn = "Y";
	} else if($("#room_gbn2").is(":checked")) {
		room_gbn = "N";
	}
	
	if(us_major11 == "0") {
		alert("문의분야 대분류를 선택하세요");
		$("#us_major11").focus();
		return;
		
	}
	if(us_major12 == "0") {
		alert("문의분야 소분류를 선택하세요");
		$("#us_major12").focus();
		return;
		
	}
	if(memto_gbn == "" ) {
		alert("멘토링방식을 선택하세요");
		return;
	}
	if( ((memto_gbn=="2" ) || (memto_gbn=="3" )) && (room_gbn == "") ) {
		alert("센터회의실 사용유무를 선택하세요");
		return;
	}
	if( ((memto_gbn=="2" ) || (memto_gbn=="3" ))  && (room_date=="") ) {
		alert("멘토링 날짜를 선택하세요.");
		$("#room_date").focus();
		return;
	}
	if( ((memto_gbn=="2" ) || (memto_gbn=="3" ))  && (Number(room_time1) >= Number(room_time2)) ) {
		alert("멘토링 시간을 확인해 주세요.");
		$("#room_time2").focus();
		return;
	}
	if( ((memto_gbn=="2" ) || (memto_gbn=="3" ))  && ((att_cnt=="") || (att_cnt=="0")) ) {
		alert("멘토링 참석인원을 입력해 주세요.");
		$("#att_cnt").focus();
		return;
	}
	if(title == "") {
		alert("제목을 선택하세요");
		$("#title").focus();
		return;
	}
	if($("#agree_check01").is(":checked") == false) {
		alert("개인정보수집이용에 동의해야 신청이 가능합니다.");
		$("#agree_check01").focus();
		return;
	}
	if($("#survey_check01").is(":checked") == false) {
		alert("설문조사에 동의해야 신청이 가능합니다.");
		$("#survey_check01").focus();
		return;
	}
		
	
	if(confirm("신청 하시겠습니까?")) {
		if(att_cnt=="") {
			$("#att_cnt").val("0");
		}

		frm.submit();
	}
	
}
</script>

<form name="submitParam" method="post">
</form>

<div class="typebox mb">
	<ul class="tabs list03">				
		<li><a href="<c:url value='/sub04/sub01_01.do'/>">상담신청안내</a></li>
		<li><a href="<c:url value='/sub04/sub01_02.do'/>">전문 멘토단</a></li>
		<li class="current"><a href="<c:url value='/sub04/sub01_03.do'/>">상담신청 목록</a></li>
	</ul>
</div>

<!--글쓰기-->

<form name="sfrm" id="sfrm" action="${pageContext.request.contextPath}/sub04/sub01_03_Updt.do"  method="post" enctype="multipart/form-data" >
<input type="hidden" name="idx" value="0" />
<input type="hidden" name="us_id" value="<c:out value='${user.us_id}'/>" />
<input type="hidden" name="us_major1_etc" value="" />

<div class="mentoring_write">
	<h5>기업상담신청서 작성</h5>
	<div class="form_box left">
		<ul class="mb20">
			<!--<li>
				<span class="fm_list">회원구분 <b class="redTxt">*</b></span>
				<span class="fm_txt btn_change">
					<label for="" class="blind">회원구분</label>
					<input type="radio" name="b_type" class="op0" id="b_type01" /><label for="b_type01" class="radio_label">도내기업</label> 
					<input type="radio" name="b_type" class="op0" id="b_type02"  /><label for="b_type02" class="radio_label">예비창업자</label> 
					<input type="radio" name="b_type" class="op0" id="b_type03"  /><label for="b_type03" class="radio_label">입주기업</label> 
					
				</span>
			</li>-->
			<li>
				<span class="fm_list">기업명 <b class="redTxt">*</b></span>
				<span class="fm_txt"><label for="us_company" class="blind">기업명</label>
				<input type="text" name="us_company" class="input_txt" id="us_company" hname="" value="<c:out value='${mem_result.us_company}'/>" frequired="required" readonly /></span>
			</li>
			<li>
				<span class="fm_list">직급 <b class="redTxt">*</b></span>
				<span class="fm_txt"><label for="us_position" class="blind">직급</label>
				<input type="text" name="us_position" class="input_txt" id="us_position" hname="" value="<c:out value='${mem_result.us_position}'/>" frequired="required"/></span>
			</li>	
			<li>
				<span class="fm_list">설립연도 <b class="redTxt">*</b></span>
				<span class="fm_txt"><label for="us_makeyear" class="blind">설립연도</label>
				<input type="text" name="us_makeyear" class="input_txt" id="us_makeyear" hname="" value="<c:out value='${mem_result.us_makeyear}'/>" frequired="required"/></span>
			</li>
			<li>
				<span class="fm_list">기업유형 <b class="redTxt">*</b></span>
				<span class="fm_txt">
					<input type="text" name="us_uptaex" class="input_txt busi_type_in" id="us_uptaex" hname="" value="<c:out value='${mem_result.us_uptaex}'/>" frequired="required" placeholder="업종/업태입력"/>
				</span>
			</li>				
		</ul>
	</div>
	<div class="form_box right">
		<ul class="mb20">
			<li>
				<span class="fm_list">문의분야 <b class="redTxt">*</b></span>
				<span class="fm_txt btn_change">
					<label for="us_major11" class="blind">문의분야</label>
					<select name="us_major11" title="대분류선택" size="" class="mentor_type_select" id="us_major11" onchange="change_major('us_major11','us_major12')">
						<option value="0">대분류선택</option>
						<option value="1">창업</option>
						<option value="2">마케팅/홍보</option>
						<option value="3">투자</option>
						<option value="4">경영심화</option>
						<option value="5">관광</option>
						<option value="6">제품디자인</option>
					</select>

					<select name="us_major12" title="소분류" size="" class="mentor_type_select mt10" id="us_major12" onchange="change_hmemto();"> <!--창업선택시-->
						<option value="0">소분류선택</option>
					</select>

					
				</span>
			</li>
			<li>
				<span class="fm_list">희망멘토 <b class="redTxt">*</b></span>
				<span class="fm_txt"><label for="hope_memto" class="blind">희망멘토</label>				
					<select name="hope_memto" title="소분류" size="" class="mentor_type_select mt10" id="hope_memto">
						<option value="0">희망멘토없음</option>
						<c:forEach var="result" items="${mem_list1}" varStatus="status">
							<option value="<c:out value='${result.us_id}'/>"><c:out value='${result.us_name}'/></option>
						</c:forEach>
					</select>

				</span>
			</li>
			<li>
				<span class="fm_list">멘토링방식 <b class="redTxt">*</b></span>
				<span class="fm_txt btn_change"><label for="memto_gbn" class="blind">멘토링방식</label>				
					<input type="radio" name="memto_gbn" class="op0" id="memto_gbn" value="1" onclick="check_memto_gbn('1');" /><label for="memto_gbn" class="radio_label">서면</label> 
					<input type="radio" name="memto_gbn" class="op0" id="memto_gbn2" value="2" onclick="check_memto_gbn('2');" /><label for="memto_gbn2" class="radio_label">화상</label> 
					<input type="radio" name="memto_gbn" class="op0" id="memto_gbn3" value="3" onclick="check_memto_gbn('3');" /><label for="memto_gbn3" class="radio_label">대면</label> 				
				</span>
			</li>
			<!-- 화상선택시 아래화면 나옴-->
			<li id="room_gbn_id" style="display:none;">
				<span class="fm_list">센터회의실 <b class="redTxt">*</b></span>
				<span class="fm_txt btn_change"><label for="room_gbn" class="blind">센터회의실</label>				
					<input type="radio" name="room_gbn" class="op0" id="room_gbn" value="Y"  /><label for="room_gbn" class="radio_label">사용</label> 
					<input type="radio" name="room_gbn" class="op0" id="room_gbn2" value="N"  /><label for="room_gbn2" class="radio_label">사용안함</label> 					
				</span>
			</li>
			<li id="room_date_id" style="display:none;">
				<span class="fm_list">희망날짜/시간 <b class="redTxt">*</b></span>
				<span class="fm_txt"><label for="room_date" class="blind">희망날짜/시간</label>	
					<div class="date_input">
						<input type="text" name="room_date" class="input_txt date_in" id="room_date" value="" readonly /><button type="button" id="hopeDt_btn" class="btn_cal" onclick="show_sd();">날짜선택</button>
					</div>
					<div class="time_select">
						<select name="room_time1" title="멘토링시작시간" size="1" class="time_start" id="room_time1">
							<option value="0930">09:30</option>
							<option value="1000">10:00</option>
							<option value="1030">10:30</option>
							<option value="1100">11:00</option>
							<option value="1330">13:30</option>
							<option value="1400">14:00</option>
							<option value="1430">14:30</option>
							<option value="1500">15:00</option>
							<option value="1530">15:30</option>
							<option value="1600">16:00</option>
							<option value="1630">16:30</option>
							
						</select>
						<span class="textin">~</span>
						<select name="room_time2" title="멘토링끝시간" size="1" class="time_last" id="room_time2">
							<option value="1000">10:00</option>
							<option value="1030">10:30</option>
							<option value="1100">11:00</option>
							<option value="1130">11:30</option>
							<option value="1200">12:00</option>
							<option value="1230">12:30</option>
							<option value="1300">13:00</option>
							<option value="1330">13:30</option>
							<option value="1400">14:00</option>
							<option value="1430">14:30</option>
							<option value="1500">15:00</option>
							<option value="1530">15:30</option>
							<option value="1600">16:00</option>
							<option value="1630">16:30</option>
							<option value="1700">17:00</option>
							<option value="1730">17:30</option>
						</select>
					</div>
					<span class="cb dpb redTxt fss">※12시~1시는 점심시간으로 진행이 불가합니다.</span>
				</span>
			</li>
			<li id="att_cnt_id" style="display:none;">
				<span class="fm_list">참석인원 <b class="redTxt">*</b></span>
				<span class="fm_txt btn_change"><label for="att_cnt" class="blind">참석인원</label>				
					<input type="number" name="att_cnt" class="input_txt date_in" id="att_cnt" value="0" /> 명					
				</span>
			</li>

			<!-- 화상선택시 end-->
			
		</ul>
	</div>
	<div class="write_apply">
		<ul>	
			<li>
				<span class="fm_list">제목 <b class="redTxt">*</b></span>
				<span class="fm_txt">
					<label for="title" class="blind">카테고리</label>
					<input type="text" name="title" class="input_txt w100" id="title" hname="제목" value="" option="" frequired="required" title="제목 입력"/>
				</span>
			</li>				
		
			<li>
				<span class="fm_list">글작성 <b class="redTxt">*</b></span>
				<span class="fm_txt">
					<div class="editorin">
						<!-------------------------------------- 에디터 --------------------------------------->
<textarea id="contentx" name="contentx" title="본문내용" style="width:98%; min-width:300px; height:450px; display:none;"></textarea>
<script type="text/javascript">
var oEditors = [];

// 추가 글꼴 목록
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "contentx",
	sSkinURI: "<c:url value='/'/>SE2/SmartEditor2Skin.html",	
	htParams : {
		bUseToolbar : true,				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
		bUseVerticalResizer : true,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
		bUseModeChanger : true,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
		fOnBeforeUnload : function(){
		}
	}, //boolean
	fOnAppLoad : function(){
		oEditors.getById["contentx"].exec("PASTE_HTML", [""]);
	},
	fCreator: "createSEditor2"
});
</script>	
						<!-------------------------------------- 에디터 --------------------------------------->
					</div>
				</span>
			</li>
			<li>
			<span class="fm_list">첨부파일 </span>
				<span class="fm_txt">
					<div class="filebox ">
						<input class="upload-name" value="첨부파일 선택"/>
						<label for="userfile1" class="file_label">첨부파일</label>
						<input type="file" name="userfile1" id="userfile1" class="upload-hidden" />
					</div>
					<div class="filebox mt10">
						<input class="upload-name" value="첨부파일 선택"/>
						<label for="userfile2" class="file_label">첨부파일</label>
						<input type="file" name="userfile2" id="userfile2" class="upload-hidden" />
					</div>
					<div class="filebox mt10">
						<input class="upload-name" value="첨부파일 선택"/>
						<label for="userfile3" class="file_label">첨부파일</label>
						<input type="file" name="userfile3" id="userfile3" class="upload-hidden" />
					</div>
				</span>
			</li>
			<li>
				<span class="fm_list">관련링크</span>
				<span class="fm_txt">
					<label for="link1" class="blind">관련링크</label>
					
					<input type="text" name="link1" class="input_txt w100" id="link1" hname="관련링크1" value="" frequired="required"/>	
					
					<input type="text" name="link2" class="input_txt w100 mt5" id="link2" hname="관련링크2" value="" frequired="required"/>	
					
					<input type="text" name="link3" class="input_txt w100 mt5" id="link3" hname="관련링크3" value="" frequired="required"/>	
				</span>
			</li>
				
		</ul><!--//mb-->
		<div class="agree_warp mb20">
			<div class="agree_check">
				<input type="checkbox" name="privacy_agree1" id="agree_check01">
				<label for="agree_check01">개인정보수집이용동의</label>
				<a href="#privacy01" class="txt_info litebox">전문보기</a>
			</div>
			
		</div>
		<div class="agree_warp mb20">
			<p class="fwb ppTxt fsb tac mb10">멘토링 완료 후 만족도 설문조사를 반드시 제출 해주셔야 합니다.
				이에 동의하고 기업 상담신청을 하시겠습니까?</p>
			<ul class="dot_li">
				<li>서면 – 멘토 댓글 확인 후 <span class="blTxt fwb">글 하단에서 [상담완료 및 멘토평가]로 설문조사 제출</span></li>
 				<li>화상 – 멘토링 완료 후 <span class="blTxt fwb">문자로 설문조사요청 발송</span></li>
			</ul>
			<ul class="dot_li">
				<li>원활한 멘토링 진행을 위하여 센터 및 멘토에 적극 협조하며, 이에 응하지 않을 경우 멘토링을 거부당할 수 있다.</li>
				<li>문의하는 분야에 해당되는 전문 멘토가 없을 경우 상담이 불가할 수 있음을 사전에 인지한다.</li>
				<li>멘토링 진행을 위하여 개인 및 기업 정보에 대해서 추가 문의를 할 수 있으며, 답변을 거부할 경우 멘토링 진행에 제한이 생길 수 있다.</li>
				<li>신청글마다 시간, 날짜, 멘토 등 포함하여 최대 2회까지만 변경 가능하며, 3회 초과 시 운영상의 제재를 받을 수 있다.</li>
				<li>멘토는 단순 자문단임을 인지하고, 사업적으로 중요한 결정에 대해서는 센터가 책임을 지지 않음에 동의한다.</li>
				<li>상담완료 후 만족도 설문조사지를 작성하여 제출한다. </li>
			</ul>
			<div class="agree_check">
				<input type="checkbox" name="survey_agree1" id="survey_check01">
				<label for="survey_check01">설문조사에 동의합니다.</label>
			</div>
			
		</div>
		<div class="tac">
			<a href="#" class="btn_rd btn_big mb20" onclick="update_prc()">기업상담신청 </a>
		</div>
	</div>
	
</div>

</form>


<!--글쓰기end-->
			</div><!--con-->
		</div><!--subcon-->
	</div><!--subwrap-->




<%@ include file="/WEB-INF/jsp/egovframework/gntbsc/inc/footer.jsp" %>