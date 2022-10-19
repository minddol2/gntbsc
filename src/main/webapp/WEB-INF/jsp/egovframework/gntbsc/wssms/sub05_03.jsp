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
int m2 = 3;
int m3 = 0;

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
	$( "#sdate, #edate" ).datepicker({
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

function fn_egov_select_List() {
	document.frm.action = "<c:url value='/sb05/sub03.do'/>";
	 document.frm.method = "post";
	document.frm.submit();
}

function fn_egov_excel() {
	 document.frm.action = "<c:url value='/sb05/sub03_excel.do'/>";
	 document.frm.method = "get";
	 document.frm.submit();
}
</script>


<h4 class="tit_dot">신청통계</h4>

<form name="frm" action="<c:url value='/sb05/sub03.do'/>"  method="post" >

<div class="crewtop bmb">
	<div class="bgtab">
		<h3 class="txtin">상담신청현황</h3>	
	</div>
	<table class="srch_table mb20">	
		<colgroup>
			<col width="10%">
			<col width="90%">
		</colgroup>
		<tbody>			
			<tr>
				<th>기간검색</th>
				<td>
					<input type="text" name="sdate" id="sdate" value="<c:out value='${searchVO.sdate}'/>" /><button type="button" class="btn_cal" onclick="show_sd();"></button> - 
					<input type="text" name="edate" id="edate" value="<c:out value='${searchVO.edate}'/>" /><button type="button" class="btn_cal" onclick="show_ed();"></button>&nbsp;&nbsp;
					<ul class="dpi_li dpi">
						<li><a href="#" class="btn_sumit" onclick="set_datex('이번달');">이번달</a></li>
						<li><a href="#" class="btn_sumit" onclick="set_datex('전체');">전체</a></li>
					</ul>
				</td>				
			</tr>				
		</tbody>
	</table>
	<div class="ok_btn">
		<ul>
			<li><button type="button" class="btn_sumit2" onclick="fn_egov_select_List();">검색</button></li>
			<li><button type="button" class="btn_sumit2" onclick="fn_egov_excel()" >엑셀다운로드</button></li>
		</ul>
	</div>	
</div>

</form>


<h4 class="tit_dot">상담유형별 </h4>
<p class="mb10 fsb">검색기간: <c:out value='${searchVO.sdate}'/>~<c:out value='${searchVO.edate}'/></p>
<table class="dash_table fsb tac bmb">	
	<colgroup>	
		<col width="16.6%"/>
		<col width="16.6%"/>
		<col width="16.6%"/>
		<col width="16.6%"/>
		<col width="16.6%"/>
		<col width="16.6%"/>
	</colgroup>
	<tbody>
		<tr>
			<th>창업</th>
			<th>마케팅/홍보</th>
			<th>투자</th>
			<th>경영심화</th>
			<th>관광</th>			
			<th>제품디자인</th>
		</tr>
		<tr>
			<td><fmt:formatNumber value="${svo1.s_item1}" groupingUsed="true"/></td>
			<td><fmt:formatNumber value="${svo1.s_item2}" groupingUsed="true"/></td>
			<td><fmt:formatNumber value="${svo1.s_item3}" groupingUsed="true"/></td>
			<td><fmt:formatNumber value="${svo1.s_item4}" groupingUsed="true"/></td>
			<td><fmt:formatNumber value="${svo1.s_item5}" groupingUsed="true"/></td>
			<td><fmt:formatNumber value="${svo1.s_item7}" groupingUsed="true"/></td>
		</tr>
		<tr>
			<td colspan="6">총 합계: <fmt:formatNumber value="${svo1.s_item6}" groupingUsed="true"/> 건</td>
		</tr>		
	</tbody>
</table>
<h4 class="tit_dot">상담유형상세 </h4>
<p class="mb10 fsb">검색기간: <c:out value='${searchVO.sdate}'/>~<c:out value='${searchVO.edate}'/></p>
<table class="comm_table tac mb">	
	<colgroup>
		<col width="15%"/>
		<col width="15%"/>
		<col width="10%"/>
		<col width="10%"/>
		<col width="10%"/>
		<col width="10%"/>
		<col width="10%"/>
		<col width="10%"/>
		<col width="10%"/>		
	</colgroup>
	<tbody>
		<tr>
			<th colspan="2" rowspan="2">상담구분</th>
			<th colspan="7">통계</th>			
		</tr>
		<tr>			
			<th>전체</th>
			<th>도내기업</th>
			<th>입주기업</th>
			<th>예비창업자</th>
			<th>서면</th>
			<th>화상</th>
			<th>대면</th>
		</tr>
		<c:set var="t_count1" value="0" />
		<c:set var="t_count2" value="0" />
		<c:set var="t_count3" value="0" />
		<c:set var="t_count4" value="0" />
		<c:set var="t_count5" value="0" />
		<c:set var="t_count6" value="0" />
		<c:set var="t_count7" value="0" />
		<c:set var="t_no" value="0" />
		<c:forEach var="result" items="${svo2}" varStatus="status">
		<tr>
			<c:if test="${t_no eq 0}">
			<th rowspan="${fn:length(svo2)}">창업</th>
			</c:if>
			<td class="bgc"><c:out value="${result.us_major12_nm}"/></td>
			<td><fmt:formatNumber value="${result.s_item1}" groupingUsed="true"/></td>
			<td><fmt:formatNumber value="${result.s_item2}" groupingUsed="true"/></td>
			<td><fmt:formatNumber value="${result.s_item3}" groupingUsed="true"/></td>
			<td><fmt:formatNumber value="${result.s_item4}" groupingUsed="true"/></td>
			<td><fmt:formatNumber value="${result.s_item5}" groupingUsed="true"/></td>
			<td><fmt:formatNumber value="${result.s_item6}" groupingUsed="true"/></td>
			<td><fmt:formatNumber value="${result.s_item7}" groupingUsed="true"/></td>
		</tr>
		<c:set var= "t_no" value="${t_no + 1}"/>
		<c:set var= "t_count1" value="${t_count1 + result.s_item1}"/>
		<c:set var= "t_count2" value="${t_count2 + result.s_item2}"/>
		<c:set var= "t_count3" value="${t_count3 + result.s_item3}"/>
		<c:set var= "t_count4" value="${t_count4 + result.s_item4}"/>
		<c:set var= "t_count5" value="${t_count5 + result.s_item5}"/>
		<c:set var= "t_count6" value="${t_count6 + result.s_item6}"/>
		<c:set var= "t_count7" value="${t_count7 + result.s_item7}"/>
		</c:forEach>
		<tr>
			<th class="bgc" colspan="2">총 합계</th>
			<td class="bgc"><fmt:formatNumber value="${t_count1}" groupingUsed="true"/></td>
			<td class="bgc"><fmt:formatNumber value="${t_count2}" groupingUsed="true"/></td>
			<td class="bgc"><fmt:formatNumber value="${t_count3}" groupingUsed="true"/></td>
			<td class="bgc"><fmt:formatNumber value="${t_count4}" groupingUsed="true"/></td>
			<td class="bgc"><fmt:formatNumber value="${t_count5}" groupingUsed="true"/></td>
			<td class="bgc"><fmt:formatNumber value="${t_count6}" groupingUsed="true"/></td>
			<td class="bgc"><fmt:formatNumber value="${t_count7}" groupingUsed="true"/></td>
		</tr>		
		
		
	</tbody>
</table>
<table class="comm_table tac mb">	
	<colgroup>
		<col width="15%"/>
		<col width="15%"/>
		<col width="10%"/>
		<col width="10%"/>
		<col width="10%"/>
		<col width="10%"/>
		<col width="10%"/>
		<col width="10%"/>
		<col width="10%"/>		
	</colgroup>
	<tbody>
		<tr>
			<th colspan="2" rowspan="2">상담구분</th>
			<th colspan="7">통계</th>			
		</tr>
		<tr>			
			<th>전체</th>
			<th>도내기업</th>
			<th>입주기업</th>
			<th>예비창업자</th>
			<th>서면</th>
			<th>화상</th>
			<th>대면</th>
		</tr>
		<c:set var="t_count1" value="0" />
		<c:set var="t_count2" value="0" />
		<c:set var="t_count3" value="0" />
		<c:set var="t_count4" value="0" />
		<c:set var="t_count5" value="0" />
		<c:set var="t_count6" value="0" />
		<c:set var="t_count7" value="0" />
		<c:set var="t_no" value="0" />
		<c:forEach var="result" items="${svo3}" varStatus="status">
		<tr>
			<c:if test="${t_no eq 0}">
			<th rowspan="${fn:length(svo3)}">마케팅/홍보</th>
			</c:if>
			<td class="bgc"><c:out value="${result.us_major12_nm}"/></td>
			<td><fmt:formatNumber value="${result.s_item1}" groupingUsed="true"/></td>
			<td><fmt:formatNumber value="${result.s_item2}" groupingUsed="true"/></td>
			<td><fmt:formatNumber value="${result.s_item3}" groupingUsed="true"/></td>
			<td><fmt:formatNumber value="${result.s_item4}" groupingUsed="true"/></td>
			<td><fmt:formatNumber value="${result.s_item5}" groupingUsed="true"/></td>
			<td><fmt:formatNumber value="${result.s_item6}" groupingUsed="true"/></td>
			<td><fmt:formatNumber value="${result.s_item7}" groupingUsed="true"/></td>
		</tr>
		<c:set var= "t_no" value="${t_no + 1}"/>
		<c:set var= "t_count1" value="${t_count1 + result.s_item1}"/>
		<c:set var= "t_count2" value="${t_count2 + result.s_item2}"/>
		<c:set var= "t_count3" value="${t_count3 + result.s_item3}"/>
		<c:set var= "t_count4" value="${t_count4 + result.s_item4}"/>
		<c:set var= "t_count5" value="${t_count5 + result.s_item5}"/>
		<c:set var= "t_count6" value="${t_count6 + result.s_item6}"/>
		<c:set var= "t_count7" value="${t_count7 + result.s_item7}"/>
		</c:forEach>
		<tr>
			<th class="bgc" colspan="2">총 합계</th>
			<td class="bgc"><fmt:formatNumber value="${t_count1}" groupingUsed="true"/></td>
			<td class="bgc"><fmt:formatNumber value="${t_count2}" groupingUsed="true"/></td>
			<td class="bgc"><fmt:formatNumber value="${t_count3}" groupingUsed="true"/></td>
			<td class="bgc"><fmt:formatNumber value="${t_count4}" groupingUsed="true"/></td>
			<td class="bgc"><fmt:formatNumber value="${t_count5}" groupingUsed="true"/></td>
			<td class="bgc"><fmt:formatNumber value="${t_count6}" groupingUsed="true"/></td>
			<td class="bgc"><fmt:formatNumber value="${t_count7}" groupingUsed="true"/></td>
		</tr>		
		
	</tbody>
</table>
<table class="comm_table tac mb">	
	<colgroup>
		<col width="15%"/>
		<col width="15%"/>
		<col width="10%"/>
		<col width="10%"/>
		<col width="10%"/>
		<col width="10%"/>
		<col width="10%"/>
		<col width="10%"/>
		<col width="10%"/>		
	</colgroup>
	<tbody>
		<tr>
			<th colspan="2" rowspan="2">상담구분</th>
			<th colspan="7">통계</th>			
		</tr>
		<tr>			
			<th>전체</th>
			<th>도내기업</th>
			<th>입주기업</th>
			<th>예비창업자</th>
			<th>서면</th>
			<th>화상</th>
			<th>대면</th>
		</tr>
		<c:set var="t_count1" value="0" />
		<c:set var="t_count2" value="0" />
		<c:set var="t_count3" value="0" />
		<c:set var="t_count4" value="0" />
		<c:set var="t_count5" value="0" />
		<c:set var="t_count6" value="0" />
		<c:set var="t_count7" value="0" />
		<c:set var="t_no" value="0" />
		<c:forEach var="result" items="${svo4}" varStatus="status">
		<tr>
			<c:if test="${t_no eq 0}">
			<th rowspan="${fn:length(svo4)}">투자</th>
			</c:if>
			<td class="bgc"><c:out value="${result.us_major12_nm}"/></td>
			<td><fmt:formatNumber value="${result.s_item1}" groupingUsed="true"/></td>
			<td><fmt:formatNumber value="${result.s_item2}" groupingUsed="true"/></td>
			<td><fmt:formatNumber value="${result.s_item3}" groupingUsed="true"/></td>
			<td><fmt:formatNumber value="${result.s_item4}" groupingUsed="true"/></td>
			<td><fmt:formatNumber value="${result.s_item5}" groupingUsed="true"/></td>
			<td><fmt:formatNumber value="${result.s_item6}" groupingUsed="true"/></td>
			<td><fmt:formatNumber value="${result.s_item7}" groupingUsed="true"/></td>
		</tr>
		<c:set var= "t_no" value="${t_no + 1}"/>
		<c:set var= "t_count1" value="${t_count1 + result.s_item1}"/>
		<c:set var= "t_count2" value="${t_count2 + result.s_item2}"/>
		<c:set var= "t_count3" value="${t_count3 + result.s_item3}"/>
		<c:set var= "t_count4" value="${t_count4 + result.s_item4}"/>
		<c:set var= "t_count5" value="${t_count5 + result.s_item5}"/>
		<c:set var= "t_count6" value="${t_count6 + result.s_item6}"/>
		<c:set var= "t_count7" value="${t_count7 + result.s_item7}"/>
		</c:forEach>
		<tr>
			<th class="bgc" colspan="2">총 합계</th>
			<td class="bgc"><fmt:formatNumber value="${t_count1}" groupingUsed="true"/></td>
			<td class="bgc"><fmt:formatNumber value="${t_count2}" groupingUsed="true"/></td>
			<td class="bgc"><fmt:formatNumber value="${t_count3}" groupingUsed="true"/></td>
			<td class="bgc"><fmt:formatNumber value="${t_count4}" groupingUsed="true"/></td>
			<td class="bgc"><fmt:formatNumber value="${t_count5}" groupingUsed="true"/></td>
			<td class="bgc"><fmt:formatNumber value="${t_count6}" groupingUsed="true"/></td>
			<td class="bgc"><fmt:formatNumber value="${t_count7}" groupingUsed="true"/></td>
		</tr>
	</tbody>
</table>

<table class="comm_table tac mb">	
	<colgroup>
		<col width="15%"/>
		<col width="15%"/>
		<col width="10%"/>
		<col width="10%"/>
		<col width="10%"/>
		<col width="10%"/>
		<col width="10%"/>
		<col width="10%"/>
		<col width="10%"/>		
	</colgroup>
	<tbody>
		<tr>
			<th colspan="2" rowspan="2">상담구분</th>
			<th colspan="7">통계</th>			
		</tr>
		<tr>			
			<th>전체</th>
			<th>도내기업</th>
			<th>입주기업</th>
			<th>예비창업자</th>
			<th>서면</th>
			<th>화상</th>
			<th>대면</th>
		</tr>
		<c:set var="t_count1" value="0" />
		<c:set var="t_count2" value="0" />
		<c:set var="t_count3" value="0" />
		<c:set var="t_count4" value="0" />
		<c:set var="t_count5" value="0" />
		<c:set var="t_count6" value="0" />
		<c:set var="t_count7" value="0" />
		<c:set var="t_no" value="0" />
		<c:forEach var="result" items="${svo5}" varStatus="status">
		<tr>
			<c:if test="${t_no eq 0}">
			<th rowspan="${fn:length(svo5)}">경영심화</th>
			</c:if>
			<td class="bgc"><c:out value="${result.us_major12_nm}"/></td>
			<td><fmt:formatNumber value="${result.s_item1}" groupingUsed="true"/></td>
			<td><fmt:formatNumber value="${result.s_item2}" groupingUsed="true"/></td>
			<td><fmt:formatNumber value="${result.s_item3}" groupingUsed="true"/></td>
			<td><fmt:formatNumber value="${result.s_item4}" groupingUsed="true"/></td>
			<td><fmt:formatNumber value="${result.s_item5}" groupingUsed="true"/></td>
			<td><fmt:formatNumber value="${result.s_item6}" groupingUsed="true"/></td>
			<td><fmt:formatNumber value="${result.s_item7}" groupingUsed="true"/></td>
		</tr>
		<c:set var= "t_no" value="${t_no + 1}"/>
		<c:set var= "t_count1" value="${t_count1 + result.s_item1}"/>
		<c:set var= "t_count2" value="${t_count2 + result.s_item2}"/>
		<c:set var= "t_count3" value="${t_count3 + result.s_item3}"/>
		<c:set var= "t_count4" value="${t_count4 + result.s_item4}"/>
		<c:set var= "t_count5" value="${t_count5 + result.s_item5}"/>
		<c:set var= "t_count6" value="${t_count6 + result.s_item6}"/>
		<c:set var= "t_count7" value="${t_count7 + result.s_item7}"/>
		</c:forEach>
		<tr>
			<th class="bgc" colspan="2">총 합계</th>
			<td class="bgc"><fmt:formatNumber value="${t_count1}" groupingUsed="true"/></td>
			<td class="bgc"><fmt:formatNumber value="${t_count2}" groupingUsed="true"/></td>
			<td class="bgc"><fmt:formatNumber value="${t_count3}" groupingUsed="true"/></td>
			<td class="bgc"><fmt:formatNumber value="${t_count4}" groupingUsed="true"/></td>
			<td class="bgc"><fmt:formatNumber value="${t_count5}" groupingUsed="true"/></td>
			<td class="bgc"><fmt:formatNumber value="${t_count6}" groupingUsed="true"/></td>
			<td class="bgc"><fmt:formatNumber value="${t_count7}" groupingUsed="true"/></td>
		</tr>	
	</tbody>
</table>

<table class="comm_table tac mb">	
	<colgroup>
		<col width="15%"/>
		<col width="15%"/>
		<col width="10%"/>
		<col width="10%"/>
		<col width="10%"/>
		<col width="10%"/>
		<col width="10%"/>
		<col width="10%"/>
		<col width="10%"/>		
	</colgroup>
	<tbody>
		<tr>
			<th colspan="2" rowspan="2">상담구분</th>
			<th colspan="7">통계</th>			
		</tr>
		<tr>			
			<th>전체</th>
			<th>도내기업</th>
			<th>입주기업</th>
			<th>예비창업자</th>
			<th>서면</th>
			<th>화상</th>
			<th>대면</th>
		</tr>
		<c:set var="t_count1" value="0" />
		<c:set var="t_count2" value="0" />
		<c:set var="t_count3" value="0" />
		<c:set var="t_count4" value="0" />
		<c:set var="t_count5" value="0" />
		<c:set var="t_count6" value="0" />
		<c:set var="t_count7" value="0" />
		<c:set var="t_no" value="0" />
		<c:forEach var="result" items="${svo6}" varStatus="status">
		<tr>
			<c:if test="${t_no eq 0}">
			<th rowspan="${fn:length(svo6)}">관광</th>
			</c:if>
			<td class="bgc"><c:out value="${result.us_major12_nm}"/></td>
			<td><fmt:formatNumber value="${result.s_item1}" groupingUsed="true"/></td>
			<td><fmt:formatNumber value="${result.s_item2}" groupingUsed="true"/></td>
			<td><fmt:formatNumber value="${result.s_item3}" groupingUsed="true"/></td>
			<td><fmt:formatNumber value="${result.s_item4}" groupingUsed="true"/></td>
			<td><fmt:formatNumber value="${result.s_item5}" groupingUsed="true"/></td>
			<td><fmt:formatNumber value="${result.s_item6}" groupingUsed="true"/></td>
			<td><fmt:formatNumber value="${result.s_item7}" groupingUsed="true"/></td>
		</tr>
		<c:set var= "t_no" value="${t_no + 1}"/>
		<c:set var= "t_count1" value="${t_count1 + result.s_item1}"/>
		<c:set var= "t_count2" value="${t_count2 + result.s_item2}"/>
		<c:set var= "t_count3" value="${t_count3 + result.s_item3}"/>
		<c:set var= "t_count4" value="${t_count4 + result.s_item4}"/>
		<c:set var= "t_count5" value="${t_count5 + result.s_item5}"/>
		<c:set var= "t_count6" value="${t_count6 + result.s_item6}"/>
		<c:set var= "t_count7" value="${t_count7 + result.s_item7}"/>
		</c:forEach>
		<tr>
			<th class="bgc" colspan="2">총 합계</th>
			<td class="bgc"><fmt:formatNumber value="${t_count1}" groupingUsed="true"/></td>
			<td class="bgc"><fmt:formatNumber value="${t_count2}" groupingUsed="true"/></td>
			<td class="bgc"><fmt:formatNumber value="${t_count3}" groupingUsed="true"/></td>
			<td class="bgc"><fmt:formatNumber value="${t_count4}" groupingUsed="true"/></td>
			<td class="bgc"><fmt:formatNumber value="${t_count5}" groupingUsed="true"/></td>
			<td class="bgc"><fmt:formatNumber value="${t_count6}" groupingUsed="true"/></td>
			<td class="bgc"><fmt:formatNumber value="${t_count7}" groupingUsed="true"/></td>
		</tr>	
	</tbody>
</table>


<table class="comm_table tac mb">	
	<colgroup>
		<col width="15%"/>
		<col width="15%"/>
		<col width="10%"/>
		<col width="10%"/>
		<col width="10%"/>
		<col width="10%"/>
		<col width="10%"/>
		<col width="10%"/>
		<col width="10%"/>		
	</colgroup>
	<tbody>
		<tr>
			<th colspan="2" rowspan="2">상담구분</th>
			<th colspan="7">통계</th>			
		</tr>
		<tr>			
			<th>전체</th>
			<th>도내기업</th>
			<th>입주기업</th>
			<th>예비창업자</th>
			<th>서면</th>
			<th>화상</th>
			<th>대면</th>
		</tr>
		<c:set var="t_count1" value="0" />
		<c:set var="t_count2" value="0" />
		<c:set var="t_count3" value="0" />
		<c:set var="t_count4" value="0" />
		<c:set var="t_count5" value="0" />
		<c:set var="t_count6" value="0" />
		<c:set var="t_count7" value="0" />
		<c:set var="t_no" value="0" />
		<c:forEach var="result7" items="${svo7}" varStatus="status">
		<tr>
			<c:if test="${t_no eq 0}">
			<th>제품디자인</th>
			</c:if>
			<td class="bgc"><c:out value="${result7.us_major12_nm}"/></td>
			<td><fmt:formatNumber value="${result7.s_item1}" groupingUsed="true"/></td>
			<td><fmt:formatNumber value="${result7.s_item2}" groupingUsed="true"/></td>
			<td><fmt:formatNumber value="${result7.s_item3}" groupingUsed="true"/></td>
			<td><fmt:formatNumber value="${result7.s_item4}" groupingUsed="true"/></td>
			<td><fmt:formatNumber value="${result7.s_item5}" groupingUsed="true"/></td>
			<td><fmt:formatNumber value="${result7.s_item6}" groupingUsed="true"/></td>
			<td><fmt:formatNumber value="${result7.s_item7}" groupingUsed="true"/></td>
		</tr>
		<c:set var= "t_no" value="${t_no + 1}"/>
		<c:set var= "t_count1" value="${t_count1 + result.s_item1}"/>
		<c:set var= "t_count2" value="${t_count2 + result.s_item2}"/>
		<c:set var= "t_count3" value="${t_count3 + result.s_item3}"/>
		<c:set var= "t_count4" value="${t_count4 + result.s_item4}"/>
		<c:set var= "t_count5" value="${t_count5 + result.s_item5}"/>
		<c:set var= "t_count6" value="${t_count6 + result.s_item6}"/>
		<c:set var= "t_count7" value="${t_count7 + result.s_item7}"/>
		</c:forEach>
		<tr>
			<th class="bgc" colspan="2">총 합계</th>
			<td class="bgc"><fmt:formatNumber value="${t_count1}" groupingUsed="true"/></td>
			<td class="bgc"><fmt:formatNumber value="${t_count2}" groupingUsed="true"/></td>
			<td class="bgc"><fmt:formatNumber value="${t_count3}" groupingUsed="true"/></td>
			<td class="bgc"><fmt:formatNumber value="${t_count4}" groupingUsed="true"/></td>
			<td class="bgc"><fmt:formatNumber value="${t_count5}" groupingUsed="true"/></td>
			<td class="bgc"><fmt:formatNumber value="${t_count6}" groupingUsed="true"/></td>
			<td class="bgc"><fmt:formatNumber value="${t_count7}" groupingUsed="true"/></td>
		</tr>	
	</tbody>
</table>







<%@ include file="/WEB-INF/jsp/egovframework/gntbsc/wssms/footer.jsp" %>