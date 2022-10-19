<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%
String is_main = request.getParameter("is_main");
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<title>경남관광기업지원센터</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<meta name="format-detection" content="telephone=no, address=no, email=no"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="robots" content="index, follow" />
<meta name="author" content="경남관광기업지원센터">
<meta name="description" content="관광스타트업 창업 및 육성지원, 지역 관광산업 활성화 지원, 관광일자리 구축, 대관신청 등" />
<meta name="keywords" content="경남, 관광, 스타트업지원, 관광스타트업, 지역관광, 관광일자리, 관광창업, 관광육성산업" />

<meta property="og:type" content="website" /> 
<meta property="og:image" content="<c:url value='/img/sns_img.jpg'/>" />
<meta property="og:title" content="경남관광기업지원센터" /> 
<meta property="og:description" content="관광스타트업 창업 및 육성지원, 지역 관광산업 활성화 지원, 관광일자리 구축, 대관신청 등" />
<meta property="og:url" content="http://gyeongnam.tourbiz.or.kr">

<link rel="canonical" href="http://gyeongnam.tourbiz.or.kr" />
<link rel="shortcut icon" href="<c:url value='/img/favicon.png'/>" type="image/x-icon" />
<link rel="stylesheet" media="all" href="<c:url value='/css/font.css'/>" />
<link rel="stylesheet" media="all" href="<c:url value='/css/style.css'/>" />
<link rel="stylesheet" media="all" href="<c:url value='/css/layout.css'/>" />
<link rel="stylesheet" media="all" href="<c:url value='/css/menu.css'/>" />
<link rel="stylesheet" media="all" href="<c:url value='/css/contents.css'/>" />
<link rel="stylesheet" media="all" href="<c:url value='/css/program.css'/>" />
<link rel="stylesheet" media="all" href="<c:url value='/css/board.css'/>" />

<script src="//code.jquery.com/jquery-2.2.0.min.js" ></script>

<script src="<c:url value='/js/common.js'/>"></script>
<script src="<c:url value='/js/d_lnb.js'/>"></script>
<script src="<c:url value='/js/modernizr.js'/>"></script> <!-- Modernizr -->
<script src="<c:url value='/js/jquery.vticker-min.js'/>"></script>
<script src="<c:url value='/js/responsivetables.js'/>"></script>
<script src="<c:url value='/js/tytabs.jquery.min.js'/>"></script>
<script src="<c:url value='/js/faqscript.js'/>"></script>


<!--공통-->
<script src="<c:url value='/js/jquery.easing.min.js'/>"></script>
<script src="<c:url value='/js/slick.js'/>"></script>

<link rel="stylesheet" type="text/css" href="<c:url value='/plugin/font-awesome/css/font-awesome.min.css'/>">
<!--공통-->
<!--[if lt IE 9]>
<script type="text/javascript" src="<c:url value='/plugin/share/html5.js'/>"></script>
<script type="text/javascript" src="<c:url value='/plugin/share/respond.min.js'/>"></script>
<![endif]-->
<!--[if lte IE 8]>
<link href="<c:url value='/css/ie8.css'/>" rel="stylesheet">
<![endif]-->

<script type="text/javascript">
/*if (document.location.protocol == 'http:') {
    document.location.href = document.location.href.replace('http:', 'https:');
    console.log('');
}*/
</script>
</head>
<body class="<% if(is_main.equals("")) out.println("subWrap"); else out.println("mainWrap");   %>">
<div class="wrap">	
	<%@ include file="/WEB-INF/jsp/egovframework/gntbsc/inc/header.jsp" %>