<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
String lang_mode = (String) request.getAttribute("lang_temp");

String is_main = "";
int m1 = 11;
int m2 = 4;
int m3 = 3;
%>

<jsp:include page="/WEB-INF/jsp/egovframework/gntbsc/inc/top.jsp" flush="true" >
	<jsp:param name="is_main" value="<%=is_main%>"/>
</jsp:include>

<jsp:include page="/WEB-INF/jsp/egovframework/gntbsc/inc/sub_top.jsp" flush="true" >
		<jsp:param name="m1" value="<%=m1%>"/>
		<jsp:param name="m2" value="<%=m2%>"/>
		<jsp:param name="m3" value="<%=m3%>"/>
</jsp:include>

<jsp:include page="/WEB-INF/jsp/egovframework/gntbsc/member/tablist.jsp" flush="true" >
		<jsp:param name="m1" value="<%=m1%>"/>
		<jsp:param name="m2" value="<%=m2%>"/>
		<jsp:param name="m3" value="<%=m3%>"/>
</jsp:include>

<script type="text/javascript">
function refuse_myrent(idx) {
	if(idx == "") {
		return false;
	} else {
		$.ajax({
	    	url:"<c:url value='/member/refuse_myjob.do'/>",
	    	data:{ "idx": idx},
	    	dataType:'json',
	    	type:'POST',
	    	success: function(response){
	            //대여디비처리 성공시
	            if(response.result == "Y") {
    			alert("취소신청이 정상 처리되었습니다.");
    			location.reload();
    			
    		} else {
    			alert("저장에 실패했습니다. 다시 시도해 주세요.");
    			return false;
    		}
	        
	        },
	    	error:function(data){
	    		//alert('rent err');   
	   		}
		});
	}
}
</script>

<div class="responsive-tabs acdForm bmb">
	<c:forEach var="result" items="${job_list}" varStatus="status">
	<h5>
		<c:choose>
			<c:when test="${result.status eq 3}">
				<span class="prs no">반려</span>
			</c:when>
			<c:when test="${result.status eq 2}">
				<span class="prs ok">승인</span>
			</c:when>
			<c:otherwise>
				<span class="prs">검토중</span>
			</c:otherwise>
		</c:choose>
		<span class="tit">
			[<c:out value="${result.datexx}"/>] <c:out value="${result.name}"/>
			 <c:choose>
			 	<c:when test="${result.counsel_gbn eq 1}">
					구인
				</c:when>
				<c:otherwise>
					구직
				</c:otherwise>
			 </c:choose>
			상담신청</span> 
		<span class="date">신청일:<c:out value="${result.reg_date}"/></span>
	</h5>
	<div class="acdCon">		
		<table class="comm_table mb">
			<tr>
				<th scope="row">예약자명</th>
				<td><c:out value="${result.name}"/></td>
			</tr>
			<tr>
				<th scope="row">예약일</th>
				<td class="fwb ppTxt">
					<c:out value="${result.datexx}"/>
				</td>
			</tr>
			<tr>
				<th scope="row">예약시간</th>
				<td>
					<c:set var="timestr" value="${result.timexx}"/>
					<c:if test = "${fn:contains(timestr, '0900')}">
						<span>09:00~10:00&nbsp;</span>
					</c:if>
					<c:if test = "${fn:contains(timestr, '1000')}">
						<span>10:00~11:00&nbsp;</span>
					</c:if>
					<c:if test = "${fn:contains(timestr, '1100')}">
						<span>11:00~12:00&nbsp;</span>
					</c:if>
					<c:if test = "${fn:contains(timestr, '1300')}">
						<span>13:00~14:00&nbsp;</span>
					</c:if>
					<c:if test = "${fn:contains(timestr, '1400')}">
						<span>14:00~15:00&nbsp;</span>
					</c:if>
					<c:if test = "${fn:contains(timestr, '1500')}">
						<span>15:00~16:00&nbsp;</span>
					</c:if>
					<c:if test = "${fn:contains(timestr, '1600')}">
						<span>16:00~17:00&nbsp;</span>
					</c:if>
					<c:if test = "${fn:contains(timestr, '1700')}">
						<span>17:00~18:00&nbsp;</span>
					</c:if>
				</td>
			</tr>
			<tr>
				<th scope="row">첨부1</th>
				<td>
					<c:if test="${!empty result.userfile1}">
					<a href="#" class="btn_sumit" onclick="window.open(encodeURI('<c:url value='/download/downloadFile.do?'/>requestedFile=${result.userfile1}&dFileName=${result.userfile1}'))">다운로드</a>
					</c:if>
				</td>
			</tr>
			<tr>
				<th scope="row">첨부2</th>
				<td>
					<c:if test="${!empty result.userfile2}">
					<a href="#" class="btn_sumit" onclick="window.open(encodeURI('<c:url value='/download/downloadFile.do?'/>requestedFile=${result.userfile2}&dFileName=${result.userfile2}'))">다운로드</a>
					</c:if>
				</td>
			</tr>
			<tr>
				<th scope="row">첨부3</th>
				<td>
					<c:if test="${!empty result.userfile3}">
					<a href="#" class="btn_sumit" onclick="window.open(encodeURI('<c:url value='/download/downloadFile.do?'/>requestedFile=${result.userfile3}&dFileName=${result.userfile3}'))">다운로드</a>
					</c:if>
				</td>
			</tr>
			<tr>
				<th scope="row">문의사항</th>
				<td><c:out value="${result.content1}"/></td>
			</tr>
			<tr>
				<th scope="row">신청현황</th>
				<td><span class="redTxt fwb">
					<c:if test="${result.status eq 3}">
					[반려] <c:out value="${result.refuse_txt}"/>
					</c:if>
					</span>
				</td>
			</tr>
			

		</table>
		<c:if test="${result.status ne 3}">
		<ul class="ok_btn">
			<li><button type="button" onclick="refuse_myrent('${result.idx}');" class="btn_sumit">신청취소</button></li>		
		</ul>
		</c:if>
	</div>
	</c:forEach>

</div>



			</div><!--con-->
		</div><!--subcon-->
	</div><!--subwrap-->





<%@ include file="/WEB-INF/jsp/egovframework/gntbsc/inc/footer.jsp" %>