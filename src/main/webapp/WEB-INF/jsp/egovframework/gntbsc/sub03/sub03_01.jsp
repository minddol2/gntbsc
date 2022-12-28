<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="egovframework.com.cmm.service.EgovProperties" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import ="egovframework.goncs.member.service.LoginVO" %>
<%
    String lang_mode = (String) request.getAttribute("lang_temp");

    String is_main = "";
    int m1 = 3;
    int m2 = 3;
    int m3 = 1;

    int us_level = 5;
    LoginVO loginVO = (LoginVO)session.getAttribute("loginVO");
    if(loginVO != null) {
        us_level = loginVO.getUs_level();
    }
%>

<jsp:include page="/WEB-INF/jsp/egovframework/gntbsc/inc/top.jsp" flush="true" >
    <jsp:param name="is_main" value="<%=is_main%>"/>
</jsp:include>

<jsp:include page="/WEB-INF/jsp/egovframework/gntbsc/inc/sub_top.jsp" flush="true" >
    <jsp:param name="m1" value="<%=m1%>"/>
    <jsp:param name="m2" value="<%=m2%>"/>
    <jsp:param name="m3" value="<%=m3%>"/>
</jsp:include>

경남관광스타트업

</div><!--con-->
</div><!--subcon-->
</div><!--subwrap-->





<%@ include file="/WEB-INF/jsp/egovframework/gntbsc/inc/footer.jsp" %>