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

<div class="mapbox">
    <div class="address_info">
      <h4>경남관광기업지원센터</h4>
      <p>경남 창원시 성산구 충혼로 91(창원문성대학교 경상관 1층)</p>
		  <!--<ul class="dot_li">
			<li><b>대표전화</b> 055-000-0000</li>
		  </ul>-->
    </div>
	<div id="daumRoughmapContainer1625105193352" class="root_daum_roughmap root_daum_roughmap_landing"></div>
</div>

<script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>







<!-- 3. 실행 스크립트 -->
<script charset="UTF-8">
	new daum.roughmap.Lander({
		"timestamp" : "1625105193352",
		"key" : "26g3g",
		"mapWidth" : "640",
		"mapHeight" : "450"
	}).render();
</script>
<table class="comm_table bmb">
	<tbody>
		<tr>
			<th>자가용 이용시</th>
			<td>
				(네비게이션) 경남 창원시 성산구 충혼로 91(창원문성대학교 경상관 1층) 또는 경남관광기업지원센터 검색 
			</td>
		</tr>
		<tr>
			<th>버스이용시</th>
			<td>
				<h5 class="fwb mb5">문성고등학교 정류장</h5>
				<ul>
					<li class="mb10"><span class="bgtxt bgbl">간선버스</span> 102,103,109,113,155,155-1</li>
					<li class="mb10"><span class="bgtxt bgorg">좌석버스 </span> 703,710,751,757</li>
					<li class="mb10"><span class="bgtxt bggr">지선버스 </span> 17,212,220,506</li>
				</ul>
				<h5 class="fwb mb5">문성대학교 정류장</h5>
				<ul>
					<li class="mb10"><span class="bgtxt bgbl">간선버스</span> 101,111,116 </li>
					<li class="mb10"><span class="bgtxt bgorg">좌석버스 </span> 704,59,59A</li>
					<li class="mb10"><span class="bgtxt bggr">지선버스 </span> 213,216,502</li>
				</ul>
			</td>
		</tr>
	</tbody>
</table>



			</div><!--con-->
		</div><!--subcon-->
	</div><!--subwrap-->





<%@ include file="/WEB-INF/jsp/egovframework/gntbsc/inc/footer.jsp" %>