<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="egovframework.com.cmm.service.EgovProperties" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<% pageContext.setAttribute("newLineChar", "\n"); %>
<%
String bodyckey = "false";
int m1 = 5;
int m2 = 1;
int m3 = 0;
%>

<jsp:include page="/WEB-INF/jsp/egovframework/gntbsc/wssms/top.jsp" flush="true" >
		<jsp:param name="bodyckey" value="<%=bodyckey%>"/>
</jsp:include>
<jsp:include page="/WEB-INF/jsp/egovframework/gntbsc/wssms/sub_top.jsp" flush="true" >
		<jsp:param name="bodyckey" value="<%=bodyckey%>"/>
		<jsp:param name="m1" value="<%=m1%>"/>
		<jsp:param name="m2" value="<%=m2%>"/>
		<jsp:param name="m3" value="<%=m3%>"/>
</jsp:include>

<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>

<script type="text/javaScript">
$(document).ready(function(){	
	var resultMsg = '${resultMsg}';
	
	if(resultMsg != "") {
		alert(resultMsg);
	}
	
	var memto_gbn = "${memto_result.memto_gbn}";
	
	if(memto_gbn=="2") {
		$("#mento_gbn2_id").show();
	} else if(memto_gbn=="3") {
		$("#mento_gbn2_id").show();
	} else {
		$("#mento_gbn2_id").hide();
	}
		
});

function show_sd(){ 
	$("#room_wdate").datepicker('show');
} 

$(function() {    
	$( "#room_wdate" ).datepicker({
		dateFormat: "yy-mm-dd",
		changeMonth: true,
		changeYear: true,
		showOtherMonths: true ,
		selectOtherMonths: true,
		showMonthAfterYear: true ,
		monthNamesShort: [ "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12" ],
		monthNames:[ "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12" ],
		beforeShowDay: function(date){
			var day = date.getDay();
			return [(day != 0 && day != 6)];
		}
	}); 
	
});

function fn_egov_select_List() {
	 document.submitParam.action = "<c:url value='/sb05/sub01.do'/>";
	 document.submitParam.submit();
}

function change_status(idx) {
	var status = $("#status").val();
	
	if(confirm('진행상태 변경처리 하시겠습니까? \n\n')) {
		$.ajax({
			url : "<c:url value='/memto/changeStatusAjax.do'/>",
			data : {
				"idx" : idx, "status" : status
			},
			dataType : 'json',
			type : 'POST',
			success : function(response) {
				//alert(response);
				if(response.result == "N") {
					alert("저장에 실패했습니다");
				} else {
					alert("상태가 변경되었습니다.");
					save_memto_gbn();
					
					location.reload();
				}

			},
			error : function(data) {
				return;
			}
		});
	}
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

function mento_search() {
	var major1 = "";
	var major2 = "";
	var search_type = "0";
	var search_text = "";
	
	$.ajax({
		url : "<c:url value='/member/selectsMentoAjax.do'/>",
		data : {
			"major1" : major1, "major2" : major2, "search_type" : search_type, "search_text" : search_text
		},
		dataType : 'json',
		type : 'POST',
		success : function(response) {
			//alert(response);
			optionitem = response.optionlist;
			$("#mento_list").html(optionitem);

		},
		error : function(data) {
			return;
		}
	});
}

function mento_search2() {
	var major1 = $("#s_major11").val();
	var major2 = $("#s_major12").val();
	var search_type = $("#search_type").val();
	var search_text = $("#search_text").val();
	
	$.ajax({
		url : "<c:url value='/member/selectsMentoAjax.do'/>",
		data : {
			"major1" : major1, "major2" : major2, "search_type" : search_type, "search_text" : search_text
		},
		dataType : 'json',
		type : 'POST',
		success : function(response) {
			//alert(response);
			optionitem = response.optionlist;
			$("#mento_list").html(optionitem);

		},
		error : function(data) {
			return;
		}
	});
}

function mento_init() {
	$("#s_major11").val("");
	$("#s_major12").val("");
	$("#search_type").val("0");
	$("#search_text").val("");
	
	mento_search2();
	
}

function select_mento(){
	var midx = $("#midx").val();
	var sele_idx = "";
	var item_cnt = 0;
	$("input[name=menidx]:checked").each(function() {
		sele_idx = $(this).val();
		item_cnt++;
	});
	if(item_cnt == 0) {
		alert("적용할 멘토를 선택하세요.");
	} else {
		var ments = sele_idx.split("|");
		$("#mento").val(ments[0]);
		$("#memto_nm").val(ments[1]);
		var mento = ments[0];
		var mobile = ments[2];
		
		$.ajax({
			url : "<c:url value='/sb05/updateMentos.do'/>",
			data : {
				"idx" : midx, "mento" : mento, "mobile" : mobile
			},
			dataType : 'json',
			type : 'POST',
			success : function(response) {
				//alert(response);
				alert("멘토를 설정했습니다.");
				smento_close();
			},
			error : function(data) {
				return;
			}
		});
		
	}
}

//멘토검색 닫기
function smento_close() {
	$("#view_mentor_list").hide();
	$('.litebox-overlay').hide();
	$('.litebox-preload').remove();
	$("#view_mentor_list").remove();
}

function comment_proc() {
	var counsel_idx = $("#counsel_idx").val();
	var content1 = $("#content1").val();
	
	if(content1 == "") {
		return false;
	}
	
	if(confirm('저장 하시겠습니까?')) {
		$.ajax({
			url : "<c:url value='/mtcmt/comt4_UpdtAjax.do'/>",
			data : {
				"counsel_idx" : counsel_idx, "content1" : content1 
			},
			dataType : 'json',
			type : 'POST',
			success : function(response) {
				//alert(response.comment);
				if(response.comment == "N") {
					alert("저장에 실패했습니다");
				} else {
					$("#comment_form").before(response.comment);
					$("#content1").val("");
				}
			},
			error : function(data) {
				return false;
			}
		});
	}
	
}

function delete_comment(idx) {
	
	if(confirm('삭제 하시겠습니까?')) {
		$.ajax({
			url : "<c:url value='/mtcmt/comt4_DelAjax.do'/>",
			data : {
				"idx" : idx
			},
			dataType : 'json',
			type : 'POST',
			success : function(response) {
				//alert(response.comment);
				if(response.result == "N") {
					alert("삭제에 실패했습니다");
				} else {
					//alert(response.result);
					$("div").remove("#comment_"+idx);
					$("div").remove("#ecomment_form_"+idx);
				}
			},
			error : function(data) {
				return;
			}
		});
	}
}

function modify_comment(idx) {
	
	$("#ecomment_form_"+idx).show();
	
}

function comment_eproc(idx) {
	var content1 = $("#econtent1_"+idx).val();
	var counsel_idx = $("#counsel_idx").val();
	
	if(content1 == "") {
		return false;
	}
	
	if(confirm('수정저장 하시겠습니까?')) {
		$.ajax({
			url : "<c:url value='/mtcmt/comt4_eUpdtAjax.do'/>",
			data : {
				"idx" : idx, "counsel_idx" : counsel_idx , "content1" : content1 
			},
			dataType : 'json',
			type : 'POST',
			success : function(response) {
				if(response.comment == "N") {
					alert("저장에 실패했습니다");
				} else {
					$("#comment_"+idx).html(response.comment);
					$("#ecomment_form_"+idx).html(response.ecoment);
					$("#ecomment_form_"+idx).hide();
				}
			},
			error : function(data) {
				return false;
			}
		});
	}
	
}

function check_memto_gbn(gbn) {
	
	if(gbn == "2") {
		$("#mento_gbn2_id").show();
	} else if(gbn == "3") {
		$("#mento_gbn2_id").show();
	} else {
		$("#mento_gbn2_id").hide();
		$("#room_wdate").val("");
		$("#room_wtime1").val("0930");
		$("#room_wtime2").val("1000");
	}
	
	//save_memto_gbn();
	
}

function check_room_gbn() {
	//save_memto_gbn();
}

function save_memto_gbn() {
	var midx = $("#midx").val();
	var memto_gbn = "";
	var room_gbn = "";
	var room_wdate = $("#room_wdate").val();
	var room_wtime1 = $("#room_wtime1").val();
	var room_wtime2 = $("#room_wtime2").val();
	
	if($("#memto_gbn").is(":checked")) {
		memto_gbn = "1";
	} else if($("#memto_gbn2").is(":checked")) {
		memto_gbn = "2";
	} else if($("#memto_gbn3").is(":checked")) {
		memto_gbn = "3";
	}
	
	if($("#room_gbn").is(":checked")) {
		room_gbn = "N";
	} else if($("#room_gbn2").is(":checked")) {
		room_gbn = "Y";
	}
	
	$.ajax({
		url : "<c:url value='/sb05/updateMentoGbn.do'/>",
		data : {
			"idx" : midx, "memto_gbn" : memto_gbn, "room_gbn" : room_gbn, "room_wdate" : room_wdate, "room_wtime1" : room_wtime1, "room_wtime2" : room_wtime2
		},
		dataType : 'json',
		type : 'POST',
		success : function(response) {
			//alert(response.optionlist);
		},
		error : function(data) {
			return;
		}
	});
}
</script>

<form name="submitParam" method="post">
</form>

<h4 class="tit_dot">상담글 확인</h4>

<input type="hidden" id="midx" value="<c:out value='${memto_result.idx}'/>" />
<div class="board_view board_anwser bmb">
	<div class="bgtab">
		<div class="half">
			<h3 class="dpi mr10 fsb">
				<b class="ylTxt">
					<c:choose>
						<c:when test="${memto_result.status eq 1}">
							[접수]
						</c:when>
						<c:when test="${memto_result.status eq 2}">
							[접수완료]
						</c:when>
						<c:when test="${memto_result.status eq 3}">
							[상담중]
						</c:when>
						<c:when test="${memto_result.status eq 4}">
							[상담완료]
						</c:when>
						<c:otherwise>
							[처리완료]
						</c:otherwise>
					</c:choose>
				</b>  
				<b class="blTxt">
				[<c:out value='${memto_result.us_major11_nm}'/>]</b> <c:out value='${memto_result.title}'/>
				</h3>
			<p class="dpi">작성일 : <c:out value='${memto_result.reg_date}'/></p>
		</div>
		<div class="half">
			<ul class="dpi_li tar">
				<li> 진행상태 
					<select name="status" title="진행상태" size="1" class="" id="status" >
						<option value="1" <c:if test="${memto_result.status eq 1}">selected</c:if>>접수</option>
						<option value="2" <c:if test="${memto_result.status eq 2}">selected</c:if>>접수완료</option>
						<option value="3" <c:if test="${memto_result.status eq 3}">selected</c:if>>상담 중</option>
						<option value="4" <c:if test="${memto_result.status eq 4}">selected</c:if>>상담완료</option>
						<option value="5" <c:if test="${memto_result.status eq 5}">selected</c:if>>처리완료</option>
					</select>
					로 
					<a href="javascript:change_status('${memto_result.idx}');" class="btn_sumit3">변경(저장)</a>
				</li>
				<li><a href="javascript:fn_egov_select_List();" class="btn_sumit2">목록으로</a></li>
			</ul>
		</div>
	</div>

	<div class="mentoring_info mb20">
		<table>
			<colgroup>
				<col class="w15">
				<col class="w35">
				<col class="w15">
				<col class="w35">
			</colgroup>
			<tr>
				<th scope="col">접수번호</th>
				<td colspan="3"><c:out value='${memto_result.idx}'/></td>
			</tr>
			<tr>
				<th scope="col">문의분야</th>
				<td>
					<select name="us_major11" title="문의대분류" size="1" class="" id="us_major11">
						<option value="1" <c:if test="${memto_result.us_major11 eq 1}">selected</c:if>>창업</option>
						<option value="2" <c:if test="${memto_result.us_major11 eq 2}">selected</c:if>>마케팅/홍보</option>
						<option value="3" <c:if test="${memto_result.us_major11 eq 3}">selected</c:if>>투자</option>
						<option value="4" <c:if test="${memto_result.us_major11 eq 4}">selected</c:if>>경영심화</option>
						<option value="5" <c:if test="${memto_result.us_major11 eq 5}">selected</c:if>>관광</option>
						<option value="6" <c:if test="${memto_result.us_major11 eq 6}">selected</c:if>>제품디자인</option>
					</select>
					<input type="text" value="<c:out value='${memto_result.us_major12_nm}'/> <c:out value='${memto_result.us_major1_etc}'/>" class="w50" readonly />
				</td>
				<th scope="col">멘토링방식</th>
				<td>
					<div class="txtin">
						<label class="mr10" for="memto_gbn"> <input type="radio" name="memto_gbn" id="memto_gbn" value="1" onclick="check_memto_gbn('1');" <c:if test="${memto_result.memto_gbn eq 1}">checked</c:if>/> 서면</label>
						<label class="mr10" for="memto_gbn2"> <input type="radio" name="memto_gbn" id="memto_gbn2" value="2" onclick="check_memto_gbn('2');" <c:if test="${memto_result.memto_gbn eq 2}">checked</c:if>/> 화상</label>
						<label class="mr10" for="memto_gbn3"> <input type="radio" name="memto_gbn" id="memto_gbn3" value="3" onclick="check_memto_gbn('3');" <c:if test="${memto_result.memto_gbn eq 3}">checked</c:if>/> 대면</label> 
					</div>
				</td>
			</tr>
		<!--멘토링방식-화상에서 센터회의실사용할경우만 아래내용표기-->
			<tr id="mento_gbn2_id" style="display:none;">
				<th scope="col">화상(센터회의실사용)</th>
					<td colspan="3"> 
						<div class="w30 dpi fl mr">						
							<label class="mr10" for="room_gbn"> <input type="radio" name="room_gbn" id="room_gbn" value="N" onclick="check_room_gbn();" <c:if test="${memto_result.room_gbn eq 'N'}">checked</c:if>/> 사용안함</label>
							<label class="mr10" for="room_gbn2"> <input type="radio" name="room_gbn" id="room_gbn2" value="Y" onclick="check_room_gbn();" <c:if test="${memto_result.room_gbn eq 'Y'}">checked</c:if>/> 사용함</label>
						</div>
						<div class="data_select w50 fl">						
							<input type="text" name="room_wdate" id="room_wdate" class="date_box" value="<c:out value='${memto_result.room_wdate}'/>" onchange="check_room_gbn();" /><button type="button" class="btn_cal" id="start_date_btn" onclick="show_sd();"></button>
							<select name="room_wtime1" title="멘토링시간" size="1" class="w20" id="room_wtime1" onchange="check_room_gbn();">
								<option value="0930" <c:if test="${memto_result.room_wtime1 eq '0930'}">selected</c:if>>09:30</option>
								<option value="1000" <c:if test="${memto_result.room_wtime1 eq '1000'}">selected</c:if>>10:00</option>
								<option value="1030" <c:if test="${memto_result.room_wtime1 eq '1030'}">selected</c:if>>10:30</option>
								<option value="1100" <c:if test="${memto_result.room_wtime1 eq '1100'}">selected</c:if>>11:00</option>
								<option value="1330" <c:if test="${memto_result.room_wtime1 eq '1330'}">selected</c:if>>13:30</option>
								<option value="1400" <c:if test="${memto_result.room_wtime1 eq '1400'}">selected</c:if>>14:00</option>
								<option value="1430" <c:if test="${memto_result.room_wtime1 eq '1430'}">selected</c:if>>14:30</option>
								<option value="1500" <c:if test="${memto_result.room_wtime1 eq '1500'}">selected</c:if>>15:00</option>
								<option value="1530" <c:if test="${memto_result.room_wtime1 eq '1530'}">selected</c:if>>15:30</option>
								<option value="1600" <c:if test="${memto_result.room_wtime1 eq '1600'}">selected</c:if>>16:00</option>
								<option value="1630" <c:if test="${memto_result.room_wtime1 eq '1630'}">selected</c:if>>16:30</option>
							</select>
							<select name="room_wtime2" title="멘토링시간" size="1" class="w20" id="room_wtime2" onchange="check_room_gbn();">
								<option value="1000" <c:if test="${memto_result.room_wtime2 eq '1000'}">selected</c:if>>10:00</option>
								<option value="1030" <c:if test="${memto_result.room_wtime2 eq '1030'}">selected</c:if>>10:30</option>
								<option value="1100" <c:if test="${memto_result.room_wtime2 eq '1100'}">selected</c:if>>11:00</option>
								<option value="1130" <c:if test="${memto_result.room_wtime2 eq '1130'}">selected</c:if>>11:30</option>
								<option value="1200" <c:if test="${memto_result.room_wtime2 eq '1200'}">selected</c:if>>12:00</option>
								<option value="1230" <c:if test="${memto_result.room_wtime2 eq '1230'}">selected</c:if>>12:30</option>
								<option value="1300" <c:if test="${memto_result.room_wtime2 eq '1300'}">selected</c:if>>13:00</option>
								<option value="1330" <c:if test="${memto_result.room_wtime2 eq '1330'}">selected</c:if>>13:30</option>
								<option value="1400" <c:if test="${memto_result.room_wtime2 eq '1400'}">selected</c:if>>14:00</option>
								<option value="1430" <c:if test="${memto_result.room_wtime2 eq '1430'}">selected</c:if>>14:30</option>
								<option value="1500" <c:if test="${memto_result.room_wtime2 eq '1500'}">selected</c:if>>15:00</option>
								<option value="1530" <c:if test="${memto_result.room_wtime2 eq '1530'}">selected</c:if>>15:30</option>
								<option value="1600" <c:if test="${memto_result.room_wtime2 eq '1600'}">selected</c:if>>16:00</option>
								<option value="1630" <c:if test="${memto_result.room_wtime2 eq '1630'}">selected</c:if>>16:30</option>
								<option value="1700" <c:if test="${memto_result.room_wtime2 eq '1700'}">selected</c:if>>17:00</option>
								<option value="1730" <c:if test="${memto_result.room_wtime2 eq '1730'}">selected</c:if>>17:30</option>
							</select>
							<p class="redTxt fss mt5">센터회의실 사용일 경우에만 관리자가 대회의실 대관예약을 한뒤 접수완료를 진행합니다.</p>
						</div>
				
				</td>
			</tr>
		  <!--멘토링방식-화상에서 센터회의실사용할경우만 위내용표기-->
			<tr>
				<th scope="col">희망멘토</th>
				<td><b class="redTxt fwb"><c:out value='${memto_result.hope_memto_nm}'/></b> (<c:out value='${memto_result.hope_memto_mobile}'/>)</td>				
				<th scope="col">매칭멘토</th>
				<td>
					<input type="hidden" name="mento" id="mento" value="<c:out value='${memto_result.memto}'/>" />
					<input type="text" id="memto_nm" name="memto_nm" value="<c:out value='${memto_result.memto_nm}'/>" class="w40"/>
					<a href="#view_mentor_list" class="btn_sumit2 litebox" onclick="mento_search()">대체멘토검색</a>
				</td>				
			</tr>
		</table>		
	</div>
	

	<div class="mentoring_info">
		<table>			
			<caption>기업정보 표가 들어갑니다.</caption>
			<colgroup>
				<col class="w15">
				<col class="w35">
				<col class="w15">
				<col class="w35">
			</colgroup>
			<tbody>			
		
				<tr>
					<th scope="col">작성자</th>
					<td><c:out value='${memto_result.us_name}'/></td>
					<th scope="col">휴대전화</th>
					<td><c:out value='${memto_result.us_mobile}'/></td>
				</tr>
				<tr>
					<th scope="col">이메일</th>
					<td><c:out value='${memto_result.us_email}'/></td>
					<th scope="col">멘토링방식</th>
					<td>
						<b class="blTxt fwb">희망일시 : 
						<c:choose>
							<c:when test="${memto_result.memto_gbn eq 1}">
								서면
							</c:when>
							<c:when test="${memto_result.memto_gbn eq 2}">
								화상
							</c:when>
							<c:otherwise>
								대면
							</c:otherwise>
						</c:choose>  
						<c:if test="${memto_result.memto_gbn eq 2}">
						/ 
						<c:out value="${memto_result.room_date}"/> <c:out value="${memto_result.room_time1}"/>~<c:out value="${memto_result.room_time2}"/> / 
							<c:choose>
								<c:when test="${memto_result.room_gbn eq 'Y'}">
									센터대회의실사용
								</c:when>
								<c:otherwise>
									센터대회의실사용안함
								</c:otherwise>
							</c:choose>   / 참석인원 <c:out value="${memto_result.att_cnt}"/> 명
						</c:if>
						<c:if test="${memto_result.memto_gbn eq 3}">
						/ 
						<c:out value="${memto_result.room_date}"/> <c:out value="${memto_result.room_time1}"/>~<c:out value="${memto_result.room_time2}"/> / 
							<c:choose>
								<c:when test="${memto_result.room_gbn eq 'Y'}">
									센터대회의실사용
								</c:when>
								<c:otherwise>
									센터대회의실사용안함
								</c:otherwise>
							</c:choose>   / 참석인원 <c:out value="${memto_result.att_cnt}"/> 명
						</c:if>
						</b> <br />
						<b class="redTxt fwb">확정일시 : 
						<c:choose>
							<c:when test="${memto_result.memto_gbn eq 1}">
								서면
							</c:when>
							<c:when test="${memto_result.memto_gbn eq 2}">
								화상
							</c:when>
							<c:otherwise>
								대면
							</c:otherwise>
						</c:choose>  
						<c:if test="${memto_result.memto_gbn eq 2}">
						/ 
						<c:out value="${memto_result.room_wdate}"/> <c:out value="${memto_result.room_wtime1}"/>~<c:out value="${memto_result.room_wtime2}"/> / 
							<c:choose>
								<c:when test="${memto_result.room_gbn eq 'Y'}">
									센터대회의실사용
								</c:when>
								<c:otherwise>
									센터대회의실사용안함
								</c:otherwise>
							</c:choose>   / 참석인원 <c:out value="${memto_result.att_cnt}"/> 명
						</c:if>
						<c:if test="${memto_result.memto_gbn eq 3}">
						/ 
						<c:out value="${memto_result.room_wdate}"/> <c:out value="${memto_result.room_wtime1}"/>~<c:out value="${memto_result.room_wtime2}"/> / 
							<c:choose>
								<c:when test="${memto_result.room_gbn eq 'Y'}">
									센터대회의실사용
								</c:when>
								<c:otherwise>
									센터대회의실사용안함
								</c:otherwise>
							</c:choose>   / 참석인원 <c:out value="${memto_result.att_cnt}"/> 명
						</c:if>
						</b>
						
					</td><!--화상멘토링일경우 희망일시표기-->
				</tr>			
				<tr>
					<th scope="col">기업명</th>
					<td><b class="redTxt">
						<c:choose>
							<c:when test="${memto_result.us_buss_gbn eq 1}">
								[도내]
							</c:when>
							<c:when test="${memto_result.us_buss_gbn eq 2}">
								[예비]
							</c:when>
							<c:otherwise>
								[입주]
							</c:otherwise>
						</c:choose>  
						</b><c:out value='${memto_result.us_company}'/></td>
					<th scope="col">직급</th>
					<td><c:out value='${memto_result.us_position}'/></td>
				</tr>
				<tr>
					<th scope="col">사업자번호</th>
					<td><c:out value='${memto_result.us_saupno}'/></td>
					<th scope="col">설립연도</th>
					<td><c:out value='${memto_result.us_makeyear}'/></td>
				</tr>
				<tr>
					<th scope="col">기업유형</th>
					<td colspan="3"><c:out value='${memto_result.us_uptaex}'/></td>			
				</tr>			
				<tr>
					<th scope="col">소재지</th>
					<td colspan="3"><c:out value="${memto_result.us_addrxx}"/> <c:out value="${memto_result.us_addres}"/></td>			
				</tr>
				<tr>
					<th scope="col">문의분야</th>
					<td colspan="3"><c:out value="${memto_result.us_major11_nm}"/> / <c:out value="${memto_result.us_major12_nm}"/>
						<c:if test="${memto_result.us_major12_nm eq '기타'}"><c:out value="${memto_result.us_major1_etc}"/></c:if>
					</td>			
				</tr>
			</tbody>
		</table>
	</div>
	<div class="board_view_con">
		<div class="editor_view">
				<c:out value="${memto_result.contentx}" escapeXml="false" />
		</div>
	</div>

	<div class="board_view_file">
		<p class="tit">첨부파일</p>
		<div class="file_box">				
			<p class="file_each">
				<c:if test="${!empty memto_result.userfile1}">
				<a href="#" class="btn_sumit" onclick="window.open(encodeURI('<c:url value='/download/downloadFile.do?'/>requestedFile=${memto_result.userfile1}&dFileName=${memto_result.userfile1}'))"><c:out value="${memto_result.userfile1}"/> 다운로드</a>
				</c:if>
				<c:if test="${!empty memto_result.userfile2}">
				<br /><a href="#" class="btn_sumit" onclick="window.open(encodeURI('<c:url value='/download/downloadFile.do?'/>requestedFile=${memto_result.userfile2}&dFileName=${memto_result.userfile2}'))"><c:out value="${memto_result.userfile2}"/> 다운로드</a>
				</c:if>
				<c:if test="${!empty memto_result.userfile3}">
				<br /><a href="#" class="btn_sumit" onclick="window.open(encodeURI('<c:url value='/download/downloadFile.do?'/>requestedFile=${memto_result.userfile3}&dFileName=${memto_result.userfile3}'))"><c:out value="${memto_result.userfile3}"/> 다운로드</a>
				</c:if>
				<c:if test="${empty memto_result.userfile1 and empty memto_result.userfile2 and empty memto_result.userfile3}">
					첨부파일이 없습니다.
				</c:if>
			</p>
		
		</div>
	</div>
	
	<div class="board_view_link">
		<p class="tit">관련링크</p>
		<div class="file_box">
			<c:choose>
					<c:when test="${!empty memto_result.link1}">
						<a href="<c:out value="${memto_result.link1}"/>" target="_blank"><c:out value="${memto_result.link1}"/></a>
					</c:when>
					<c:when test="${!empty memto_result.link2}">
						<a href="<c:out value="${memto_result.link2}"/>" target="_blank"><c:out value="${memto_result.link2}"/></a>
					</c:when>
					<c:when test="${!empty memto_result.link3}">
						<a href="<c:out value="${memto_result.link3}"/>" target="_blank"><c:out value="${memto_result.link3}"/></a>
					</c:when>
					<c:otherwise>
						관련링크가 없습니다.
					</c:otherwise>
				</c:choose>
		</div>
	</div>

	<c:forEach var="result3" items="${coment_list}" varStatus="status">
	<div class="board_comment" id="comment_<c:out value='${result3.idx}'/>">
		<div class="comment_top">	
			<p class="tit"><c:out value="${result3.w_name}"/> <span>작성일 : <c:out value="${result3.reg_date}"/></span></p>
			<ul>
				<li><a href="javascript:modify_comment('${result3.idx}')" class="btn_edit" >수정</a></li>
				<li><a href="javascript:delete_comment('${result3.idx}');" >삭제</a></li>
			</ul>
		</div>
		<div class="comment_box">				
			<p>${fn:replace(result3.content1, newLineChar, "<br/>")}</p>
		</div>
	</div>
	<div class="board_comment" id="ecomment_form_<c:out value='${result3.idx}'/>" style="display:none;">
		<div class="comment_box">				
			<textarea name="econtent1" id="econtent1_<c:out value='${result3.idx}'/>" class="textarea" wrap="hard"><c:out value="${result3.content1}" escapeXml="false" /></textarea>
			<button type="button" onclick="comment_eproc('${result3.idx}');" >저장</button>
		</div>
	</div>
	</c:forEach>
	
	<form name="comment_form" id="comment_form" method="post" >
	<input type="hidden" id="counsel_idx" value="<c:out value='${memto_result.idx}'/>" />
	<div class="board_comment">
		<div class="comment_top">	
			<p class="tit">
				<input type="text" name="w_name" id="w_name" class="input_txt" value="<c:out value='${user.us_name}'/>" readonly />
			</p>
		</div>
		<div class="comment_box">				
			<textarea name="content1" id="content1" class="textarea" wrap="hard"></textarea>
			<button type="button" onclick="comment_proc();" >저장</button>
		</div>
	</div>
	</form>
	
	<!--//board_comment-->


	
<!-- 이전글 다음글은 관리자만 확인 가능
	<div class="board_view_bottom">
		<p class="tit"><span class="prev">이전글</span></p>
		<div class="link">		
			이전글이 없습니다.
		</div>
	</div>
	<div class="board_view_bottom right">
		<p class="tit"><span class="next">다음글</span></p>
		<div class="link">			
			<a href="#">다음글 제목이 들어갑니다.</a>
		</div>
	</div>
이전글 다음글은 관리자만 확인 가능-->


</div>

<!--설문지 내용-->
<c:if test="${memto_result.status eq '5'}">
<div id="survey" class="view_survey">
	<div class="survey_top">
		<h1>멘토링 만족도 설문조사</h1>
		<p>멘토평점: <b><fmt:formatNumber value="${msvo.apoint}" pattern=".00"/></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		      멘토단시스템평점: <b><fmt:formatNumber value="${msvo.apoint2}" pattern=".00"/></b></p>
	</div>
	<div class="mentoring_info">
		<table>			
			<caption>기업정보 표가 들어갑니다.</caption>
			<colgroup>
				<col class="w20">
				<col class="w30">
				<col class="w20">
				<col class="w30">
			</colgroup>
			<tbody>
				<tr>
					<th scope="col">이름</th>
					<td><c:out value='${msvo.w_name}'/> (<c:out value='${msvo.w_mobile}'/>)</td>
					<th scope="col">담당멘토</th>
					<td><c:out value='${memto_result.memto_nm}'/></td>
				</tr>
				<tr>
					<th scope="col">기업명</th>
					<td><b class="redTxt">
						<c:choose>
							<c:when test="${memto_result.us_buss_gbn eq 1}">
								[도내]
							</c:when>
							<c:when test="${memto_result.us_buss_gbn eq 2}">
								[예비]
							</c:when>
							<c:otherwise>
								[입주]
							</c:otherwise>
						</c:choose>
					</b><c:out value="${memto_result.us_company}"/></td>
					<th scope="col">멘토링일자</th>
					<td><b class="redTxt">
						<c:choose>
							<c:when test="${memto_result.memto_gbn eq 1}">
								서면
							</c:when>
							<c:when test="${memto_result.memto_gbn eq 2}">
								화상
							</c:when>
							<c:otherwise>
								대면
							</c:otherwise>
						</c:choose>
						<c:if test="${memto_result.memto_gbn eq 2}">
					 / <c:out value="${memto_result.room_date}"/> <c:out value="${memto_result.room_time1}"/>~<c:out value="${memto_result.room_time2}"/> / 
					 		<c:choose>
								<c:when test="${memto_result.room_gbn eq 'Y'}">
									센터대회의실사용
								</c:when>
								<c:otherwise>
									센터대회의실사용안함
								</c:otherwise>
							</c:choose> 
					 	</c:if>
						<c:if test="${memto_result.memto_gbn eq 3}">
					 / <c:out value="${memto_result.room_date}"/> <c:out value="${memto_result.room_time1}"/>~<c:out value="${memto_result.room_time2}"/> / 
					 		<c:choose>
								<c:when test="${memto_result.room_gbn eq 'Y'}">
									센터대회의실사용
								</c:when>
								<c:otherwise>
									센터대회의실사용안함
								</c:otherwise>
							</c:choose> 
					 	</c:if>
					 </b></td>
				</tr>				
			</tbody>
		</table>
	</div>
	<div class="survey_pop">
		<p class="tit mb20">아래는 멘토에 대한 설문조사입니다. <span class="mEnter">하단의 설문지를 읽고 해당하는 곳에 <span class="ppTxt fwb">체크표시</span>를 해주세요.</span></p>
		
		<div class="survey_chart mb">
			<div class="box">
				<h2><b>01</b>담당 멘토는 내가 이해하기 쉽게끔 전반적인 사항을 상세히 설명 해주었다.</h2>
				<ul class="sur_check">
					<li>
						<input type="radio" name="srv01" id="surv01_01" class="" disabled value="5" <c:if test="${msvo.ans_1 eq '5'}">checked</c:if> />
						<label for="surv01_01">매우 그렇다</label>		
					</li>
					<li>
						<input type="radio" name="srv01" id="surv01_02" class="" disabled value="4" <c:if test="${msvo.ans_1 eq '4'}">checked</c:if> />
						<label for="surv01_02">그렇다</label>		
					</li>
					<li>
						<input type="radio" name="srv01" id="surv01_03" class="" disabled value="3" <c:if test="${msvo.ans_1 eq '3'}">checked</c:if> />
						<label for="surv01_03">보통이다</label>		
					</li>
					<li>
						<input type="radio" name="srv01" id="surv01_04" class="" disabled value="2" <c:if test="${msvo.ans_1 eq '2'}">checked</c:if> />
						<label for="surv01_04">아니다</label>		
					</li>
					<li>
						<input type="radio" name="srv01" id="surv01_05" class="" disabled value="1" <c:if test="${msvo.ans_1 eq '1'}">checked</c:if> />
						<label for="surv01_05">매우 아니다</label>		
					</li>
				</ul>
			</div>

			<div class="box">
				<h2><b>02</b>담당 멘토는 나의 문의(요구)사항을 잘 이해하고 그에 맞는 대책안을 주었다.</h2>
				<ul class="sur_check">
					<li>
						<input type="radio" name="srv02" id="surv02_01" class="" disabled <c:if test="${msvo.ans_2 eq '5'}">checked</c:if> />
						<label for="surv02_01">매우 그렇다</label>		
					</li>
					<li>
						<input type="radio" name="srv02" id="surv02_02" class="" disabled <c:if test="${msvo.ans_2 eq '4'}">checked</c:if> />
						<label for="surv02_02">그렇다</label>		
					</li>
					<li>
						<input type="radio" name="srv02" id="surv02_03" class="" disabled <c:if test="${msvo.ans_2 eq '3'}">checked</c:if> />
						<label for="surv02_03">보통이다</label>		
					</li>
					<li>
						<input type="radio" name="srv02" id="surv02_04" class="" disabled <c:if test="${msvo.ans_2 eq '2'}">checked</c:if> />
						<label for="surv02_04">아니다</label>		
					</li>
					<li>
						<input type="radio" name="srv02" id="surv02_05" class="" disabled <c:if test="${msvo.ans_2 eq '1'}">checked</c:if> />
						<label for="surv02_05">매우 아니다</label>		
					</li>
				</ul>
			</div>

			<div class="box">
				<h2><b>03</b>담당 멘토는 전문성과 책임감을 가지고 멘토링에 응하였다.</h2>
				<ul class="sur_check">
					<li>
						<input type="radio" name="srv03" id="surv03_01" class="" disabled <c:if test="${msvo.ans_3 eq '5'}">checked</c:if> />
						<label for="surv03_01">매우 그렇다</label>		
					</li>
					<li>
						<input type="radio" name="srv03" id="surv03_02" class="" disabled <c:if test="${msvo.ans_3 eq '4'}">checked</c:if> />
						<label for="surv03_02">그렇다</label>		
					</li>
					<li>
						<input type="radio" name="srv03" id="surv03_03" class="" disabled <c:if test="${msvo.ans_3 eq '3'}">checked</c:if> />
						<label for="surv03_03">보통이다</label>		
					</li>
					<li>
						<input type="radio" name="srv03" id="surv03_04" class="" disabled <c:if test="${msvo.ans_3 eq '2'}">checked</c:if> />
						<label for="surv03_04">아니다</label>		
					</li>
					<li>
						<input type="radio" name="srv03" id="surv03_05" class="" disabled <c:if test="${msvo.ans_3 eq '1'}">checked</c:if> />
						<label for="surv03_05">매우 아니다</label>		
					</li>
				</ul>
			</div>

			<div class="box">
				<h2><b>04</b>담당 멘토를 다른 사람(기업)에 추천할 의향이 있다.</h2>
				<ul class="sur_check">
					<li>
						<input type="radio" name="srv04" id="surv04_01" class="" disabled <c:if test="${msvo.ans_4 eq '5'}">checked</c:if> />
						<label for="surv04_01">매우 그렇다</label>		
					</li>
					<li>
						<input type="radio" name="srv04" id="surv04_02" class="" disabled <c:if test="${msvo.ans_4 eq '4'}">checked</c:if> />
						<label for="surv04_02">그렇다</label>		
					</li>
					<li>
						<input type="radio" name="srv04" id="surv04_03" class="" disabled <c:if test="${msvo.ans_4 eq '3'}">checked</c:if> />
						<label for="surv04_03">보통이다</label>		
					</li>
					<li>
						<input type="radio" name="srv04" id="surv04_04" class="" disabled <c:if test="${msvo.ans_4 eq '2'}">checked</c:if> />
						<label for="surv04_04">아니다</label>		
					</li>
					<li>
						<input type="radio" name="srv04" id="surv04_05" class="" disabled <c:if test="${msvo.ans_4 eq '1'}">checked</c:if> />
						<label for="surv04_05">매우 아니다</label>		
					</li>
				</ul>
			</div>
		</div>

		<p class="tit mb20">아래는 멘토단 시스템에 대한 설문조사입니다. <span class="mEnter">하단의 설문지를 읽고 해당하는 곳에 <span class="ppTxt fwb">체크표시</span>를 해주세요.</span></p>

		<div class="survey_chart mb">
			<div class="box">
				<h2><b>05</b>다른 분야로 다시 경남관광기업지원센터의 멘토단을 이용할 의향이 있다.</h2>
				<ul class="sur_check">
					<li>
						<input type="radio" name="srv05" id="surv05_01" class="" disabled <c:if test="${msvo.ans_5 eq '5'}">checked</c:if> />
						<label for="surv05_01">매우 그렇다</label>		
					</li>
					<li>
						<input type="radio" name="srv05" id="surv05_02" class="" disabled <c:if test="${msvo.ans_5 eq '4'}">checked</c:if> />
						<label for="surv05_02">그렇다</label>		
					</li>
					<li>
						<input type="radio" name="srv05" id="surv05_03" class="" disabled <c:if test="${msvo.ans_5 eq '3'}">checked</c:if> />
						<label for="surv05_03">보통이다</label>		
					</li>
					<li>
						<input type="radio" name="srv05" id="surv05_04" class="" disabled <c:if test="${msvo.ans_5 eq '2'}">checked</c:if> />
						<label for="surv05_04">아니다</label>		
					</li>
					<li>
						<input type="radio" name="srv05" id="surv05_05" class="" disabled <c:if test="${msvo.ans_5 eq '1'}">checked</c:if> />
						<label for="surv05_05">매우 아니다</label>		
					</li>
				</ul>
			</div>

			<div class="box">
				<h2><b>06</b>경남관광기업지원센터의 멘토링 시스템이 기업의 애로사항 해결에 도움이 됐다.</h2>
				<ul class="sur_check">
					<li>
						<input type="radio" name="srv06" id="surv06_01" class="" disabled <c:if test="${msvo.ans_6 eq '5'}">checked</c:if> />
						<label for="surv06_01">매우 그렇다</label>		
					</li>
					<li>
						<input type="radio" name="srv06" id="surv06_02" class="" disabled <c:if test="${msvo.ans_6 eq '4'}">checked</c:if> />
						<label for="surv06_02">그렇다</label>		
					</li>
					<li>
						<input type="radio" name="srv06" id="surv06_03" class="" disabled <c:if test="${msvo.ans_6 eq '3'}">checked</c:if> />
						<label for="surv06_03">보통이다</label>		
					</li>
					<li>
						<input type="radio" name="srv06" id="surv06_04" class="" disabled <c:if test="${msvo.ans_6 eq '2'}">checked</c:if> />
						<label for="surv06_04">아니다</label>		
					</li>
					<li>
						<input type="radio" name="srv06" id="surv06_05" class="" disabled <c:if test="${msvo.ans_6 eq '1'}">checked</c:if> />
						<label for="surv06_05">매우 아니다</label>		
					</li>
				</ul>
			</div>
		</div>

		<p class="fwb mb20">멘토링 상담 후기 및 자유로운 의견을 작성하여 주세요.</p>
		<textarea name="survey_comment" id="survey_comment" class="textarea mb" readonly wrap="hard"><c:out value="${msvo.ans_7}"/></textarea>

	</div>
</div>
</c:if>

<div id="view_mentor_list" class="no-display popinfo">
	<h1>대체멘토 검색</h1>
	<div class="popcon">
		<div class="crewtop bmb">
			<div class="bgtab">
				<h3 class="txtin">멘토 검색</h3>	
			</div>
			<table class="srch_table mb20">	
				
				<tbody>
					<tr>
						<th>상담유형</th>
						<td style="text-align:left;">
							<select name="s_major11" title="문의대분류" size="1" class="w20" id="s_major11" onchange="change_major('s_major11','s_major12');">
								<option value="">전체</option>
								<option value="1">창업</option>
								<option value="2">마케팅/홍보</option>
								<option value="3">투자</option>
								<option value="4">경영심화</option>
								<option value="5">관광</option>
								<option value="6">제품디자인</option>
							</select>
							<select name="s_major12" title="문의소분류" size="1" class="w30" id="s_major12">
							</select>
							
						</td>				
					</tr>
					<tr>
						<th>검색어</th>
						<td style="text-align:left;">
							<select name="search_type" id="search_type" class="fSelect">
								<option value="0">선택</option>
								<option value="1">멘토이름</option>
								<option value="2">멘토아이디</option>
							</select>
							<input type="text" value="" name="search_text" id="search_text" class="w50"/>
						</td>
					</tr>		
				</tbody>
			</table>
			<div class="ok_btn">
				<ul>
					<li><button type="button" class="btn_sumit2" onclick="mento_search2();">검색</button></li>
					<li><button type="button" class="btn_sumit2" onclick="mento_init();">전체</button></li>
				</ul>
			</div>
		</div>
		<div class="bgtab bgtab2">
			<div class="w50 fl">
				<p><span class="redTxt"></span></p>
			</div>
			<div class="w50 fl">
				<ul class="dpi_li tar">
					<li><a href="javascript:select_mento();" class="btn_sumit2"/>멘토선택</a></li>
				</ul>
			</div>

		</div>
		<table class="comm_table tac bmb" style="font-size:0.95em;">	
			<colgroup>
				<col width="3%">
				<col width="5%">
				<col width="10%">
				<col width="10%">
				<col width="15%">
				<col width="*">
				<col width="8%">
				<col width="7%">
				<col width="7%">
				<col width="7%">

			</colgroup>
			<thead>
				<tr>
					<th></th>
					<th>순번</th>
					<th>아이디</th>
					<th>이름</th>
					<th>구분</th>
					<th>전문분야</th>
					<th>접수완료</th>
					<th>상담중</th>				
					<th>총 건수</th>				
					<th>평점</th>				
				</tr>
			</thead>
			<tbody id="mento_list">	
			</tbody>
		</table>
	</div>
</div>


<!-- 설문내용 end-->
<%@ include file="/WEB-INF/jsp/egovframework/gntbsc/wssms/footer.jsp" %>