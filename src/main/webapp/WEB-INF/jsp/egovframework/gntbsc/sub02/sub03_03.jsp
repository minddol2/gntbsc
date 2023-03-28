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
int m3 = 3;
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



<h4 class="tit_dot mb20">관광기업 지역인재 채용 활성화</h4>
<div class="pointbox mb20">
	<p class="fsb fwb tac">도내 관광기업의 경영 부담을 완화하여 지역인재 고용 촉진</p>
</div>
<table class="comm_table mb10">
	<colgroup>
		<col width="20%"/>
		<col width="*"/>
	</colgroup>
	<tbody>
		<tr>
			<th class="bgc">모집대상</th>
			<td>도내 관광기업 및 경남관광기업지원센터 입주기업</td>
		</tr>
		<tr>
			<th class="bgc">모집기간</th>
			<td>2023. 3. 20. ~ 예산소진시까지</td>
		</tr>
		<tr>
			<th class="bgc">지원규모</th>
			<td>1개 기업 당 최대 2명</td>
		</tr>
		<tr>
			<th class="bgc">지원기간</th>
			<td>신규채용일로부터 사업종료일(‘23.11월)까지</td>
		</tr>
		<tr>
			<th class="bgc">지원내용</th>
			<td>
				<ul class="dot_li">
					<li>최대 2개월간 월 180만원 지원</li>
					<li>5개월 이상 근속자 중 정규직, 300만원 추가 지원</li>
				</ul>
			</td>
		</tr>
		<tr>
			<th class="bgc">세부내용</th>
			<td>
				<a href="/sub05/sub01_view.do?bbsId=BBSMSTR_000000000301&nttId=559&bbsTyCode=BBST03&bbsAttrbCode=BBSA03&authFlag=Y&pageIndex=1" class="ic_blank" target="_blank">공고문 참조</a>
			</td>
		</tr>
	</tbody>
</table>
<p class="mb">※ 상기 일정 및 내용은 상황에 따라 변동 가능</p>
<div class="business_img bdbt mb">
	<ul class="list01">
		<li><img src="<c:url value='/img/b_hirepay2023.jpg'/>" alt="" /></li>
	</ul>
</div>


<h4 class="tit_dot mb20">관광일자리 잡페어</h4>
<div class="pointbox mb20">
	<p class="fsb fwb tac">경남 관광기업과 지역인재 간 만남의 장 마련</p>
</div>
<table class="comm_table m10">
	<colgroup>
		<col width="20%"/>
		<col width="*"/>
	</colgroup>
	<tbody>
		<tr>
			<th class="bgc">개최일시</th>
			<td>2023. 6. 1. (목) ~ 6. 2.(금) </td>
		</tr>
		<tr>
			<th class="bgc">개최장소</th>
			<td>창원컨벤션센터 3층 회의실 301·302호</td>
		</tr>
		<tr>
			<th class="bgc">행사내용</th>
			<td>기업 전시 및 채용부스 운영, 채용정보 제공, 현장면접 진행, 부대행사 운영</td>
		</tr>	
		<tr>
			<th class="bgc"> 참가기업</th>
			<td>
				<ul class="dot_li">
					<li>1) 관광진흥법 상의 관광사업체</li>
					<li>2) 경남관광기업지원센터 입주기업(관광스타트업)</li>
					<li>3) 관광 관련 아이템으로 사업을 운영 또는 기획 중인 도내 소재 기업</li>
				</ul>
				<p class="fss redTxt">※ 모든 요건은 공고일 기준으로 도내에 소재하고 있어야 함</p>
			</td>
		</tr>
		<tr>
			<th class="bgc">참가자</th>
			<td>경남 관광산업 구직을 희망하는 자</td>
		</tr>	
	</tbody>
</table>
<p class="mb">※ 상기 일정 및 내용은 상황에 따라 변동 가능</p>
<div class="business_img bdbt mb">
	<ul class="list02">
		<li><img src="<c:url value='/img/b_jobfair2022_1.jpg'/>" alt="잡페어2022년 현장" /></li>
		<li><img src="<c:url value='/img/b_jobfair2022_2.jpg'/>" alt="잡페어2022년 현장" /></li>
		<li><img src="<c:url value='/img/b_jobfair2022_3.jpg'/>" alt="잡페어2022년 현장" /></li>
	</ul>
</div>


<!--
<h4 class="tit_dot mb20">디지털 관광마케터 양성 교육 운영</h4>
<div class="pointbox mb20">
	<p class="fsb fwb tac">관광산업의 디지털화에 맞춘 디지털마케팅 전문 인력 양성</p>
</div>
<table class="comm_table mb">
	<colgroup>
		<col width="20%"/>
		<col width="*"/>
	</colgroup>
	<tbody>
		<tr>
			<th class="bgc">신청자격</th>
			<td>만 19세 이상 만 39세 이하 도민</td>
		</tr>
		<tr>
			<th class="bgc">모집인원</th>
			<td>25명 내외</td>
		</tr>
		<tr>
			<th class="bgc">교육기간</th>
			<td>2022. 5월 ~ 8월(자세한 사항은 공고문 참고)</td>
		</tr>
		<tr>
			<th class="bgc">참여혜택</th>
			<td>전 과정 무료교육, 경남관광재단 대표이사 명의 수료증 발급, 멘토링 및 포트폴리오 제작 지원, 취업연계 지원 및 잡페어 참가 지원, 보수 심화교육 지원</td>
		</tr>
	</tbody>
</table>

<h5 class="tit_nm mb20">기본 교육과정</h5>
<table class="time_table tac">
	<thead>
		<tr>
			<th>회차</th>
			<th>일정</th>
			<th>주제</th>
			<th>주요 내용</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td class="bgc" rowspan="2">1회차</td>
			<td rowspan="2">05.23.(월)</td>
			<td rowspan="2">OT, 관광산업 및 디지털 마케팅 이론</td>
			<td class="tal">
				지원사업 안내 및 교육 프로그램 안내			
			</td>
		</tr>
		<tr>
			<td class="tal">
				<p class="fwb">[관광 산업 및 관광산업 마케팅 이론]</p>
				<ul class="dot_li">
					<li>관광 산업 및 관광 마케팅의 이해</li>
					<li>관광산업 및 디지털 관광 마케팅 현황 분석</li>
				</ul>
				<p class="fwb">[디지털 마케팅 이론]</p>
				<ul class="dot_li">
					<li>디지털 마케팅의 이해 </li>
					<li>마케팅 성공 전략</li>
				</ul>
			</td>	
		</tr>
		<tr>
			<td class="bgc">2회차</td>
			<td>05.24.(화)</td>
			<td>관광 트렌드 분석 및 플랫폼 별 검색엔진 최적화</td>
			<td class="tal">
				<p class="fwb">[2022 관광 트렌드 분석]</p>
				<ul class="dot_li">
					<li>현 관광 트렌드 및 미래 관광 트렌드 수요 분석</li>
					<li>사례 분석 과제 및 발표 실습</li>
				</ul>
				<p class="fwb">[플랫폼별 검색 엔진 최적화]</p>
				<ul class="dot_li">
					<li>광고 플랫폼 별 상위 노출 전략</li>
					<li>타겟팅 전략</li>
				</ul>
			</td>	
		</tr>
		<tr>
			<td class="bgc" rowspan="2">3회차</td>
			<td rowspan="2">05.30.(월)</td>
			<td rowspan="2">디지털 매체 이론 및 활용 방법(1)</td>
			<td class="tal">
				실무 교육 프로그램 안내 및 추후 프로그램 안내			
			</td>
		</tr>
		<tr>
			<td class="tal">
				<p class="fwb">[디지털 매체 기본 이해]</p>
				<ul class="dot_li">
					<li>디지털 핵심 5대 매체 기본 이해</li>
					<li>매체별 장단점 및 사례 분석</li>
				</ul>
				<p class="fwb">[디지털 매체 활용 실습]</p>
				<ul class="dot_li">
					<li>인스타그램, 페이스북, 카카오톡 활용 이론</li>
					<li>네이버 블로그, 스마트 스토어 활용 이론 </li>
					<li>매체별 사례 분석 과제 부여 및 발표 실습</li>
				</ul>
			</td>	
		</tr>
		<tr>
			<td class="bgc">4회차</td>
			<td>05.31.(화)</td>
			<td>디지털 매체 이론 및활용 방법(2)</td>
			<td class="tal">
				<p class="fwb">[구글 매체 기본 이해]</p>
				<ul class="dot_li">
					<li>구글 애즈 및 구글 애널리틱스 이론</li>
					<li>구글 태그 운용 매니저란?</li>
				</ul>
				<p class="fwb">[디지털 매체 활용 실습]</p>
				<ul class="dot_li">
					<li>광고 집행 시 사전 확인 사항</li>
					<li>광고 집행 실습(인스타그램/페이스북)</li>
					<li>실습 및 피드백 진행</li>
				</ul>
			</td>	
		</tr>
		<tr>
			<td class="bgc">5회차</td>
			<td>06.07.(화)</td>
			<td>마케팅 기획 및 지역 사례 분석</td>
			<td class="tal">
				<p class="fwb">[마케팅 기획 방법]</p>
				<ul class="dot_li">
					<li>마케팅 기획 A to Z</li>
					<li>마케팅 기획서 작성법 이론</li>
					<li>기획서 작성 실습 및 피드백</li>
				</ul>
				<p class="fwb">[지역 사례 분석]</p>
				<ul class="dot_li">
					<li>경남 관광 브랜딩 전략 수립</li>
					<li>경남 관광 분야 상품 사례 분석 과제 및 발표 실습</li>
				</ul>
			</td>	
		</tr>
		<tr>
			<td class="bgc" >6회차</td>
			<td>06.13.(월)</td>
			<td>콘텐츠 제작 (숏폼/카드뉴스)</td>
			<td class="tal">
				<p class="fwb">[마케팅 콘텐츠의 중요성]</p>
				<ul class="dot_li">
					<li>눈길을 사로잡는 마케팅 콘텐츠 제작법</li>
				</ul>
				<p class="fwb">[콘텐츠 제작 플랫폼 이론 및 실무]</p>
				<ul class="dot_li">
					<li>숏폼/카드뉴스 마케팅이란?</li>
					<li>숏폼/카드뉴스 마케팅 우수 사례 분석</li>
					<li>숏폼/카드뉴스 콘텐츠 제작 및 발표 실습</li>
				</ul>
			</td>	
		</tr>
		<tr>
			<td class="bgc" >7회차</td>
			<td>06.14.(화)</td>
			<td>콘텐츠 기획 및 포트폴리오 제작</td>
			<td class="tal">
				<p class="fwb">[콘텐츠 기획 및 제작]</p>
				<ul class="dot_li">
					<li>다양한 플랫폼을 이용한 콘텐츠 기획 및 제작방법</li>
					<li>멘토링 및 결과물 피드백</li>
				</ul>
				<p class="fwb">[잡페어 – 콘텐츠·포트폴리오 기획 및 제작]</p>
				<ul class="dot_li">
					<li>잡페어 참가 기업 콘텐츠 구상 </li>
					<li>개인(팀) 포트폴리오 기획 및 제작</li>
				</ul>
			</td>	
		</tr>
		<tr>
			<td class="bgc">8회차</td>
			<td>06.20.(월)</td>
			<td>포트폴리오 최종 발표 및 수료식</td>
			<td class="tal">
				<p class="fwb">[포트폴리오 발표]</p>
				<ul class="dot_li">
					<li>교육 수강생 포트폴리오 결과물 발표</li>
					<li>발표 및 피드백 진행</li>
				</ul>
				<p class="fwb">[수료식]</p>
				<ul class="dot_li">
					<li>수료식 진행 및 기본 교육 프로그램 최종 종료</li>
				</ul>
			</td>	
		</tr>
	</tbody>
</table>
<p class="mb">※ 상기 일정 및 내용은 상황에 따라 변동 가능</p>

<h5 class="tit_nm mb20">역량강화 과정</h5>
<table class="time_table tac">
	<thead>
		<tr>
			<th>회차</th>
			<th>일정</th>
			<th>주제</th>
			<th>주요 내용</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td class="bgc">1회차</td>
			<td>08.20.(토)</td>
			<td>콘텐츠 기획 및 제작</td>
			<td class="tal">
				<p class="fwb">[누구나 콘텐츠 마케터가 될 수 있다 1]</p>
				<ul class="dot_li">
					<li>퍼포먼스 성능을 높이는 카피라이팅과 콘텐츠 기획</li>
					<li>눈에 띄는 콘텐츠 제작 실습</li>
				</ul>				
			</td>
		</tr>
		<tr>
			<td class="bgc">2회차</td>
			<td>08.21.(일)</td>
			<td>콘텐츠 광고 집행</td>
			<td class="tal">
				<p class="fwb">[누구나 콘텐츠 마케터가 될 수 있다 2]</p>
				<ul class="dot_li">
					<li>내가 제작한 콘텐츠 광고 집행 실습</li>
					<li>콘텐츠 제작 및 광고 집행 결과 보고회</li>
				</ul>				
			</td>
		</tr>
		<tr>
			<td class="bgc">3회차</td>
			<td>08.27.(토)</td>
			<td>구글 애널리틱스 활용</td>
			<td class="tal">
				<p class="fwb">[구글 애널리틱스, 어렵게 생각하지 마세요]</p>
				<ul class="dot_li">
					<li>구글 애널리틱스 쉽게 이해하기</li>
					<li>구글 애널리틱스 활용 실습</li>
				</ul>				
			</td>
		</tr>
		<tr>
			<td class="bgc">4회차</td>
			<td>08.28.(일)</td>
			<td>숏폼 마케팅 실습 및 수료</td>
			<td class="tal">
				<p class="fwb">[MZ 세대를 사로 잡는 숏폼 마케팅 전략]</p>
				<ul class="dot_li">
					<li>숏폼 마케팅의 이해 및 분야별 숏폼 사례 분석</li>
					<li>숏폼 콘텐츠 직접 제작 실습</li>
				</ul>				
			</td>
		</tr>	
	
	</tbody>
</table>
<p class="mb">※ 상기 일정 및 내용은 상황에 따라 변동 가능</p>
<div class="business_img bdbt mb">
	<ul class="list02">
		<li><img src="<c:url value='/img/b_digital_img01.jpg'/>" alt="디지털 관광마케터 양성 교육" /></li>
		<li><img src="<c:url value='/img/b_digital_img02.jpg'/>" alt="디지털 관광마케터 양성 교육_심화" /></li>
	</ul>
</div>
-->

<!--
<h4 class="tit_dot mb20">2022 경남 관광 창업 아이디어톤</h4>
<div class="pointbox mb20">
	<p class="fsb fwb tac">경남 관광자원을 활용한 혁신적인 아이디어를 보유한 창업팀 발굴</p>
</div>
<table class="comm_table mb20">	
	<colgroup>
		<col width="20%"/>
		<col width="*"/>
	</colgroup>
	<tbody>
		<tr>
			<th class="bgc">접수기간</th>
			<td>‘22. 6. 22.(수) ~ 7. 31.(일) 14:00까지</td>
		</tr>
		<tr>
			<th class="bgc">참가대상</th>
			<td>관광 분야 창업에 관심이 있는 누구나<br/>
  - 각 팀당 2인 이상 구성</td>
		</tr>
		<tr>
			<th class="bgc">시상규모</th>
			<td>최종 12팀 선정, 총 3천만 원 규모 시상</td>
		</tr>
		<tr>
			<th class="bgc">모집분야</th>
			<td>경상남도 관광과 관련된 식음료, 제조기반, 지역관광, 관광 ICT 등</td>
		</tr>
		<tr>
			<th class="bgc">행사일정</th>
			<td>’22. 8. 25.(목), 8. 26.(금) / 창원컨벤션센터 600호</td>
		</tr>
		<tr>
			<th class="bgc">세부내용</th>
			<td><a href="https://gyeongnam.tourbiz.or.kr/sub05/sub01_view.do?bbsId=BBSMSTR_000000000301&nttId=426&bbsTyCode=BBST03&bbsAttrbCode=BBSA03&authFlag=Y&pageIndex=1" class="ic_blank" target="_blank">공고문 참조</a></td>
		</tr>
	</tbody>
</table>
<div class="business_img mb">
	<ul class="list01">
		<li><img src="<c:url value='/img/b_idea_poster01.jpg'/>" alt="관광 창업 아이디어톤 포스터" /></li>
	</ul>
</div>
-->


			</div><!--con-->
		</div><!--subcon-->
	</div><!--subwrap-->





<%@ include file="/WEB-INF/jsp/egovframework/gntbsc/inc/footer.jsp" %>