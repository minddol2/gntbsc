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
			<h4><span class="cate cate01">예비관광 스타트업</span><span class="tit">KN-투어사피언스 (Kn-Tour Sapiens)</span></h4>
			<p class="tag">#지역체험장 #테마여행 #인생영상</p>
			<p class="txt">경남지역 관광지 또는 지역 체험장을 방문하는 관광객을 대상으로 우정, 사랑, 가족, 코믹 등의 테마로 영화, 드라마, CF, 뮤직비디오와 같은 한 장면을 연출하여 인생영상을 제작하여 제공합니다.</p>		
		</div>	
		<div class="photo_logo">
			<img src="<c:url value='/img/business_logo04.jpg'/>" alt="회사이름"/>
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
						<td>김무근</td>
					</tr>
					<tr>
						<th class="bgc">연락처</th>
						<td>010-7400-8299</td>
					</tr>
					<tr>
						<th class="bgc">이메일</th>
						<td>kmg8299@naver.com</td>
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