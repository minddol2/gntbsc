<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
String lang_mode = (String) request.getAttribute("lang_temp");

String is_main = "";
int m1 = 3;
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

<form name="frm" method="post" action="">
<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>">
<input type="hidden" name="bbsId" value="<c:out value='${result.bbsId}'/>" >
<input type="hidden" name="nttId" value="<c:out value='${result.nttId}'/>" >
<input type="hidden" name="parnts" value="<c:out value='${result.parnts}'/>" >
<input type="hidden" name="sortOrdr" value="<c:out value='${result.sortOrdr}'/>" >
<input type="hidden" name="replyLc" value="<c:out value='${result.replyLc}'/>" >
<input type="hidden" name="nttSj" value="<c:out value='${result.nttSj}'/>" >

<div class="center_view">
	<div class="tar">
		<a href="<c:url value='/'/>sub03/sub01_01.do" class="btn_list">목록보기</a>
	</div>

	<div class="com_introduce">
	
		<div class="photo_logo">
			<c:choose>
				<c:when test="${empty result.atchFileId}">
					<img src="<c:url value='/img/business_logo03.jpg'/>" alt="" />
				</c:when>
				<c:otherwise>
					<!-- 첨부파일 5개열어주세효.. 리스트이미지는 현재 이미지 유지/ 뷰페이지에서는 새로운 첨부파일 5개추가-->
					<ul class="slider"> 
						<c:forEach var="fileVO" items="${file_result}" varStatus="status">
						<c:if test="${fileVO.fileSn gt 0}">
						<li><img src="<c:url value='/cmm/fms/getImage.do?fileSn=${fileVO.fileSn}&atchFileId=${fileVO.atchFileId}'/>" style="max-height:362px;" alt="<c:out value='${result.nttSj}' />" /></li>
						</c:if>
						</c:forEach>
					</ul>
					<ul class="slider-nav">
						<c:forEach var="fileVO2" items="${file_result}" varStatus="status">
						<c:if test="${fileVO2.fileSn gt 0}">
						<li><img src="<c:url value='/cmm/fms/getImage.do?fileSn=${fileVO2.fileSn}&atchFileId=${fileVO2.atchFileId}'/>" alt="<c:out value='${result.nttSj}' />" /></li>
						</c:if>
						</c:forEach>
					</ul>
					<!-- 첨부파일 5개열어주세효..-->
				</c:otherwise>
			</c:choose>
		</div>	
			<script>
				 $('.slider').slick({
				  slidesToShow: 1,
				  slidesToScroll: 1,
				  autoplay:true,
				  arrows: true,
				  fade: true,
				  asNavFor: '.slider-nav'
				});
				$('.slider-nav').slick({
				  slidesToShow: 4,
				  slidesToScroll: 1,
				  asNavFor: '.slider',
				  dots: false,
				  arrows:false,
				  focusOnSelect: true
				});
			</script>
		
		<div class="introduce_txt">
			<div class="introduce_tit">
				<h4>
					<c:choose>
						<c:when test="${result.category eq 1}">
							<span class="cate cate01">예비관광 스타트업</span>
						</c:when>
						<c:when test="${result.category eq 2}">
							<span class="cate cate02">지역혁신 스타트업</span>
						</c:when>
						<c:when test="${result.category eq 3}">
							<span class="cate cate03">지역상생 스타트업</span>
						</c:when>
						<c:otherwise>
							<span class="cate cate04">비상주 협력기업</span>
						</c:otherwise>
					</c:choose>
					<span class="tit"><c:out value="${result.nttSj}" /></span>
				</h4>
				<p class="tag"><c:out value="${result.ssWords}" /></p>		
				<!-- 기업소개-- <div class="txt mb"><c:out value="${result.nttCn}" escapeXml="false" /></div>		-->
			</div>	
			<table class="comm_table mb20">
				<colgroup>
					<col width="20%">
					<col width="*">
				</colgroup>
				<tbody>
					<tr>
						<th class="bgc">대표자</th>
						<td><c:out value="${result.ceoName}" /></td>
					</tr>
					<tr>
						<th class="bgc">연락처</th>
						<td><c:out value="${result.telnum}" /></td>
					</tr>
					<tr>
						<th class="bgc">이메일</th>
						<td><c:out value="${result.email}" /></td>
					</tr>
					<tr>
						<th class="bgc">홈페이지</th>
						<td>
							<c:choose>
								<c:when test="${empty result.homepage}">
									-
								</c:when>
								<c:otherwise>
									<a href="<c:out value="${result.homepage}" />" class="ic_blank" target="_blank" title="새창으로이동합니다."><c:out value="${result.homepage}" /></a>
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
					<tr>
						<th class="bgc">SNS</th>
						<td><c:out value="${result.snslink}" /></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>

	<div class="com_introduce_bottom mb">
		<h5 class="tit_dot mb20">기업소개</h5>
		<div class="txt mb"><c:out value="${result.nttCn}" escapeXml="false" /></div>		
		<h5 class="tit_dot mb20">상세소개</h5>
		<div class="txt"><c:out value="${result.nttAd}" escapeXml="false" /></div>	
	</div>
	<div class="com_btn_list bmb">
	<a href="<c:url value='/'/>sub03/sub01_01.do" class="btn_list">목록보기</a>
	</div>

</div>

</form>

			</div><!--con-->
		</div><!--subcon-->
	</div><!--subwrap-->





<%@ include file="/WEB-INF/jsp/egovframework/gntbsc/inc/footer.jsp" %>