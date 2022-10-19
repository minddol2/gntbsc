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


<script type="text/javascript">
<!--
$(document).ready(function(){	
	var resultMsg = '${resultMsg}';
	
	if(resultMsg != "") {
		alert(resultMsg);
	}
	
});

function fn_egov_regist_BBS() {
    document.board.onsubmit();

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
    if (frm.nttCn.value == ""){
    	alert('내용을 입력하세요.');
        return;
    }
    if (confirm('저장하시겠습니까?')) {
        //document.board.onsubmit();
        document.board.action = "<c:url value='/bbs/replyQnaArticle.do'/>";
        document.board.submit();
    }
}

function fn_egov_select_BBSList() {
    document.board.action = "<c:url value='/bbs/QnaList.do'/>";
    document.board.submit();
}  
//-->
</script>

<h4 class="tit_dot">공지사항</h4>


<script type="text/javascript" src="<c:url value='/js/EgovMultiFile.js'/>" ></script>

<form name="board" method="post" enctype="multipart/form-data">
	<input type="hidden" name="replyAt" value="Y" />
	<input type="hidden" name="pageIndex"  value="<c:out value='${searchVO.pageIndex}'/>"/>
    <input type="hidden" name="nttId" value="<c:out value='${searchVO.nttId}'/>" />
    <input type="hidden" name="parnts" value="<c:out value='${searchVO.parnts}'/>" />
    <input type="hidden" name="sortOrdr" value="<c:out value='${searchVO.sortOrdr}'/>" />
    <input type="hidden" name="replyLc" value="<c:out value='${searchVO.replyLc}'/>" />
                    
    <input type="hidden" name="bbsId" value="<c:out value='${bdMstr.bbsId}'/>" />
    <input type="hidden" name="bbsAttrbCode" value="<c:out value='${bdMstr.bbsAttrbCode}'/>" />
    <input type="hidden" name="bbsTyCode" value="<c:out value='${bdMstr.bbsTyCode}'/>" />
    <input type="hidden" name="replyPosblAt" value="<c:out value='${bdMstr.replyPosblAt}'/>" />
    <input type="hidden" name="fileAtchPosblAt" value="<c:out value='${bdMstr.fileAtchPosblAt}'/>" />
    <input type="hidden" name="posblAtchFileNumber" value="<c:out value='${bdMstr.posblAtchFileNumber}'/>" />
    <input type="hidden" name="posblAtchFileSize" value="<c:out value='${bdMstr.posblAtchFileSize}'/>" />
    <input type="hidden" name="tmplatId" value="<c:out value='${bdMstr.tmplatId}'/>" />
                    
	<c:if test="${bdMstr.bbsAttrbCode != 'BBSA01'}">
		<input id="ntceBgnde" name="ntceBgnde" type="hidden" value="10000101">
		<input id="ntceEndde" name="ntceEndde" type="hidden" value="99991231">
	</c:if>

	<div id="writeWrap">
		<div class="writecom writeTop">
			<ul>
				<li><span class="w_txt">제목</span> <span class="inputTxt"><input
						type="text" name="nttSj" class="input_txt w-col01"
						style="ime-mode: active;" id="nttSj" hname="제목" value="RE: <c:out value='${result.nttSj}'/>" option=""
						required="required" title="제목 입력" /></span></span></li>
				<li><span class="w_txt">이름</span> <span class="inputTxt"><input
						type="text" name="ntcrNm" class="input_txt"
						style="ime-mode: active;" id="ntcrNm" hname="이름"
						value="<c:out value='${user.us_charge}'/>" option="" required="required" title="이름 입력" /></span></li>
			</ul>
		</div>
		<div class="writeCon">
			<textarea id="nttCn" name="nttCn" class="w100" title="본문내용" style="width:98%; height:450px;"></textarea>
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
		<span><a href="#" onclick="javascript:fn_egov_select_BBSList(); return fasle;">목록</a> </span> 
		<c:if test="${!empty user.us_LoginID}">
		<span><a href="#" onclick="javascript:fn_egov_regist_BBS(); return fasle;">저장</a> </span> 
		</c:if>
	</div>
	



	<!-- 게시판 list end -->


<%@ include file="/WEB-INF/jsp/egovframework/gntbsc/wssms/footer.jsp" %>