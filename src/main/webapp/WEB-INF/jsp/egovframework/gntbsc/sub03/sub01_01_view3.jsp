<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
String lang_mode = (String) request.getAttribute("lang_temp");

String is_main = "";
int m1 = 3;
int m2 = 1;
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


<div class="center_view">
	<a href="<c:url value='/'/>sub03/sub01_01.do" class="btn_list">목록보기</a>

	<div class="com_introduce">
		<div class="introduce_tit">
			<h4><span class="cate cate01">예비관광 스타트업</span><span class="tit">셀프 가이드 KinK</span></h4>
			<p class="tag">#여행약자정보 #여행약자 관광정보 웹/앱서비스제공 #여행플랫폼</p>
			<h5 class="fwb fsb blackTxt mb10">여행약자중심 여행가이드 플랫폼</h5>
			<p class="txt">누구나 본인이 가고 싶은 곳의 여행계획을 쉽게 짤 수 있도록 도움을 주는 여행가이드 플랫폼을 설계하고 개발하여 제공합니다. 웹사이트 및 모바일앱으로 쉽게 접근하여 주변 관광지, 맛집, 숙박시설, 체험활동 뿐만 아니라 휠체어나 안내견의 출입이 쉽게 가능한지, 점자블록이 잘 설치되어 있는지 등의 여행 약자분들을 위한 다양한 정보를 제공합니다.</p>		
		</div>	
		<div class="photo_logo">
			<img src="<c:url value='/img/business_logo03.jpg'/>" alt="회사이름"/>
		</div>	
	
		<div class="introduce_txt">
			<table class="comm_table mb20">
				<colgroup>
					<col width="20%">
					<col width="*">
				</colgroup>
				<tbody>
					<tr>
						<th class="bgc">대표자</th>
						<td>도민준</td>
					</tr>
					<tr>
						<th class="bgc">연락처</th>
						<td>010-4203-6700</td>
					</tr>
					<tr>
						<th class="bgc">이메일</th>
						<td>d01042036700@gmail.com</td>
					</tr>
					<tr>
						<th class="bgc">홈페이지</th>
						<td>-</td>
					</tr>
					<tr>
						<th class="bgc">SNS</th>
						<td>-</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
<!--
	<div class="com_introduce_bottom mb">
		<h5 class="tit_dot mb20">상세소개</h5>
	</div>-->
	<div class="com_btn_list bmb">
	<a href="<c:url value='/'/>sub03/sub01_01.do" class="btn_list">목록보기</a>
	</div>



</div>

			</div><!--con-->
		</div><!--subcon-->
	</div><!--subwrap-->





<%@ include file="/WEB-INF/jsp/egovframework/gntbsc/inc/footer.jsp" %>