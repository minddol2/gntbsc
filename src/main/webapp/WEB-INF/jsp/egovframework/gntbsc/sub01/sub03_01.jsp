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
    <td>센터장</td>
    <td>최소연</td>
    <td class="tal"><ul class="dot_li">
        			<li> 경남관광기업지원센터 사업기획 및 운영 총괄</li>
      <li> 경상남도 및 한국관광공사 등 유관기관 대외협력 총괄</li>
      <li> 경남관광기업지원센터 물품출납(물품출납원)</li>
      <li> 2024 경남관광기업 페스타 &amp; 어워드 개최</li>
                                       		 </ul></td>
    <td>055-277-8411</td>
  </tr>
  <tr>
    <td>대리</td>
    <td>김민정</td>
    <td class="tal"><ul class="dot_li">
        			<li> 경남관광기업지원센터 사업 예산 관리 및 정산 총괄</li>
      <li> 경남관광기업지원센터 운영위원회 운영</li>
      <li> 경남관광기업지원센터 직원 복무 및 근태 등 관리</li>
      <li> 경상남도 및 한국관광공사 등 유관기관 대외협력 지원</li>
      <li> 관광상품 판매·홍보 박람회 참가</li>
      <li> 경남 관광 비즈니스 네트워킹 데이 운영(타기관 연계 답사·교류 행사)</li>
      <li> 센터 자산·물품 관리(물품운용자) 및 일반행정·자료 작성 등 총괄</li>
      <li> 센터 기록물 관리(기록물관리자)</li>
                            		 </ul></td>
    <td>055-277-8412</td>
  </tr>
  <tr>
    <td>매니저</td>
    <td>전봉규</td>
    <td class="tal"><ul class="dot_li">
        			<li> 경남 관광 로컬 크리에이터 양성 사업 운영</li>
      <li> 센터 시설 및 자산 관리(수선유지, 물품총괄관리대장 관리 등)</li>
      <li> 근로생, 비즈니스센터(커피머신 등) 관리</li>
                                 		 </ul></td>
    <td>055-277-8415</td>
  </tr>
  <tr>
    <td>매니저</td>
    <td>김초아</td>
    <td class="tal"><ul class="dot_li">
        			<li> 경남 관광스타트업 사업화자금 지원 사업 운영</li>
      <li> 경남 관광일자리 잡페어 운영</li>
      <li> 도내 관광기업 지역인재 채용 지원 사업 운영</li>
      <li> 센터 홍보 채널 및 홈페이지 관리</li>
                             		 </ul></td>
    <td>055-277-8416</td>
  </tr>
  <tr>
    <td>매니저</td>
    <td>송지선</td>
    <td class="tal"><ul class="dot_li">
        			<li> 입주기업 공모(연장평가 포함)</li>
      <li> 입주기업 액셀러레이팅 프로그램 운영</li>
      <li> e-나라도움 예산 집행 및 정산(국, 도비)</li>
      <li> 센터 운영 정기 지출(임차기기, 무인경비 등)</li>
      <li> 팀내 서무업무(여비, 급량비 관리)</li>
                              		 </ul></td>
    <td>055-277-8414</td>
  </tr>
  <tr>
    <td>매니저</td>
    <td>이승철</td>
    <td class="tal"><ul class="dot_li">
        			<li> 경남 관광 아카데미 운영</li>
      <li> 도내 관광기업 상설 컨설팅 운영</li>
      <li> 센터 대관 업무 및 투어 프로그램 운영</li>
                                		 </ul></td>
    <td>055-277-8417</td>
  </tr>
  <tr>
    <td>매니저</td>
    <td>김민주</td>
    <td class="tal"><ul class="dot_li">
        			<li> 지역기반 경남관광 협업 프로젝트 운영</li>
      <li> 경남 관광기업 팝업스토어 운영</li>
      <li> 사무용품(복사용지, 의약품 포함) 구매·관리</li>
      <li> 센터 창고, 기념품 관리</li>
                        		 </ul></td>
    <td>055-277-8413</td>
  </tr>
	</tbody>
</table>

</div>

			</div><!--con-->
		</div><!--subcon-->
	</div><!--subwrap-->





	<%@ include file="/WEB-INF/jsp/egovframework/gntbsc/inc/footer.jsp" %>