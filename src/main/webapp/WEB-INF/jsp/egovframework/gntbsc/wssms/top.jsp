<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%!
public String clearXSS(String str, String avatag) {
	if(str != null) {
		str = str.replaceAll("<","&lt;");
		str = str.replaceAll("\0","");
		str = str.replaceAll("'", "&#39;");
		str = str.replaceAll("\"", "&#34;");
		str = str.replaceAll("javascript","java-script");
		str = str.replaceAll("script","s-cript");
		str = str.replaceAll("expression","ex-pression");
		str = str.replaceAll("background","back-ground");
		str = str.replaceAll("alert","a-lert");
	
		//허용할 태그를 지정할 경우
		if (!avatag.equals("")) {
			avatag.replaceAll(" ","");
		
			String [] st = avatag.split(",");
	
			//허용할 태그를 존재 여부를 검사하여 원상태로 변환
			for(int x = 0; x < st.length; x++ ) {
				str = str.replaceAll("&lt;"+st[x]+" ", "<"+st[x]+" ");
				str = str.replaceAll("&lt;"+st[x]+">", "<"+st[x]+">");
				str = str.replaceAll("&lt;/"+st[x], "</"+st[x]);
			}
		}

		str = str.replaceAll("drop","dr-op");
		str = str.replaceAll("schema","up-date");
		str = str.replaceAll("kill","kil-l");
		str = str.replaceAll("sysobjects","sys-objects");
	} else {
		str = "";
	}

	return (str);
}
%>
<%
String bodyckey = clearXSS(request.getParameter("bodyckey"),"");
String bodyclass = "";

if(bodyckey.equals("true")) {
	bodyclass = "headernone";
} else {
	bodyclass = "";
}

%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>경남관광기업지원센터</title>
<meta charset="utf-8">
<meta name="viewport" content="width=1400px, user-scalable=yes"> <!--표준형-->
<meta name="format-detection" content="telephone=no, address=no, email=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta http-equiv="Expires" content="-1" /> 

<link rel="shortcut icon" href="<c:url value='/img/favicon.png" type="image/x-icon'/>" />
<link rel="stylesheet" media="all" href="<c:url value='/css2/font.css'/>" />

<link rel="stylesheet" type="text/css" href="<c:url value='/plugin/font-awesome/css/font-awesome.min.css'/>">
<link rel="stylesheet" media="all" href="<c:url value='/css2/style.css'/>" />
<link rel="stylesheet" media="all" href="<c:url value='/css2/program.css'/>" />
<link rel="stylesheet" media="all" href="<c:url value='/css2/layout.css'/>" />
<link rel="stylesheet" media="all" href="<c:url value='/css2/menu.css'/>" />
<link rel="stylesheet" media="all" href="<c:url value='/css2/board.css'/>" />
<link rel="stylesheet" media="all" href="<c:url value='/css2/category.css'/>" />
<link rel="stylesheet" media="all" href="<c:url value='/css2/graph.css'/>" />

<script type="text/javascript" src="<c:url value='/js/jquery-2.1.4.js'/>"></script>

<script type="text/javascript" src="<c:url value='/js/jquery-ui-1.7.2.custom.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/tytabs.jquery.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/menu.js'/>"></script> <!-- Resource jQuery -->
<script type="text/javascript" src="<c:url value='/js/common.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/modernizr.js'/>"></script> <!-- Modernizr -->
<script type="text/javascript" src="<c:url value='/SE2/js/HuskyEZCreator.js'/>" charset="utf-8"></script>

<script type="text/javascript">
/*if (document.location.protocol == 'http:') {
    document.location.href = document.location.href.replace('http:', 'https:');
}*/
</script>
</head>

<body class="<%=bodyclass%>">
<div class="wrap">
	<% if(!bodyckey.equals("true")) { %>
		<%@ include file="/WEB-INF/jsp/egovframework/gntbsc/wssms/header.jsp" %>
	<% } %>
