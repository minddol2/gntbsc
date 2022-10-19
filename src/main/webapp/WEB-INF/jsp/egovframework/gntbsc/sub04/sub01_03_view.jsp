<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="egovframework.com.cmm.service.EgovProperties" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import ="egovframework.goncs.member.service.LoginVO" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>
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

<script type="text/javascript" src="<c:url value='/js/pg_script.js'/>"></script>
<script type="text/javascript">
$(document).ready(function(){	
	var resultMsg = '${resultMsg}';
	
	if(resultMsg != "") {
		alert(resultMsg);
	}
	
	var status = "${memto_result.status}";
	
	if(status =="1") {
		$("#survey").hide();
		$("#survey_btn_id").hide();		
	} else if(status =="2") {
		$("#survey").hide();
		$("#survey_btn_id").hide();		
	} else if(status =="3") {
		$("#survey").hide();
		$("#survey_btn_id").hide();		
	} else if(status =="5") {
		$("#survey_btn_id").hide();		
	}
});

function fn_egov_select_List() {
	 document.submitParam.action = "<c:url value='/sub04/sub01_03.do'/>";
	 document.submitParam.submit();
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

function ending_memto(idx) {
	if(confirm('완료처리 하시겠습니까?')) {
		$.ajax({
			url : "<c:url value='/memto/mento_status4Ajax.do'/>",
			data : {
				"idx" : idx
			},
			dataType : 'json',
			type : 'POST',
			success : function(response) {
				if(response.result == "N") {
					alert("저장에 실패했습니다");
				} else {
					alert("멘토평가서를 작성해 주세요.");
					$("#survey").show();
					$("#survey_btn_id").show();
				}
			},
			error : function(data) {
				return false;
			}
		});
	}
}

function survey_proc() {
	var counsel_idx = $("#eidx").val();
	var ans_1 = "0";
	var ans_2 = "0";
	var ans_3 = "0";
	var ans_4 = "0";
	var ans_5 = "0";
	var ans_6 = "0";
	var ans_7 = $("#survey_comment").val();
	
	if( ($("#surv01_01").is(":checked")==false) && ($("#surv01_02").is(":checked")==false) && ($("#surv01_03").is(":checked")==false) 
			 && ($("#surv01_04").is(":checked")==false) && ($("#surv01_05").is(":checked")==false) ) {
			alert("1번 문항에 답변해 주세요.");
			return false;
		}
	if( ($("#surv02_01").is(":checked")==false) && ($("#surv02_02").is(":checked")==false) && ($("#surv02_03").is(":checked")==false) 
			 && ($("#surv02_04").is(":checked")==false) && ($("#surv02_05").is(":checked")==false) ) {
			alert("2번 문항에 답변해 주세요.");
			return false;
		}
	if( ($("#surv03_01").is(":checked")==false) && ($("#surv03_02").is(":checked")==false) && ($("#surv03_03").is(":checked")==false) 
			 && ($("#surv03_04").is(":checked")==false) && ($("#surv03_05").is(":checked")==false) ) {
			alert("3번 문항에 답변해 주세요.");
			return false;
		}
	if( ($("#surv04_01").is(":checked")==false) && ($("#surv04_02").is(":checked")==false) && ($("#surv04_03").is(":checked")==false) 
			 && ($("#surv04_04").is(":checked")==false) && ($("#surv04_05").is(":checked")==false) ) {
			alert("4번 문항에 답변해 주세요.");
			return false;
		}
	if( ($("#surv05_01").is(":checked")==false) && ($("#surv05_02").is(":checked")==false) && ($("#surv05_03").is(":checked")==false) 
			 && ($("#surv05_04").is(":checked")==false) && ($("#surv05_05").is(":checked")==false) ) {
			alert("5번 문항에 답변해 주세요.");
			return false;
		}
	if( ($("#surv06_01").is(":checked")==false) && ($("#surv06_02").is(":checked")==false) && ($("#surv06_03").is(":checked")==false) 
			 && ($("#surv06_04").is(":checked")==false) && ($("#surv06_05").is(":checked")==false) ) {
			alert("6번 문항에 답변해 주세요.");
			return false;
		}
	
	if( (ans_7 == "") || (ans_7.length < 10) ) {
		alert("상담 후기 및 자유로운 의견(10자이상)을 작성해 주세요.");
		return false;
	}
	
	if($("#surv01_01").is(":checked")) {
		ans_1 = "5";
	} else if($("#surv01_02").is(":checked")) {
		ans_1 = "4";
	} else if($("#surv01_03").is(":checked")) {
		ans_1 = "3";
	} else if($("#surv01_04").is(":checked")) {
		ans_1 = "2";
	} else if($("#surv01_05").is(":checked")) {
		ans_1 = "1";
	}
	
	if($("#surv02_01").is(":checked")) {
		ans_2 = "5";
	} else if($("#surv02_02").is(":checked")) {
		ans_2 = "4";
	} else if($("#surv02_03").is(":checked")) {
		ans_2 = "3";
	} else if($("#surv02_04").is(":checked")) {
		ans_2 = "2";
	} else if($("#surv02_05").is(":checked")) {
		ans_2 = "1";
	}
	
	if($("#surv03_01").is(":checked")) {
		ans_3 = "5";
	} else if($("#surv03_02").is(":checked")) {
		ans_3 = "4";
	} else if($("#surv03_03").is(":checked")) {
		ans_3 = "3";
	} else if($("#surv03_04").is(":checked")) {
		ans_3 = "2";
	} else if($("#surv03_05").is(":checked")) {
		ans_3 = "1";
	}
	
	if($("#surv04_01").is(":checked")) {
		ans_4 = "5";
	} else if($("#surv04_02").is(":checked")) {
		ans_4 = "4";
	} else if($("#surv04_03").is(":checked")) {
		ans_4 = "3";
	} else if($("#surv04_04").is(":checked")) {
		ans_4 = "2";
	} else if($("#surv04_05").is(":checked")) {
		ans_4 = "1";
	}
	
	if($("#surv05_01").is(":checked")) {
		ans_5 = "5";
	} else if($("#surv05_02").is(":checked")) {
		ans_5 = "4";
	} else if($("#surv05_03").is(":checked")) {
		ans_5 = "3";
	} else if($("#surv05_04").is(":checked")) {
		ans_5 = "2";
	} else if($("#surv05_05").is(":checked")) {
		ans_5 = "1";
	}
	
	if($("#surv06_01").is(":checked")) {
		ans_6 = "5";
	} else if($("#surv06_02").is(":checked")) {
		ans_6 = "4";
	} else if($("#surv06_03").is(":checked")) {
		ans_6 = "3";
	} else if($("#surv06_04").is(":checked")) {
		ans_6 = "2";
	} else if($("#surv06_05").is(":checked")) {
		ans_6 = "1";
	}
	
	if(confirm('멘토링 만족도 설문조사를 저장 하시겠습니까?')) {
		$.ajax({
			url : "<c:url value='/memto/mento_surveyUpAjax.do'/>",
			data : {
				"counsel_idx" : counsel_idx, "ans_1" : ans_1, "ans_2" : ans_2, "ans_3" : ans_3, "ans_4" : ans_4
				, "ans_5" : ans_5, "ans_6" : ans_6, "ans_7" : ans_7
			},
			dataType : 'json',
			type : 'POST',
			success : function(response) {
				if(response.result == "N") {
					alert("저장에 실패했습니다");
				} else {
					alert("정상 저장되었습니다.");
					$("#survey_btn_id").hide();
				}
			},
			error : function(data) {
				return false;
			}
		});
	}
	
}
</script>

<form name="submitParam" method="post">
	<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"  />
</form>

<div class="typebox mb">
	<ul class="tabs list03">				
		<li><a href="<c:url value='/sub04/sub01_01.do'/>">상담신청안내</a></li>
		<li><a href="<c:url value='/sub04/sub01_02.do'/>">전문 멘토단</a></li>
		<li class="current"><a href="<c:url value='/sub04/sub01_03.do'/>">상담신청 목록</a></li>
	</ul>
</div>


<!--뷰-->
<input type="hidden" name="eidx" id="eidx" value="<c:out value='${memto_result.idx}'/>" />
<div class="board_view board_anwser bmb">
	<div class="board_view_top">
		<h4 class="tit">
			<span class="cmt cmt01">
				<c:choose>
					<c:when test="${memto_result.status eq 1}">
						<b>접수</b>
					</c:when>
					<c:when test="${memto_result.status eq 2}">
						<b>접수완료</b>
					</c:when>
					<c:when test="${memto_result.status eq 3}">
						<b>상담중</b>
					</c:when>
					<c:when test="${memto_result.status eq 4}">
						<b>상담완료</b>
					</c:when>
					<c:otherwise>
						<b>처리완료</b>
					</c:otherwise>
				</c:choose>
			</span> 
			<span class="cate">[<c:out value="${memto_result.us_major11_nm}"/>]</span>
			<span class="tit_tt"><c:out value="${memto_result.title}"/></span>
		</h4>
		<div class="info">
			<span class="each">접수번호 : <c:out value="${memto_result.idx}"/></span>
			<span class="each">작성일 : <c:out value="${memto_result.reg_date}"/></span>
			<span class="each">조회 : <c:out value="${memto_result.hit}"/></span>
		</div>
	</div>
	<div class="mentoring_info">
		<table>			
			<caption>기업정보 표가 들어갑니다.</caption>
			<colgroup>
				<col class="w20"/>
				<col class="w30"/>
				<col class="w20"/>
				<col class="w30"/>
			</colgroup>
			<tr>
				<th scope="col">이름</th>
				<td><c:out value="${memto_result.us_name}"/></td>
				<th scope="col">휴대전화</th>
				<td><c:out value="${memto_result.us_mobile}"/></td>
			</tr>
			<tr>
				<th scope="col">이메일</th>
				<td><c:out value="${memto_result.us_email}"/></td>
				<th scope="col">멘토링방식</th>
				<td>
					<b class="ppTxt fwb">
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
					</b>
					<c:if test="${memto_result.memto_gbn eq '2'}">
						<c:choose>
							<c:when test="${memto_result.status eq 1}">
								<b class="ppTxt fwb"><span class="mEnter tEnter">/ <c:out value="${memto_result.room_date}"/> <c:out value="${memto_result.room_time1}"/>~<c:out value="${memto_result.room_time2}"/></span></b>/ 
							</c:when>
							<c:otherwise>
								<b class="ppTxt fwb"><span class="mEnter tEnter">/ <c:out value="${memto_result.room_wdate}"/> <c:out value="${memto_result.room_wtime1}"/>~<c:out value="${memto_result.room_wtime2}"/></span></b>/
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${memto_result.room_gbn eq 'Y'}">
								센터대회의실사용
							</c:when>
							<c:otherwise>
								센터대회의실사용안함
							</c:otherwise>
						</c:choose>  / 참석인원 <c:out value="${memto_result.att_cnt}"/> 명
					</c:if>
					<c:if test="${memto_result.memto_gbn eq '3'}">
						<c:choose>
							<c:when test="${memto_result.status eq 1}">
								<b class="ppTxt fwb"><span class="mEnter tEnter">/ <c:out value="${memto_result.room_date}"/> <c:out value="${memto_result.room_time1}"/>~<c:out value="${memto_result.room_time2}"/></span></b>/ 
							</c:when>
							<c:otherwise>
								<b class="ppTxt fwb"><span class="mEnter tEnter">/ <c:out value="${memto_result.room_wdate}"/> <c:out value="${memto_result.room_wtime1}"/>~<c:out value="${memto_result.room_wtime2}"/></span></b>/
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${memto_result.room_gbn eq 'Y'}">
								센터대회의실사용
							</c:when>
							<c:otherwise>
								센터대회의실사용안함
							</c:otherwise>
						</c:choose>  / 참석인원 <c:out value="${memto_result.att_cnt}"/> 명
					</c:if>
				</td>
			</tr>			
			<tr>
				<th scope="col">기업명</th>
				<td><c:out value="${memto_result.us_company}"/></td>
				<th scope="col">직급</th>
				<td><c:out value="${memto_result.us_position}"/></td>
			</tr>
			<tr>
				<th scope="col">사업자번호</th>
				<td><c:out value="${memto_result.us_saupno}"/></td>
				<th scope="col">설립연도</th>
				<td><c:out value="${memto_result.us_makeyear}"/></td>
			</tr>
			<tr>
				<th scope="col">기업유형</th>
				<td colspan="3"><c:out value="${memto_result.us_uptaex}"/></td>			
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
			<p class="link_each">
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
			</p>
		</div>
	</div>

	<c:forEach var="result3" items="${coment_list}" varStatus="status">
	<div class="board_comment" id="comment_<c:out value='${result3.idx}'/>">
		<div class="comment_top">	
			<p class="tit"><c:out value="${result3.w_name}"/> <span>작성일 : <c:out value="${result3.reg_date}"/></span></p>
			<ul>
				<c:if test="${result3.w_id eq user.us_id}">
				<c:if test="${memto_result.status eq '2' or memto_result.status eq '3'}">
				<li><a href="javascript:modify_comment('${result3.idx}')" class="btn_edit" >수정</a></li>
				<li><a href="javascript:delete_comment('${result3.idx}');" >삭제</a></li>
				</c:if>
				</c:if>
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
	
	<c:if test="${memto_result.status eq '3' or user.us_level le 2}">
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
	</c:if>
	
	<!--//board_comment-->

</div>

<c:if test="${memto_result.status eq '3' and user.us_gbn eq '2'}">
<div class="tac mb">
	<a href="javascript:ending_memto('${memto_result.idx}');" class="btn_rd btn_big">상담완료 및 멘토평가</a> <!--상담중일때 해당 버튼 노출-->
</div>
</c:if>

<div class="boardButton">
	<ul>
		<li><span><a href="#" onclick="fn_egov_select_List('1');">목록</a></span></li>
	</ul>
</div>
<!--뷰 -->


<!--설문지 내용-->
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
					<c:choose>
						<c:when test="${empty msvo.w_name}">
							<td><c:out value='${user.us_name}'/> (<c:out value='${user.us_phone}'/>)</td>
						</c:when>
						<c:otherwise>
							<td><c:out value='${msvo.w_name}'/> (<c:out value='${msvo.w_mobile}'/>)</td>
						</c:otherwise>
					</c:choose>
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
						<c:if test="${memto_result.memto_gbn eq 2 and memto_result.room_gbn eq 'Y'}">
					 / <c:out value="${memto_result.room_date}"/> <c:out value="${memto_result.room_time1}"/>~<c:out value="${memto_result.room_time2}"/> / 센터대회의실사용
					 	</c:if>
						<c:if test="${memto_result.memto_gbn eq 3 and memto_result.room_gbn eq 'Y'}">
					 / <c:out value="${memto_result.room_date}"/> <c:out value="${memto_result.room_time1}"/>~<c:out value="${memto_result.room_time2}"/> / 센터대회의실사용
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
						<input type="radio" name="srv01" id="surv01_01" class="" value="5" <c:if test="${msvo.ans_1 eq '5'}">checked</c:if> />
						<label for="surv01_01">매우 그렇다</label>		
					</li>
					<li>
						<input type="radio" name="srv01" id="surv01_02" class="" value="4" <c:if test="${msvo.ans_1 eq '4'}">checked</c:if> />
						<label for="surv01_02">그렇다</label>		
					</li>
					<li>
						<input type="radio" name="srv01" id="surv01_03" class="" value="3" <c:if test="${msvo.ans_1 eq '3'}">checked</c:if> />
						<label for="surv01_03">보통이다</label>		
					</li>
					<li>
						<input type="radio" name="srv01" id="surv01_04" class="" value="2" <c:if test="${msvo.ans_1 eq '2'}">checked</c:if> />
						<label for="surv01_04">아니다</label>		
					</li>
					<li>
						<input type="radio" name="srv01" id="surv01_05" class="" value="1" <c:if test="${msvo.ans_1 eq '1'}">checked</c:if> />
						<label for="surv01_05">매우 아니다</label>		
					</li>
				</ul>
			</div>

			<div class="box">
				<h2><b>02</b>담당 멘토는 나의 문의(요구)사항을 잘 이해하고 그에 맞는 대책안을 주었다.</h2>
				<ul class="sur_check">
					<li>
						<input type="radio" name="srv02" id="surv02_01" class="" <c:if test="${msvo.ans_2 eq '5'}">checked</c:if> />
						<label for="surv02_01">매우 그렇다</label>		
					</li>
					<li>
						<input type="radio" name="srv02" id="surv02_02" class="" <c:if test="${msvo.ans_2 eq '4'}">checked</c:if> />
						<label for="surv02_02">그렇다</label>		
					</li>
					<li>
						<input type="radio" name="srv02" id="surv02_03" class="" <c:if test="${msvo.ans_2 eq '3'}">checked</c:if> />
						<label for="surv02_03">보통이다</label>		
					</li>
					<li>
						<input type="radio" name="srv02" id="surv02_04" class="" <c:if test="${msvo.ans_2 eq '2'}">checked</c:if> />
						<label for="surv02_04">아니다</label>		
					</li>
					<li>
						<input type="radio" name="srv02" id="surv02_05" class="" <c:if test="${msvo.ans_2 eq '1'}">checked</c:if> />
						<label for="surv02_05">매우 아니다</label>		
					</li>
				</ul>
			</div>

			<div class="box">
				<h2><b>03</b>담당 멘토는 전문성과 책임감을 가지고 멘토링에 응하였다.</h2>
				<ul class="sur_check">
					<li>
						<input type="radio" name="srv03" id="surv03_01" class="" <c:if test="${msvo.ans_3 eq '5'}">checked</c:if> />
						<label for="surv03_01">매우 그렇다</label>		
					</li>
					<li>
						<input type="radio" name="srv03" id="surv03_02" class="" <c:if test="${msvo.ans_3 eq '4'}">checked</c:if> />
						<label for="surv03_02">그렇다</label>		
					</li>
					<li>
						<input type="radio" name="srv03" id="surv03_03" class="" <c:if test="${msvo.ans_3 eq '3'}">checked</c:if> />
						<label for="surv03_03">보통이다</label>		
					</li>
					<li>
						<input type="radio" name="srv03" id="surv03_04" class="" <c:if test="${msvo.ans_3 eq '2'}">checked</c:if> />
						<label for="surv03_04">아니다</label>		
					</li>
					<li>
						<input type="radio" name="srv03" id="surv03_05" class="" <c:if test="${msvo.ans_3 eq '1'}">checked</c:if> />
						<label for="surv03_05">매우 아니다</label>		
					</li>
				</ul>
			</div>

			<div class="box">
				<h2><b>04</b>담당 멘토를 다른 사람(기업)에 추천할 의향이 있다.</h2>
				<ul class="sur_check">
					<li>
						<input type="radio" name="srv04" id="surv04_01" class="" <c:if test="${msvo.ans_4 eq '5'}">checked</c:if> />
						<label for="surv04_01">매우 그렇다</label>		
					</li>
					<li>
						<input type="radio" name="srv04" id="surv04_02" class="" <c:if test="${msvo.ans_4 eq '4'}">checked</c:if> />
						<label for="surv04_02">그렇다</label>		
					</li>
					<li>
						<input type="radio" name="srv04" id="surv04_03" class="" <c:if test="${msvo.ans_4 eq '3'}">checked</c:if> />
						<label for="surv04_03">보통이다</label>		
					</li>
					<li>
						<input type="radio" name="srv04" id="surv04_04" class="" <c:if test="${msvo.ans_4 eq '2'}">checked</c:if> />
						<label for="surv04_04">아니다</label>		
					</li>
					<li>
						<input type="radio" name="srv04" id="surv04_05" class="" <c:if test="${msvo.ans_4 eq '1'}">checked</c:if> />
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
						<input type="radio" name="srv05" id="surv05_01" class="" <c:if test="${msvo.ans_5 eq '5'}">checked</c:if> />
						<label for="surv05_01">매우 그렇다</label>		
					</li>
					<li>
						<input type="radio" name="srv05" id="surv05_02" class="" <c:if test="${msvo.ans_5 eq '4'}">checked</c:if> />
						<label for="surv05_02">그렇다</label>		
					</li>
					<li>
						<input type="radio" name="srv05" id="surv05_03" class="" <c:if test="${msvo.ans_5 eq '3'}">checked</c:if> />
						<label for="surv05_03">보통이다</label>		
					</li>
					<li>
						<input type="radio" name="srv05" id="surv05_04" class="" <c:if test="${msvo.ans_5 eq '2'}">checked</c:if> />
						<label for="surv05_04">아니다</label>		
					</li>
					<li>
						<input type="radio" name="srv05" id="surv05_05" class="" <c:if test="${msvo.ans_5 eq '1'}">checked</c:if> />
						<label for="surv05_05">매우 아니다</label>		
					</li>
				</ul>
			</div>

			<div class="box">
				<h2><b>06</b>경남관광기업지원센터의 멘토링 시스템이 기업의 애로사항 해결에 도움이 됐다.</h2>
				<ul class="sur_check">
					<li>
						<input type="radio" name="srv06" id="surv06_01" class="" <c:if test="${msvo.ans_6 eq '5'}">checked</c:if> />
						<label for="surv06_01">매우 그렇다</label>		
					</li>
					<li>
						<input type="radio" name="srv06" id="surv06_02" class="" <c:if test="${msvo.ans_6 eq '4'}">checked</c:if> />
						<label for="surv06_02">그렇다</label>		
					</li>
					<li>
						<input type="radio" name="srv06" id="surv06_03" class="" <c:if test="${msvo.ans_6 eq '3'}">checked</c:if> />
						<label for="surv06_03">보통이다</label>		
					</li>
					<li>
						<input type="radio" name="srv06" id="surv06_04" class="" <c:if test="${msvo.ans_6 eq '2'}">checked</c:if> />
						<label for="surv06_04">아니다</label>		
					</li>
					<li>
						<input type="radio" name="srv06" id="surv06_05" class="" <c:if test="${msvo.ans_6 eq '1'}">checked</c:if> />
						<label for="surv06_05">매우 아니다</label>		
					</li>
				</ul>
			</div>
		</div>

		<p class="fwb mb20">멘토링 상담 후기 및 자유로운 의견을 작성하여 주세요.</p>
		<textarea name="survey_comment" id="survey_comment" class="textarea mb" wrap="hard"><c:out value="${msvo.ans_7}"/></textarea>

		<div class="tac" id="survey_btn_id">
			<a href="javascript:survey_proc();" class="btn_rd btn_big">저장</a>
		</div>

	</div>
</div>



			</div><!--con-->
		</div><!--subcon-->
	</div><!--subwrap-->




<%@ include file="/WEB-INF/jsp/egovframework/gntbsc/inc/footer.jsp" %>