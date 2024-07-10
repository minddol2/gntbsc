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

<h4 class="tit_dot mb20">경남관광스타트업 발굴 및 창업·육성 지원</h4>
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
			<td>‘24. 5. ~ 11.</td>
		</tr>
		<tr>
			<th class="bgc">지원대상</th>
			<td>경남관광스타트업(입주기업 및 비상주협력기업)</td>
		</tr>
		<tr>
			<th class="bgc">지원내용</th>
			<td>입주공간 및 센터시설 이용(사무공간, 회의실 등), 사업화 자금, 역량강화 교육, 컨설팅, 홍보, 판로개척, 네트워킹, 투자유치 ,경영 관련 맞춤 교육 및 전담 멘토링 지원</td>
		</tr>
	</tbody>
</table>
<!--<p class="mb bdbt">※ 자세한 사항은 <a href="<c:url value='/'/>sub02/sub04_01.do" class="ic_blank">기업입주 안내를 참조</a>해주세요.</p>-
<div class="business_img mb">
	<ul>
		<li><img src="<c:url value='/img/program-img_2024_02.jpg'/>" alt="관광기업 발굴 및 육성지원 현장사진" /></li>
		<li><img src="<c:url value='/img/b_up_img221005_01.jpg'/>" alt="관광기업 발굴 및 육성지원 현장사진" /></li>
	</ul>
</div>

<h4 class="tit_nm mb20">교육내용</h4>-->
<div class="business_img mb bdbt">
	<ul class="list02">
		<li><img src="<c:url value='/img/program-img_2024_02.jpg'/>" alt="공모사업포스터" /></li>
		<li><img src="<c:url value='/img/b_up_poster_230324_01.jpg'/>" alt="공모사업설명회" /></li>
	</ul>
</div>


<!--20240710추가-->
<h4 class="tit_dot mb20">입주기업 엑셀러레이팅 프로그램 운영</h4>
<div class="pointbox mb20">
	<p class="fsb fwb tac">경남관광스타트업 대상 집중형 맞춤 프로그램을 통한
                           사업 고도화 및 역량강화 지원</p>
</div>
<table class="comm_table mb">
	<colgroup>
		<col width="20%"/>
		<col width="*"/>
	</colgroup>
	<tbody>
		<tr>
			<th class="bgc">추진일정</th>
			<td>2024. 8월 ~ 12월</td>
		</tr>
		<tr>
			<th class="bgc">지원대상</th>
			<td>경남관광스타트업 1기 ~ 5기</td>
		</tr>
		<tr>
			<th class="bgc">지원내용</th>
			<td>맞춤형 창업실무교육, 컨설팅, 기업간 네트워킹, 투자유치 지원</td>
		</tr>
	</tbody>
</table>
<div class="business_img mb bdbt">
	<ul class="list02">
		<li><img src="<c:url value='/img/newBs01.jpg'/>" alt="" /><span>선진지 벤치마킹</span></li>
		<li><img src="<c:url value='/img/newBs02.jpg'/>" alt="" /><span>데모데이</span></li>
	</ul>
</div>
<h4 class="tit_dot mb20">경남 관광 아카데미 운영</h4>
<div class="pointbox mb20">
	<p class="fsb fwb tac">도내 관광업 종사자 및 예비창업자를 위한 관광 아카데미</p>
</div>
<table class="comm_table mb">
	<colgroup>
		<col width="20%"/>
		<col width="*"/>
	</colgroup>
	<tbody>
		<tr>
			<th class="bgc">신청기간</th>
			<td>2024. 8월중 <p class="fss redTxt">※추후 상세일정 공지 예정</p></td>
		</tr>
		<tr>
			<th class="bgc">모집인원</th>
			<td>기초·심화과정 160명, 창업과정 20명 <p class="fss redTxt">※창업과정 : 기초·심화과정           수료자 중 조건을 충족하는 자</p></td>
		</tr>
		<tr>
			<th class="bgc">교육장소</th>
			<td>
			<ul class="dot_li">
                <li>오프라인: 경남관광기업지원센터 대회의실</li>
                <li>온라인 :관광e배움터(<a href="https://touredu.visitkorea.or.kr/" target="_blank">https://touredu.visitkorea.or.kr/</a>)</li>
                </ul>
            </td>
		</tr>
		<tr>
			<th class="bgc">교육일정</th>
			<td>
			    <ul class="dot_li">
                    <li>기초과정: 2024. 9. 6. ~ 9. 20. (매주 금요일)</li>
                    <li>심화과정: 2024. 9. 7. ~ 9. 21. (매주 토요일)</li>
                    <li>창업과정: 2024. 10. 5. ~ 10. 26. 과정 내 관광 창업 아이디어 공모전 운영(상금 및 시상식 진행 예정)</li>
                </ul>
                <p class="fss redTxt">※ 상황에 따라 일정 변경 될 수 있음 </p>
            </td>
		</tr>
		<tr>
			<th class="bgc">참여혜택</th>
			<td>전 과정 무료 교육, 경남 관광재단 대표이사 명의 수료증 발급,
                               창업과정 참여 기회 제공, 협력 파트너 지원 가능<br>
                               (전문 컨설팅, 관광스타트업 지원 시 가산점 부여 등)</td>
		</tr>
	</tbody>
</table>



			</div><!--con-->
		</div><!--subcon-->
	</div><!--subwrap-->





<%@ include file="/WEB-INF/jsp/egovframework/gntbsc/inc/footer.jsp" %>