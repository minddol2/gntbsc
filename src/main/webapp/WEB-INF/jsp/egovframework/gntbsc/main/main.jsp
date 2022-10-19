<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
String is_main = "true";
String moible_mode = (String) request.getAttribute("moible_mode");
%>
<jsp:include page="/WEB-INF/jsp/egovframework/gntbsc/inc/top.jsp" flush="true" >
	<jsp:param name="is_main" value="<%=is_main%>"/>
</jsp:include>

<div class="mainvisual">
	<ul class="visualslider">
		<li class="main main01">
			<div class="inner">
				<div class="txt">
				<p>경남의 관광산업은<br/>
				<b>경남관광기업지원센터</b>와 <span>함께 성장합니다.</span></p>
				</div>
			</div>
		</li>
		<li class="main main02">
			<div class="inner">
				<div class="txt">
					<p>경남의 관광산업은<br/>
					<b>경남관광기업지원센터</b>와 <span>함께 성장합니다.</span></p>
				</div>
			</div>
		</li>
	</ul>	
</div>

<script type="text/javascript">
$(document).ready(function(){	
	var resultMsg = '${resultMsg}';
	
	if(resultMsg != "") {
		alert(resultMsg);
	}
	
});

$('.visualslider').slick({
		infinite: true,
		arrows:true,
		dots:false,
		fade:true,
		autoplay: true,
		autoplaySpeed: 2500,
});

function fn_egov_inqire_Notice(nttId, bbsId) {
	 if(bbsId == "") return false; //20150508
	 document.submitParam.nttId.value = nttId;
	 document.submitParam.bbsId.value = bbsId;
	 document.submitParam.action = "<c:url value='/sub05/sub01_view.do'/>";
	 document.submitParam.submit();
}

function fn_egov_inqire_Data(nttId, bbsId) {
	 if(bbsId == "") return false; //20150508
	 document.submitParam.nttId.value = nttId;
	 document.submitParam.bbsId.value = bbsId;
	 document.submitParam.action = "<c:url value='/sub05/sub02_view.do'/>";
	 document.submitParam.submit();
}

function fn_egov_inqire_Comp(nttId, bbsId) {
	 if(bbsId == "") return false; //20150508
	 document.submitParam.nttId.value = nttId;
	 document.submitParam.bbsId.value = bbsId;
	 document.submitParam.action = "<c:url value='/sub03/sub01_01v.do'/>";
	 document.submitParam.submit();
}
</script>

<!--팝업시작-->
<script type="text/javascript">
function layerClosex(id) {
   document.getElementById("layerPopup" + id).style.visibility = "hidden";
}
 
function closeByTodayx(id){
   if (document.getElementById("chkbox" + id).checked == true) {
      setCookiex("layerPopup" + id, "done", 1);
   }
 
   document.getElementById("layerPopup" + id).style.visibility = "hidden";
   document.getElementById("chkbox" + id).checked = false;
}

function setCookiex( name, value, expiredays )
{
	var todayDate = new Date();
	todayDate.setDate( todayDate.getDate() + expiredays );
	document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"
}
function getCookiex( name )
{
	var nameOfCookie = name + "=";
	var x = 0;
	while ( x <= document.cookie.length )
	{
		var y = (x+nameOfCookie.length);
		if ( document.cookie.substring( x, y ) == nameOfCookie ) {
			if ( (endOfCookie=document.cookie.indexOf( ";", y )) == -1 )
				endOfCookie = document.cookie.length;
			return unescape( document.cookie.substring( y, endOfCookie ) );
		}
		x = document.cookie.indexOf( " ", x ) + 1;
		if ( x == 0 )
			break;
	}
	return "";
}
</script>

<c:set var="pop_cnt" value="10" />
<c:forEach var="result" items="${poplist}" varStatus="status">
<% if(moible_mode.equals("true")) { %>
<style type="text/css">
 .layerPopup<c:out value="${pop_cnt}"/> { visibility:hidden; position:absolute; background-color:#FFFFFF; border:1px solid #666666; 
	width:350px; height:350px; color:#676767; left:<c:out value='${result.leftx}'/>px; top:<c:out value='${result.lefty}'/>px;	}	
 .layerPopup<c:out value="${pop_cnt}"/> .whites{color:white}
</style>
<% } else { %>
<style type="text/css">
 .layerPopup<c:out value="${pop_cnt}"/> { visibility:hidden; position:absolute; background-color:#FFFFFF; border:1px solid #666666; 
	width:<c:out value='${result.sizex}'/>px; /*height:<c:out value='${result.sizey}'/>px;*/ color:#676767; left:<c:out value='${result.leftx}'/>px; top:<c:out value='${result.lefty}'/>px;	}	
 .layerPopup<c:out value="${pop_cnt}"/> .whites{color:white}
</style>
<% } %>
<c:set var= "pop_cnt" value="${pop_cnt + 1}"/>
</c:forEach>

<c:set var="pop_cnt" value="10" />
<c:forEach var="result" items="${poplist}" varStatus="status">
	<div id="layerPopup<c:out value='${pop_cnt}'/>" class="layerPopup<c:out value='${pop_cnt}'/> layerpop">
		<div>
			<c:if test="${!empty result.link_url}">
				<c:choose>
					<c:when test="${result.nttCn eq 'Y'}">
						<a href="<c:out value='${result.link_url}'/>" target="_blank">
					</c:when>
					<c:otherwise>
						<a href="<c:out value='${result.link_url}'/>">
		    		</c:otherwise>
				</c:choose>
			</c:if>
			<c:choose>
				<c:when test="${result.fileSn gt 0}">
					<img src="<c:url value='/cmm/fms/getImage.do?fileSn=${result.fileSn}&atchFileId=${result.atchFileId}'/>" alt="" />
				</c:when>
	    		<c:otherwise>
	    			<div>
	    				<c:out value="${fn:replace(result.nttCn,newLineChar,br)}" escapeXml="false" />
	    			</div>
	    		</c:otherwise>
			</c:choose>
			<c:if test="${!empty result.link_url}">
				</a>
			</c:if>

			<div class="layerpop_bottom"><input title="하루동안안보기체크" type="checkbox" name="chkbox<c:out value="${pop_cnt}"/>" id="chkbox<c:out value="${pop_cnt}"/>" onclick="closeByTodayx('<c:out value="${pop_cnt}"/>');">
				<span class="whites">하루 동안 이 창을 열지 않습니다.</span>
				<a href="close#" onClick="layerClosex('<c:out value="${pop_cnt}"/>'); return false;"><span class="whites">닫기</span></a>
			</div>
		</div> 
	</div>
<c:set var= "pop_cnt" value="${pop_cnt + 1}"/>
</c:forEach>
<script type="text/javascript">
	var pop_max = ${pop_cnt};
	var pop_top = Number(0);
	var pop_left = Number(0);

	for (i = 10; i < pop_max; i++){
		file_name = getCookiex("layerPopup"+i);	
        if (file_name != "done") {
            document.getElementById("layerPopup" + i).style.visibility = "visible";
        } else {
            document.getElementById("layerPopup" + i).style.visibility = "hidden";
        }
	}
	
</script>
<!--팝업끝-->


<div class="tabsection">
	<div class="pdinner">
		<div class="popup_zone">
			<h4>popup zone</h4>		
			<ul class="popupbox">
				<c:forEach var="result" items="${popzoneList}" >
				<li>
					<c:if test="${!empty result.link_url}">
					<c:choose>
						<c:when test="${result.nttCn eq 'Y'}">
							<a href="<c:out value='${result.link_url}'/>" target="_blank">
						</c:when>
						<c:otherwise>
							<a href="<c:out value='${result.link_url}'/>">
			    		</c:otherwise>
					</c:choose>
					</c:if>
					<img src="<c:url value='/cmm/fms/getImage.do?fileSn=${result.fileSn}&atchFileId=${result.atchFileId}'/>" alt="<c:out value='${result.nttSj}'/>"/>
					<c:if test="${!empty result.link_url}">
						</a>
					</c:if>
				</li>
				</c:forEach>
			</ul>
			
			<script>
				$('.popupbox').slick({
					infinite: true,
					arrows:false,
					dots:true,
					autoplay: true,
					autoplaySpeed: 4000,
				});									
			</script>

		</div>

		<div class="noticebox" id="tabsholder">
			<ul class="tabs">
				<li id="tab1">공지사항</li>
				<li id="tab2">보도자료</li>
			</ul>     
			<div id="content1" class="tabscontent">
				<a class="btn_clink" href="<c:url value='/'/>sub05/sub01_01.do">more</a>
				<c:if test="${fn:length(noticeList) == 0}">
				<p class="none">등록된 글이 없습니다.</p>		
				</c:if>
				<c:forEach var="result" items="${noticeList}" varStatus="status">
				<dl>
					<a href="#" onclick="fn_egov_inqire_Notice('${result.nttId}', '${result.bbsId }');">
					<dt><span class="date"><c:out value="${fn:substring(result.frstRegisterPnttm,8,10)}"/><b><c:out value="${fn:substring(result.frstRegisterPnttm,2,4)}"/>.<c:out value="${fn:substring(result.frstRegisterPnttm,5,7)}"/></b></span> <span class="tit"><c:out value="${result.nttSj}"/></span></dt>
					<dd><c:out value='${fn:substring(result.nttCn.replaceAll("\\\<.*?\\\>","").replaceAll("&nbsp;",""),0, 30)}' />...</dd>
					</a>
				</dl>
				</c:forEach>
				<ul>
					<c:forEach var="result" items="${noticeList2}" varStatus="status">
					<li><a href="#" onclick="fn_egov_inqire_Notice('${result.nttId}', '${result.bbsId }');"><span class="txt"><c:out value="${result.nttSj}"/></span> <span class="date"><c:out value="${fn:substring(result.frstRegisterPnttm,2,10)}"/></span></a></li>
					</c:forEach>
				</ul>	
			</div>
			<div id="content2" class="tabscontent">
				<a class="btn_clink" href="<c:url value='/'/>sub05/sub02_01.do">more</a>
				<c:if test="${fn:length(dataList) == 0}">
				<p class="none">등록된 글이 없습니다.</p>		
				</c:if>
				<c:forEach var="result3" items="${dataList}" varStatus="status">
				<dl>
					<a href="#" onclick="fn_egov_inqire_Data('${result3.nttId}', '${result3.bbsId }');">
					<dt><span class="date"><c:out value="${fn:substring(result3.frstRegisterPnttm,8,10)}"/><b><c:out value="${fn:substring(result3.frstRegisterPnttm,2,4)}"/>.<c:out value="${fn:substring(result3.frstRegisterPnttm,5,7)}"/></b></span> <span class="tit"><c:out value="${result3.nttSj}"/></span></dt>
					<dd><c:out value='${fn:substring(result3.nttCn.replaceAll("\\\<.*?\\\>","").replaceAll("&nbsp;",""),0, 30)}' />...</dd>
					</a>
				</dl>
				</c:forEach>
				<ul>
					<c:forEach var="result4" items="${dataList2}" varStatus="status">
					<li><a href="#" onclick="fn_egov_inqire_Data('${result4.nttId}', '${result4.bbsId }');"><span class="txt"><c:out value="${result4.nttSj}"/></span> <span class="date"><c:out value="${fn:substring(result4.frstRegisterPnttm,2,10)}"/></span></a></li>
					</c:forEach>
				</ul>	
			</div>
		</div>
			<script> 
				$(document).ready(function(){
					$("#tabsholder").tytabs({
										tabinit:"1",
										fadespeed:"fast"
								});				
					});
			</script> 

	</div>
</div>


<div class="section" id="section01">
	<div class="pdinner">			
		<div class="quick_li">
			<ul>
				<li class="tit"><span>바로가기</span></li>
				<li><a href="<c:url value='/'/>sub01/sub01_01.do"><img src="<c:url value='/img/quick_li01.png'/>" alt="센터소개"/><span>센터소개</span></a></li>
				<li><a href="<c:url value='/'/>sub01/sub02_01.do"><img src="<c:url value='/img/quick_li02.png'/>" alt="시설안내"/><span>시설안내</span></a></li>
				<li><a href="<c:url value='/'/>sub02/sub04_01.do"><img src="<c:url value='/img/quick_li03.png'/>" alt="지원사업"/><span>기업입주안내</span></a></li>
				<li><a href="<c:url value='/'/>sub02/sub03_01.do"><img src="<c:url value='/img/quick_li04.png'/>" alt="운영사업"/><span>운영사업</span></a></li>
				<li><a href="<c:url value='/'/>sub04/sub01_01.do"><img src="<c:url value='/img/quick_li05.png'/>" alt="기업상담신청"/><span>기업상담신청</span></a></li>
				<li><a href="<c:url value='/'/>sub04/sub03_01.do"><img src="<c:url value='/img/quick_li06.png'/>" alt="회의실 대관신청"/><span>회의실 대관신청</span></a></li>
				<li><a href="<c:url value='/'/>sub05/sub03_01.do"><img src="<c:url value='/img/quick_li07.png'/>" alt="FAQ"/><span>FAQ</span></a></li>
				<li><a href="<c:url value='/'/>sub05/sub03_01.do""><img src="<c:url value='/img/quick_li08.png'/>" alt="오시는길"/><span>오시는길</span></a></li>
			</ul>
		</div>
	</div>
</div>


<div class="section" id="section02">
	<div class="section_top">
		<h3 class="section_h mb10">입주기업안내</h3>
		<p>경남관광기업지원센터와 <span class="mEnter">함께하는 기업들을 소개합니다.</span></p>
	</div>
	<div class="pdinner">
		<div class="column_li">
			
		<ul class="column_box">
			<c:forEach var="result9" items="${complist}" varStatus="status">
				<li>
					<a href="#" onclick="fn_egov_inqire_Comp('${result9.nttId}', '${result9.bbsId }');">
						<div class="photo">
							<c:choose>
							<c:when test="${empty result9.atchFileId}">
								<img src="<c:url value='/img/business_logo03.jpg'/>" alt="" />
							</c:when>
							<c:otherwise>
								<img src="<c:url value='/cmm/fms/getImage.do?fileSn=${result9.fileSn}&atchFileId=${result9.atchFileId}'/>" alt="" />
							</c:otherwise>
							</c:choose>
						</div>
						<div class="info">
							<dl>
								<dt><c:out value="${result9.nttSj}"/></dt>
								<dd class="txt"><c:out value='${fn:substring(result9.nttCn.replaceAll("\\\<.*?\\\>",""),0, 40)}' /></dd>
								<dd class="tag"><c:out value="${result9.ssWords}"/></dd>
							</dl>
						</div>
					</a>
				</li>
			</c:forEach>
		</ul>
		<ul class="column_box">
			<c:forEach var="result92" items="${complist2}" varStatus="status">
				<li>
					<a href="#" onclick="fn_egov_inqire_Comp('${result92.nttId}', '${result92.bbsId }');">
						<div class="photo">
							<c:choose>
							<c:when test="${empty result92.atchFileId}">
								<img src="<c:url value='/img/business_logo03.jpg'/>" alt="" />
							</c:when>
							<c:otherwise>
								<img src="<c:url value='/cmm/fms/getImage.do?fileSn=${result92.fileSn}&atchFileId=${result92.atchFileId}'/>" alt="" />
							</c:otherwise>
							</c:choose>
						</div>
						<div class="info">
							<dl>
								<dt><c:out value="${result92.nttSj}"/></dt>
								<dd class="txt"><c:out value='${fn:substring(result92.nttCn.replaceAll("\\\<.*?\\\>",""),0, 40)}' /></dd>
								<dd class="tag"><c:out value="${result92.ssWords}"/></dd>
							</dl>
						</div>
					</a>
				</li>
			</c:forEach>
		</ul>

		</div>
		<ul class="column_nav cir-arrow">
			<li></li>
			<li></li>
		</ul>

		<script>
			$('.column_li').slick({
			  infinite: true,
			  autoplay: true,
			  autoplaySpeed: 4000,
			  asNavFor: '.column_nav',
			  dots:false,
			  arrows:false,
				
			});

		   $('.column_nav').slick({
		  asNavFor: '.column_li',
		  dots: true,
		  customPaging: function (slider, i) {
		  console.log(slider);
		  var thumb = $(slider.$slides[i]).data();
		  return '<span class="num">' + '<b>' + (i + 1) + '</b>'+ '/' + slider.slideCount + '</span>';
			   },
			});
		</script>
	
	</div>
</div>

<div class="related_banner">
	<div class="pdinner">
		<ul class="quick_banner slickdot">
			<li><a href="https://www.mcst.go.kr/" target="_blank" title="새창으로 이동"><img src="<c:url value='/img/quick_banner01.jpg'/>" alt="문화체육관광부"/></a></li>
			<li><a href="http://www.visitkorea.or.kr/" target="_blank" title="새창으로 이동"><img src="<c:url value='/img/quick_banner02.jpg'/>" alt="한국관광공사"/></a></li>
			<li><a href="http://www.gyeongnam.go.kr/" target="_blank" title="새창으로 이동"><img src="<c:url value='/img/quick_banner03.jpg'/>" alt="경상남도"/></a></li>
			<li><a href="https://academy.visitkorea.or.kr" target="_blank" title="새창으로 이동"><img src="<c:url value='/img/quick_banner04.jpg'/>" alt="관광in"/></a></li>
			<li><a href="https://tourbiz.or.kr/" target="_blank" title="새창으로 이동"><img src="<c:url value='/img/quick_banner05.jpg'/>" alt="서울관광기업지원센터"/></a></li>
			<li><a href="http://busan.tourbiz.or.kr/" target="_blank" title="새창으로 이동"><img src="<c:url value='/img/quick_banner06.jpg'/>" alt="부산관광기업지원센터"/></a></li>
			<li><a href="https://daejeonsejong.tourbiz.or.kr/" target="_blank" title="새창으로 이동"><img src="<c:url value='/img/quick_banner07.jpg'/>" alt="대전세종관광기업지원센터"/></a></li>
			<li><a href="https://incheon.tourbiz.or.kr/" target="_blank" title="새창으로 이동"><img src="<c:url value='/img/quick_banner08.jpg'/>" alt="인천관광기업지원센터"/></a></li>
		</ul>
	</div>
</div>

<script>
$('.quick_banner').slick({
  dots: false,
  autoplay:true,
  infinite: true,
  speed: 300,
  arrows:true,
  slidesToShow: 6,
  slidesToScroll: 1,
  //centerMode: true,
  //variableWidth: true,
  responsive: [
	{
      breakpoint: 1400,
      settings: {
        slidesToShow: 6,
        slidesToScroll: 1,
		arrows:true,
		dots: false,
      }
    },
    {
      breakpoint: 1024,
      settings: {
        slidesToShow: 5,
        slidesToScroll: 5,
		arrows:true,
		dots: false,
      }
    },
    {
      breakpoint: 600,
      settings: {
        slidesToShow: 3,
        slidesToScroll: 3,
		arrows:true,
		dots: false,
      }
    },
    {
      breakpoint: 480,
      settings: {
        slidesToShow: 2,
        slidesToScroll: 2,
		arrows:true,
		dots: false,
      }
    }
    // You can unslick at a given breakpoint now by adding:
    // settings: "unslick"
    // instead of a settings object
  ]
});
  $('.quick_banner .slick-dots').on('click', function() {
    $('.autoplay').slick('slickPause');
});
        
</script>

<form name="submitParam" method="get">
	<input type="hidden" name="bbsId" /> 
	<input type="hidden" name="nttId" />
	<input name="pageIndex" type="hidden" value="1"/>
</form>

<%@ include file="/WEB-INF/jsp/egovframework/gntbsc/inc/footer.jsp" %>