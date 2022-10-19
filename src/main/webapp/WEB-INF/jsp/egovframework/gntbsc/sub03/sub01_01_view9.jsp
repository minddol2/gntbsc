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
			<h4><span class="cate cate01">예비관광 스타트업</span><span class="tit">동네방네 이야기 지도</span></h4>
			<p class="tag">#여행지 앱 #AR #VR #여행상품</p>
			<p class="txt">지역주민이 호스트가 되고 지역주민과 여행자들이 쉽게 여행지를 찾아올 수 있는 앱(APP)을 구현하고 AR과 VR을 정착하여 재미와 흥미를 느낄 수 있는 여행상품을 개발하고자 합니다.</p>		
		</div>	
		<div class="photo_logo">
			<img src="<c:url value='/img/business_logo09.jpg'/>" alt="회사이름"/>
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
						<td>박세일</td>
					</tr>
					<tr>
						<th class="bgc">연락처</th>
						<td>010-5682-9416</td>
					</tr>
					<tr>
						<th class="bgc">이메일</th>
						<td>tpqkryo@naver.com</td>
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