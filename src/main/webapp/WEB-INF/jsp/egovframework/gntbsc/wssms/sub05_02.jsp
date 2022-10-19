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
int m2 = 2;
int m3 = 0;

String sdate1 = (String) request.getAttribute("sdate1");
String sdate2 = (String) request.getAttribute("sdate2");

int tCnt = (int) request.getAttribute("tCnt");
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
	
});

function fn_egov_write(idx) {
	 document.submitParam.idx.value = idx;
	 document.submitParam.action = "<c:url value='/sb05/sub02_view.do'/>";
	 document.submitParam.submit();
}
	
function fn_egov_select_List(pageNo) {
	document.frm.pageIndex.value = pageNo;
	document.frm.action = "<c:url value='/sb05/sub02.do'/>";
	document.frm.submit();
}

function fn_egov_excel() {
	 document.frm.action = "<c:url value='/sb05/sub02_excel.do'/>";
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
		document.delfrm.action = "<c:url value='/sb05/sub02_sdele.do'/>";
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

function fn_egov_change_state() {
	var item_cnt = 0;
	
	$("input[class=checkbox]:checked").each(function() {
		item_cnt++;
	});
	
	if(item_cnt == 0) {
		alert("승인처리할 자료를 선택하세요.");

	} else if(confirm('선택한 멘토를 승인처리 하시겠습니까? \n\n')) {
		document.delfrm.action = "<c:url value='/sb05/sub02_schange.do'/>";
		document.delfrm.submit();
	}
}

function fn_egov_change_state2() {
	var item_cnt = 0;
	
	$("input[class=checkbox]:checked").each(function() {
		item_cnt++;
	});
	
	if(item_cnt == 0) {
		alert("개인회원 승인처리할 자료를 선택하세요.");

	} else if(confirm('선택한 멘토를 개인회원 승인처리 하시겠습니까? \n\n')) {
		document.delfrm.action = "<c:url value='/sb05/sub02_schange2.do'/>";
		document.delfrm.submit();
	}
}
//-->
</script>

<h4 class="tit_dot">멘토관리</h4>

<form name="submitParam" method="post">
	<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"  />
	<input type="hidden" name="idx" value=""  />
</form>

<form name="frm" action="<c:url value='/sb02/sub02.do'/>"  method="post" >
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
				<td>
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
				<th>회원유형</th>
				<td>
					<div class="txtin">
						<label class="mr10"><input type="radio" name="us_mentoyn" id="us_mentoyn" value=""  <c:if test="${searchVO.us_mentoyn == ''}">checked</c:if> /> 전체</label>
						<label class="mr10"><input type="radio" name="us_mentoyn" id="us_mentoyn2" value="N" <c:if test="${searchVO.us_mentoyn == 'N'}">checked</c:if> /> 대기</label>
						<label class="mr10"><input type="radio" name="us_mentoyn" id="us_mentoyn3" value="Y" <c:if test="${searchVO.us_mentoyn == 'Y'}">checked</c:if> /> 멘토</label>
					</div>
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
				
				<th>검색어</th>
				<td>
					<select name="searchCnd" id="searchCnd" class="fSelect">
						<option value="0">선택</option>
						<option value="1" <c:if test="${searchVO.searchCnd == '1'}">selected</c:if>>멘토이름</option>
						<option value="2" <c:if test="${searchVO.searchCnd == '2'}">selected</c:if>>멘토아이디</option>
					</select>
					<input type="text" value="<c:out value="${searchVO.searchWrd}"/>" name="searchWrd" id="searchWrd" class="w50"/>
				</td>
				
			</tr>
		</tbody>
	</table>
	<div class="ok_btn">
		<ul>
			<li><button type="button" class="btn_sumit2" onclick="fn_egov_select_List('1');">검색</button></li>
			<li><a href="<c:url value='/sb05/sub02.do'/>" class="btn_sumit2">전체</a></li>
		</ul>
	</div>	
</div>
</form>

<form name="delfrm" method="post">

<div class="crewinfo">	
	<div class="ofh mb10">
		<div class="half">
			<p>총 멘토 수 <%=tCnt%>명 /  검색 수 <span class="redTxt"><fmt:formatNumber value="${totCnt}" groupingUsed="true"/></span>명</p>
		</div>
		<div class="half tar">

		</div>
	</div>
	<div class="bgtab bgtab2">
		<div class="w50 fl">
			<ul class="dpi_li">
				<li><a href="#" class="btn_sumit2" onclick="fn_egov_excel()"/>엑셀다운로드</a></li>
				<li><a href="#" class="btn_sumit" onclick="fn_egov_change_state();"/>멘토승인</a></li>
				<li><a href="#" class="btn_sumit3" onclick="fn_egov_change_state2();"/>개인회원승인</a></li>
			</ul>
		</div>
	</div>
	<table class="comm_table tac bmb">	
		<colgroup>
			<col width="3%"/>
			<col width="3%"/>
			<col width="10%"/>
			<col width="5%"/>
			<col width="10%"/>
			<col width="10%"/>
			<col width="10%"/>
			<col width="*"/>
			<col width="4%"/>
			<col width="4%"/>
			<col width="4%"/>
			<col width="5%"/>
			<col width="5%"/>
			<col width="4%"/>
		</colgroup>
		<tbody>
			<tr>
				<th><input type="checkbox" class="checkbox" id="p1" /></th>
				<th>순번</th>
				<th>아이디</th>
				<th>유형</th>
				<th>이름</th>
				<th>휴대전화</th>
				<th>구분</th>
				<th>전문분야</th>
				<th>화상</th>
				<th>서면</th>
				<th>대면</th>
				<th>총 건수</th>				
				<th>평가건수</th>				
				<th>평점</th>				
			</tr>
			<c:forEach var="result" items="${mem_list}" varStatus="status">
			<tr>
				<td><input type="checkbox" name="idx" id="idx_<c:out value="${result.idx}"/>" class="checkbox" value="${result.idx}" /></td>
				<td><c:out value="${totCnt - ((searchVO.pageIndex-1) * 50 + status.count -1)}"/></td>
				<td><a href="#" onclick="fn_egov_write('${result.idx}');"><c:out value="${result.us_id}"/></a></td>
				<td>
					<c:choose>
						<c:when test="${result.us_mentoyn eq 'N'}">
							<span class="redTxt">대기</span>
						</c:when>
						<c:otherwise>
							<span class="redTxt">승인</span>
						</c:otherwise>
					</c:choose>
				</td>
				<td><a href="#" onclick="fn_egov_write('${result.idx}');"><c:out value="${result.us_name}"/></a></td>	
				<td><c:out value="${result.us_phone}"/></td>	
				<td>
					<c:out value="${result.us_major11_nm}"/>
					<c:if test="${!empty result.us_major21_nm}">, <c:out value="${result.us_major21_nm}"/></c:if>
				</td>
				<td>
					<c:out value="${result.us_major12_nm}"/>
					<c:if test="${!empty result.us_major1_etc}">(<c:out value="${result.us_major1_etc}"/>)</c:if>
					<c:if test="${!empty result.us_major22_nm}">, <c:out value="${result.us_major22_nm}"/></c:if>
					<c:if test="${!empty result.us_major2_etc}">(<c:out value="${result.us_major2_etc}"/>)</c:if>
				</td>
				<td><fmt:formatNumber value="${result.cam_cnt}" groupingUsed="true"/></td>
				<td><fmt:formatNumber value="${result.pap_cnt}" groupingUsed="true"/></td>
				<td><fmt:formatNumber value="${result.man_cnt}" groupingUsed="true"/></td>
				<td><fmt:formatNumber value="${result.mento_cnt}" groupingUsed="true"/></td>
				<td><fmt:formatNumber value="${result.end_cnt}" groupingUsed="true"/></td>
				<td><fmt:formatNumber value="${result.avg_point}" groupingUsed="true"/></td>
			</tr>
			</c:forEach>
			
		</tbody>
	</table>
</div>

</form>

<div class="pageList">
	<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_select_List" />
</div>

<%@ include file="/WEB-INF/jsp/egovframework/gntbsc/wssms/footer.jsp" %>