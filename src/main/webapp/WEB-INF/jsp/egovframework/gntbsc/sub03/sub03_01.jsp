<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="egovframework.com.cmm.service.EgovProperties" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page import="egovframework.goncs.member.service.LoginVO" %>
<%
    String lang_mode = (String) request.getAttribute("lang_temp");

    String is_main = "";
    int m1 = 3;
    int m2 = 3;
    int m3 = 1;

    int us_level = 5;
    LoginVO loginVO = (LoginVO) session.getAttribute("loginVO");
    if (loginVO != null) {
        us_level = loginVO.getUs_level();
    }
%>

<jsp:include page="/WEB-INF/jsp/egovframework/gntbsc/inc/top.jsp" flush="true">
    <jsp:param name="is_main" value="<%=is_main%>"/>
</jsp:include>

<jsp:include page="/WEB-INF/jsp/egovframework/gntbsc/inc/sub_top.jsp" flush="true">
    <jsp:param name="m1" value="<%=m1%>"/>
    <jsp:param name="m2" value="<%=m2%>"/>
    <jsp:param name="m3" value="<%=m3%>"/>
</jsp:include>

<%--<c:forEach var="result" items="${resultList}" varStatus="status">
    ${result.classfication2} ${result.nttSj} <br>
</c:forEach>--%>

<div class="start_list">
    <div class="box">
        <p class="tlt">
            2020년도 입주기업
        </p>
        <ul>
            <c:forEach var="result" items="${resultList}" varStatus="status">
                <c:if test="${result.classfication2 eq '2' || result.classfication2 eq '5'}">
                    <li><a href="javascript: void(0);"
                           onclick="fn_egov_downFile_etc('${result.bbsId}','0','${result.atchFileId}')">${result.nttSj}</a>
                    </li>
                </c:if>
            </c:forEach>
            <li><a href="<c:url value="/img/pdf/1. 괭이그리스(예비관광스타트업).pdf"/>" download>괭이그리스</a></li>
            <li><a href="<c:url value="/img/pdf/4. KinK(예비관광스타트업).pdf"/>" download>KinK</a></li>
            <li><a href="<c:url value="/img/pdf/2. Kn-투어사피엔스(예비관광스타트업).pdf"/>" download>Kn-투어사피엔스</a></li>
            <li><a href="<c:url value="/img/pdf/3. 디지털노마드닷컴(예비관광스타트업).pdf"/>" download>디지털노마드닷컴</a></li>
        </ul>
    </div>
    <div class="box">
        <p class="tlt">
            2021년도 입주기업
        </p>
        <ul>
            <c:forEach var="result" items="${resultList}" varStatus="status">
                <c:if test="${result.classfication2 eq '3' || result.classfication2 eq '6'}">
                    <li><a href="javascript: void(0);"
                           onclick="fn_egov_downFile_etc('${result.bbsId}','0','${result.atchFileId}')">${result.nttSj}</a>
                    </li>
                </c:if>
            </c:forEach>
        </ul>
    </div>
    <div class="box">
        <p class="tlt">
            2022년도 입주기업
        </p>
        <ul>
            <c:forEach var="result" items="${resultList}" varStatus="status">
                <c:if test="${result.classfication2 eq '4'}">
                    <li><a href="javascript: void(0);"
                           onclick="fn_egov_downFile_etc('${result.bbsId}','0','${result.atchFileId}')">${result.nttSj}</a>
                    </li>
                </c:if>
            </c:forEach>
            <li><a href="javascript: alert('준비중입니다.');" download>KBF</a></li>
        </ul>
    </div>

</div>

</div><!--con-->
</div><!--subcon-->
</div><!--subwrap-->

<script>
    function fn_egov_downFile_etc(bbsId, fileIdx, bbsIdx) {
        window.open("<c:url value='/cmm/fms/downloadEtcFile.do?bbsId="+bbsId+"&fileIdx="+fileIdx+"&bbsIdx="+bbsIdx+"'/>");
    }
</script>


<%@ include file="/WEB-INF/jsp/egovframework/gntbsc/inc/footer.jsp" %>