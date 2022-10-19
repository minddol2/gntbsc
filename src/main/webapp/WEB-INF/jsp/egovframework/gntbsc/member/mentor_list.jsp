<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="egovframework.com.cmm.service.EgovProperties" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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

<style>
.mentoring_ing{padding:15px 0px; border-top:1px solid #e6e6e6; border-bottom:1px solid #e6e6e6; box-sizing:border-box; background:#f9f9f9; overflow:hidden}
.mentoring_ing .mentor_i{float:left; width:25%; text-align:center;}
.mentoring_ing .mentor_i dt{color:#006fba; font-weight:500;}
.mentoring_ing .mentor_i dd b{font-size:1.2em; font-weight:600;}

.mentor_date{overflow:hidden}
.mentor_date .data_select{padding:0px; float:right; max-width:400px; margin-bottom:15px}
.mentor_date .data_select button{border:0px; }
.mentor_date .data_select:after{content:''; clear:both; display:block;}
.mentor_date .data_select .box{width:calc(48% - 41px); float:left; position:relative}
.mentor_date .data_select .box:first-child{margin-right:4%;}
.mentor_date .data_select .box:first-child:after{content:''; width:4%; height:1px; background:#808080; position:absolute; right:-8%; top:0; bottom:0; margin:auto}
.mentor_date .data_select .box button{position:absolute; right:0; top:0; background:#123d88; width:36px;}
.mentor_date .data_select .box input{width:100%}
.mentor_date .data_select .box button:before{color:#ffffff; font-size:13px}

.mentor_date .data_select_button{float:left; width:82px; position:relative;}
.mentor_date .data_select_button{overflow:hidden}
.mentor_date .data_select_button button{float:left; border:0px; background:#1abbb7; color:#ffffff;  width:36px; height:36px;}
.mentor_date .data_select_button button.btn_search{background:#006fba; text-indent:-999999px; position:relative; margin-left:5px}
.mentor_date .data_select_button button.btn_search:before{font-family:'FontAwesome'; content:'\f002'; color:#ffffff; font-size:1.3em; position:absolute; text-indent:0; left:0; right:0; top:0; bottom:0; line-height:36px; text-align:center}

.mentor_date .data_select_button button.btn_reset{text-indent:-999999px; position:relative; width:36px;  height:36px; line-height:36px; float:left; border:0; background:#1abbb7; margin-left:5px}
.mentor_date .data_select_button button.btn_reset:before{ font-family:'FontAwesome'; content:'\f0e2'; color:#ffffff; font-size:1.3em;  position:absolute; text-indent:0;  left:0; right:0; top:0; bottom:0; line-height:36px; text-align:center}


@media all and (min-width:768px) {
.mentoring_ing .mentor_i{padding:0 20px;}
.mentoring_ing .mentor_i dl{overflow:hidden}
.mentoring_ing .mentor_i dt,
.mentoring_ing .mentor_i dd{float:left; text-align:left; width:50%; line-height:30px}
.mentoring_ing .mentor_i dd{text-align:right;}
}

@media all and (min-width:768px) {

}

</style>

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
	$( ".date_box" ).datepicker({
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

function fn_egov_view(idx) {
	 document.submitParam.idx.value = idx;
	 document.submitParam.action = "<c:url value='/member/mentor_view.do'/>";
	 document.submitParam.submit();
}

function fn_egov_select_List(pageNo) {
	document.frm.pageIndex.value = pageNo;
	document.frm.action = "<c:url value='/member/mentor_list.do'/>";
	document.frm.submit();
}

function init_frm() {
	$("#sdate").val("");
	$("#edate").val("");
	document.frm.submit();
}
</script>




<form name="frm" action="<c:url value='/member/mentor_list.do'/>"  method="post" >
<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>

<div class="mentor_date">
	<div class="data_select">
		<div class="box">
			<input type="text" name="sdate" id="sdate" class="date_box " value="<c:out value='${searchVO.sdate}'/>"/><button type="button" class="btn_cal" id="start_date_btn" onclick="show_sd();"></button>
		</div> 
		<div class="box">
			<input type="text" name="edate" id="edate" class="date_box " value="<c:out value='${searchVO.edate}'/>"/><button type="button" class="btn_cal" id="end_date_btn" onclick="show_ed()"></button>
		</div>
		<div class="data_select_button">
			<button type="button" class="btn_search" onclick="fn_egov_select_List('1');">검색</button>
			<button type="button" class="btn_reset" onclick="init_frm();">초기화</button>
		</div>
	</div>
</div>
</form>

<div class="mentoring_ing ofh mb">	
	<div class="mentor_i">
		<dl>
			<dt>접수완료</dt>					
			<dd><b><fmt:formatNumber value="${mvo.cam_cnt}" groupingUsed="true"/></b>건</dd>
		</dl>
	</div>
	<div class="mentor_i">
		<dl>
			<dt>상담 중</dt>					
			<dd><b><fmt:formatNumber value="${mvo.pap_cnt}" groupingUsed="true"/></b>건</dd>
		</dl>
	</div>
	<div class="mentor_i">
		<dl>
			<dt>상담완료</dt>					
			<dd><b><fmt:formatNumber value="${mvo.mento_cnt}" groupingUsed="true"/></b>건</dd>
		</dl>
	</div>
	<div class="mentor_i">
		<dl>
			<dt>처리완료</dt>					
			<dd><b><fmt:formatNumber value="${mvo.avg_point}" groupingUsed="true"/></b>건</dd>
		</dl>
	</div>
</div>

<form name="submitParam" method="post">
	<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"  />
	<input type="hidden" name="idx" value=""  />
</form>

<div class="board_anwser secret_anwser">	
	<ul class="board_ul">
		<li class="title_li">
			<span class="select_btn"></span>		
			<div class="board_h5">					
				<span class="title">제목</span>
			</div>
			<div class="boardInfo">
				<span class="name">작성자</span>
				<span class="date">날짜</span>
				<span class="aw_status">비고</span>
			</div>
		</li>

		<c:forEach var="result" items="${memto_list}" varStatus="status">
		<li>
			<span class="select_btn"></span>
			<h5>
				<a href="#" onclick="fn_egov_view('${result.idx}');">			
					<span class="num"><c:out value="${result.idx}"/></span><span class="title"><span class="cate">[<c:out value="${result.us_major11_nm}"/>]</span> <c:out value="${result.title}"/></span>
				</a>
			</h5>
			<div class="boardInfo">
				<span class="name"><c:out value="${result.us_company}"/></span>
				<span class="date">
					<fmt:parseDate var="dateString" value="${result.reg_date}" pattern="yyyy-MM-dd" />
					<fmt:formatDate value="${dateString}" pattern="yyyy.MM.dd" />
				</span>
				<c:choose>
					<c:when test="${result.status eq 1}">
						<span class="aw_status s01"><b>접수</b></span>
					</c:when>
					<c:when test="${result.status eq 2}">
						<span class="aw_status s02"><b>접수완료</b></span>
					</c:when>
					<c:when test="${result.status eq 3}">
						<span class="aw_status s03"><b>상담중</b></span>
					</c:when>
					<c:when test="${result.status eq 4}">
						<span class="aw_status s04"><b>상담완료</b></span>
					</c:when>
					<c:otherwise>
						<span class="aw_status s05"><b>처리완료</b></span>
					</c:otherwise>
				</c:choose>
			</div>
		</li>
		</c:forEach>
				
	</ul>
</div>


<div class="pageList">
	<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_select_List" />
</div>


			</div><!--con-->
		</div><!--subcon-->
	</div><!--subwrap-->





<%@ include file="/WEB-INF/jsp/egovframework/gntbsc/inc/footer.jsp" %>