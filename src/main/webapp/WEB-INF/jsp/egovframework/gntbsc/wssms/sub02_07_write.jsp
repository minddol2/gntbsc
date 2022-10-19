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
int m1 = 2;
int m2 = 7;
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

<link rel="stylesheet" href="//code.jquery.com/ui/1.10.1/themes/base/jquery-ui.css" />  
<script src="//code.jquery.com/ui/1.10.1/jquery-ui.js"></script>
<script type="text/javascript">
<!--
$(document).ready(function(){	
	var resultMsg = '${resultMsg}';
	
	if(resultMsg != "") {
		alert(resultMsg);
	}
	
});

$(function() {    
	$( "#ntceBgnde, #ntceEndde" ).datepicker({
		dateFormat: "yymmdd",
		changeMonth: true,
		changeYear: true,
		showOtherMonths: true ,
		selectOtherMonths: true,
		showMonthAfterYear: true ,
		monthNamesShort: [ "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12" ],
		monthNames:[ "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12" ]
	}); 
});

function fn_egov_regist_BBS() {
    var frm = document.forms.board;
    
    if (frm.bbsId.value == ""){
    	alert('잘못된 접급입니다.');
        return;
    }
    if (frm.ntcrNm.value == ""){
    	alert('작성자를 입력하세요');
        return;
    }
    if (frm.nttSj.value == ""){
    	alert('제목을 입력하세요');
        return;
    }
    if (confirm('저장하시겠습니까?')) {
        //document.board.onsubmit();
        document.board.action = "<c:url value='/sb02/sub07_Add.do'/>";
        document.board.submit();
    }
}

function fn_egov_select_BBSList() {
    document.board.action = "<c:url value='/sb02/sub07.do'/>";
    document.board.submit();
}  

function pasteImage(img_url,target){
	//alert(img_url);
	sHTML = "<div><img src="+img_url+"  alt='image'/></div>";
	oEditors.getById[target].exec("PASTE_HTML", [sHTML]);
}
//-->
</script>

<h4 class="tit_dot">팝업존 관리</h4>


<script type="text/javascript" src="<c:url value='/js/EgovMultiFile.js'/>" ></script>

<form name="board" method="post" enctype="multipart/form-data">
	<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>" /> 
	<input type="hidden" name="bbsId" value="<c:out value='${bdMstr.bbsId}'/>" /> 
	<input type="hidden" name="bbsAttrbCode" value="<c:out value='${bdMstr.bbsAttrbCode}'/>" /> 
	<input type="hidden" name="bbsTyCode" value="<c:out value='${bdMstr.bbsTyCode}'/>" /> 
	<input type="hidden" name="replyPosblAt" value="<c:out value='${bdMstr.replyPosblAt}'/>" />
	<input type="hidden" name="fileAtchPosblAt" value="<c:out value='${bdMstr.fileAtchPosblAt}'/>" /> 
	<input type="hidden" name="posblAtchFileNumber" value="<c:out value='${bdMstr.posblAtchFileNumber}'/>" /> 
	<input type="hidden" name="posblAtchFileSize" value="<c:out value='${bdMstr.posblAtchFileSize}'/>" /> 
	<input type="hidden" name="tmplatId" value="<c:out value='${bdMstr.tmplatId}'/>" /> 
	<input type="hidden" name="cal_url" value="<c:url value='/sym/cmm/EgovNormalCalPopup.do'/>" />
	<input type="hidden" name="authFlag" value="<c:out value='${bdMstr.authFlag}'/>" />
	<input name="topx" type="hidden" value="0" />

	<div id="writeWrap">
		<div class="writecom writeTop">
			<ul>
				<li><span class="w_txt">상태</span> <span class="inputTxt"><input type="checkbox" name="category" id="category" hname="상태" value="on" />진행중</span></span></li>
				<li><span class="w_txt">제목</span> <span class="inputTxt"><input 	type="text" name="nttSj" class="input_txt w-col01"
						style="ime-mode: active;" id="nttSj" hname="제목" value="" option=""	required="required" title="제목 입력" /></span></li>
				<li><span class="w_txt">기간</span> <span class="inputTxt">
					<input type="text" name="ntceBgnde" class="input_txt" id="ntceBgnde" hname="기간" value="" title="기간 입력" /> ~ 
					<input type="text" name="ntceEndde" class="input_txt" id="ntceEndde" hname="기간" value="" title="기간 입력" />
					</span></li>
				<li><span class="w_txt">이름</span> <span class="inputTxt"><input 	type="text" name="ntcrNm" class="input_txt"
						style="ime-mode: active;" id="ntcrNm" hname="이름" value="<c:out value='${user.us_name}'/>" option="" required="required" title="이름 입력" /></span></li>
				<li><span class="w_txt">새창</span> <span class="inputTxt"><input type="checkbox" name="nttCn" id="nttCn" hname="새창" value="Y" />새창</span></span></li>
				<li><span class="w_txt">링크</span><span class="inputTxt"><input	type="text" name="link_url" class="input_txt w-col01"
						style="ime-mode: active;" id="link_url" hname="링크" value="" option=""	required="required" title="링크 입력" /></span></li>
			</ul>
		</div>
		<c:if test="${bdMstr.fileAtchPosblAt == 'Y'}">
		<div class="writecom writeBottom">
		<ul>
			<li><span class="w_txt">첨부파일</span><span class="inputTxt"><input type="file" name="file_1" id="egovComFileUploader" 
				class="input_txt" hname="첨부파일" title="첨부파일을 찾아 선택하세요" /></span></li>
		</ul>
		</div>
		</c:if>
	</div>
	<c:if test="${bdMstr.fileAtchPosblAt == 'Y'}">
		<script type="text/javascript">
			var maxFileNum = document.board.posblAtchFileNumber.value;
			if (maxFileNum == null || maxFileNum == "") {
				maxFileNum = 3;
			}
			var multi_selector = new MultiSelector(document
					.getElementById('egovComFileList'), maxFileNum);
			multi_selector.addElement(document
					.getElementById('egovComFileUploader'));
		</script>
	</c:if>


	<div class="boardButton">
		<span><a href="#" onclick="fn_egov_select_BBSList();">목록</a> </span> 
		<c:if test="${!empty user.us_id}">
		<span><a href="#" onclick="fn_egov_regist_BBS();">저장</a> </span> 
		</c:if>
	</div>
	
</form>


	<!-- 게시판 list end -->


<%@ include file="/WEB-INF/jsp/egovframework/gntbsc/wssms/footer.jsp" %>