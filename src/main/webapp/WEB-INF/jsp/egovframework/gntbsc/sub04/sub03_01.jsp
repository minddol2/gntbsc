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

<div class="typebox mb">
	<ul class="tabs list02">				
		<li class="current"><a href="<c:url value='/sub04/sub03_01.do'/>"> 대관신청안내</a></li>
		<li><a href="<c:url value='/member/mypage.do'/>">대관신청확인</a></li>
	</ul>
</div>

<h4 class="tit_dot mb20">대관 신청방법</h4>
<div class="counsel_process rent_process mb">
	<ul class="list03">
		<li><img src="<c:url value='/img/ic_rent_pro01.png'/>" alt="대관신청" /> <span>대관신청</span></li>
		<li><img src="<c:url value='/img/ic_rent_pro02.png'/>" alt="대관승인" /> <span>대관승인</span></li>
		<li><img src="<c:url value='/img/ic_rent_pro03.png'/>" alt="SMS통보" /> <span>SMS통보</span></li>
	</ul>
</div>

<h4 class="tit_dot mb20">대관문의 및 신청</h4>
<div class="time_info ofh mb">
	<div class="time">
		<dl class="time01">
			<dt>운영시간</dt>
			<dd>예약 09:00 ~ 18:00 (평일) </dd>
			<dd>전화 09:00 ~ 18:00 (평일) </dd>
			<dd class="fss">※18시 이후 사용이 필요하신 분들은 유선으로 문의 부탁드립니다.</dd>
		</dl>
	</div>
	<div class="time">
		<dl class="time02">
			<dt>문의</dt>
			<!--dd>경남관광기업지원센터 055-277-8413 김민주 매니저</dd-->
			<dd>담당자 이승철 Tel. 055-277-8417</dd>
		</dl>
	</div>	
</div>

<h4 class="tit_dot mb20">사전승인필수안내</h4>
<div class="pointbox mb">
	<ul class="dot_li">
		<li>사전승인 가능시간 : 월~금, 9:00 ~ 18:00 <span class="ppTxt fwb">(최소 3일 전 예약 필수)</span></li>
		<li>당일대관 예약은 온라인 예약 후 <span class="ppTxt fwb">055-277-8417로 확인전화</span> 부탁드립니다.</li>
	</ul>
</div>

<h4 class="tit_dot mb20">대관시설안내</h4>
<div class="photo_list mb20 slick-dots">
	<div class="box">
		<span>소회의실 1,2,4,5</span>
		<img src="<c:url value='/img/space_info_01.jpg'/>" alt="소회의실 1,2,4,5의 사진" />
	</div>
	<div class="box">
		<span>소회의실 3,6</span>
		<img src="<c:url value='/img/space_info_02.jpg'/>" alt="소회의실 3,6의 사진" />
	</div>
	<div class="box">
		<span>대회의실 </span>
		<img src="<c:url value='/img/space_info_03.jpg'/>" alt="대회의실 사진" />
	</div>
</div>



<script>
$('.photo_list').slick({
		infinite: true,
		arrows:true,
		dots:true,
		fade:false,
		autoplay: true,
		autoplaySpeed: 2500,
		slidesToShow: 3,
        slidesToScroll: 1,
		responsive: [
 
   
    {
      breakpoint: 768,
      settings: {
        slidesToShow: 1,
        slidesToScroll: 1,
      }
    }
	]
});
</script>

<table class="comm_table bd_table tac mb">
	<caption>대관가능한 회의실 안내표입니다.</caption>	
	
	<thead>
		<tr>
			<th scope="col">구분</th>
			<th scope="col">대관장소</th>
			<th scope="col">인원</th>
			<th scope="col">사용가능기자재</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td class="bgc tac" rowspan="2">소회의실</td>
			<td>소회의실 1,2,4,5</td>
			<td>6명</td>
			<td class="tal">
				-
			</td>
		</tr>
		<tr>
			<td>소회의실 3,6</td>
			<td>6명</td>
			<td class="tal">
				<ul class="dot_li">
					<li>TV </li>
				</ul>
				<p><span class="ppTxt">※노트북 개인지참</span></p>
			</td>
		</tr>
		<tr>
			<td class="bgc tac">대회의실</td>
			<td>대회의실</td>
			<td>50명</td>
			<td class="tal">
				<ul class="dot_li">
					<li>빔 프로젝터</li>
					<li>스크린</li>
					<li>무선 마이크(2)</li>
					<li>유선 마이크(1)</li>
				</ul>
				<p><span class="ppTxt">※노트북 개인지참</span></p>
			</td>
		</tr>
		
	</tbody>
</table>



<h4 class="tit_dot mb20">유의사항</h4>
<div class="pointbox mb">
	<ul class="dot_li">
		<li>인원수에 맞는 회의실 사용을 권고 드립니다.</li>
		<li>회의실 내 음식물 반입 및 취식은 금지되어 있습니다.</li>
		<li>회의실 사용 후 뒷정리 및 기본가구 세팅 원상복구 부탁드립니다.</li>
		<li><span class="ppTxt fwb">소회의실을 확장하여 사용을 원하시는 경우, 최대 3개까지 확장 사용 가능하며, 해당 회의실을 모두 예약</span>하셔야 합니다. (소회의실 1+2+3 / 소회의실 4+5+6 으로만 선택가능 )</li>
	</ul>
</div>

<div class="tac mb">
<a href="<c:url value='/sub04/rental.do'/>" class="btn_rd btn_big">회의실 대관신청</a>
<!--<a href="#" class="btn_rd btn_big">센터내부사정으로 <span class="mEnter">회의실 대관신청이 불가합니다.</span></a>-->
</div>


			</div><!--con-->
		</div><!--subcon-->
	</div><!--subwrap-->





<%@ include file="/WEB-INF/jsp/egovframework/gntbsc/inc/footer.jsp" %>