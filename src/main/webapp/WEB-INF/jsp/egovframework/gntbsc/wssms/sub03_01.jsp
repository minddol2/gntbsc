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
String bodyckey = "false";
int m1 = 3;
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
<script type="text/javascript">
<!--
$(document).ready(function(){
	var resultMsg = '${resultMsg}';
	
	if(resultMsg != "") {
		alert(resultMsg);
	}
	
	
});

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
	window.open("","detailvfrm","width=780, height=600, top=100, left=100, resizable=no, scrollbars=yes");
	$("#idx5").val(idx);
	$("#detailvfrm").submit();
}
	
function fn_egov_select_List(pageNo) {
	document.frm.pageIndex.value = pageNo;
	document.frm.action = "<c:url value='/sb03/sub01.do'/>";
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
		document.delfrm.action = "<c:url value='/sb03/sub01_sdele.do'/>";
		document.delfrm.submit();
	}
}


function fn_egov_change_status() {
	var item_cnt = 0;
	var cstate = $("#status7").val();
	
	if(cstate == "") {
		alert("변경할 상태를 선택하세요");
		return false;
	} else {
		$("#cstate").val(cstate);
	}
	
	$("input[class=checkbox]:checked").each(function() {
		item_cnt++;
	});
	if(item_cnt == 0) {
		alert("상태변경할 자료를 선택하세요.");

	} else if(confirm('선택한 자료의 상태를 변경하시겠습니까? \n\n')) {
		document.delfrm.action = "<c:url value='/sb03/sub01_schange.do'/>";
		document.delfrm.submit();
	}
}
//-->
</script>

<h4 class="tit_dot">대관신청 목록</h4>

<form id="detailvfrm" target="detailvfrm" method="post" action="<c:url value='/sb03/sub01_write.do'/>" >
	<input type="hidden" name="idx" id="idx5" value=""/>
</form>

<form name="submitParam" method="post">
	<input type="hidden" name="idx" value=""  />
	<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>
	<input type="hidden" name="sdate" value="<c:out value='${searchVO.sdate}'/>"/>
	<input type="hidden" name="edate" value="<c:out value='${searchVO.edate}'/>"/>
	<input type="hidden" name="status" value="<c:out value='${searchVO.status}'/>"/>
	<input type="hidden" name="name" value="<c:out value='${searchVO.name}'/>"/>
	<input type="hidden" name="mobile" value="<c:out value='${searchVO.mobile}'/>"/>
</form>


<form name="frm" action="<c:url value='/sb03/sub01.do'/>"  method="post" >
<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>

<table class="dash_table tal mb">
	<colgroup>
		<col width="10%"/>
		<col width="90%"/>
	</colgroup>
	<tr>
		<th>신청일</th>
		<td>
			<input type="text" name="sdate" id="sdate" class="cal_date w10" value="<c:out value="${searchVO.sdate}"/>"  />
			<input type="text" name="edate" id="edate" class="cal_date w10" value="<c:out value="${searchVO.edate}"/>"  />
		</td>
	</tr>
	<tr>
		<th>상태</th>
		<td>
			<input type="radio" name="status" id="status1" value="" <c:if test="${'' eq searchVO.status}">checked</c:if> /><label for="status1">전체</label>
			<input type="radio" name="status" id="status2" value="1" <c:if test="${'1' eq searchVO.status}">checked</c:if> /><label for="status1">접수</label>
			<input type="radio" name="status" id="status3" value="2" <c:if test="${'2' eq searchVO.status}">checked</c:if> /><label for="status1">승인</label>
			<input type="radio" name="status" id="status4" value="3" <c:if test="${'3' eq searchVO.status}">checked</c:if> /><label for="status1">반려</label>
		</td>
	</tr>
	<tr>
		<th>신청자</th>
		<td>
			<input type="text" class="w20" name="name" id="name" value="<c:out value='${searchVO.name}'/>" />
			<span class="ml20">휴대폰</span><input type="text" class="w20" name="mobile" id="mobile" value="<c:out value='${searchVO.mobile}'/>" />
		</td>
	</tr>
</table>
<div class="ok_btn bmb">
	<ul>
		<li><button type="button" class="btn_sumit2 btn_src" onclick="fn_egov_select_List('1')">검색</button></li>
		<li><button type="button" class="btn_sumit2 btn_src" onclick="fn_egov_write('0')">추가</button></li>
	</ul>
</div>

</form>

<h4 class="tit_dot">검색결과</h4>
<div class="bgtab bgtab2">
	<div class="half">
		<h3 class="dpi mr10">검색</h3>
		<p class="dpi">총 <fmt:formatNumber value="${totCnt}" groupingUsed="true"/>건</p>
	</div>
	<div class="half">
		<ul class="dpi_li tar">
			<li>
				선택한 항목을 
				<select name="status" id="status7" class="w30" onchange="fn_egov_change_status();">
					<option value="" >상태변경</option>
					<option value="1" >접수</option>
					<option value="2" >승인</option>
					<option value="3" >반려</option>
				</select>
				변경&nbsp;&nbsp;&nbsp;
			</li>
			<li><a href="#" class="btn_sumit" onclick="fn_egov_select_dele();">선택삭제</a></li>
		</ul>
	</div>
</div>

<form name="delfrm" method="post">
<input type="hidden" name="cstate" id="cstate" value="" />
<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>
<input type="hidden" name="sdate" value="<c:out value='${searchVO.sdate}'/>"/>
<input type="hidden" name="edate" value="<c:out value='${searchVO.edate}'/>"/>
<input type="hidden" name="status" value="<c:out value='${searchVO.status}'/>"/>
<input type="hidden" name="name" value="<c:out value='${searchVO.name}'/>"/>
<input type="hidden" name="mobile" value="<c:out value='${searchVO.mobile}'/>"/>

<table class="comm_table tac bmb">
	<tr>
		<th>
			<input type="checkbox" class="checkbox" id="p1" />
		</th>
		<th>ROOM</th>
		<th>예약일</th>
		<th>시간</th>
		<th>업체명</th>
		<th>예약자</th>
		<th>예약인원</th>
		<th>휴대폰</th>
		<th>상태</th>
	</tr>
	<tbdoy>
	<c:forEach var="result" items="${rent_list}" varStatus="status">
	<tr class="HighlightableRow">
		<td>
			<input type="checkbox" name="idx" id="idx_<c:out value="${result.idx}"/>" class="checkbox" value="${result.idx}" />
			<c:out value="${totCnt - ((searchVO.pageIndex-1) * 20 + status.count -1)}"/>
		</td>
		<td><a href="#" onclick="fn_egov_write('${result.idx}');">
			<c:choose>
				<c:when test="${result.room_id1 eq 's1'}">
					소회의실1
				</c:when>
				<c:when test="${result.room_id1 eq 's2'}">
					소회의실2
				</c:when>
				<c:when test="${result.room_id1 eq 's3'}">
					소회의실3
				</c:when>
				<c:when test="${result.room_id1 eq 's4'}">
					소회의실4
				</c:when>
				<c:when test="${result.room_id1 eq 's5'}">
					소회의실5
				</c:when>
				<c:when test="${result.room_id1 eq 's6'}">
					소회의실6
				</c:when>
				<c:when test="${result.room_id1 eq 's7'}">
					대회의실
				</c:when>
			</c:choose>
			
			<c:if test="${'' ne result.room_id2}">,&nbsp;
				<c:choose>
					<c:when test="${result.room_id2 eq 's1'}">
						소회의실1
					</c:when>
					<c:when test="${result.room_id2 eq 's2'}">
						소회의실2
					</c:when>
					<c:when test="${result.room_id2 eq 's3'}">
						소회의실3
					</c:when>
					<c:when test="${result.room_id2 eq 's4'}">
						소회의실4
					</c:when>
					<c:when test="${result.room_id2 eq 's5'}">
						소회의실5
					</c:when>
					<c:when test="${result.room_id2 eq 's6'}">
						소회의실6
					</c:when>
					<c:when test="${result.room_id2 eq 's7'}">
						대회의실
					</c:when>
				</c:choose>
			</c:if>
			
			<c:if test="${'' ne result.room_id3}">,&nbsp;
				<c:choose>
					<c:when test="${result.room_id3 eq 's1'}">
						소회의실1
					</c:when>
					<c:when test="${result.room_id3 eq 's2'}">
						소회의실2
					</c:when>
					<c:when test="${result.room_id3 eq 's3'}">
						소회의실3
					</c:when>
					<c:when test="${result.room_id3 eq 's4'}">
						소회의실4
					</c:when>
					<c:when test="${result.room_id3 eq 's5'}">
						소회의실5
					</c:when>
					<c:when test="${result.room_id3 eq 's6'}">
						소회의실6
					</c:when>
					<c:when test="${result.room_id3 eq 's7'}">
						대회의실
					</c:when>
				</c:choose>
			</c:if>
			</a>
		</td>
		<td><a href="#" onclick="fn_egov_write('${result.idx}');"><c:out value="${result.datexx}"/></a></td>
		<td><a href="#" onclick="fn_egov_write('${result.idx}');">
				<c:set var="timestr" value="${result.timexx}"/>
				<c:if test = "${fn:contains(timestr, '0900')}">
					<span>09:00~09:30&nbsp;</span>
				</c:if>
				<c:if test = "${fn:contains(timestr, '0930')}">
					<span>09:30~10:00&nbsp;</span>
				</c:if>
				<c:if test = "${fn:contains(timestr, '1000')}">
					<span>10:00~10:30&nbsp;</span>
				</c:if>
				<c:if test = "${fn:contains(timestr, '1030')}">
					<span>10:30~11:00&nbsp;</span>
				</c:if>
				
				<c:if test = "${fn:contains(timestr, '1100')}">
					<span>11:00~11:30&nbsp;</span>
				</c:if>
				<c:if test = "${fn:contains(timestr, '1130')}">
					<span>11:30~12:00&nbsp;</span>
				</c:if>
				
				<c:if test = "${fn:contains(timestr, '1200')}">
					<span>12:00~12:30&nbsp;</span>
				</c:if>
				<c:if test = "${fn:contains(timestr, '1230')}">
					<span>12:30~13:00&nbsp;</span>
				</c:if>
				
				<c:if test = "${fn:contains(timestr, '1300')}">
					<span>13:00~13:30&nbsp;</span>
				</c:if>
				<c:if test = "${fn:contains(timestr, '1330')}">
					<span>13:30~14:00&nbsp;</span>
				</c:if>
				
				<c:if test = "${fn:contains(timestr, '1400')}">
					<span>14:00~14:30&nbsp;</span>
				</c:if>
				<c:if test = "${fn:contains(timestr, '1430')}">
					<span>14:30~15:00&nbsp;</span>
				</c:if>
				
				<c:if test = "${fn:contains(timestr, '1500')}">
					<span>15:00~15:30&nbsp;</span>
				</c:if>
				<c:if test = "${fn:contains(timestr, '1530')}">
					<span>15:30~16:00&nbsp;</span>
				</c:if>
				
				<c:if test = "${fn:contains(timestr, '1600')}">
					<span>16:00~16:30&nbsp;</span>
				</c:if>
				<c:if test = "${fn:contains(timestr, '1630')}">
					<span>16:30~17:00&nbsp;</span>
				</c:if>
				
				<c:if test = "${fn:contains(timestr, '1700')}">
					<span>17:00~17:30&nbsp;</span>
				</c:if>
				<c:if test = "${fn:contains(timestr, '1730')}">
					<span>17:30~18:00&nbsp;</span>
				</c:if>
			</a>
		</td>
		<td><a href="#" onclick="fn_egov_write('${result.idx}');"><c:out value="${result.company}"/></a></td>
		<td style="font-weight:bold;"><a href="#" onclick="fn_egov_write('${result.idx}');"><c:out value="${result.name}"/></a></td>
		<td><a href="#" onclick="fn_egov_write('${result.idx}');"><c:out value="${result.people_cnt}"/></a></td>
		<td><a href="#" onclick="fn_egov_write('${result.idx}');"><c:out value="${result.mobile}"/></a></td>
		<td>
			<a href="#" onclick="fn_egov_write('${result.idx}');">
				<c:choose>
				<c:when test="${result.status eq 1}">
					접수
				</c:when>
				<c:when test="${result.status eq 2}">
					승인
				</c:when>
				<c:when test="${result.status eq 3}">
					반려
				</c:when>
				<c:otherwise>
					<span style="color:blue;">접수</span>
				</c:otherwise>
			</c:choose>
			</a>
		</td>
	</tr>
	</c:forEach>
	<c:if test="${fn:length(rent_list) == 0}">
	<tr>
		<td colspan="9">일치하는 자료가 없습니다.</td>
	</tr>	
	</c:if>
	</tbdoy>
</table>

</form>

<div class="pageList">
	<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_select_List" />
</div>



<%@ include file="/WEB-INF/jsp/egovframework/gntbsc/wssms/footer.jsp" %>