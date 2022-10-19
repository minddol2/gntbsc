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
	    	url:"<c:url value='/rent/refuse_myrent.do'/>",
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
	<c:forEach var="result" items="${rent_list}" varStatus="status">
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
		<span class="tit">[<c:out value="${result.datexx}"/>] <c:out value="${result.name}"/> 대관신청</span> 
		<span class="date">신청일:
			<fmt:parseDate var="dateString" value="${result.reg_date}" pattern="yyyy-MM-dd" />
			<fmt:formatDate value="${dateString}" pattern="yy-MM-dd" /> 
		</span>
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
						<span>09:00~09:30&nbsp;</span>
					</c:if>
					<c:if test = "${fn:contains(timestr, '0930')}">
						<span>09:30~10:00&nbsp;</span>
					</c:if>
					<c:if test = "${fn:contains(timestr, '1000')}">
						<span>10:00~10:30&nbsp;</span>
					</c:if>
					<c:if test = "${fn:contains(timestr, '1030')}">
						<span>10:30~11:00&nbsp;</span>
					</c:if>
				
					<c:if test = "${fn:contains(timestr, '1100')}">
						<span>11:00~11:30&nbsp;</span>
					</c:if>
					<c:if test = "${fn:contains(timestr, '1130')}">
						<span>11:30~12:00&nbsp;</span>
					</c:if>
				
					<c:if test = "${fn:contains(timestr, '1200')}">
						<span>12:00~12:30&nbsp;</span>
					</c:if>
					<c:if test = "${fn:contains(timestr, '1230')}">
						<span>12:30~13:00&nbsp;</span>
					</c:if>
				
					<c:if test = "${fn:contains(timestr, '1300')}">
						<span>13:00~13:30&nbsp;</span>
					</c:if>
					<c:if test = "${fn:contains(timestr, '1330')}">
						<span>13:30~14:00&nbsp;</span>
					</c:if>
				
					<c:if test = "${fn:contains(timestr, '1400')}">
						<span>14:00~14:30&nbsp;</span>
					</c:if>
					<c:if test = "${fn:contains(timestr, '1430')}">
						<span>14:30~15:00&nbsp;</span>
					</c:if>
				
					<c:if test = "${fn:contains(timestr, '1500')}">
						<span>15:00~15:30&nbsp;</span>
					</c:if>
					<c:if test = "${fn:contains(timestr, '1530')}">
						<span>15:30~16:00&nbsp;</span>
					</c:if>
				
					<c:if test = "${fn:contains(timestr, '1600')}">
						<span>16:00~16:30&nbsp;</span>
					</c:if>
					<c:if test = "${fn:contains(timestr, '1630')}">
						<span>16:30~17:00&nbsp;</span>
					</c:if>
				
					<c:if test = "${fn:contains(timestr, '1700')}">
						<span>17:00~17:30&nbsp;</span>
					</c:if>
					<c:if test = "${fn:contains(timestr, '1730')}">
						<span>17:30~18:00&nbsp;</span>
					</c:if>
				</td>
			</tr>
			<tr>
				<th scope="row">대관장소</th>
				<td>
					<c:choose>
						<c:when test="${result.room_id1 eq 's1'}">
							소회의실1
						</c:when>
						<c:when test="${result.room_id1 eq 's2'}">
							소회의실2
						</c:when>
						<c:when test="${result.room_id1 eq 's3'}">
							소회의실3
						</c:when>
						<c:when test="${result.room_id1 eq 's4'}">
							소회의실4
						</c:when>
						<c:when test="${result.room_id1 eq 's5'}">
							소회의실5
						</c:when>
						<c:when test="${result.room_id1 eq 's6'}">
							소회의실6
						</c:when>
						<c:when test="${result.room_id1 eq 's7'}">
							대회의실
						</c:when>
					</c:choose>
			
					<c:if test="${'' ne result.room_id2}">,&nbsp;
						<c:choose>
							<c:when test="${result.room_id2 eq 's1'}">
								소회의실1
							</c:when>
							<c:when test="${result.room_id2 eq 's2'}">
								소회의실2
							</c:when>
							<c:when test="${result.room_id2 eq 's3'}">
								소회의실3
							</c:when>
							<c:when test="${result.room_id2 eq 's4'}">
								소회의실4
							</c:when>
							<c:when test="${result.room_id2 eq 's5'}">
								소회의실5
							</c:when>
							<c:when test="${result.room_id2 eq 's6'}">
								소회의실6
							</c:when>
							<c:when test="${result.room_id2 eq 's7'}">
								대회의실
							</c:when>
						</c:choose>
					</c:if>
			
					<c:if test="${'' ne result.room_id3}">,&nbsp;
						<c:choose>
							<c:when test="${result.room_id3 eq 's1'}">
								소회의실1
							</c:when>
							<c:when test="${result.room_id3 eq 's2'}">
								소회의실2
							</c:when>
							<c:when test="${result.room_id3 eq 's3'}">
								소회의실3
							</c:when>
							<c:when test="${result.room_id3 eq 's4'}">
								소회의실4
							</c:when>
							<c:when test="${result.room_id3 eq 's5'}">
								소회의실5
							</c:when>
							<c:when test="${result.room_id3 eq 's6'}">
								소회의실6
							</c:when>
							<c:when test="${result.room_id3 eq 's7'}">
								대회의실
							</c:when>
						</c:choose>
					</c:if>
				</td>
			</tr>
			<tr>
				<th scope="row">업체명</th>
				<td><c:out value="${result.company}"/></td>
			</tr>
			<tr>
				<th scope="row">예약인원</th>
				<td><c:out value="${result.people_cnt}"/></td>
			</tr>
			<tr>
				<th scope="row">사용목적</th>
				<td><c:out value="${result.content1}"/></td>
			</tr>
			<tr>
				<th scope="row">필요기자재</th>
				<td><c:out value="${result.content2}"/></td>
			</tr>
			<tr>
				<th scope="row">문의사항</th>
				<td><c:out value="${result.etc}"/></td>
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