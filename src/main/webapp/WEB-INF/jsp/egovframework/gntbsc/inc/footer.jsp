<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

	<div id="footer">
		<div class="bottom_li">
			<div class="pdinner">
				<div class="relative_li">
					<div class="dropdown">
						<a onclick="myFunction()" class="dropbtn">관련사이트 바로가기</a>		
						<div id="dropdown" class="dropmenu">
							<ul>			
								<li><a href="https://www.mcst.go.kr/" target="_blank" title="새창으로 이동">문화체육관광부</a></li>
								<li><a href="http://www.visitkorea.or.kr/" target="_blank" title="새창으로 이동">한국관광공사</a></li>
								<li><a href="http://www.gyeongnam.go.kr/" target="_blank" title="새창으로 이동">경상남도</a></li>
								<li><a href="https://academy.visitkorea.or.kr/" target="_blank" title="새창으로 이동">관광in</a></li>
								<li><a href="https://tourbiz.or.kr/" target="_blank" title="새창으로 이동">서울관광기업지원센터</a></li>
								<li><a href="http://busan.tourbiz.or.kr/" target="_blank" title="새창으로 이동">부산관광기업지원센터</a></li>
								<li><a href="https://daejeonsejong.tourbiz.or.kr/" target="_blank" title="새창으로 이동">대전세종관광기업지원센터</a></li>
								<li><a href="https://incheon.tourbiz.or.kr/" target="_blank" title="새창으로 이동">인천관광기업지원센터</a></li>
							</ul>
						</div>
					</div>
				</div>
				<ul class="foot_li">
					<li><a href="<c:url value='/'/>sub10/sub01_01.do">개인정보취급방침</a></li>
					<li><a href="<c:url value='/'/>sub10/sub02_01.do">이용약관</a></li>
					<li><a href="<c:url value='/'/>sub10/sub03_01.do">이메일무단수집거부</a></li>
				</ul>
			</div>
		</div>
		<div class="pdinner footinfo">
			<div class="box">
				<h5 class="fwb">경남관광기업지원센터</h5>
				<ul>
					<li>대표번호 055-277-8412</li>				
				</ul>
				<address>경남 창원시 성산구 충혼로 91, 창원문성대학교 경상관 1층(우51410)</address>
				
			</div>
			
		</div>
		<div class="copy">
			<p class="pdinner">Copyright ⓒ <b>2020 경남관광기업지원센터</b>. <span><a href="/wssms/LoginUsr.do" title="관리자페이지로이동" target="_blank">관리자</a></span>  
				<span class="mEnter">All Rights Reserved. designed by 크리에이티브마루.</span> 
			</p>
		</div>
	</div>
	<div id="pageup">
	</div>

	<script type="text/javascript">
		$("#pageup").pageup();
		$(document).ready(function() {
			RESPONSIVEUI.responsiveTabs();
		})

	</script>
	<div id="ready" class="no-display popinfo">
		<h1>경남관광기업지원센터</h1>
		<div class="readybox">
			<h4><img src="<c:url value='/img/logo.png'/>" alt="경남관광지원센터"/></h4>
			<div class="txt">
				<h5>SNS 개설 준비중 입니다.</h5>
				<p>경남관광기업지원센터의 다양한 소식을 기대해주세요!</p>
			</div>
		</div>
	</div>

</div><!--wrap-->
<!-- litebox -->
		<script src="<c:url value='/plugin/litebox/jquery-ui.min.js'/>"></script>
		<link rel="stylesheet" media="all" href="<c:url value='/plugin/litebox/litebox.css'/>" />
		<script src="<c:url value='/plugin/litebox/litebox.js'/>"></script>
		<script src="<c:url value='/plugin/litebox/backbone.js'/>"></script>
		<script src="<c:url value='/plugin/litebox/images-loaded.min.js'/>"></script>
		<script>
			$('.litebox').liteBox();
		</script>
<!-- litebox -->

<script src="<c:url value='/plugin/share/wow.js'/>"></script>
<link rel="stylesheet" media="all" href="<c:url value='/plugin/share/animate.css'/>">
<script>
	wow = new WOW(
		{
			boxClass:     'wow',
			animateClass: 'animated',
			offset:       100,
			callback:     function(box) {
			  console.log("WOW: animating <" + box.tagName.toLowerCase() + ">")
			}
		}
	);
	wow.init();
  </script>

</body>
</html>
