<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
String lang_mode = (String) request.getAttribute("lang_temp");

String is_main = "";
int m1 = 4;
int m2 = 2;
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

<div class="typebox mb">
	<ul class="tabs list02">				
		<li class="current"><a href="<c:url value='/sub04/sub02_01.do'/>"> 신청안내</a></li>
		<li><a href="<c:url value='/member/myjob.do'/>">신청확인</a></li>
	</ul>
</div>


<h4 class="tit_dot mb20">일자리상담 신청방법</h4>
<div class="counsel_process mb">
	<ul>
		<li><img src="<c:url value='/img/ic_counsel_pro01.png'/>" alt="상담예약신청 (사전예약)" /> <span>상담예약신청<br/>(사전예약)</span></li>
		<li><img src="<c:url value='/img/ic_counsel_pro02.png'/>" alt="날짜/시간 선택" /> <span>날짜/시간 선택</span></li>
		<li><img src="<c:url value='/img/ic_counsel_pro03.png'/>" alt="예약확정(담당자승인)" /> <span>예약확정<br/>담당자승인</span></li>
		<li><img src="<c:url value='/img/ic_counsel_pro04.png'/>" alt="관광기업 경영개선지원" /> <span>신청접수 알림 <br/>(SMS 통보)</span></li>	
	</ul>
</div>




<h4 class="tit_dot mb20">상담문의 및 신청</h4>
<div class="time_info ofh mb">
	<div class="time">
		<dl class="time01">
			<dt>운영시간</dt>
			<dd>예약 및 상담 09:00 ~ 18:00 (평일) </dd>
			<dd>점심시간 12:00 ~ 13:00 </dd>
		</dl>
	</div>
	<div class="time">
		<dl class="time02">
			<dt>문의</dt>
			<dd>담당자 김초아</dd>
			<dd>Tel. 055-277-8416</dd>
		</dl>
	</div>	
</div>

<h4 class="tit_dot mb20">구인/구직신청 서식 다운로드</h4>
<div class="standard_down mb">
	<dl class="ic_counsel01">
		<dt>구 인</dt>
		<dd>관광 인력 연결이 필요합니다.</dd>
		<dd class="down"><a href="#" class="btn_sumit" onclick="window.open(encodeURI('<c:url value='/download/downloadFile.do?'/>requestedFile=businessperson.hwp&dFileName=2022_경남관광기업지원센터_일자리상담소_구인신청서.hwp'))">구인신청서 서식 다운로드</a></dd>
	</dl>
	<dl class="ic_counsel02">
		<dt>구 직</dt>
		<dd>관광 일자리 연결이 필요합니다.</dd>
		<dd class="down"><a href="#" class="btn_sumit" onclick="window.open(encodeURI('<c:url value='/download/downloadFile.do?'/>requestedFile=jobseeker.hwp&dFileName=2022_경남관광기업지원센터_일자리상담소_구직신청서.hwp'))">구직신청서 서식 다운로드</a></dd>
	</dl>
</div>


<h4 class="tit_dot mb20">유의사항</h4>
<div class="pointbox mb">
	<ul class="dot_li">
		<li><span class="ppTxt fwb">구인/구직신청서</span>를 반드시 첨부해주세요.</li>
		<li><span class="ppTxt fwb">상담예약 신청은 상담일 전일</span>까지 가능하며, 당일 상담예약 신청은 유선으로 연락주시기 바랍니다.</li>
		<li>주말 및 공휴일은 예약신청 할수 없으며 <span class="ppTxt fwb">확정된 방문 시간을 꼭 준수</span>하여 주시기 바랍니다.</li>
		<li>아래 상담 신청은 희망시간이며, <span class="ppTxt fwb">승인 문자를 받으신 분에 한하여 상담이 가능</span>합니다.</li>
	</ul>
</div>



<div class="tac mb">	
	<a href="<c:url value='/sub04/job.do'/>" class="btn_rd btn_big">일자리 지원신청</a>
</div>




			</div><!--con-->
		</div><!--subcon-->
	</div><!--subwrap-->





<%@ include file="/WEB-INF/jsp/egovframework/gntbsc/inc/footer.jsp" %>