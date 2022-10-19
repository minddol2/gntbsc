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


<div class="info_space mb">			
	<div class="photo">
		<img src="../img/space_info.jpg" alt="">
	</div>
	<div class="space_li">
		<ul>
			<li><span class="num">01</span> 라운지(방문자센터)</li>
			<li><span class="num">02</span> 입주기업사무실(독립)</li>
			<li><span class="num">03</span> 입주기업사무실(공유)</li>
			<li><span class="num">04</span> 대회의실</li>
			<li><span class="num">05</span> 소회의실</li>
			<li><span class="num">06</span> 비즈니스 센터</li>
		</ul>
	</div>
</div>


<h4 class="tit_dot mb20">시설소개</h4>
<div class="photo_slider mb">
	<ul class="space_slider slide01">
		<li><img src="<c:url value='/img/space_photo01.jpg'/>" alt="경남관광기업지원센터 로비사진"/> <span>로비전경</span></li>
		<li><img src="<c:url value='/img/space_photo02.jpg'/>" alt="경남관광기업지원센터 로비사진2"/><span>로비전경</span></li>
		<li><img src="<c:url value='/img/space_photo03.jpg'/>" alt="경남관광기업지원센터 로비사진3"/><span>로비전경</span></li>
		<li><img src="<c:url value='/img/space_photo04.jpg'/>" alt="경남관광기업지원센터 비즈니스센터"/><span>비즈니스센터</span></li>
		<li><img src="<c:url value='/img/space_photo05.jpg'/>" alt="경남관광기업지원센터 복도사진"/><span>복도전경</span></li>
		<li><img src="<c:url value='/img/space_photo06.jpg'/>" alt="경남관광기업지원센터 복도사진"/><span>복도전경</span></li>
		<li><img src="<c:url value='/img/space_photo07.jpg'/>" alt="경남관광기업지원센터 입주기업사무실(공유)"/><span>입주기업사무실(공유)</span></li>
		<li><img src="<c:url value='/img/space_photo08.jpg'/>" alt="경남관광기업지원센터 입주기업사무실(독립)"/><span>입주기업사무실(독립)</span></li>
		<li><img src="<c:url value='/img/space_photo09.jpg'/>" alt="경남관광기업지원센터 소회의실"/><span>소회의실</span></li>
		<li><img src="<c:url value='/img/space_photo10.jpg'/>" alt="경남관광기업지원센터 대회의실"/><span>대회의실</span></li>
	</ul>
	<ul class="slider_nav nav01">
		<li><img src="<c:url value='/img/space_photo01.jpg'/>" alt="경남관광기업지원센터 로비사진"/></li>
		<li><img src="<c:url value='/img/space_photo02.jpg'/>" alt="경남관광기업지원센터 로비사진2"/></li>
		<li><img src="<c:url value='/img/space_photo03.jpg'/>" alt="경남관광기업지원센터 로비사진3"/></li>
		<li><img src="<c:url value='/img/space_photo04.jpg'/>" alt="경남관광기업지원센터 비즈니스센터"/></li>
		<li><img src="<c:url value='/img/space_photo05.jpg'/>" alt="경남관광기업지원센터 복도사진"/></li>
		<li><img src="<c:url value='/img/space_photo06.jpg'/>" alt="경남관광기업지원센터 복도사진"/></li>
		<li><img src="<c:url value='/img/space_photo07.jpg'/>" alt="경남관광기업지원센터 입주기업사무실(공유)"/></li>
		<li><img src="<c:url value='/img/space_photo08.jpg'/>" alt="경남관광기업지원센터 입주기업사무실(독립)"/></li>
		<li><img src="<c:url value='/img/space_photo09.jpg'/>" alt="경남관광기업지원센터 소회의실"/></li>
		<li><img src="<c:url value='/img/space_photo10.jpg'/>" alt="경남관광기업지원센터 대회의실"/></li>
	</ul>

</div>
<script>
	 $('.space_slider').slick({
		  slidesToShow: 1,
		  slidesToScroll: 1,
		  autoplay:true,
		  arrows: true,
		  fade: true,
		  asNavFor: '.slider_nav'
		});
		$('.slider_nav').slick({
		  slidesToShow: 4,
		  slidesToScroll: 1,
		  asNavFor: '.space_slider',
		  dots: false,
		  arrows:false,
		  focusOnSelect: true
		});						
</script>
<div class="space_view mb">
	<ul>
		<li>
			<img src="<c:url value='/img/space01.jpg'/>" alt="라운지(방문자센터)" />
			<dl>
				<dt><span class="num">01</span>라운지(방문자센터)</dt>
				<dd>센터 방문객 휴식 및 관광기업 간 네트워킹</dd>
				<dd>관광사업체 홍보 자료관</dd>
				<dd>센터 소개 및 경남관광 안내</dd>
			</dl>
		</li>
		<li>
			<img src="<c:url value='/img/space02.jpg'/>" alt="입주기업 사무실" />
			<dl>
				<dt><span class="num">02</span>입주기업 사무실(독립공간)</dt>
				<dd>시설규모 : 2~3인실(2실), 4~6인실(7실)</dd>
				<dd>모집공모를 통해 선정된 관광분야 스타트업 기업 입주공간</dd>
				<dd>사무용 가구, 인터넷 등 제공</dd>
			</dl>
		</li>
		<li>
			<img src="<c:url value='/img/space03.jpg'/>" alt="입주기업 사무실(공유오피스)" />
			<dl>
				<dt><span class="num">03</span>입주기업 사무실(공유오피스)</dt>
				<dd>시설규모 : 오피스(12석)</dd>
				<dd>모집공모를 통해 선정된 관광분야 스타트업 기업 입주공간</dd>
				<dd>사무용 가구, 인터넷 등 제공</dd>
			</dl>
		</li>
		<li>
			<img src="<c:url value='/img/space04.jpg'/>" alt="회의실" />
			<dl>
				<dt><span class="num">04</span>회의실</dt>
				<dd>대회의실(1실)</dd>
				<dd>소회의실(6실)</dd>
			</dl>
		</li>
		<li>
			<img src="<c:url value='/img/space05.jpg'/>" alt="비즈니스센터" />
			<dl>
				<dt><span class="num">05</span>비즈니스센터</dt>
				<dd>관광기업 간 정보 교류, 공동작업 공간</dd>
				<dd>입주기업이 공용으로 사용 가능한 물품 구비(정수기, 냉장고, 전자레인지 등)</dd>
			</dl>
		</li>
		
	</ul>
</div>


			</div><!--con-->
		</div><!--subcon-->
	</div><!--subwrap-->





	<%@ include file="/WEB-INF/jsp/egovframework/gntbsc/inc/footer.jsp" %>