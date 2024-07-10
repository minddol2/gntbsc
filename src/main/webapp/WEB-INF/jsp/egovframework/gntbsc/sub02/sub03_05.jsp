<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
String lang_mode = (String) request.getAttribute("lang_temp");

String is_main = "";
int m1 = 2;
int m2 = 3;
int m3 = 5;
%>

<jsp:include page="/WEB-INF/jsp/egovframework/gntbsc/inc/top.jsp" flush="true" >
	<jsp:param name="is_main" value="<%=is_main%>"/>
</jsp:include>

<jsp:include page="/WEB-INF/jsp/egovframework/gntbsc/inc/sub_top.jsp" flush="true" >
		<jsp:param name="m1" value="<%=m1%>"/>
		<jsp:param name="m2" value="<%=m2%>"/>
		<jsp:param name="m3" value="<%=m3%>"/>
</jsp:include>


<jsp:include page="/WEB-INF/jsp/egovframework/gntbsc/sub02/tablist.jsp" flush="true" >
		<jsp:param name="m1" value="<%=m1%>"/>
		<jsp:param name="m2" value="<%=m2%>"/>
		<jsp:param name="m3" value="<%=m3%>"/>
</jsp:include>

<h4 class="tit_dot mb20">경남관광기업지원센터 운영 및 홍보강화</h4>

<table class="comm_table mb bdbt">
	<colgroup>
		<col width="20%"/>
		<col width="*"/>
	</colgroup>
	<tbody>
		<tr>
			<th class="bgc">인스타그램</th>
			<td><a href="https://www.instagram.com/gyeongnam_tourbiz/" target="_blank">https://www.instagram.com/gyeongnam_tourbiz/</a></td>
		</tr>
		<tr>
			<th class="bgc">블로그</th>
			<td class="tal">
				<a href="https://blog.naver.com/gyeongnam_tourbiz" target="_blank">https://blog.naver.com/gyeongnam_tourbiz</a>
			</td>
		</tr>
		<tr>
			<th class="bgc">유튜브</th>
			<td class="tal">
				<a href="https://www.youtube.com/@gntourbiz" target="_blank">https://www.youtube.com/@gntourbiz</a>
			</td>
		</tr>
	</tbody>
</table>













			</div><!--con-->
		</div><!--subcon-->
	</div><!--subwrap-->





<%@ include file="/WEB-INF/jsp/egovframework/gntbsc/inc/footer.jsp" %>