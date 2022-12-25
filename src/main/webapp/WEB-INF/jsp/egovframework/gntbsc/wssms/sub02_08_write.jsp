<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="egovframework.com.cmm.service.EgovProperties" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%
	String bodyckey = "false";
	int m1 = 2;
	int m2 = 8;
	int m3 = 0;
%>

<jsp:include page="/WEB-INF/jsp/egovframework/gntbsc/wssms/top.jsp" flush="true">
	<jsp:param name="bodyckey" value="<%=bodyckey%>"/>
</jsp:include>
<jsp:include page="/WEB-INF/jsp/egovframework/gntbsc/wssms/sub_top.jsp" flush="true">
	<jsp:param name="bodyckey" value="<%=bodyckey%>"/>
	<jsp:param name="m1" value="<%=m1%>"/>
	<jsp:param name="m2" value="<%=m2%>"/>
	<jsp:param name="m3" value="<%=m3%>"/>
</jsp:include>

<script type="text/javascript">
	<!--
	$(document).ready(function () {
		var resultMsg = '${resultMsg}';

		if (resultMsg != "") {
			alert(resultMsg);
		}

	});

	function fn_egov_regist_BBS() {
		var frm = document.forms.board;

		if (oEditors.getById["nttCn"]) {
			oEditors.getById["nttCn"].exec("UPDATE_CONTENTS_FIELD", []);
		}
		if (oEditors2.getById["nttAd"]) {
			oEditors2.getById["nttAd"].exec("UPDATE_CONTENTS_FIELD", []);
		}

		if (frm.bbsId.value == "") {
			alert('잘못된 접급입니다.');
			return;
		}

		if (frm.category.value == '') {
			alert('1차 카테고리를 선택해주세요.');
			return;
		}

		if (frm.category2.value == '') {
			alert('2차 카테고리를 선택해주세요.');
			return;
		}

		if (frm.ntcrNm.value == "") {
			alert('작성자를 입력하세요');
			return;
		}
		if (frm.nttSj.value == "") {
			alert('제목을 입력하세요');
			return;
		}
		if (confirm('저장하시겠습니까?')) {
			//document.board.onsubmit();
			document.board.action = "<c:url value='/sb02/sub02_08_Add_test.do'/>";
			document.board.submit();
		}
	}

	function fn_egov_select_BBSList() {
		document.board.action = "<c:url value='/sb02/sub02_08_test.do'/>";
		document.board.submit();
	}

	function pasteImage(img_url, target) {
		//alert(img_url);
		sHTML = "<div><img src=" + img_url + "  alt='image'/></div>";
		oEditors.getById[target].exec("PASTE_HTML", [sHTML]);
	}

	//-->
</script>

<h4 class="tit_dot">기업소개 관리</h4>


<script type="text/javascript" src="<c:url value='/js/EgovMultiFile.js'/>"></script>

<form name="board" method="post" enctype="multipart/form-data">
	<input name="pageIndex" type="hidden"
		   value="<c:out value='${searchVO.pageIndex}'/>"/> <input type="hidden"
																   name="bbsId"
																   value="<c:out value='${bdMstr.bbsId}'/>"/> <input
		type="hidden" name="bbsAttrbCode"
		value="<c:out value='${bdMstr.bbsAttrbCode}'/>"/> <input
		type="hidden" name="bbsTyCode"
		value="<c:out value='${bdMstr.bbsTyCode}'/>"/> <input type="hidden"
															  name="replyPosblAt"
															  value="<c:out value='${bdMstr.replyPosblAt}'/>"/>
	<input type="hidden" name="fileAtchPosblAt"
		   value="<c:out value='${bdMstr.fileAtchPosblAt}'/>"/> <input
		type="hidden" name="posblAtchFileNumber"
		value="<c:out value='${bdMstr.posblAtchFileNumber}'/>"/> <input
		type="hidden" name="posblAtchFileSize"
		value="<c:out value='${bdMstr.posblAtchFileSize}'/>"/> <input
		type="hidden" name="tmplatId"
		value="<c:out value='${bdMstr.tmplatId}'/>"/> <input type="hidden"
															 name="cal_url"
															 value="<c:url value='/sym/cmm/EgovNormalCalPopup.do'/>"/>
	<input type="hidden" name="authFlag"
		   value="<c:out value='${bdMstr.authFlag}'/>"/>
	<c:if test="${bdMstr.bbsAttrbCode != 'BBSA01'}">
		<input id="ntceBgnde" name="ntceBgnde" type="hidden" value="10000101">
		<input id="ntceEndde" name="ntceEndde" type="hidden" value="99991231">
	</c:if>
	<input name="topx" type="hidden" value="0"/>

	<div id="writeWrap">
		<div class="writecom writeTop">
			<ul class="categoryBox">
				<li>
					<span class="w_txt">분류</span>
					<%--<input type="radio" name="category" id="category1" hname="예비관광" value="1" /><label for="category1">예비관광</label>&nbsp;&nbsp;
                    <input type="radio" name="category" id="category2" hname="지역혁신" value="2" /><label for="category2">지역혁신</label>&nbsp;&nbsp;
                    <input type="radio" name="category" id="category3" hname="지역상생" value="3" /><label for="category3">지역상생</label>&nbsp;&nbsp;
                    <input type="radio" name="category" id="category3" hname="비상주협력기업" value="4" /><label for="category3">비상주 협력기업</label>--%>
					<%--input type="radio" name="category" id="category1" hname="ICT/플랫폼" value="1"
                           onchange="changeCategory(this, this.value)"/><label for="category1">ICT/플랫폼</label>&nbsp;&nbsp;
                    <input type="radio" name="category" id="category2" hname="로컬푸드" value="2"/><label for="category2">로컬푸드</label>&nbsp;&nbsp;
                    <input type="radio" name="category" id="category3" hname="관광상품" value="3"/><label for="category3">관광상품</label>&nbsp;&nbsp;
                    <input type="radio" name="category" id="category4" hname="관광체험•레저" value="4"/><label
                            for="category4">관광체험•레저</label>&nbsp;
                    <input type="radio" name="category" id="category5" hname="관광콘텐츠" value="5"/><label for="category5">관광콘텐츠</label>--%>
					<select name="category">
						<option value="">1차 분류 선택</option>
						<option value="1">ICT/플랫폼</option>
						<option value="2">로컬푸드</option>
						<option value="3">관광상품</option>
						<option value="4">관광체험•레저</option>
						<option value="5">관광콘텐츠</option>
					</select>
					<select name="category2">
						<option value="">2차 분류 선택</option>
						<option value="1">ICT/플랫폼</option>
						<option value="2">로컬푸드</option>
						<option value="3">관광상품</option>
						<option value="4">관광체험•레저</option>
						<option value="5">관광콘텐츠</option>
					</select>
				</li>
				<li>
					<span class="w_txt">구분</span>
					<select name="classfication">
						<option value="">구분 선택</option>
						<option value="1">예비관광스타트업</option>
						<option value="2">지역혁신 관광스타트업</option>
						<option value="3">지역상생 관광스타트업</option>
						<option value="4">비상주</option>
					</select>
					<select name="classfication2">
						<option value="">연도별 구분 선택</option>
						<option value="1">비상주협력기업</option>
						<option value="2">2020년 입주기업</option>
						<option value="3">2021년 입주기업</option>
						<option value="4">2022년 입주기업</option>
					</select>
				</li>
				<li>
					<span class="w_txt">제목</span>
					<span class="inputTxt">
                        <input type="text" name="nttSj" class="input_txt w-col01" style="ime-mode: active;" id="nttSj"
							   hname="제목" value="" option="" required="required" title="제목 입력"/>
                    </span>
				</li>
				<li>
					<span class="w_txt">키워드</span>
					<span class="inputTxt">
                    <input type="text" name="ssWords" class="input_txt w-col01" style="ime-mode: active;" id="ssWords"
						   hname="키워드" value="" option="" required="required" title="키워드 입력"/>
                    </span>
				</li>
				<li>
					<span class="w_txt">대표자</span>
					<span class="inputTxt">
                    <input type="text" name="ceoName" class="input_txt w-col01"
						   style="width:150px" style="ime-mode: active;" id="ceoName" hname="대표자" value="" option=""
						   required="required" title="대표자 입력"/>
                    </span>
				</li>
				<li>
					<span class="w_txt">연락처</span> <span class="inputTxt">
                    <input type="text" name="telnum" class="input_txt w-col01"
						   style="width:150px" style="ime-mode: active;" id="telnum"
						   hname="연락처" value="" option="" required="required" title="연락처 입력"/>
                    </span>
				</li>
				<li>
					<span class="w_txt">이메일</span> <span class="inputTxt">
                    <input type="text" name="email" class="input_txt w-col01" style="width:250px"
						   style="ime-mode: active;" id="email"
						   hname="이메일" value="" option="" required="required" title="이메일 입력"/>
                    </span>
				</li>
				<li>
					<span class="w_txt">홈페이지</span>
					<span class="inputTxt">
                        <input type="text" name="homepage" class="input_txt w-col01" style="width:250px"
							   style="ime-mode: active;" id="homepage" hname="홈페이지" value="" option=""
							   required="required" title="홈페이지 입력"/>
                    </span>
				</li>
				<li>
					<span class="w_txt">SNS</span>
					<span class="inputTxt">
                        <input type="text" name="snslink" class="input_txt w-col01" style="width:250px"
							   style="ime-mode: active;" id="snslink" hname="SNS" value="" option="" required="required"
							   title="SNS 입력"/>
                    </span>
				</li>
				<li>
					<span class="w_txt">작성자</span>
					<span class="inputTxt">
                        <input type="text" name="ntcrNm" class="input_txt" style="ime-mode: active;" id="ntcrNm"
							   hname="이름" value="<c:out value='${user.us_name}'/>" option="" required="required"
							   title="이름 입력"/>
                    </span>
				</li>
			</ul>
		</div>
		<div class="writeCon">
            <textarea id="nttCn" name="nttCn" title="본문내용"
					  style="width:98%; min-width:300px; height:250px; display:none;"></textarea>
			<script type="text/javascript">
				var oEditors = [];

				// 추가 글꼴 목록
				nhn.husky.EZCreator.createInIFrame({
					oAppRef: oEditors,
					elPlaceHolder: "nttCn",
					sSkinURI: "<c:url value='/'/>SE2/SmartEditor2Skin.html",
					htParams: {
						bUseToolbar: true,				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
						bUseVerticalResizer: true,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
						bUseModeChanger: true,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
						fOnBeforeUnload: function () {
						}
					}, //boolean
					fOnAppLoad: function () {
						oEditors.getById["nttCn"].exec("PASTE_HTML", [""]);
					},
					fCreator: "createSEditor2"
				});
			</script>
		</div>
		<div class="writeCon">
            <textarea id="nttAd" name="nttAn" title="본문내용"
					  style="width:98%; min-width:300px; height:250px; display:none;">
                <c:out value="${result.nttAd}" escapeXml="false"/>
            </textarea>
			<script type="text/javascript">
				var oEditors2 = [];

				// 추가 글꼴 목록
				nhn.husky.EZCreator.createInIFrame({
					oAppRef: oEditors2,
					elPlaceHolder: "nttAd",
					sSkinURI: "<c:url value='/'/>SE2/SmartEditor2Skin.html",
					htParams: {
						bUseToolbar: true,				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
						bUseVerticalResizer: true,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
						bUseModeChanger: true,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
						fOnBeforeUnload: function () {
						}
					}, //boolean
					fOnAppLoad: function () {
						oEditors2.getById["nttCn"].exec("PASTE_HTML", [""]);
					},
					fCreator: "createSEditor2"
				});
			</script>
		</div>
		<c:if test="${bdMstr.fileAtchPosblAt == 'Y'}">
			<div class="writecom writeBottom">
				<ul>
					<li><span class="w_txt">썸네일</span>
						<span class="inputTxt">
                            <input type="file" name="file_1" id="egovComFileUploader" class="input_txt" hname="첨부파일"
								   title="첨부파일을 찾아 선택하세요"/>
                        </span>
					</li>
				</ul>
				<ul>
					<li>
						<span class="w_txt">회사소개서(PDF) 파일</span>
						<span class="inputTxt">
                        <input type="file" name="etcFile" id="" class="input_txt" hname="첨부파일"
							   title="첨부파일을 찾아 선택하세요"/>
                        </span>
					</li>
				</ul>
				<ul>
					<li>
						<span class="w_txt">첨부파일</span>
						<span class="inputTxt">
                        <input type="file" name="file_2" id="egovComFileUploader" class="input_txt" hname="첨부파일"
							   title="첨부파일을 찾아 선택하세요"/></span>
					</li>
				</ul>
				<ul>
					<li>
						<span class="w_txt">첨부파일</span>
						<span class="inputTxt">
                            <input type="file" name="file_3" id="egovComFileUploader" class="input_txt" hname="첨부파일"
								   title="첨부파일을 찾아 선택하세요"/>
                        </span>
					</li>
				</ul>
				<ul>
					<li>
						<span class="w_txt">첨부파일</span>
						<span class="inputTxt">
                            <input type="file" name="file_4" id="egovComFileUploader" class="input_txt" hname="첨부파일"
								   title="첨부파일을 찾아 선택하세요"/>
                        </span>
					</li>
				</ul>
				<ul>
					<li>
						<span class="w_txt">첨부파일</span><span class="inputTxt">
                        <input type="file" name="file_5" id="egovComFileUploader" class="input_txt" hname="첨부파일"
							   title="첨부파일을 찾아 선택하세요"/>
                    </span>
					</li>
				</ul>
				<ul>
					<li>
						<span class="w_txt">첨부파일</span>
						<span class="inputTxt">
                            <input type="file" name="file_6" id="egovComFileUploader" class="input_txt" hname="첨부파일"
								   title="첨부파일을 찾아 선택하세요"/>
                        </span>
					</li>
				</ul>

			</div>
		</c:if>
	</div>
	<c:if test="${bdMstr.fileAtchPosblAt == 'Y'}">
		<script type="text/javascript">
			var maxFileNum = document.board.posblAtchFileNumber.value;
			if (maxFileNum == null || maxFileNum == "") {
				maxFileNum = 6;
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

<script>
</script>

<%@ include file="/WEB-INF/jsp/egovframework/gntbsc/wssms/footer.jsp" %>