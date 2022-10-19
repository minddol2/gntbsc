<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
String lang_mode = (String) request.getAttribute("lang_temp");

String is_main = "";
int m1 = 1;
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

<!--
<h4 class="tit_dot mb20">조직도</h4>
<div class="organization bmb">
	<div class="ordep or01">
		<h5 class="orhd">경남관광기업지원센터장</h5></div>
	<div class="ordep or02">
		<h6 class="orhd right">시설관리</h6>
	</div>
	<div class="ordep or03">
		<h7 class="orhd">본부장</h7>
	</div>
	<div class="ordep or04">		
		<div class="ortree list04">
			<h8 class="orhd">일자리상담소</h8>			
		</div>
		<div class="ortree list04">
			<h8 class="orhd">관광기업발굴</h8>			
		</div>
		<div class="ortree list04">
			<h8 class="orhd">관광 컨설팅</h8>			
		</div>
		<div class="ortree list04">
			<h8 class="orhd">회계/총무</h8>			
		</div>
	</div>
</div>
-->

<h4 class="tit_dot mb20">담당자 안내</h4>
<div class="font-sz" style="font-weight:400;">
<table class="comm_table bd_table tac bmb">
	<colgroup>
		<col width="20%"/>
		<col width="20%"/>
		<col width="*"/>
		<col width="20%"/>
	</colgroup>
	<thead>
		<tr>
			<th>직위</th>
			<th>담당자</th>
			<th>주요업무</th>
			<th>연락처</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td class="bgc">센터장</td>
			<td>황은희</td>
			<td class="tal">
				<ul class="dot_li">
					<li>경남관광기업지원센터 사업기획 및 운영 총괄</li>
                    <li>경상남도 및 한국관광공사 등 유관기관 대외협력 총괄</li>
				</ul>
			</td>
			<td>055-277-8411</td>
		</tr>
		<tr>
			<td class="bgc">대리</td>
			<td>김유리</td>
			<td class="tal">
				<ul class="dot_li">
					<li>경남관광기업지원센터 사업 예산 집행 및 정산</li>
                    <li>경남관광기업지원센터 운영위원회 운영</li>
                    <li>경상남도 및 한국관광공사 등 유관기관 대외협력</li>
                    <li>센터 자산·물품 관리 및 일반 서무</li>
				</ul>
			</td>
			<td>055-277-8412</td>
		</tr>
		<tr>
			<td class="bgc">매니저</td>
			<td>오혜리</td>
			<td class="tal">
				<ul class="dot_li">
					<li>관광스타트업 발굴 및 창업 육성 지원<br>
                          - 입주기업 역량강화 교육 및 네트워킹 강화 지원<br>
                          - 우수 입주기업 사업화자금 지원 사업 운영 </li>
                        <li>e-나라도움 예산 집행 및 정산(국비)</li>
                        <li>센터 자산 관리(일반 시설)</li>
				</ul>
			</td>
			<td>055-277-8413</td>
		</tr>
		<tr>
			<td class="bgc">매니저</td>
			<td>송지선</td>
			<td class="tal">
				<ul class="dot_li">
					<li>지역관광 활성화 지원<br>
                          - 지역 기반 관광스타트업 협업 프로젝트 운영<br />
- 경남 여행기획자-여행기업 상품개발 매칭 지원사업 운영</li>
                     <li> 센터 투어프로그램 운영</li>
                     <li> 센터 서무 업무</li>
				</ul>
			</td>
			<td>055-277-8414</td>
		</tr>
		<tr>
			<td class="bgc">매니저</td>
			<td>송유나</td>
			<td class="tal">
				<ul class="dot_li">
					<li> 관광일자리 허브 구축<br>
                          - 지역인재 채용 관광기업 지원 사업 운영<br>
                          - 디지털 관광마케터 양성교육 운영<br>
                          - 관광일자리 잡페어 개최<br>
                          - 경남관광 창업 아이디어톤 운영</li>
				</ul>
			</td>
			<td>055-277-8415</td>
		</tr>
		<tr>
			<td class="bgc">매니저</td>
			<td>정동민</td>
			<td class="tal">
				<ul class="dot_li">
					<li>지역관광 활성화 지원<br/>
 - 지역관광 인플루언서 양성교육 운영</li>
					<li>관광스타트업 발굴 및 창업 육성 지원<br/>
  - 입주기업 디렉토리북 제작</li>
					<li>관광일자리 허브 구축<br/>
  - 경남 관광 창업 아이디어톤 운영 지원</li>
					<li>센터 대관 업무 및 자산관리(기자재)</li>
				</ul>
			</td>
			<td>055-277-8416</td>
		</tr>
		<tr>
			<td class="bgc">매니저</td>
			<td>이유민</td>
			<td class="tal">
				<ul class="dot_li">
					<li>도내 관광기업 역량강화<br>
                          - 도내 관광기업 상설컨설팅 운영<br>
                          - 관광아카데미 교육 운영<br>
                          - 언택트 온라인마케팅 지원사업 운영</li>
                    <li>센터 홈페이지 관리</li>
				</ul>
			</td>
			<td>055-277-8417</td>
		</tr>
<!--
		<tr>
			<td class="bgc">매니저</td>
			<td>오혜리</td>
			<td class="tal">
				<ul class="dot_li">
					<li> 관광스타트업 발굴 및 창업 육성 지원 사업 기획 및 운영<br>
                         - 입주기업 공모 사업 운영<br>
                         - 우수 입주기업 사업화자금 지원 사업 운영<br>
                         - 입주기업 네트워킹 강화 지원 사업 운영</li>
                        <li> 도내 관광기업 역량 강화 사업 기획 및 운영<br>
                         - 도내 관광기업 액셀러레이팅 지원 사업 운영</li>
                        <li>지역관광 활성화 지원 사업 기획 및 운영<br>
                         - 지역관광 인플루언서 양성 사업 운영</li>
				</ul>
			</td>
			<td>055-277-8413</td>
		</tr>

		<tr>
			<td class="bgc">매니저</td>
			<td>김수경</td>
			<td class="tal">
				<ul class="dot_li">
					<li> 도내 관광기업 역량 강화 사업 기획 및 운영<br>
                         - 관광 아카데미 운영<br>
                         - 도내 관광기업 상설 컨설팅(멘토링) 운영<br>
                         - 경남 관광 창업 해커톤 추진 사업 운영<br>
                         - 도내 관광기업 대규모 이벤트 참가 지원 사업 운영</li>
				</ul>
			</td>
			<td>055-277-8415</td>
		</tr>
        <tr>
        			<td class="bgc">매니저</td>
        			<td>노란</td>
        			<td class="tal">
        				<ul class="dot_li">
        					<li>관광일자리 허브 구축 사업 기획 및 운영<br>
                                 - 관광일자리 구인 구직 매칭<br>
                                 - 관광일자리 잡페어 개최 및 운영<br>
                                 - 도내 관광기업 지역인재 채용 지원 사업 운영</li>
                                <li>관광기업지원센터 시설 관리 및 대관 업무</li>
        				</ul>
        			</td>
        			<td>055-277-8414</td>
        		</tr>

		<tr>
			<td class="bgc">매니저</td>
			<td>박민희</td>
			<td class="tal">
				<ul class="dot_li">
					<li>도내 관광기업 역량강화 사업 운영지원<br/>
                         - 경남 관광 크리에이터 발굴 및 콘텐츠 제작 지원 사업 운영</li>
                        <li> 지역관광 활성화 지원 사업 기획 및 운영<br/>
                         - 관광약자 유치 상품화 지원 사업 운영</li>
                        <li> 관광스타트업 발굴 및 창업 육성 지원 사업 기획 및 운영 지원<br/>
                         - 우수 입주기업 사업화자금 지원 사업 지원<br/>
                         - 입주기업 네트워킹 강화 지원 사업 지원</li>
                        <li> 관광기업지원센터 국비보조금 집행 관리</li>
				</ul>
			</td>
			<td>055-277-8417</td>
		</tr>-->
	</tbody>
</table>
<!--
<table class="comm_table bd_table tac bmb">
	<colgroup>
		<col width="20%"/>
		<col width="20%"/>
		<col width="*"/>
		<col width="20%"/>
	</colgroup>
	<thead>
		<tr>
			<th>직위</th>
			<th>담당자</th>
			<th>주요업무</th>
			<th>연락처</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td class="bgc">센터장</td>
			<td>황은희</td>
			<td class="tal">
				<ul class="dot_li">
					<li>경남관광기업지원센터 총괄</li>
				</ul>
			</td>
			<td>055-277-8411</td>
		</tr>

		<tr>
			<td class="bgc">주임</td>
			<td>김유리</td>
			<td class="tal">
				<ul class="dot_li">
					<li>운영위원회 운영</li>
					<li>사업 예산 및 집행관리</li>
					<li>유관기관 대외협력</li>
				</ul>
			</td>
			<td>055-277-8412</td>
		</tr>
		
		<tr>
			<td class="bgc">매니저</td>
			<td>오혜리</td>
			<td class="tal">
				<ul class="dot_li">
					<li>관광스타트업 발굴 및 창업 육성 사업 운영 <br/>
					- 입주기업 공모 및 사업화 자금 지원 등</li>
					<li>지역관광 활성화 지원사업 운영<br/>
					- 경남관광 인플루언서 양성교육 운영</li>
				</ul>
			</td>
			<td>055-277-8413</td>
		</tr>
		<tr>
			<td class="bgc">매니저</td>
			<td>노란</td>
			<td class="tal">
				<ul class="dot_li">
					<li>관광일자리 허브 구축 기획 및 운영<br/>
					- 관광 일자리 구인·구직 매칭<br/>
					- 도내 관광기업 지역인재 채용 지원</li>
				</ul>
			</td>
			<td>055-277-8414</td>
		</tr>
		<tr>
			<td class="bgc">매니저</td>
			<td>김수경</td>
			<td class="tal">
				<ul class="dot_li">
					<li>도내 관광기업 역량강화 사업 운영<br/>
					- 도내 관광기업 상설컨설팅(멘토링) 운영<br/>
					- 관광 아카데미, 경남 관광 창업 아이디어톤 운영 등</li>
				</ul>
			</td>
			<td>055-277-8415</td>
		</tr>

		
		<tr>
			<td class="bgc">매니저</td>
			<td>박민희</td>
			<td class="tal">
				<ul class="dot_li">
					<li>도내 관광기업 역량강화 사업 운영 지원</li>
					<li>지역관광 활성화 지원 사업 운영<br/>
 - 관광약자 여행지원 사업 운영</li>
					<li>센터 홈페이지 관리 및 일반 서무</li>
				</ul>
			</td>
			<td>055-277-8417</td>
		</tr>		
	</tbody>
</table>-->
</div>

			</div><!--con-->
		</div><!--subcon-->
	</div><!--subwrap-->





	<%@ include file="/WEB-INF/jsp/egovframework/gntbsc/inc/footer.jsp" %>