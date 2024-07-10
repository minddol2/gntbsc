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
int m3 = 4;
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

<h4 class="tit_dot mb20">경남 관광일자리 잡페어 운영</h4>
<div class="pointbox mb20">
	<p class="fsb fwb tac">도내 관광기업과 지역인재 간 연계의 장을 마련하여
                           관광 일자리 창출을 활성화하고 양질의 정보를 제공하고자 함</p>
</div>

<table class="comm_table mb bdbt">
	<colgroup>
		<col width="20%"/>
		<col width="*"/>
	</colgroup>
	<tbody>
		<tr>
			<th class="bgc">행사명</th>
			<td>2024 경남 관광일자리 잡페어</td>
		</tr>
		<tr>
			<th class="bgc">개최일시</th>
			<td class="tal">
				24. 6. 12.(수) 10:00 ~ 17:00(예정)
			</td>
		</tr>
		<tr>
			<th class="bgc">개최장소</th>
			<td class="tal">
				창원컨벤션센터(CECO) 3전시장
			</td>
		</tr>
		<tr>
			<th class="bgc">주최/주관</th>
			<td class="tal">
				문화체육관광부, 한국관광공사, 경상남도, 경남관광재단
			</td>
		</tr>
		<tr>
			<th class="bgc">슬로건</th>
			<td class="tal">
				경남에서 내 일(Job)을 찾는 여행!
			</td>
		</tr>
		<tr>
			<th class="bgc">행사규모</th>
			<td class="tal">
				구인기업 및 부대 프로그램 등 40개 내외 부스 운영
			</td>
		</tr>
		<tr>
			<th class="bgc">주요내용</th>
			<td class="tal">
				부스운영, 채용정보 제공, 현장면접, 채용대상자 확정
			</td>
		</tr>
	</tbody>
</table>





<h4 class="tit_dot mb20">도내 관광기업 지역인재 채용 지원</h4>
<div class="pointbox mb20">
	<p class="fsb fwb tac">2024년 청년을 채용하는 도내 관광기업의 경제적 부담을 완화하고 현장 교육을 통한 실무형 관광인재를 양성하고자 함</p>
</div>

<table class="comm_table mb bdbt">
	<colgroup>
		<col width="20%"/>
		<col width="*"/>
	</colgroup>
	<tbody>
		<tr>
			<th class="bgc">사업기간</th>
			<td>24. 3 ~ 11월(예산 소진 시까지)</td>
		</tr>
		<tr>
			<th class="bgc">지원대상</th>
			<td class="tal">
			<ul class="dot_li">
                <li>(기업) 경남 소재 관광기업* 및 경남관광스타트업**
                <p class="fss">* 공고일 기준, 관광진흥법 상 관광사업으로 등록·허가 또는 지정을 받거나 신고된 기업</p>
                <p class="fss">** 경남에 본사 또는 지사를 둔 기업(사업자 등록지 기준)</p>
                </li>
                <li>(청년) 부산·경남 거주 미취업 청년 및 대학(원) 졸업자
                <p class="fss">※ 만 19세~39세, 채용 후 경남으로 주소지 이전 필수</p></li>
			</ul>
			</td>
		</tr>
		<tr>
			<th class="bgc">지원규모</th>
			<td class="tal">
				45명
			</td>
		</tr>
		<tr>
			<th class="bgc">지원내용</th>
			<td class="tal">
                <ul class="dot_li">
                    <li>(기업) 인건비 지원(월 150만원, 3개월),
                                          경영·노무 컨설팅 제공</li>
                    <li> (청년) 관광 트렌드 및 실무 역량강화 교육 제공 </li>
                </ul>
			</td>
		</tr>
	</tbody>
</table>








<h4 class="tit_dot mb20">경남 관광 로컬 크리에이터 양성</h4>
<div class="pointbox mb20">
	<p class="fsb fwb tac">경남 관광 콘텐츠 활용 실무 교육을 통해
                           지역 내 콘텐츠 크리에이터 인재를 양성하고자 함</p>
</div>

<table class="comm_table mb20">
	<colgroup>
		<col width="20%"/>
		<col width="*"/>
	</colgroup>
	<tbody>
		<tr>
			<th class="bgc">사업기간</th>
			<td>2024. 5월 ~ 10월</td>
		</tr>
		<tr>
			<th class="bgc">교육대상</th>
			<td class="tal">관광 콘텐츠 제작·개발에 관심 있는 경남도민 또는
                                                도내 기업 및 대학에 재직·재학 중인 자(외국인 포함) /<br>
                                                실제 개인 SNS를 운영 중인 크리에이터 등
			</td>
		</tr>
		<tr>
			<th class="bgc">교육인원</th>
			<td class="tal">
				총 200명(기초 80명/전문가 120명) <br>
                                  <p class="fss">※ 목표 수료생 : 총 150명 이상</p>
			</td>
		</tr>
		<tr>
			<th class="bgc">주요내용</th>
			<td class="tal">
			로컬 기반 콘텐츠 제작 분야별 실무 중심
                              이론·실습 교육 운영 및 콘텐츠 제작 지원<br>
                1) 기 초 반 : 모바일 기기 활용 경남 관광 미디어 콘텐츠 제작 교육<br>
                  2) 전문가반 : PC 및 촬영 장비 활용 경남 관광 미디어 콘텐츠 실습(AI/트렌드반, 롱폼 제작반, 숏폼 제작반)  <br>

                <ul class="dot_li fss">
                    <li>AI/트렌드반 : AI 및 최신 트렌드를 반영한 이론 및 실습 교육</li>
                    <li>롱폼 제작반 : 영상 기획 및 제작 교육, 프로그램 실습 교육</li>
                    <li>숏폼 제작반 : 기초반(모바일) 심화 교육, 편집 실습 교육         </li>
                </ul>
			</td>
		</tr>
	</tbody>
</table>

<div class="business_img mb">
	<ul class="list02">
		<li><img src="/img/newPs01.jpg" alt=""></li>
		<li><img src="/img/newPs02.jpg" alt=""></li>
	</ul>
</div>






			</div><!--con-->
		</div><!--subcon-->
	</div><!--subwrap-->





<%@ include file="/WEB-INF/jsp/egovframework/gntbsc/inc/footer.jsp" %>