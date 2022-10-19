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
String lang_mode = (String) request.getAttribute("lang_temp");

String is_main = "";
int m1 = 11;
int m2 = 7;
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

<jsp:include page="/WEB-INF/jsp/egovframework/gntbsc/member/tablist.jsp" flush="true" >
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
	
});

function fn_egov_select_List() {
	 document.submitParam.action = "<c:url value='/member/mentor_list.do'/>";
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
</script>

<form name="submitParam" method="post">
	<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"  />
</form>

<!--뷰-->
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
					<c:if test="${memto_result.memto_gbn eq 2}">
						<b class="ppTxt fwb"><span class="mEnter tEnter">/ <c:out value="${memto_result.room_wdate}"/> <c:out value="${memto_result.room_wtime1}"/>~<c:out value="${memto_result.room_wtime2}"/></span></b>/
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
						<b class="ppTxt fwb"><span class="mEnter tEnter">/ <c:out value="${memto_result.room_wdate}"/> <c:out value="${memto_result.room_wtime1}"/>~<c:out value="${memto_result.room_wtime2}"/></span></b>/
						<c:choose>
							<c:when test="${memto_result.room_gbn eq 'Y'}">
								센터대회의실사용
							</c:when>
							<c:otherwise>
								센터대회의실사용안함
							</c:otherwise>
						</c:choose> 
					</c:if>
					  / 참석인원 <c:out value="${memto_result.att_cnt}"/> 명
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

	<c:if test="${memto_result.status eq '2' or memto_result.status eq '3' or memto_result.status eq '4' or memto_result.status eq '5' }">
	
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
	
	<c:if test="${memto_result.status eq '2' or memto_result.status eq '3'}">
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
	</c:if>

</div>

<div class="boardButton">
	<ul>
		<li><span><a href="#" onclick="fn_egov_select_List('1');">목록</a></span></li>
	</ul>
</div>
<!--뷰 -->

<!--설문지 내용-->



			</div><!--con-->
		</div><!--subcon-->
	</div><!--subwrap-->





<%@ include file="/WEB-INF/jsp/egovframework/gntbsc/inc/footer.jsp" %>