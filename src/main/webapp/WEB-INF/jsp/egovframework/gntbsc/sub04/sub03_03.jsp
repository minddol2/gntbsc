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


<div class="pointbox mb">
	<ul class="dot_li">
		<li>사전승인 가능시간 : <span class="ppTxt fwb">월~금, 9:00 ~ 18:00 /온라인 승인은 전일까지 가능</span></li>
		<li><span class="ppTxt fwb">사전예약 취소는 전 일까지 가능</span>합니다.</li>
	</ul>
</div>


<h4 class="tit_dot mb20">대관 신청결과</h4>
<div class="responsive-tabs acdForm bmb">
	<h5><span class="prs no">반려</span><span class="tit">[2021-01-20] 홍길동 대관신청</span> <span class="date">신청일: 21-01-16</span></h5>
	<div class="acdCon">		
		<table class="comm_table mb">
			<tr>
				<th scope="row">예약자명</th>
				<td>홍길동</td>
			</tr>
			<tr>
				<th scope="row">예약일</th>
				<td class="fwb ppTxt">21.01.27</td>
			</tr>
			<tr>
				<th scope="row">예약시간</th>
				<td>09:00, 09:30, 10:00, 10:30, 11:00</td>
			</tr>
			<tr>
				<th scope="row">대관장소</th>
				<td>소회의실1, 소회의실2</td>
			</tr>
			<tr>
				<th scope="row">업체명</th>
				<td>크리에이티브마루</td>
			</tr>
			<tr>
				<th scope="row">예약인원</th>
				<td>10</td>
			</tr>
			<tr>
				<th scope="row">사용목적</th>
				<td>업체미팅 및 회의진행</td>
			</tr>
			<tr>
				<th scope="row">필요기자재</th>
				<td>-</td>
			</tr>
			<tr>
				<th scope="row">문의사항</th>
				<td>-</td>
			</tr>
			<tr>
				<th scope="row">신청현황</th>
				<td><span class="redTxt fwb">[반려] ooooo의 사유로 반려되었습니다.</span></td>
			</tr>

		</table>
		<ul class="ok_btn">
			<li><button type="button" onclick="" class="btn_sumit">신청취소</button></li>		
		</ul>
	</div>

	<h5><span class="prs">검토중</span><span class="tit">[2021-01-20] 홍길동 대관신청</span> <span class="date">신청일: 21-01-16</span></h5>
	<div class="acdCon">		
		<table class="comm_table mb">
			<tr>
				<th scope="row">예약자명</th>
				<td>홍길동</td>
			</tr>
			<tr>
				<th scope="row">예약일</th>
				<td class="fwb ppTxt">21.01.27</td>
			</tr>
			<tr>
				<th scope="row">예약시간</th>
				<td>09:00, 09:30, 10:00, 10:30, 11:00</td>
			</tr>
			<tr>
				<th scope="row">대관장소</th>
				<td>소회의실1, 소회의실2</td>
			</tr>
			<tr>
				<th scope="row">업체명</th>
				<td>크리에이티브마루</td>
			</tr>
			<tr>
				<th scope="row">예약인원</th>
				<td>10</td>
			</tr>
			<tr>
				<th scope="row">사용목적</th>
				<td>업체미팅 및 회의진행</td>
			</tr>
			<tr>
				<th scope="row">필요기자재</th>
				<td>-</td>
			</tr>
			<tr>
				<th scope="row">문의사항</th>
				<td>-</td>
			</tr>
			<tr>
				<th scope="row">신청현황</th>
				<td><span class="ppTxt fwb">[검토중]  대관을 검토중입니다.</span></td>
			</tr>

		</table>
		<ul class="ok_btn">
			<li><button type="button" onclick="" class="btn_sumit">신청취소</button></li>		
		</ul>
	</div>

	<h5><span class="prs ok">승인</span><span class="tit">[2021-01-20] 홍길동 대관신청</span> <span class="date">신청일: 21-01-16</span></h5>
	<div class="acdCon">		
		<table class="comm_table mb">
			<tr>
				<th scope="row">예약자명</th>
				<td>홍길동</td>
			</tr>
			<tr>
				<th scope="row">예약일</th>
				<td class="fwb ppTxt">21.01.27</td>
			</tr>
			<tr>
				<th scope="row">예약시간</th>
				<td>09:00, 09:30, 10:00, 10:30, 11:00</td>
			</tr>
			<tr>
				<th scope="row">대관장소</th>
				<td>소회의실1, 소회의실2</td>
			</tr>
			<tr>
				<th scope="row">업체명</th>
				<td>크리에이티브마루</td>
			</tr>
			<tr>
				<th scope="row">예약인원</th>
				<td>10</td>
			</tr>
			<tr>
				<th scope="row">사용목적</th>
				<td>업체미팅 및 회의진행</td>
			</tr>
			<tr>
				<th scope="row">필요기자재</th>
				<td>-</td>
			</tr>
			<tr>
				<th scope="row">문의사항</th>
				<td>-</td>
			</tr>
			<tr>
				<th scope="row">신청현황</th>
				<td><span class="ppTxt fwb">[승인]  대관이 승인되었습니다.</span></td>
			</tr>

		</table>
		<ul class="ok_btn">
			<li><button type="button" onclick="" class="btn_sumit">신청취소</button></li>		
		</ul>
	</div>

	<h5><span class="prs end">완료</span><span class="tit">[2021-01-17] 홍길동 대관신청</span> <span class="date">신청일: 21-01-16</span></h5>
	<div class="acdCon">		
		<table class="comm_table mb">
			<tr>
				<th scope="row">예약자명</th>
				<td>홍길동</td>
			</tr>
			<tr>
				<th scope="row">예약일</th>
				<td class="fwb ppTxt">21.01.27</td>
			</tr>
			<tr>
				<th scope="row">예약시간</th>
				<td>09:00, 09:30, 10:00, 10:30, 11:00</td>
			</tr>
			<tr>
				<th scope="row">대관장소</th>
				<td>소회의실1, 소회의실2</td>
			</tr>
			<tr>
				<th scope="row">업체명</th>
				<td>크리에이티브마루</td>
			</tr>
			<tr>
				<th scope="row">예약인원</th>
				<td>10</td>
			</tr>
			<tr>
				<th scope="row">사용목적</th>
				<td>업체미팅 및 회의진행</td>
			</tr>
			<tr>
				<th scope="row">필요기자재</th>
				<td>-</td>
			</tr>
			<tr>
				<th scope="row">문의사항</th>
				<td>-</td>
			</tr>
			<tr>
				<th scope="row">신청현황</th>
				<td><span class="ppTxt fwb">[완료]</span></td>
			</tr>

		</table>
		<ul class="ok_btn">
			<li><button type="button" onclick="" class="btn_sumit">신청취소</button></li>		
		</ul>
	</div>
</div>


			</div><!--con-->
		</div><!--subcon-->
	</div><!--subwrap-->





<%@ include file="/WEB-INF/jsp/egovframework/gntbsc/inc/footer.jsp" %>