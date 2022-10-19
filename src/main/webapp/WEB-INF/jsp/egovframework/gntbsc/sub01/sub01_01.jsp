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


<h4 class="tit_dot mb20">설립경위</h4>
<div class="pointbox mb">
	<p>경상남도는 문화체육관광부와 한국관광공사가 공모한 ‘2020 지역 관광기업지원센터 구축 공모사업’에 선정되었습니다.</p>
	<p> 이에 따라 경상남도는 수도권에 집중된 관광사업체 지원체계를 지역까지 확산해 지역주도의 관광혁신 거점을 구축하기 위해 경남관광기업지원센터를 창원에 설립하였습니다. </p>
</div>

<h4 class="tit_dot mb20">주요업무</h4>
<div class="pointbox mb">
	<p>경남지역 관광기업육성, 창업지원 및 전문인력 육성을 위한 교육 등 지역관광산업 활성화를 위한 선순환 구조 확립 및 지역 일자리 창출을 지원합니다.</p>
</div>

<h4 class="tit_dot mb20">비전 및 전략</h4>
<div class="vision mb">
	<h5 class="vs_tit tac mb"><b>VISION</b><span class="tit">경남형 관광산업 거점조성을 통한 <span class="mEnter">지역관광사업 생태계 조성</span></span></h5>
	<div class="goal mb">
		<h5 class="vs_tit tac"><b>GOAL</b><span class="tit">지역 관광산업 발굴·육성 및 일자리 창출</span></h5>
	</div>
	<div class="vision_li tac">
		<ul>
			<li>
				<img src="<c:url value='/img/ic_vision01.png'/>" alt="스타트업인큐베이팅" />
				<dl>
					<dt>관광스타트업 발굴 <br/>및 창업․육성 지원</dt>
					<dd>입주기업 발굴 및 창업 육성 지원</dd>
					<dd>우수 입주기업 사업화자금 지원</dd>
					<dd>입주기업 대내‧외 네트워킹 강화 지원</dd>
					<dd>입주기업 역량강화 프로그램 운영</dd>
				</dl>
			</li>
			<li>
				<img src="<c:url value='/img/ic_vision02.png'/>" alt="관광기업 경영개선지원" />
				<dl>
					<dt>도내 관광기업 <br/>역량강화</dt>
					<dd>관광 교육 아카데미 운영</dd>
					<dd>관광기업 상설 컨설팅 지원</dd>
					<dd>언택트 온라인 마케팅 지원사업 운영</dd>
				</dl>
			</li>
			<li>
				<img src="<c:url value='/img/ic_vision03.png'/>" alt="관광일자리 허브 구축" />
				<dl>
					<dt>관광일자리 <br/>허브 구축</dt>
					<dd>지역인재 채용 관광기업 지원 사업 운영</dd>
					<dd>디지털 관광마케터 양성교육 운영</dd>
					<dd>경남 관광 창업 아이디어톤 운영</dd>
					<dd>관광 일자리 잡페어 개최</dd>
				</dl>
			</li>
			<li>
				<img src="<c:url value='/img/ic_vision04.png'/>" alt="지역관광산업 지원사업" />
				<dl>
					<dt>지역 관광산업<br/> 활성화 지원사업</dt>
					<dd>지역관광 인플루언서 양성</dd>
					<dd>지역기반 관광스타트업 협업 프로젝트 운영</dd>
					<dd>경남 여행기획자-여행기업 상품 개발 매칭지원</dd>
				</dl>
			</li>
		</ul>
	</div>
</div>


			</div><!--con-->
		</div><!--subcon-->
	</div><!--subwrap-->





<%@ include file="/WEB-INF/jsp/egovframework/gntbsc/inc/footer.jsp" %>