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
int m3 = 2;
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
		<li><a href="#">대관신청안내</a></li>
		<li class="current"><a href="#">대관신청확인</a></li>
	</ul>
</div>


<h4 class="tit_dot mb20">대관 신청확인</h4>


<div class="chek_reservation mb">	
	<div class="chek_reser">
		<ul class="mb">
			<li><label for="">예약자명</label> <input id="" name="" type="text" class="input_txt inbox" placeholder="예약자명" title="" value=""/></li>
			<li><label for="">휴대전화</label> <input id="" name="" type="text" class="input_txt inbox" placeholder="휴대전화" title="" value="" onfocus="autoHypenPhone(this);" onkeyup="autoHypenPhone(this);"/></li>
			<li><label for="">예약일</label> <div class="inbox"><input id="" name="" type="text" class="input_txt" placeholder="예약일" title="" value=""/><button class="btn_cal">예약일선택</button></div></li>
		</ul>		
		<button type="submit" class="btn_chek">신청확인</button>
	</div>
</div>

<div class="pointbox mb">
	<ul class="dot_li">
		<li>사전승인 가능시간 : <span class="ppTxt fwb">월~금, 9:00 ~ 18:00 /온라인 승인은 전일까지 가능</span></li>
		<li><span class="ppTxt fwb">사전예약 취소는 전 일까지 가능</span>합니다.</li>
	</ul>
</div>


			</div><!--con-->
		</div><!--subcon-->
	</div><!--subwrap-->





<%@ include file="/WEB-INF/jsp/egovframework/gntbsc/inc/footer.jsp" %>