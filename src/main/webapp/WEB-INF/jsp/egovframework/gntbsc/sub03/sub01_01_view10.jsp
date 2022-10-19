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
			<h4><span class="cate cate03">지역혁신 관광스타트업</span><span class="tit">아름다운 동행</span></h4>
			<p class="tag">#경남스마트관광 #관광플랫폼 #소상공인 판로개척</p>
			<p class="txt">경남스마트관광플랫폼 APP IN APP 구축을 통해 경남지역 관광소상공인 등 관광플랫폼을 개발하고 중앙 앱과 연결하는 등 소상공인 판로개척의 양극화 해소에 일조하고자 합니다.</p>		
		</div>	
		<div class="photo_logo">
			<img src="<c:url value='/img/business_logo10.jpg'/>" alt="회사이름"/>
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
						<td>양정숙</td>
					</tr>
					<tr>
						<th class="bgc">연락처</th>
						<td>010-3528-9449</td>
					</tr>
					<tr>
						<th class="bgc">이메일</th>
						<td>donghang9449@daum.net</td>
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