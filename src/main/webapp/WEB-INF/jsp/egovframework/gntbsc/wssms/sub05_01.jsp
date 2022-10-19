<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="egovframework.com.cmm.service.EgovProperties" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
String bodyckey = "false";
int m1 = 5;
int m2 = 1;
int m3 = 0;

int cnt1 = (int) request.getAttribute("cnt1");
int cnt2 = (int) request.getAttribute("cnt2");
int cnt3 = (int) request.getAttribute("cnt3");
int cnt4 = (int) request.getAttribute("cnt4");
int cnt5 = (int) request.getAttribute("cnt5");

String sdate1 = (String) request.getAttribute("sdate1");
String sdate2 = (String) request.getAttribute("sdate2");
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
<script type="text/javascript">
<!--
$(document).ready(function(){
	var resultMsg = '${resultMsg}';
	
	if(resultMsg != "") {
		alert(resultMsg);
	}
	
	
});

function show_sd(){ 
	$("#sdate").datepicker('show');
}

function show_ed(){ 
	$("#edate").datepicker('show');
} 

$(function() {    
	$( ".cal_date" ).datepicker({
		dateFormat: "yy-mm-dd",
		changeMonth: true,
		changeYear: true,
		showOtherMonths: true ,
		selectOtherMonths: true,
		showMonthAfterYear: true ,
		monthNamesShort: [ "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12" ],
		monthNames:[ "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12" ]
	}); 
	
	//전체선택 체크박스 클릭
	$("#p1").click(function(){
		//만약 전체 선택 체크박스가 체크된상태일경우
		if($("#p1").prop("checked")) {
			//해당화면에 전체 checkbox들을 체크해준다
			$("input[class='checkbox']").prop("checked",true);
		// 전체선택 체크박스가 해제된 경우
		} else {
			//해당화면에 모든 checkbox들의 체크를해제시킨다.
			$("input[class='checkbox']").prop("checked",false);
		}
	});
	
});

function fn_egov_write(idx) {
	 document.submitParam.idx.value = idx;
	 document.submitParam.action = "<c:url value='/sb05/sub01_view.do'/>";
	 document.submitParam.submit();
}
	
function fn_egov_select_List(pageNo) {
	document.frm.pageIndex.value = pageNo;
	document.frm.action = "<c:url value='/sb05/sub01.do'/>";
	document.frm.submit();
}

function fn_egov_excel() {
	 document.frm.action = "<c:url value='/sb05/sub01_excel.do'/>";
	 document.frm.target = "";
	 document.frm.submit();
}
	
$(function(){
	//전체선택 체크박스 클릭
	$("#p1").click(function(){
		//만약 전체 선택 체크박스가 체크된상태일경우
		if($("#p1").prop("checked")) {
			//해당화면에 전체 checkbox들을 체크해준다
			$("input[type=checkbox]").prop("checked",true);
		// 전체선택 체크박스가 해제된 경우
		} else {
			//해당화면에 모든 checkbox들의 체크를해제시킨다.
			$("input[type=checkbox]").prop("checked",false);
		}
	});
})

function fn_egov_select_dele() {
	var item_cnt = 0;
	$("input[class=checkbox]:checked").each(function() {
		item_cnt++;
	});
	if(item_cnt == 0) {
		alert("삭제할 자료를 선택하세요.");

	} else if(confirm('선택한 자료를 삭제하시겠습니까? \n\n')) {
		document.delfrm.action = "<c:url value='/sb05/sub01_sdele.do'/>";
		document.delfrm.submit();
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

function set_datex(today) {
	var sdate1 = "<%=sdate1%>";
	var sdate2 = "<%=sdate2%>";

	if (today == "이번달") {
        document.getElementById("sdate").value = sdate1;
        document.getElementById("edate").value = sdate2;
    } else  {
        document.getElementById("sdate").value = "";
        document.getElementById("edate").value = "";
    }

	document.bbs_search_form.submit();
}
//-->
</script>

<form name="submitParam" method="post">
	<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"  />
	<input type="hidden" name="idx" value=""  />
</form>

<h4 class="tit_dot">신청현황</h4>
<p class="tar fsb">총 신청건수: <b class="blTxt"><fmt:formatNumber value="${totCnt}" groupingUsed="true"/></b> 건</p>
<div class="gboxwrap list05 ofh bmb">
	<dl class="gbox">
		<a href="#">
		<dt class="fsb">접수</dt>
		<dd><span class="num"><%=cnt1%></span></dd>
		</a>
	</dl>

	<dl class="gbox">
		<a href="#">
		<dt class="fsb">접수완료</dt>
		<dd><span class="num"><%=cnt2%></span></dd>
		</a>
	</dl>

	<dl class="gbox">
		<a href="#">
		<dt class="fsb">상담 중</dt>
		<dd><span class="num"><%=cnt3%></span></dd>
		</a>
	</dl>

	<dl class="gbox">
		<a href="#">
		<dt class="fsb">상담완료</dt>
		<dd><span class="num"><%=cnt4%></span></dd>
		</a>
	</dl>

	<dl class="gbox">
		<a href="#">
		<dt class="fsb">처리완료 (이번 달)</dt>
		<dd><span class="num"><%=cnt5%></span></dd>
		</a>
	</dl>
</div>


<form name="frm" action="<c:url value='/sb05/sub01.do'/>"  method="post" >
<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>

<div class="crewtop bmb">
	<div class="bgtab">
		<h3 class="txtin">상담신청현황</h3>	
	</div>
	<table class="srch_table mb20">	
		<colgroup>
			<col width="10%">
			<col width="40%">
			<col width="10%">
			<col width="40%">
		</colgroup>
		<tbody>
			<tr>
				<th>상담유형</th>
				<td colspan="3">
					<select name="us_major11" title="문의대분류" size="1" class="w20" id="us_major11" onchange="change_major('us_major11','us_major12')">
						<option value="0" <c:if test="${searchVO.us_major11 eq 0}">selected</c:if>>전체</option>
						<option value="1" <c:if test="${searchVO.us_major11 eq 1}">selected</c:if>>창업</option>
						<option value="2" <c:if test="${searchVO.us_major11 eq 2}">selected</c:if>>마케팅/홍보</option>
						<option value="3" <c:if test="${searchVO.us_major11 eq 3}">selected</c:if>>투자</option>
						<option value="4" <c:if test="${searchVO.us_major11 eq 4}">selected</c:if>>경영심화</option>
						<option value="5" <c:if test="${searchVO.us_major11 eq 5}">selected</c:if>>관광</option>
						<option value="6" <c:if test="${searchVO.us_major11 eq 6}">selected</c:if>>제품디자인</option>
					</select>
					<select name="us_major12" title="문의소분류" size="1" class="w30" id="us_major12">
						<option value="">전체</option>
						<c:forEach var="result" items="${min_list1}" varStatus="status">
						<option value="<c:out value='${result.code}'/>" <c:if test="${result.code eq searchVO.us_major12}">selected</c:if>><c:out value='${result.cd_name}'/></option>
						</c:forEach>
					</select>
					
				</td>				
			</tr>				
			<tr>
				<th>기간검색</th>
				<td>
					<input type="text" name="sdate" id="sdate" class="cal_date"  value="<c:out value='${searchVO.sdate}'/>" /><button type="button" class="btn_cal" onclick="show_sd();"></button> - <input type="text" name="edate" id="edate" class="cal_date" value="<c:out value='${searchVO.edate}'/>" /><button type="button" class="btn_cal" onclick="show_ed()"></button>&nbsp;&nbsp;
					<ul class="dpi_li dpi">
						<li><a href="#" class="btn_sumit" onclick="set_datex('이번달');">이번달</a></li>
						<li><a href="#" class="btn_sumit" onclick="set_datex('전체');">전체</a></li>
					</ul>
				</td>
				<th>기업유형</th>
				<td>
					<div class="txtin">
						<label class="mr10"><input type="radio" name="us_buss_gbn" id="us_buss_gbn" value="" <c:if test="${searchVO.us_buss_gbn == ''}">checked</c:if> /> 전체</label>
						<label class="mr10"><input type="radio" name="us_buss_gbn" id="us_buss_gbn1" value="3" <c:if test="${searchVO.us_buss_gbn == '3'}">checked</c:if>> 입주기업</label>
						<label class="mr10"><input type="radio" name="us_buss_gbn" id="us_buss_gbn2" value="1" <c:if test="${searchVO.us_buss_gbn == '1'}">checked</c:if>> 도내기업</label> 
						<label class="mr10"><input type="radio" name="us_buss_gbn" id="us_buss_gbn3" value="2" <c:if test="${searchVO.us_buss_gbn == '2'}">checked</c:if>> 예비창업자</label> 
					</div>
				</td>
			</tr>	
			<tr>
				<th>멘토링방식</th>
				<td>
					<div class="txtin">
						<label class="mr10"><input type="radio" name="memto_gbn" id="memto_gbn" value="" <c:if test="${searchVO.memto_gbn == ''}">checked</c:if> /> 전체</label>
						<label class="mr10"><input type="radio" name="memto_gbn" id="memto_gbn1" value="1" <c:if test="${searchVO.memto_gbn == '1'}">checked</c:if> /> 서면</label>
						<label class="mr10"><input type="radio" name="memto_gbn" id="memto_gbn2" value="2" <c:if test="${searchVO.memto_gbn == '2'}">checked</c:if> /> 화상</label> 
						<label class="mr10"><input type="radio" name="memto_gbn" id="memto_gbn3" value="3" <c:if test="${searchVO.memto_gbn == '3'}">checked</c:if> /> 대면</label> 
					</div>
				</td>
				<th>검색어</th>
				<td>
					<select name="searchCnd" id="searchCnd" class="fSelect">
						<option value="0" <c:if test="${searchVO.searchCnd == 0}">selected</c:if>>선택</option>
						<option value="1" <c:if test="${searchVO.searchCnd == 1}">selected</c:if>>작성자</option>				
						<option value="6" <c:if test="${searchVO.searchCnd == 6}">selected</c:if>>업체명</option>				
						<option value="2" <c:if test="${searchVO.searchCnd == 2}">selected</c:if>>멘토이름</option>
						<option value="3" <c:if test="${searchVO.searchCnd == 3}">selected</c:if>>멘토아이디</option>
					</select>
					<input type="text" value="<c:out value="${searchVO.searchWrd}"/>" name="searchWrd" id="searchWrd" class="w50"/>
				</td>
			</tr>				
			<tr>
				<th>상담상태</th>
				<td colspan="3">
					<div class="txtin">
						<label class="mr10"><input type="radio" name="status" id="status" value="" <c:if test="${searchVO.status == ''}">checked</c:if> /> 전체</label>
						<label class="mr10"><input type="radio" name="status" id="status1" value="1" <c:if test="${searchVO.status == '1'}">checked</c:if> /> 접수</label>
						<label class="mr10"><input type="radio" name="status" id="status2" value="2" <c:if test="${searchVO.status == '2'}">checked</c:if> /> 접수완료</label> 
						<label class="mr10"><input type="radio" name="status" id="status3" value="3" <c:if test="${searchVO.status == '3'}">checked</c:if> /> 상담중</label> 
						<label class="mr10"><input type="radio" name="status" id="status4" value="4" <c:if test="${searchVO.status == '4'}">checked</c:if> /> 상담완료</label> 
						<label class="mr10"><input type="radio" name="status" id="status5" value="5" <c:if test="${searchVO.status == '5'}">checked</c:if> /> 처리완료</label> 
					</div>
				</td>
			</tr>				
			
		</tbody>
	</table>
	<div class="ok_btn">
		<ul>
			<li><button type="button" class="btn_sumit2" onclick="fn_egov_select_List('1');">검색</button></li>
			<li><a href="<c:url value='/sb05/sub01.do'/>" class="btn_sumit2">전체</a></li>
			<li><a href="#" class="btn_sumit" onclick="fn_egov_select_dele();">선택삭제</a></li>
		</ul>
	</div>	
</div>

</form>


<div class="crewinfo">		
	<div class="bgtab bgtab2">
		<div class="w50 fl">
			<p>총 게시글 수 <fmt:formatNumber value="${cntss}" groupingUsed="true"/>건 /  검색 수 <span class="redTxt"><fmt:formatNumber value="${totCnt}" groupingUsed="true"/></span>건</p>
		</div>
		<div class="w50 fl tar">
			<ul class="dpi_li dpi">
				<li><a href="#" class="btn_sumit2" onclick="fn_egov_excel()">엑셀다운로드</a></li>
			</ul>
		</div>
	</div>	
</div>

<form name="delfrm" method="post">

<table class="board_table mb">
	<thead>
		<tr>
			<th><input id="p1" type="checkbox" /></th>
			<th colspan="2">제목</th>
			<th>작성일</th>
			<th>작성자</th>
			<th>기업유형</th>
			<th>담당멘토</th>			
			<th>멘토링방식</th>			
			<th>비고</th>
			<th>멘토평점</th>
			<th>시스템평점</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="result" items="${memto_list}" varStatus="status">
		<tr>
			<td><input name="idx" id="idx_<c:out value="${result.idx}"/>" value="${result.idx}" class="checkbox"  type="checkbox"/></td>
			<td><c:out value="${result.idx}"/></td>
			<td class="tal"><a href="#" onclick="fn_egov_write('${result.idx}');"><span class="blTxt fwb">[<c:out value="${result.us_major11_nm}"/>]</span> <c:out value="${result.title}"/></a></td>
			<td>
				<fmt:parseDate var="dateString" value="${result.reg_date}" pattern="yyyy-MM-dd" />
				<fmt:formatDate value="${dateString}" pattern="yyyy.MM.dd" />
			</td>
			<td><c:out value="${result.us_company}"/></td>
			<td>
				<c:choose>
					<c:when test="${result.us_buss_gbn eq 1}">
						<b>도내</b>
					</c:when>
					<c:when test="${result.us_buss_gbn eq 2}">
						<b>예비창업자</b>
					</c:when>
					<c:otherwise>
						<b>입주</b>
					</c:otherwise>
				</c:choose>
			</td>
			<td><c:out value="${result.memto_nm}"/></td>
			<td>
				<c:choose>
					<c:when test="${result.memto_gbn eq 1}">
						<b class="redTxt">서면</b>
					</c:when>
					<c:when test="${result.memto_gbn eq 2}">
						<b class="blTxt">화상</b>
					</c:when>
					<c:otherwise>
						<b class="grTxt">대면</b>
					</c:otherwise>
				</c:choose>
			</td>
			<td><span class="aw_status s0${result.status}">
				<c:choose>
					<c:when test="${result.status eq 1}">
						<b>접수</b>
					</c:when>
					<c:when test="${result.status eq 2}">
						<b>접수완료</b>
					</c:when>
					<c:when test="${result.status eq 3}">
						<b>상담중</b>
					</c:when>
					<c:when test="${result.status eq 4}">
						<b>상담완료</b>
					</c:when>
					<c:otherwise>
						<b>처리완료</b>
					</c:otherwise>
				</c:choose>
				</span>
			</td>
			<td>
				<c:choose>
					<c:when test="${result.point eq 0}">
						-
					</c:when>
					<c:otherwise>
						<fmt:formatNumber value="${result.point}" pattern=".00"/>
					</c:otherwise>
				</c:choose>
			</td>
			<td>
				<c:choose>
					<c:when test="${result.point2 eq 0}">
						-
					</c:when>
					<c:otherwise>
						<fmt:formatNumber value="${result.point2}" pattern=".00"/>
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
		</c:forEach>

	</tbody>
</table>

</form>

<div class="pageList">
	<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_select_List" />
</div>




<%@ include file="/WEB-INF/jsp/egovframework/gntbsc/wssms/footer.jsp" %>