<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="egovframework.com.cmm.service.EgovProperties" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import ="egovframework.goncs.member.service.LoginVO" %>
<%
String lang_mode = (String) request.getAttribute("lang_temp");

String is_main = "";
int m1 = 4;
int m2 = 1;
int m3 = 1;

int us_level = 5;
LoginVO loginVO = (LoginVO)session.getAttribute("loginVO");
if(loginVO != null) {
	us_level = loginVO.getUs_level();
}

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
	<ul class="tabs list03">				
		<li class="current"><a href="<c:url value='/sub04/sub01_01.do'/>">상담신청안내</a></li>
		<li><a href="<c:url value='/sub04/sub01_02.do'/>">전문 멘토단</a></li>
		<c:if test="${applicationFlag}">
		    <li><a href="<c:url value='/sub04/sub01_03.do'/>">상담신청</a></li>
		</c:if>
	</ul>
</div>
<p style="color:red; margin-bottom:10px;font-size: 20px; font-weight: bold;">멘토링 프로그램은 일시적으로 운영이 중단됩니다.</p>

<h4 class="tit_dot mb20">기업상담 신청방법</h4>
<div class="mentor_process mb">
	<ul>
		<li><img src="<c:url value='/img/ic_counsel_pro01.png'/>" alt="상담 접수"> <span class="tit">상담 접수</span> <span class="txt">회원 로그인 후 상담접수 글 작성<br/>(기업/예비창업자로 가입하여아 글 작성 가능)</span></li>
		<li><img src="<c:url value='/img/ic_counsel_pro02.png'/>" alt="멘토매칭"> <span class="tit">멘토매칭</span> <span class="txt">희망 상담분야에 해당하는<br/> 희망 멘토 선택<br/>
(불가시 대체 멘토 매칭)</span></li>
		<li><img src="<c:url value='/img/ic_counsel_pro03.png'/>" alt="멘토링진행"> <span class="tit">멘토링진행</span> <span class="txt">서면 : 댓글로 멘토링 진행<br/>
화상 : 화상회의 시스템으로 진행<br/> 대면 : 전화로 문의
</span></li>
		<li><img src="<c:url value='/img/ic_counsel_pro04.png'/>" alt="만족도조사"> <span class="tit">만족도조사</span> <span class="txt">멘토링 완료 후 만족도 설문</span></li>	
	</ul>
</div>
<h4 class="tit_dot mb20">상담문의 및 신청</h4>
<div class="time_info ofh mb">
	<div class="time">
		<dl class="time01">
			<dt>운영시간</dt>
			<dd>09:00 ~ 18:00 (주말 및 공휴일 제외)</dd>
			<dd>점심시간 12:00 ~ 13:00 </dd>
			<dd>멘토 매칭 및 답변까지 센터 근무일 기준 3일 내외 소요</dd>
		</dl>
	</div>
	<div class="time">
		<dl class="time02">
			<dt>문의</dt>
			<dd>담당자 이승철 Tel. 055-277-8417</dd>
		</dl>
	</div>	
</div>

<h4 class="tit_dot mb20">유의사항</h4>
<div class="pointbox mb">
	<ul class="dot_li">
		<li>로그인을 하셔야 작성한 글이 확인 가능합니다. <span class="ppTxt fwb">(타인이 작성한 글은 확인 불가)</span></li>
		<li>화상 멘토링 선택 시 댓글로 화상 멘토링 일정을  안내해드리며, 희망 시간에 진행이 불가할 경우 대체 시간으로 안내 드립니다. </li>		
		<li><span class="ppTxt fwb">화상 멘토링 진행 시 시간을 꼭 준수</span> 해주시기 바랍니다. </li>
		<li><span class="ppTxt fwb">화상회의는 ‘구글미팅’(Google Meet)으로 진행</span>되며, 사용이 불가한 경우 경남관광기업지원센터에 예약 후 센터에서 화상회의 시스템 사용이 가능합니다. </li>
		<li><span class="redTxt fwb">화상멘토링은 신청글 작성 후 이틀 뒤 부터 가능합니다. (신청 당일 진행 불가)</span></li>		
		<li><span class="redTxt fwb">작성한 글은 수정 및 삭제가 불가하므로 신중히 작성하여 주시기를 바랍니다.</span></li>
		<li>서면 멘토링 진행 시, <span class="ppTxt fwb">멘토 댓글 확인 후 이에 대한 추가문의가 있을 경우 24시간 안에 대댓글을 작성해야 추가 문의 진행이 가능</span>합니다. (24시간 후 댓글 창 닫힘) </li>
	</ul>
</div>
<div class="tac mb">
	<!--<a href="<c:url value='/sub04/sub01_03_write.do'/>" class="btn_rd btn_big">기업상담신청</a>-->
	<a href="javascript: void(0);" class="btn_rd btn_big" onclick="javascript: alert('기업상담신청기간이 아닙니다.');">기업상담신청</a>
</div>


			</div><!--con-->
		</div><!--subcon-->
	</div><!--subwrap-->





<%@ include file="/WEB-INF/jsp/egovframework/gntbsc/inc/footer.jsp" %>