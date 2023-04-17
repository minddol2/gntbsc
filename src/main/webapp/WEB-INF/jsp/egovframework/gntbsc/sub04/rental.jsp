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
int m2 = 3;
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

<script type="text/javascript" src="<c:url value='/js/pg_script.js'/>"></script>  
<script type="text/javascript">
$(document).ready(function(){	
	var resultMsg = '${resultMsg}';
	
	if(resultMsg != "") {
		alert(resultMsg);
	}
	
	get_calendar('<%=thisYear%>','<%=thisMonth%>');
});

//이전달 구하기
function get_last_mon() {
	var i_year = $("#i_year").val();
	var i_mon = $("#i_mon").val();
	
	if(i_year == "") {
		alert("날짜 오류 입니다.");
		return false;
	} else if(i_mon == "") {
		alert("날짜 오류 입니다.");
		return false;
	} else {
		$.ajax({
	    	url:"<c:url value='/rent/get_last_mon.do'/>",
	    	data:{ "i_year": i_year,
     		   "i_mon": i_mon},
	    	dataType:'json',
	    	type:'POST',
	    	success: function(response){
	            //대여디비처리 성공시
	            $("#now_ym").html(response.yearx+"."+uncomma(response.monx));
	        	$("#i_year").val(response.yearx);
	            $("#i_mon").val(response.monx);
	            $("#room_id1").val("");
	            $("#room_id2").val("");
	            $("#room_id3").val("");
	            $("#datexx").val("");
	            
	            get_calendar(response.yearx,response.monx);
	        
	        },
	    	error:function(data){
	    		//alert('rent err');   
	   		}
		});
	}
}

//다음달 구하기
function get_next_mon() {
	var i_year = $("#i_year").val();
	var i_mon = $("#i_mon").val();
	
	if(i_year == "") {
		alert("날짜 오류 입니다.");
		return false;
	} else if(i_mon == "") {
		alert("날짜 오류 입니다.");
		return false;
	} else {
		$.ajax({
	    	url:"<c:url value='/rent/get_next_mon.do'/>",
	    	data:{ "i_year": i_year,
     		   "i_mon": i_mon},
	    	dataType:'json',
	    	type:'POST',
	    	success: function(response){
	            //대여디비처리 성공시
	            $("#now_ym").html(response.yearx+"."+uncomma(response.monx));
	        	$("#i_year").val(response.yearx);
	            $("#i_mon").val(response.monx);
	            $("#room_id1").val("");
	            $("#room_id2").val("");
	            $("#room_id3").val("");
	            $("#datexx").val("");
	            
	            get_calendar(response.yearx,response.monx);
	        
	        },
	    	error:function(data){
	    		//alert('rent err');   
	   		}
		});
	}
}

//달력에 날짜 뿌리기
function get_calendar(yearx, monx) {
	if(yearx == "") {
		alert("날짜 오류 입니다.");
		return false;
	} else if(monx == "") {
		alert("날짜 오류 입니다.");
		return false;
	} else {
		
		$.ajax({
	    	url:"<c:url value='/rent/get_calendar.do'/>",
	    	data:{ "yearx": yearx,
     		   "monx": monx},
	    	dataType:'json',
	    	type:'POST',
	    	success: function(response){
	            //대여디비처리 성공시
	    		$("#calendar_table").html(response.select_monx);
	        
	        },
	    	error:function(data){
	    		//alert('rent err');   
	   		}
		});
	}
}

//달력에서 날짜 선택
function select_rent_day(datexx) {
	var cday = $("#datexx").val().substring(8,10);
	var iday = datexx.substring(8,10);
	
	if(datexx == "") {
		alert("날짜 오류 입니다.");
		return false;
	} else {
		$.ajax({
	    	url:"<c:url value='/rent/select_rentday.do'/>",
	    	data:{ "datexx": datexx},
	    	dataType:'json',
	    	type:'POST',
	    	success: function(response){
	            //대여디비처리 성공시
	            var vcheck = response.select_timeon;
	            
	            if(cday != iday) {
	            	if($("#iday_"+cday).hasClass("select")) {
	            		$("#iday_"+cday).removeClass("select");
	            	}
	            	$("#iday_"+iday).addClass("select");
	            }
	            
	            $("#set_datetime").html(datexx);
	            $("#datexx").val(datexx);
	            
	            if(vcheck == "Y") {
	            	$("#cal_timeoff").hide();
	            	$("#cal_timeon").show();
	            } else {
	            	$("#cal_timeoff").show();
	            	$("#cal_timeon").hide();
	            }
	            
	            $("#timexx").val("");
	            $("#room_id1").val("");
	            $("#room_id2").val("");
	            $("#room_id3").val("");
	            $("#disp_room1").show();
            	$("#disp_room2").hide();
            	
            	if($("#time0900").hasClass("select")) {
            		$("#time0900").removeClass("select");
            	}
            	if($("#time0930").hasClass("select")) {
            		$("#time0930").removeClass("select");
            	}
            	if($("#time1000").hasClass("select")) {
            		$("#time1000").removeClass("select");
            	}
            	if($("#time1030").hasClass("select")) {
            		$("#time1030").removeClass("select");
            	}
            	if($("#time1100").hasClass("select")) {
            		$("#time1100").removeClass("select");
            	}
            	if($("#time1130").hasClass("select")) {
            		$("#time1130").removeClass("select");
            	}
            	if($("#time1200").hasClass("select")) {
            		$("#time1200").removeClass("select");
            	}

            	if($("#time1230").hasClass("select")) {
	            	$("#time1230").removeClass("select");
            	}
            	if($("#time1300").hasClass("select")) {
	            	$("#time1300").removeClass("select");
            	}
            	if($("#time1330").hasClass("select")) {
	            	$("#time1330").removeClass("select");
            	}
            	if($("#time1400").hasClass("select")) {
	            	$("#time1400").removeClass("select");
            	}
            	if($("#time1430").hasClass("select")) {
	            	$("#time1430").removeClass("select");
            	}
            	if($("#time1500").hasClass("select")) {
	            	$("#time1500").removeClass("select");
            	}
            	if($("#time1530").hasClass("select")) {
	            	$("#time1530").removeClass("select");
            	}
            	if($("#time1600").hasClass("select")) {
	            	$("#time1600").removeClass("select");
            	}
            	if($("#time1630").hasClass("select")) {
	            	$("#time1630").removeClass("select");
            	}
            	if($("#time1700").hasClass("select")) {
	            	$("#time1700").removeClass("select");
            	}
            	if($("#time1730").hasClass("select")) {
	            	$("#time1730").removeClass("select");
            	}
	        
	        },
	    	error:function(data){
	    		//alert('rent err');   
	   		}
		});
	}
	
}

//시간선택
function select_datetime(timexx) {
	var datexx  = $("#datexx").val();
	var ctimexx = $("#timexx").val();
	var j = 0;
	
	if($("#time"+timexx).hasClass("select")) {
		$("#time"+timexx).removeClass("select");
		
		if(ctimexx.indexOf(timexx) > -1) {
			ctimexx = replaceAll(ctimexx, ","+timexx, "");
			ctimexx = replaceAll(ctimexx, timexx, "");
		}
		$("#timexx").val(ctimexx);
		
	} else {
		$("#time"+timexx).addClass("select");
		if(ctimexx == "") {
			ctimexx = timexx;
		} else {
			ctimexx = ctimexx + "," + timexx;
		}
		
		$("#timexx").val(ctimexx);
	}
	
	if(ctimexx == "") {
		alert("시간을 선택하세요");
		return false;
	} else {
		$.ajax({
	    	url:"<c:url value='/rent/select_rentroom.do'/>",
	    	data:{ "datexx": datexx, "timexx": ctimexx},
	    	dataType:'json',
	    	type:'POST',
	    	success: function(response){
	            //대여디비처리 성공시
	            $("#room_s1").prop("checked", false);
	            $("#room_s2").prop("checked", false);
	            $("#room_s3").prop("checked", false);
	            $("#room_s4").prop("checked", false);
	            $("#room_s5").prop("checked", false);
	            $("#room_s6").prop("checked", false);
	            $("#room_s7").prop("checked", false);
	            $("#disp_s1").hide();
	            $("#disp_s2").hide();
	            $("#disp_s3").hide();
	            $("#disp_s4").hide();
	            $("#disp_s5").hide();
	            $("#disp_s6").hide();
	            $("#disp_s7").hide();
	            
	            $("#room_id1").val("");
	            $("#room_id2").val("");
	            $("#room_id3").val("");
	            	            
	            var vroom = response.room_list.split("|");
	            
	            for ( var i in vroom ) {
	            	$("#disp_"+vroom[i]).show();
	            	j = j + 1;
	            }
	            
	            if(j > 0) {
	            	$("#disp_room1").hide();
	            	$("#disp_room2").show();
	            }
	            
	            //$("#set_datetime").html(datexx + "   " + ctimexx);
	        
	        },
	    	error:function(data){
	    		//alert('rent err');   
	   		}
		});
	}
}

//룸 선택
function check_room(room_id) {
	var room_id1 = $("#room_id1").val();
	var room_id2 = $("#room_id2").val();
	var room_id3 = $("#room_id3").val();
	var rcnt = 0;
	var rcnt1 = 0;
	var rcnt2 = 0;
		
	if(room_id1 == room_id) {
		$("#room_id1").val("");
		room_id1 = "";
		
	} else if(room_id2 == room_id) {
		$("#room_id2").val("");
		room_id2 = "";
		
	} else if(room_id3 == room_id) {
		$("#room_id3").val("");
		room_id3 = "";
		
	} else if(room_id1 == "") {
		$("#room_id1").val(room_id);
		room_id1 = room_id;
		
	} else if(room_id2 == "") {
		$("#room_id2").val(room_id);
		room_id2 = room_id;
		
	} else if(room_id3 == "") {
		$("#room_id3").val(room_id);	
		room_id3 = room_id;
	}
	
	if( (room_id1 != "") && (room_id2 != "") && (room_id3 != "") && (room_id != "s7") ) {
		if( (room_id1 != room_id) && (room_id2 != room_id) && (room_id3 != room_id) ) {
			alert("대관은 최대3개까지 신청이 가능합니다.");
			$("#room_"+room_id).prop("checked", false);
			return false;
		}
	}

	
	if(room_id1 != "") {
		rcnt++;
	}
	if(room_id2 != "") {
		rcnt++;
	}
	if(room_id3 != "") {
		rcnt++;
	}
	if( (room_id1 == "s1") || (room_id2 == "s1") || (room_id3 == "s1") ) {
		rcnt1++;
	}
	if( (room_id1 == "s2") || (room_id2 == "s2") || (room_id3 == "s2") ) {
		rcnt1++;
	}
	if( (room_id1 == "s3") || (room_id2 == "s3") || (room_id3 == "s3") ) {
		rcnt1++;
	}
	
	if( (room_id1 == "s4") || (room_id2 == "s4") || (room_id3 == "s4") ) {
		rcnt2++;
	}
	if( (room_id1 == "s5") || (room_id2 == "s5") || (room_id3 == "s5") ) {
		rcnt2++;
	}
	if( (room_id1 == "s6") || (room_id2 == "s6") || (room_id3 == "s6") ) {
		rcnt2++;
	}
	
	if( ( (room_id1 == "s7") || (room_id2 == "s7") || (room_id3 == "s7") || (room_id == "s7") ) && (rcnt > 1) ) {
		alert("대회의실은 하나만 선택할 수 있습니다.");
		$("#room_"+room_id).prop("checked", false);
		if(room_id1 == room_id) {
			$("#room_id1").val("");
		} else if(room_id2 == room_id) {
			$("#room_id2").val("");
		} else if(room_id3 == room_id) {
			$("#room_id3").val("");
		}
		return false;
		
	} else if( (rcnt1 > 0) && (rcnt2 > 0) ) {
		alert("소회의실은 1~3 / 4~6끼리 중복선택가능합니다.");
		$("#room_"+room_id).prop("checked", false);
		
		if(room_id1 == room_id) {
			$("#room_id1").val("");
		} else if(room_id2 == room_id) {
			$("#room_id2").val("");
		} else if(room_id3 == room_id) {
			$("#room_id3").val("");
		}
		return false;
		
	} else if(rcnt > 3) {
		alert("대관은 최대3개까지 신청이 가능합니다.");
		$("#room_"+room_id).prop("checked", false);
		if(room_id1 == room_id) {
			$("#room_id1").val("");
		} else if(room_id2 == room_id) {
			$("#room_id2").val("");
		} else if(room_id3 == room_id) {
			$("#room_id3").val("");
		}
		return false;
	}
	
	return false;
	
}

//대관 신청 저장
function rent_Sendit() {
	var datexx = $("#datexx").val();
	var timexx = $("#timexx").val();
	var room_id1 = $("#room_id1").val();
	var room_id2 = $("#room_id2").val();
	var room_id3 = $("#room_id3").val();
	var name = $("#name").val();
	var mobile = $("#mobile").val();
	var company = $("#company").val();
	var people_cnt = $("#people_cnt").val();
	var content1 = $("#content1").val();
	var content2 = $("#content2").val();
	var etc = $("#etc").val();
	
	if($("#agree_check01").is(":checked") == false) {
		alert("개인정보수집이용에 동의해야 신청이 가능합니다.");
		return;
	}
	if($("#agree_check02").is(":checked") == false) {
		alert("시설대관지침에 동의해야 신청이 가능합니다.");
		return;
	}
	if(datexx == "") {
		alert("날짜를 선택해 주세요");
		return;
	}
	if(timexx == "") {
		alert("시간을 선택해 주세요");
		return;
	}
	if( (room_id1=="") && (room_id2=="") && (room_id3=="") ) {
		alert("대관가능장소를 선택해 주세요");
		return;
	}
	if(name == "") {
		alert("예약자명을 입력해 주세요");
		return;
	}
	if(mobile == "") {
		alert("휴대폰번호를 입력해 주세요");
		return;
	}
	if(company == "") {
		alert("업체명을 입력해 주세요");
		return;
	}
	if(people_cnt == "") {
		alert("예약인원을 입력해 주세요");
		return;
	}
	if(content1 == "") {
		alert("사용목적을 입력해 주세요");
		return;
	}
	
	
	$.ajax({
    	url:"<c:url value='/rent/save_rent.do'/>",
    	data:{ "datexx": datexx,
    		"timexx": timexx, "room_id1": room_id1,
    		"room_id2": room_id2, "room_id3": room_id3,
    		"name": name, "mobile": mobile,
    		"company": company, "people_cnt": people_cnt,
    		"content1": content1, "content2": content2,
    		"etc": etc },
    	dataType:'json',
    	type:'POST',
    	success: function(response){
            //대여디비처리 성공시
    		if(response.result == "Y") {
    			alert("대관신청이 완료되었습니다. 진행상태는 Mypage에서 확인가능합니다.");
    			location.replace("${pageContext.request.contextPath}/sub04/sub03_01.do");
    			
    		} else {
    			alert("저장에 실패했습니다. 다시 시도해 주세요.");
    			return false;
    		}
        
        },
    	error:function(data){
    		//alert('rent err');   
   		}
	});
	
	
}
</script>


<div class="typebox mb">
	<ul class="tabs list02">				
		<li class="current"><a href="<c:url value='/sub04/sub03_01.do'/>"> 대관신청안내</a></li>
		<li><a href="<c:url value='/member/mypage.do'/>">대관신청확인</a></li>
	</ul>
</div>

<!--대관신청-->
<h4 class="tit_dot mb20">대관신청유의사항</h4>
<div class="pointbox mb">
	<ul class="dot_li">
		<li>내부 행사 및 기타 이유로 인해 부득이하게 예약 취소될 경우가 있으니 <span class="ppTxt fwb">최소 3일전까지 예약</span>부탁드립니다.</li>
		<li><span class="ppTxt fwb">소회의실 1+2+3 / 소회의실 4+5+6으로 중복선택하여 확장사용 가능</span> 하며 예약일시를 선택하시면 대관가능장소가 표기됩니다.</li>
		<li><span class="ppTxt fwb">당일대관 예약은 온라인 예약 후 055-277-8413로 확인전화</span> 부탁드립니다.</li>
		<li><span class="ppTxt fwb">개인정보 수집이용약관 및 시설대관지침을 반드시 확인</span>해주세요.</li>
	</ul>
</div>


<form name="rend_frm" method="post" id="rend_frm" >
<input type="hidden" name="i_year" id="i_year" value="<%=thisYear%>" />
<input type="hidden" name="i_mon" id="i_mon" value="<%=thisMonth%>" />
<input type="hidden" name="room_id1" id="room_id1" value="" />
<input type="hidden" name="room_id2" id="room_id2" value="" />
<input type="hidden" name="room_id3" id="room_id3" value="" />
<input type="hidden" name="datexx" id="datexx" value="" />
<input type="hidden" name="timexx" id="timexx" value="" />
	
<div class="rentwrap mb">
	<div class="left">
		<div class="calanderbox mb">

			<div class="month_box">						
				<a href="#gpm" onclick="get_last_mon();" class="mon_btn btn_mon_prev"><span>이전달 이동</span></a>					
				<h4 class="mon_tit" id="now_ym"><%=thisYear%>.<%=thisMonth%></h4> 
				<a href="#gnm" onclick="get_next_mon();" class="mon_btn btn_mon_next"><span>다음달 이동</span></a>
			</div>

			<table class="cal_table">
				<caption class="hidden">2021-1 일정표(Schedule Table)</caption>
				<colgroup>
					<col style="width:14%">
					<col style="width:14%">
					<col style="width:14%">
					<col style="width:14%">
					<col style="width:14%">
					<col style="width:14%">
					<col style="width:14%">
				</colgroup>
				<thead>
					<tr>		
						<th scope="col" class="cDay0"><p class="isWeek">일</p></th>
						<th scope="col" class="cDay1"><p class="isWeek">월</p></th>
						<th scope="col" class="cDay2"><p class="isWeek">화</p></th>
						<th scope="col" class="cDay3"><p class="isWeek">수</p></th>
						<th scope="col" class="cDay4"><p class="isWeek">목</p></th>
						<th scope="col" class="cDay5"><p class="isWeek">금</p></th>
						<th scope="col" class="cDay6"><p class="isWeek">토</p></th>
					</tr>
				</thead>
				<tbody id="calendar_table">
					
				</tbody>
			</table>



			<div class="cal_date">
				<p class="none" id="cal_timeoff">날짜를 선택하시면 예약가능 시간이 표시됩니다.</p>
				<ul class="cal_date_list" id="cal_timeon" style="display:none;">
					<li><a href="#0900" id="time0900" onclick="select_datetime('0900');">09:00~09:30</a></li>
					<li><a href="#0930" id="time0930" onclick="select_datetime('0930');">09:30~10:00</a></li>
					<li><a href="#1000" id="time1000" onclick="select_datetime('1000');">10:00~10:30</a></li>
					<li><a href="#1030" id="time1030" onclick="select_datetime('1030');">10:30~11:00</a></li>
					<li><a href="#1100" id="time1100" onclick="select_datetime('1100');">11:00~11:30</a></li>
					<li><a href="#1130" id="time1130" onclick="select_datetime('1130');">11:30~12:00</a></li>
					<li><a href="#1200" id="time1200" onclick="select_datetime('1200');">12:00~12:30</a></li>
					<li><a href="#1230" id="time1230" onclick="select_datetime('1230');">12:30~13:00</a></li>
					<li><a href="#1300" id="time1300" onclick="select_datetime('1300');">13:00~13:30</a></li>
					<li><a href="#1330" id="time1330" onclick="select_datetime('1330');">13:30~14:00</a></li>
					<li><a href="#1400" id="time1400" onclick="select_datetime('1400');">14:00~14:30</a></li>
					<li><a href="#1430" id="time1430" onclick="select_datetime('1430');">14:30~15:00</a></li>
					<li><a href="#1500" id="time1500" onclick="select_datetime('1500');">15:00~15:30</a></li>
					<li><a href="#1530" id="time1530" onclick="select_datetime('1530');">15:30~16:00</a></li>
					<li><a href="#1600" id="time1600" onclick="select_datetime('1600');">16:00~16:30</a></li>
					<li><a href="#1630" id="time1630" onclick="select_datetime('1630');">16:30~17:00</a></li>
					<li><a href="#1700" id="time1700" onclick="select_datetime('1700');">17:00~17:30</a></li>
					<li><a href="#1730" id="time1730" onclick="select_datetime('1730');">17:30~18:00</a></li>
				</ul>
			</div>

		</div>
	</div>
	<div class="right">
		<div class="form_box">
			<h5>대관신청서작성</h5>
			<ul>
				<li><span class="fm_list">예약일시 <b class="ppTxt">*</b></span>
					<span class="fm_txt"><span id="set_datetime" class="txtin ppTxt fwb">예약일시를 선택해주세요.</span></span>
				</li>
				<li><span class="fm_list">대관가능장소 <b class="ppTxt">*</b></span>
					<span class="fm_txt">
						<p class="none" id="disp_room1">
							선택 가능한 대관장소가 없습니다.
						</p>
						<ul class="select_li" id="disp_room2" style="display:none;">
							<li class="fullcheck" id="disp_s1">	
								<input type="checkbox" name="room_s1" id="room_s1" value="s1" onclick="check_room('s1');" />
								<label for="room_s1">
									<dl>
										<dt>소회의실<span>1</span></dt>
										<dd>기자재없음</dd>
									</dl>
								</label>		
							</li>
							<li class="fullcheck" id="disp_s2">	
								<input type="checkbox" name="room_s2" id="room_s2" value="s2" onclick="check_room('s2');" />
								<label for="room_s2">
									<dl>
										<dt>소회의실 <span>2</span></dt>
										<dd>기자재없음</dd>
									</dl>
								</label>		
							</li>
							<li class="fullcheck" id="disp_s3">	
								<input type="checkbox" name="room_s3" id="room_s3" value="s3" onclick="check_room('s3');" />
								<label for="room_s3">
									<dl>
										<dt>소회의실 <span>3</span></dt>
										<dd>TV</dd>
									</dl>
								</label>		
							</li>
							<li class="fullcheck" id="disp_s4">	
								<input type="checkbox" name="room_s4" id="room_s4" value="s4" onclick="check_room('s4');" />
								<label for="room_s4">
									<dl>
										<dt>소회의실 <span>4</span></dt>
										<dd>기자재없음</dd>
									</dl>
								</label>		
							</li>
							<li class="fullcheck" id="disp_s5">	
								<input type="checkbox" name="room_s5" id="room_s5" value="s5" onclick="check_room('s5');" />
								<label for="room_s5">
									<dl>
										<dt>소회의실 <span>5</span></dt>
										<dd>기자재없음</dd>
									</dl>
								</label>		
							</li>
							<li class="fullcheck" id="disp_s6">	
								<input type="checkbox" name="room_s6" id="room_s6" value="s6" onclick="check_room('s6');" />
								<label for="room_s6">
									<dl>
										<dt>소회의실 <span>6</span></dt>
										<dd>TV</dd>
									</dl>
								</label>		
							</li>
							<li class="fullcheck long" id="disp_s7">	
								<input type="checkbox" name="room_s7" id="room_s7" value="s7" onclick="check_room('s7');" />
								<label for="room_s7">
									<dl>
										<dt>대회의실</dt>
										<dd>빔프로젝터, 스크린, 유선MIC(1), 무선MIC(2)</dd>
									</dl>
								</label>		
							</li>
						</ul>
						 <div><span class="redTxt fss">소회의실 1+2+3 / 소회의실 4+5+6으로 중복선택하여 확장사용 가능합니다.</span></div>
					
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
				<li><span class="fm_list">업체명 <b class="ppTxt">*</b></span>
					<span class="fm_txt"><label for="company" class="blind">업체명</label>
					<input type="text" name="company" class="input_txt w-col01" id="company" hname="업체명" value="" option="" maxlength="50" frequired="required" title="업체명 입력"/>					
					<div><span class="redTxt fss">대관신청확인을위해 정확히입력해주세요.</span></div></span>
				</li>
				
				<li><span class="fm_list">예약인원 <b class="ppTxt">*</b></span>
					<span class="fm_txt"><label for="people_cnt" class="blind">예약인원</label>
					<input type="number" name="people_cnt" class="input_txt w-col04" id="people_cnt" hname="예약인원" value="" frequired="required" title="예약인원 입력" onkeypress="return event.keyCode != 13;"></span> 
				</li>			
			
				<li><span class="fm_list">사용목적 <b class="ppTxt">*</b></span>
					<span class="fm_txt"><label for="content1" class="blind">사용목적</label>
					<input type="text" name="content1" class="input_txt w-col01" id="content1" hname="사용목적" value="" option="" frequired="required" title="사용목적 입력" onkeypress="return event.keyCode != 13;"></span>
				</li>
				<li><span class="fm_list">필요기자재</span>
					<span class="fm_txt"><label for="content2" class="blind">필요기자재</label>
					<input type="text" name="content2" class="input_txt w-col01" id="content2" hname="필요기자재" value="" option="" title="필요기자재 입력" /></span>
				</li>
				<li><span class="fm_list">문의사항</span>
					<span class="fm_txt"><label for="etc" class="blind">문의사항</label>
					<input type="text" name="etc" class="input_txt w-col01" id="etc" hname="문의사항" value="" option="" title="문의사항 입력" /></span>
				</li>
			</ul>
		</div>
		<div class="agree_warp mb20">
			<div class="agree_check">
				<input type="checkbox" name="privacy_agree1" id="agree_check01">
				<label for="agree_check01">개인정보수집이용동의</label>
				<a href="#privacy01" class="txt_info litebox">전문보기</a>
			</div>
			<div class="agree_check">
				<input type="checkbox" name="privacy_agree2" id="agree_check02">
				<label for="agree_check02">시설대관지침동의</label>
				<a href="#privacy02" class="txt_info litebox">전문보기</a>
			</div>
		</div>
		<div class="pointbox pointbox_w">
			<ul class="dot_li">
				<li>당일대관 예약은 온라인 예약 후 센터 사무실이나 055-277-8413로 확인전화 부탁드립니다.<br/>
					<span class="redTxt fss">※사전승인 필수 사전승인 가능시간(월~금, 9:00~18:00) 온라인 승인은 전일까지 가능</span></li>
				<li>사전 예약취소는 전일까지 가능합니다. </li>
				<li>승인이 완료된 후 이용 가능하며 관련 안내 문자로 발송 예정입니다. </li>
				<li>원활한 운영을 위해 예약시간 및 횟수는 제한될 수 있습니다.</li>
			</ul>
		</div>
	</div>
</div>


<div id="privacy01" class="no-display popinfo">
	<h1>개인정보 수집이용약관</h1>
	<div class="popcon">
		<%@ include file="/WEB-INF/jsp/egovframework/gntbsc/inc/privacy.jsp" %>
	</div>
</div>

<div id="privacy02" class="no-display popinfo">
	<h1>시설대관지침약관</h1>
	<div class="popcon">
		<%@ include file="/WEB-INF/jsp/egovframework/gntbsc/inc/rental_info.jsp" %>
	</div>
</div>

<div class="tac mb">
	<a href="#rents" class="btn_rd btn_big" onclick="rent_Sendit();">대관신청서 접수</a>
</div>
</form>

<!--대관신청 끝-->


			</div><!--con-->
		</div><!--subcon-->
	</div><!--subwrap-->





<%@ include file="/WEB-INF/jsp/egovframework/gntbsc/inc/footer.jsp" %>