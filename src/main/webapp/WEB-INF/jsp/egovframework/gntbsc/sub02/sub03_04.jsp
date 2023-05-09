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

<h4 class="tit_dot mb20">경남 관광 디지털 전문인력 양성교육</h4>
<div class="pointbox mb20">
	<p class="fsb fwb tac">경남지역 관광콘텐츠 활용 전문가 육성을 위한 관광 콘텐츠 제작 실습 교육 지원</p>
</div>
<!--table class="comm_table">
	<colgroup>
		<col width="20%"/>
		<col width="*"/>
	</colgroup>
	<tbody>
		
		<tr>
			<th class="bgc">모집기간</th>
			<td>상반기 중 모집 예정</td>
		</tr>
		<tr>
			<th class="bgc">참여혜택</th>
			<td>전 과정 무료 교육, 수료증 및 상품 수여, 홍보단 참가 기회 부여</td>
		</tr>
	
		<tr>
			<th class="bgc">교육신청</th>
			<td><a href="https://gyeongnam.tourbiz.or.kr/sub05/sub01_view.do?bbsId=BBSMSTR_000000000301&nttId=472&bbsTyCode=BBST03&bbsAttrbCode=BBSA03&authFlag=Y&pageIndex=1" class="ic_blank">교육신청안내</a></td>
		</tr>
	</tbody>
</table-->

<table class="comm_table">
	<colgroup>
		<col width="20%"/>
		<col width="40%"/>
		<col width="40%"/>
	</colgroup>
  <tr>
    <th>구분</th>
    <th>관광마케터 양성교육</th>
    <th>인플루언서 양성교육</th>
  </tr>
  <tr>
    <th>교육기간</th>
    <td>2023. 5. 13~ 6. 15</td>
    <td>2023. 5. 13~ 6. 23</td>
  </tr>
  <tr>
    <th>교육대상</th>
    <td>관광 기업 취업을 희망하는 만 19세 이상 만 39세 이하 <span class="pEnter">경남도민 및 도내 재학·재직자<span></td>
    <td>관광콘텐츠 제작·개발에 관심 있는 만 19세 이상 경남도민</td>
  </tr>
  <tr>
    <th>교육인원</th>
    <td>20명</td>
    <td>실전반 90명, 마스터반 40명</td>
  </tr>
  <tr>
    <th>교육내용</th>
    <td>관광 마케팅 실무 중심 취업 연계 교육</td>
    <td>경남 관광 활용 SNS 콘텐츠 제작, 영상 편집 등 이론/실무 교육</td>
  </tr>
  <tr>
    <th>교육장소</th>
    <td colspan="2">경남관광기업지원센터 대회의실</td>
  </tr>
  <tr>
    <th>특강자</th>
    <td>54만 유튜버 &lt;사내뷰공업&gt;
      야놀자 커뮤니케이션실 &lt;송민규 실장&gt;<br>
      &lsquo;여행을 바꾸는 여행 트렌드&rsquo; 저자 &lt;김다영 작가&gt;
    </td>
    <td>1. 54만 유튜버 &lt;사내뷰공업&gt;<br />
      2. &lsquo;엄마, 내친김에 남미까지!&rsquo; 저자 &lt;태원준 여행작가&gt;</td>
  </tr>
  <tr>
    <th>참여혜택</th>
    <td>관광 마케팅 전문가 멘토링 및 교육 참여 장려 지원금 지급<br />
      실무자 초청 강연 및 스튜디오 실습을 통한 수강생의 업무 능력 제고<br />
      취업 멘토링 및 포트폴리오 제작 지원을 통한 취업연계 지원<br />
      수료증 및 수료 기념품 지급<br />
      김다영 작가의 [여행을 바꾸는 여행 트렌드] 저서 지급
    </td>
    <td>교육 수료시 제작 지원금 지급 *출석 및 과제 제출 시 지급<br />
      우수 수료생에 한해 경남관광재단 홍보단 참여 기회 부여 *5만원 월 2회, 최대 10만원 지급<br />
      수료증 및 수료 기념품 지급
    </td>
  </tr>
		<tr>
			<th class="bgc">교육신청</th>
			<td colspan="2"><a href="https://gyeongnam.tourbiz.or.kr/sub05/sub01_view.do?bbsId=BBSMSTR_000000000301&nttId=584&bbsTyCode=BBST03&bbsAttrbCode=BBSA03&authFlag=Y&pageIndex=1" class="ic_blank">교육신청안내</a></td>
		</tr>
</table>


<!--
<h5 class="tit_nm mb20">세부 교육내용-실전반</h5>
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
			<td rowspan="2">09/74(토)</td>
			<td rowspan="2">크리에이터 초청 및 OT</td>
			<td class="tal">
				<p>[OT 및 교육안내]</p>
				
			</td>
		</tr>
		<tr>			
			<td class="tal">
				<p>* 실전반, 마스터반 통합</p>
				<p>[크리에이터 우수사례를 통한 동기부여 (강의명 미정)]</p>
				<ul class="dot_li">
					<li>콘텐츠 기획 및 제작 경로, 초기 운영 노하우 및 홍보, 마케팅 방법 등</li>
					<li>질의응답 및 네트워킹</li>
				</ul>
			</td>
		</tr>		
		<tr>
			<td class="bgc">2회차</td>
			<td>09/18(일)</td>
			<td>SNS 플랫폼 이해와 활용, 윤리</td>
			<td class="tal">
				<p>[야, 너두 SNS 인플루언서 할 수 있어!]</p>
				<ul class="dot_li">
					<li>SNS 필요성과 이해 및 트렌드 분석</li>
					<li>(실습) 벤치마킹 대상 SNS 계정 찾기, 팔로워 늘어나는 SNS특징</li>
					<li>SNS 게시물 작성 노하우와 주의사항(디지털 윤리 포함)</li>
				</ul>
			</td>
		</tr>
		<tr>
			<td class="bgc">3회차</td>
			<td>09/24(토)</td>
			<td>숏폼 플랫폼</td>
			<td class="tal">
				<p>[60초안에 나를 담다, 숏폼 크리에이터가 되는 방법]</p>
				<ul class="dot_li">
					<li>숏폼, 틱톡 플랫폼 이해와 트렌드 분석</li>
					<li>(실습)나만의 숏폼 콘텐츠 기획, 영상촬영, 편집</li>
					<li>계정 활성화 방법, 수익화 방법 및 업로드 전 필수 체크 사항</li>
				</ul>
			</td>
		</tr>
		
		<tr>
			<td class="bgc">4회차</td>
			<td>09/25(일)</td>
			<td>카드뉴스 제작</td>
			<td class="tal">
				<p>[미리캔버스, 망고보드로 카드뉴스 제작하기]</p>
				<ul class="dot_li">
					<li>미리캔버스, 망고보드 이해</li>
					<li>콘텐츠 벤치마킹, 제작 가이드 및 팁</li>
					<li>(실습)콘텐츠 기획하기(소재발굴, 스토리텔링, 카피라이팅)</li>
					<li>(실습)카드 뉴스 제작 및 SNS 등록하기</li>
				</ul>
			</td>
		</tr>
		<tr>
			<td class="bgc">5회차</td>
			<td>10/1(토)</td>
			<td>사진 촬영 및 보정 방법(기초)</td>
			<td class="tal">
				<p>[클릭률을 높이는 사진 촬영, 보정법]</p>
				<ul class="dot_li">
					<li>카메라 세팅하기, 기능, 구조 파악하기</li>
					<li>(실습)인물, 풍경 사진 촬영 후 보정 및 어도비 라이트룸 기능 익히기 </li>
				</ul>
			</td>
		</tr>
		<tr>
			<td class="bgc">6회차</td>
			<td>10/2(일)</td>
			<td>크리에이터 초청 및 수료식</td>
			<td class="tal">
				<p>* 실전반, 마스터반 통합</p>
				<p>[크리에이터 우수사례를 통한 동기부여 (강의명 미정)]</p>
				<ul class="dot_li">
					<li>콘텐츠 기획 및 제작 경로, 초기 운영 노하우 및 홍보, 마케팅 방법 등</li>
					<li>질의응답 및 네트워킹</li>
				</ul>
				<p>[수료식]</p>
				<ul class="dot_li">
					<li>SNS 인플루언서 수료식(수료생, 우수 수료생 수료증 및 상품 수여)</li>
				</ul>			
			</td>
		</tr>
		
	</tbody>
</table>
<p class="fss mb">※ 상기 일정 및 내용은 변경될 수 있으며, 코로나19로 상황에 따라 온·오프라인 교차 수업 가능</p>

<h5 class="tit_nm mb10">세부 교육내용-마스터반</h5>
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
			<td>09/17(토)</td>
			<td>크리에이터 초청 및 OT</td>
			<td>
				<p>* 실전반, 마스터반 동일</p>
				
			</td>
		</tr>
		
		<tr>
			<td class="bgc">2회차</td>
			<td>09/18(일)</td>
			<td>인스타그램 브랜딩</td>
			<td class="tal">
				<p>[자꾸 보고싶은 인스타그램, 톤앤매너 활용하기]</p>
				<ul class="dot_li">
					<li>(실습)인스타그램 콘셉 정하기</li>
					<li>(실습)스타일 가이드 만들기(스타일, 필터, 팔레트, 레이아웃 등) , 콘텐츠 가이드 만들기(카테고리, 해시태그, 릴스 등)</li>
					<li>(실습)운영 가이드 만들기(운영 페르소나, 가이드, 운영 일정 계획)</li>
				</ul>
			</td>
		</tr>
		<tr>
			<td class="bgc">3회차</td>
			<td>09/24(토)</td>
			<td>사진 촬영 및 보정 방법(심화)</td>
			<td class="tal">
				<p>[프로 사진작가가 알려주는 사진 촬영과 보정법]</p>
				<ul class="dot_li">
					<li>- (실습)카메라 세팅하기, 기능 파악 후 보정 및 어도비 라이트룸 기능 익히기</li>
				</ul>
			</td>
		</tr>
		
		
		<tr>
			<td class="bgc">4회차</td>
			<td>09/25(일)</td>
			<td>포토샵을 활용한 다양한 SNS 디자인물 제작</td>
			<td class="tal">
				<p>[Hooking? 클릭하지 않고 배길 수 없는 썸네일 제작 팁]</p>
				<ul class="dot_li">
					<li>(실습)포토샵 기본 기능 익히기, 디자인물 제작 팁 및 방법</li>
					<li>(실습)디자인물 제작(커버, 카드뉴스, 썸네일, 배너 디자인, 웹포스터 등)</li>
				</ul>
			</td>
		</tr>
		<tr>
			<td class="bgc">5회차</td>
			<td>10/1(토)</td>
			<td>제페토를 활용한 메타버스(심화)</td>
			<td class="tal">
				<p>[제페토 속 유명 인싸 되기]</p>
				<ul class="dot_li">
					<li>가상공간, 메타버스 산업 이해하기</li>
					<li>(실습)제페토 기능 익히기</li>
					<li>(실습)메타버스 공간, 아바타, 썸네일, 커버사진 제작 후 발표 및 피드백</li>
					<li>크리에이터로 성장하기(제페토 크리에이터 등록하기, 수익 창출 방법)</li>
				</ul>
			</td>
		</tr>
		<tr>
			<td class="bgc">6회차</td>
			<td>10/2(일)</td>
			<td>크리에이터 초청 및 수료식</td>
			<td class="tal">
				<p>* 실전반, 마스터반 동일</p>
				<p>[수료식]</p>
				<ul class="dot_li">
					<li>SNS 인플루언서 수료식(수료생, 우수 수료생 수료증 및 상품 수여)</li>
				</ul>
			
			</td>
		</tr>
		
	</tbody>
</table>
<p class="fss">※ 상기 일정 및 내용은 변경될 수 있으며, 코로나19로 상황에 따라 온·오프라인 교차 수업 가능</p>

<div class="business_img mb bdbt">
	<ul class="list02">
		<li><img src="<c:url value='/img/b_influ_img01.jpg'/>" alt="지역관광 인플루언서 포스터" /></li>
		<li><img src="<c:url value='/img/b_influ_img02.jpg'/>" alt="지역관광 인플루언서 포스터" /></li>
	</ul>
</div>
-->

<div class="bdbt"></div>
<h4 class="tit_dot mb20">지역 기반 관광스타트업 협업 프로젝트</h4>

<table class="comm_table mb">
	<colgroup>
		<col width="20%"/>
		<col width="*"/>
	</colgroup>
	<tbody>
		<tr>
			<th class="bgc">공모기간</th>
			<td>상반기 중 모집 예정</td>
		</tr>
		<tr>
			<th class="bgc">공모내용</th>
			<td>협업을 통해 시너지 효과 창출 할 수 있는 사업, 관광객 대상 관광상품/서비스/제품을 제공하는 사업, 협약 기간 내 구체적 성과 창출이 가능한 사업</td>
		</tr>
		<tr>
			<th class="bgc">공모대상</th>
			<td class="tal">
				경남도내·외 2개 이상 관광기업이 1팀으로 공모 / 경남도내·외 관광사업을 운영 중인 기업(대표기업+협업기업)
			</td>
		</tr>
		<tr>
			<th class="bgc">지원규모</th>
			<td class="tal">
				5개 프로젝트 내외 선정 / 최대 5천만원 협업사업비 지원
			</td>
		</tr>
		<tr>
			<th class="bgc">지원사항</th>
			<td class="tal">
				협업사업비(최대5천만원 지원 – 홍보비 및 마케팅비 등), 사전컨설팅 및 상시멘토링, 기업간 네트워킹 지원
			</td>
		</tr>
	</tbody>
</table>

<!--h5 class="tit_nm mb20">사업설명회</h5>
<div class="business_img mb bdbt">
	<ul class="list02">
		<li><img src="<c:url value='/img/b_collabo_img01.jpg'/>" alt="사업설명회 사진자료" /></li>-->
		<!--<li><img src="<c:url value='/img/b_collabo_img02.jpg'/>" alt="사업설명회 사진자료2" /></li>
		<li><img src="<c:url value='/img/b_collabo_img03.jpg'/>" alt="경남관광 협업프로젝트 포스터" /></li>
	</ul>
</div-->

			</div><!--con-->
		</div><!--subcon-->
	</div><!--subwrap-->





<%@ include file="/WEB-INF/jsp/egovframework/gntbsc/inc/footer.jsp" %>