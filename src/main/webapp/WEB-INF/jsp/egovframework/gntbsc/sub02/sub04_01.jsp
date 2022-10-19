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
int m2 = 4;
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



<h4 class="tit_dot mb20">모집개요</h4>
<div class="pointbox mb">
	<ul class="dot_li">
		<li><b class="blTxt">사업목적</b> 창의적인 관광산업 발굴과 관광 분야 창업 확산을 통해 경남 관광산업 경쟁력을 강화하고 신규 일자리 창출에 기여</li>
		<li><b class="blTxt">사업내용</b> 부문별 선발된 예비 창업자 및 기업 대상 사업화 자금, 역량 강화 컨설팅, 홍보·판로개척, 유관 기관 네트워크 및 투자유치 등을 지원</li>
		<li><b class="blTxt">주최 및 주관</b> 문화체육관광부, 한국관광공사, 경상남도, 경남관광재단</li>
		<li><b class="blTxt">공모기간</b> 2020.9.25.(금)~2020.10.26.(월) (32일간)</li>
		<li><b class="blTxt">참가형태</b> 예비 관광스타트업, 지역혁신 관광스타트업, 지역상생 관광벤처</li>
		<li><b class="blTxt">주요 지원사항</b> 센터 시설 이용(사무 공간, 회의실, 강의실 등), 사업화 자금(일부 해당 기업 한정), 역량 강화 교육 및 컨설팅 등</li>
		<li><b class="blTxt">신청 및 접수</b> 이메일 접수 (tsc2020@gnto.or.kr)</li>
		<li><b class="blTxt">제출서류 다운로드</b> 경남관광기업지원센터 (http://gyeongnam.tourbiz.or.kr)</li>
	</ul>
</div>


<h4 class="tit_dot mb20">모집분야</h4>
<table class="comm_table bd_table tac mb">
	<colgroup>
		<col width="20%"/>
		<col width="10%"/>
		<col width="45%"/>
		<col width="*"/>
	</colgroup>
	<thead>
		<tr>
			<th>모집분야</th>
			<th>선별규모</th>
			<th>참가자격</th>
			<th>비고</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td class="bgc tac">예비관광 스타트업</td>
			<td>6개 내외</td>
			<td class="tal">
				<ul class="dot_li">
					<li>관광과 관련한 창업 아이템으로 경상남도에 개인사업자 또는 법인사업자를 등록할 예비창업자</li>
 					<li>※ 경남지역 내외 타 직종 사업운영자의 경우 관광 분야로 사업을 변경하는 경우 참가 가능(기존 사업 폐업 처리 조건부)</li>
				</ul>
			</td>
			<td>지역·연령 무관</td>
		</tr>
		<tr>
			<td class="bgc tac">지역혁신 관광 스타트업</td>
			<td>4개 내외</td>
			<td class="tal">
				<ul class="dot_li">
					<li>공고일 현재 경상남도 소재 창업 7년 미만(사업자등록증상 업태 및 업종 불문)개인(법인)사업자 또는 「중소기업기본법 제2조」의거 관광과 관련된 사업을 영위하고 있거나 계획 중인 자로서 경남 관광기업지원센터에 입주(본점 또는 지점)를 희망하는 자 </li>
					<li>※ ICT, 여행, MICE, 체험, 관광기획, 인력양성 등 경남지역 문화콘텐츠를 활용한 독특한 상품 및 프로그램을 개발하는 기업</li>
					<li>※ 전년도 결산서의 매출액 기준 1천만원 이상 </li>
				</ul>
			</td>
			<td rowspan="2">사업기간 산정시 법인사업자 경우 법인등기부 등본상 등록일자 적용</td>
		</tr>
		<tr>
			<td class="bgc tac">지역상생 관광벤처</td>
			<td>2개 내외</td>
			<td class="tal">
				<ul class="dot_li">
					<li>한국관광공사의 관광벤처 공모전에 선정된 자 또는 타 지역 창업 3년 이상(사업자등록증상 업태 및 업종 불문)의 개인사업자 또는 법인사업자 중 경남 관광과 관련한 신규 사업자등록 예정인 자로서 경남 관광기업지원센터에 입주(본점 또는 지점)를 희망하는 자</li>
 					<li>※ 전년도 결산서의 매출액 기준 1천만원 이상 </li>
				</ul>
			</td>
		</tr>
	</tbody>
</table>


<h4 class="tit_dot mb20">지원사항</h4>
<table class="comm_table bd_table mb">
	<colgroup>
		<col width="25%"/>
		<col width="*"/>
	</colgroup>
	<thead>
		<tr>
			<th>모집구분</th>
			<th>지원사항</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td class="bgc tac">예비관광 스타트업</td>
			<td rowspan="3">
				<h5 class="fwb mb10">사업화 자금 지원(일부 기업 한정)</h5>
				<ul class="dot_li mb10">
					<li>예비 관광스타트업 중 평과 결과에 따라 최대 3,000만 원 지원 예정</li>
					<li>지역혁신 관광스타트업 중 평과 결과에 따라 최대 2,000만 원 지원 예정</li>
					<li>지역상생 관광벤처 중 평과 결과에 따라 최대 1,000만 원 지원 예정</li>
				</ul>
				<p class="fss mb10">※ 사후정산을 원칙으로 하며 자부담(10% 이상) 선집행</p>
				<h5 class="fwb mb10">사무공간 제공, 인터넷 회선 지원 등</h5>
				<ul class="dot_li mb10">
					<li>입주 기간은 입주계약 체결일로부터 1년간(평가에 따라 1년 연장 가능)</li>
				</ul>
				<h5 class="fwb">창업역량 강화 교육·컨설팅 지원</h5>			
			</td>
		</tr>
		<tr>
			<td class="bgc tac">지역혁신 관광 스타트업</td>
		</tr>
		<tr>
			<td class="bgc tac">지역상생 관광벤처</td>
		</tr>			
	</tbody>
</table>

<h4 class="tit_dot mb20">참가유의사항</h4>
<div class="pointbox mb">
	<ul class="dot_li">
		<li>관광 관련으로 직접 수익사업이 가능한 자(기업)만 참가 가능</li>
		<li>문화체육관광부, 경상남도, 한국관광공사, 경남관광재단에 근무하고 있는 자는 지원 불가 </li>
		<li>신청자는 반드시 본 공모전 모집 요강을 충분히 숙지하고 지원</li>
		<li>신청자는 신청분야를 중복으로 지원할 수 없음</li>
		<li>예비·초기 관광스타트업 부문 선정자는 향후 한국관광공사 관광벤처 공모전의 동일한 등급인 예비·초기 관광벤처 각 부문 동일 신청 불가<br/>
    (단, 예비 관광스타트업 선정자는 초기 관광벤처 부문에 신청 가능)</li>
		<li>경남 내외 타직종 사업운영자의 경우 업무협약 체결일 전까지 기존 사업의    폐업사실 증명원 제출 필수(예비관광 스타트업에 한함)</li>
	</ul>
</div>


<h4 class="tit_dot mb20">신청 자격 제한</h4>
<p class="redTxt mb10">아래 1개 이상 항목에 해당 시, 참가가 불가합니다.</p>
<div class="pointbox mb">
	<ul class="dot_li">
		<li>금융기관 등으로부터 채무불이행으로 규제 중인 자</li>
		<li>국세 또는 지방세를 체납으로 규제 중인 자</li>
		<li>타인에 의해 지식재산권이 기 출원 또는 등록된 상품이나 서비스를 제공하는 자</li>
		<li>공기업 및 준정부기관 계약사무 규칙 또는 국가를 당사자로 하는 계약에 관한 법률에 따른 부정당업자</li>
		<li>휴업중인 자</li>
		<li>신청기관(개인)의 자격이 맞지 않거나, 아이디어·서비스 내용이 불건전하거나, 공고 내용에 적합하지 않은 경우</li>
		<li> 타인의 아이디어, 기술 등을 모방하거나 도용했을 경우<br/>
   ※ 아이디어, 기술의 모방으로 인해 발생되는 모든 민·형사상의 책임은 신청자에 있음</li>
		<li>신청한 아이디어·서비스 등이 기존의 서비스 등과 완전히 동일하거나 단순한    개선 및 제안 등에 불과한 경우</li>
		<li>신청기관(개인)이 공모전 마감일 기준, 정부 주관 사업에 참여 제한 중인 경우</li>
		<li>기타 참여제한의 사유가 있다고 인정되는 자 </li>
	</ul>
</div>


<h4 class="tit_dot mb20">심사방법</h4>

<table class="comm_table bd_table mb">
	<colgroup>
		<col width="25%"/>
		<col width="*"/>
	</colgroup>
	<thead>
		<tr>
			<th>구분</th>
			<th>내용</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td class="bgc tac">1차 서류심사</td>
			<td>				
				<ul class="dot_li">
					<li><b class="blTxt">심사방법</b> 제출 사업계획서 평가 </li>
 					<li><b class="blTxt">평가항목</b> 5개 항목 100점 만점<br/>
						 - 사업의 창의성 및 차별성, 사업모델 및 사업화 전략, 실행가능성, 지역관광사업 기여도, 지속가능성 등</li>
 					<li><b class="blTxt">청년창업자 서류 가점 부여 </b></li>
				</ul>
			
			</td>
		</tr>
		<tr>
			<td class="bgc tac">2차 발표심사</td>
			<td>				
				<ul class="dot_li">
					<li><b class="blTxt">심사방법</b> PT 발표 및 질의 응답
  - 1인(기업)당 최대 20분 ※ 코로나19 격상 시 화상발표 예정
 					<li><b class="blTxt">평가항목</b> 6개 항목 100점 만점
   - 사업의 창의성 및 차별성, 사업모델 및 사업화 전략, 실행가능성, 지역관광사업 기여도, 지속가능성 등
 					<li><b class="blTxt">유의사항</b><br/>
   가. 제출서류에 기재된 대표 및 소속직원에 한해 발표 가능<br/>
   나. 코로나 19 관련 발표자 불참 및 영상물 대체가 가능하나 질의응답 면접 진행 불가에 따른 불이익이 있을 수 있음 <br/>
   다. 창원 컨벤션센터 방문 시 마스크 착용 필수  </li>
				</ul>
			
			</td>
		</tr>	
	</tbody>
</table>

<h4 class="tit_dot mb20">추진일정</h4>

<div class="process mb">
	<ul>
		<li>
			<dl class="pro">
				<dt><span class="num">01</span> 1차 서류발표</dt>
				<dd>개별 공지</dd>
				<dd class="date">10. 30.(금)</dd>
			</dl>
		</li>
		<li>
			<dl class="pro">
				<dt><span class="num">02</span>발표서류 제출</dt>
				<dd>PT 등 발표서류 제출 </dd>
				<dd class="date">11.9(월)</dd>
			</dl>
		</li>
		<li>
			<dl class="pro">
				<dt><span class="num">03</span>2차 발표심사</dt>
				<dd>1차 합격자 대상 발표평가</dd>
				<dd class="date">11.10(화)</dd>
			</dl>
		</li>
		<li>
			<dl class="pro">
				<dt><span class="num">04</span>결과 발표</dt>
				<dd>개별 공지</dd>
				<dd class="date">11.13.(금)</dd>
			</dl>
		</li>
		<li>
			<dl class="pro">
				<dt><span class="num">05</span>입주기업 선정</dt>
				<dd>입주계약 협약서 작성</dd>
				<dd class="date">11.27(금)</dd>
			</dl>
		</li>
	</ul>
</div>



			</div><!--con-->
		</div><!--subcon-->
	</div><!--subwrap-->





<%@ include file="/WEB-INF/jsp/egovframework/gntbsc/inc/footer.jsp" %>