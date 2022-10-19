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
			<h4><span class="cate cate02">지역상생 관광벤처</span><span class="tit">㈜맛조이코리아</span></h4>
			<p class="tag">#소도시 여행콘텐츠 #OTA플랫폼 #남해안</p>
			<h5 class="fwb fsb blackTxt mb10">소도시트래블 남쪽 바다 (Sodosi Travel Southern Sea)</h5>
			<p class="txt">경상남도 18개 시·군 중 남해안(하동·남해·사천·고성·통영·거제·창원) 소도시 여행콘텐츠 개발 및 상품화(OTA플랫폼 등록/판매)</p>		
		</div>	
		<div class="photo_logo">
			<img src="<c:url value='/img/business_logo02.jpg'/>" alt="회사이름"/>
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
						<td>강병호</td>
					</tr>
					<tr>
						<th class="bgc">연락처</th>
						<td>010-6704-4339</td>
					</tr>
					<tr>
						<th class="bgc">이메일</th>
						<td>matjoytour@naver.com</td>
					</tr>
					<tr>
						<th class="bgc">홈페이지</th>
						<td><a href="http://matjoy.co.kr/" class="ic_blank" target="_blank" title="새창으로이동합니다.">http://matjoy.co.kr/</a></td>
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