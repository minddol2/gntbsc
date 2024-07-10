<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
String lang_mode = (String) request.getAttribute("lang_temp");

String is_main = "";
int m1 = 2;
int m2 = 3;
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



<jsp:include page="/WEB-INF/jsp/egovframework/gntbsc/sub02/tablist.jsp" flush="true" >
		<jsp:param name="m1" value="<%=m1%>"/>
		<jsp:param name="m2" value="<%=m2%>"/>
		<jsp:param name="m3" value="<%=m3%>"/>
</jsp:include>

<h4 class="tit_dot mb20">관광기업 발굴 및 육성지원</h4>
<div class="pointbox mb20">
	<p class="fsb fwb tac">지역기반 관광기업 발굴, 사업화 자금을 통해 창업 기초자금 지원, 사업역량을 제고하기 위한 역량강화 프로그램 운영</p>
</div>
<table class="comm_table mb">
	<colgroup>
		<col width="20%"/>
		<col width="*"/>
	</colgroup>
	<tbody>
		<tr>
			<th class="bgc">추진일정</th>
			<td>‘23. 5. ~ ’23. 11.</td>
		</tr>
		<tr>
			<th class="bgc">지원대상</th>
			<td>경남관광스타트업(입주기업 및 비상주협력기업)</td>
		</tr>
		<tr>
			<th class="bgc">지원내용</th>
			<td>사무공간 지원, 사업화 자금 지원(최대 3,000만원), 기업 진단멘토링 및 담임멘토링, 기업별 맞춤형 교육, 유관기업(기관) 네트워킹, 선진 관광기업 벤치마킹, 데모데이 등

</td>
		</tr>
	</tbody>
</table>
<!--<p class="mb bdbt">※ 자세한 사항은 <a href="<c:url value='/'/>sub02/sub04_01.do" class="ic_blank">기업입주 안내를 참조</a>해주세요.</p>-
<div class="business_img mb">
	<ul>
		<li><img src="<c:url value='/img/b_up_img221005_01.jpg'/>" alt="관광기업 발굴 및 육성지원 현장사진" /></li>
		<li><img src="<c:url value='/img/b_up_img221005_02.jpg'/>" alt="관광기업 발굴 및 육성지원 현장사진" /></li>
	</ul>
</div>

<h4 class="tit_nm mb20">교육내용</h4>-->
<div class="business_img mb">
	<ul class="list02">
		<li><img src="<c:url value='/img/b_up_poster_230324_01.jpg'/>" alt="공모사업설명회" /></li>
		<li><img src="<c:url value='/img/b_up_poster_230324_02.jpg'/>" alt="공모사업포스터" /></li>
	</ul>
</div>




			</div><!--con-->
		</div><!--subcon-->
	</div><!--subwrap-->





<%@ include file="/WEB-INF/jsp/egovframework/gntbsc/inc/footer.jsp" %>