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
<div class="font-sz">
<div class="iconBox">
	<h4 class="tit_nm mb20">경남관광스타트업 공모 소개 <span class="orgTxt">[마감]</span></h4>
	<ul class="dot_li mb10">
		<li><b class="blTxt">사업목적  </b>: <strong>창의적이고 매력적인 관광스타트업 발굴</strong>과 관광 분야 창업 확산을 통해 경남 관광산업 경쟁력을 강화하고 신규 일자리 창출에 기여</li>
		<li><b class="blTxt">모집기간  </b>: 2022. 2. 3.(목) ~ 2022. 3. 4.(금) 14:00까지</li>
		<li><b class="blTxt">서식다운로드 </b>: 홈페이지 내 공지사항 <a href="<c:url value='/'/>sub05/sub01_view.do?bbsId=BBSMSTR_000000000301&nttId=346&bbsTyCode=BBST03&bbsAttrbCode=BBSA03&authFlag=Y&pageIndex=1" class="ic_blank">2022 경남관광스타트업 공모</a> 확인</li>
	</ul>
</div>


<h4 class="tit_dot mb20">지원분야</h4>
<table class="comm_table mb">
	<thead>
		<tr>
			<th>구분</th>
			<th>내용</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td class="bgc tac">예비관광 스타트업</td>
			<td>관광과 관련한 창업아이템으로 도내 개인 또는 법인으로 신규 등록할 예비창업자<br>
                ※ 관광분야 외 기존 사업 운영자라도 관광분야로 사업을 확장하여 도내 신규 예비장업자로서 사업을 계획 중인 경우 참여 가능</td>
		</tr>
		<tr>
			<td class="bgc tac">지역혁신 <br>관광 스타트업</td>
			<td>경남 소재 창업 9년 미만 중소기업(「중소기업기본법」 제2조에 따른 기업)으로 관광과 관련한 사업을 영위하고 있는 개인사업자 <br>또는 법인 사업자</td>
		</tr>
		<tr>
			<td class="bgc tac">지역상생 관광벤처</td>
			<td>한국관광공사의 관광벤처공모전에 선정된 자 또는 타 지역 창업 3년 이상의 개인사업자 또는 법인사업자 중 경남 관광과 관련한 <br>신규 사업자 등록 예정인 자</td>
		</tr>
	</tbody>
</table>

<h4 class="tit_dot mb20">입주형태 및 입주기간</h4>
<div class="pointbox mb">
	<ul class="dot_li">
		<li><b class="blTxt">장소</b> : 경남 창원시 성산구 충혼로 91 창원문성대학교 경상관 1층 경남관광기업지원센터</li>
		<li><b class="blTxt">형태</b> : 1인실 공유오피스, 2~3인실, 4~5인실 독립오피스</li>
		<li><b class="blTxt">기간</b> : 입주계약 체결일로부터 1년간(평가에 따라 1년 연장 가능)</li>
	</ul>
</div>

<h4 class="tit_dot mb20">지원혜택</h4>
<div class="pointbox mb">
	<p class="fsb tac">센터 이용시설(사무공간, 회의실 등), 사업화 자금(최대 3천만원), 역량강화 교육, 컨설팅, 홍보, 판로개척, 네트워킹, 투자유치,<br> 경영 관련 맞춤 교육 및 전담 멘토링 지원</p>
</div>

<div class="program-img">
    <ul>
        <li>
            <a href="#img1" class="litebox"><img src="/img/program-img1.jpg" alt=""></a>
        </li>
        <li>
            <a href="#img2" class="litebox"><img src="/img/program-img2.jpg" alt=""></a>
        </li>
        <li>
            <a href="#img3" class="litebox"><img src="/img/program-img3.jpg" alt=""></a>
        </li>
        <li>
            <a href="#img4" class="litebox"><img src="/img/program-img4.jpg" alt=""></a>
        </li>
        <li>
            <a href="#img5" class="litebox"><img src="/img/program-img5.jpg" alt=""></a>
        </li>
    </ul>
</div>
<div id="img1" class="program-img-box no-display">
    <img src="/img/program-img1.jpg" alt="">
</div>
<div id="img2" class="program-img-box no-display">
    <img src="/img/program-img2.jpg" alt="">
</div>
<div id="img3" class="program-img-box no-display">
    <img src="/img/program-img3.jpg" alt="">
</div>
<div id="img4" class="program-img-box no-display">
    <img src="/img/program-img4.jpg" alt="">
</div>
<div id="img5" class="program-img-box no-display">
    <img src="/img/program-img5.jpg" alt="">
</div>
<!--style>
    .program-img-box img{max-height:80vh !important;}
    .litebox-overlay .litebox-inline-html{text-align: center !important;
                                              background: none !important;}
</style-->
</div>

			</div><!--con-->
		</div><!--subcon-->
	</div><!--subwrap-->





<%@ include file="/WEB-INF/jsp/egovframework/gntbsc/inc/footer.jsp" %>