<%--

    Licensed to Jasig under one or more contributor license
    agreements. See the NOTICE file distributed with this work
    for additional information regarding copyright ownership.
    Jasig licenses this file to you under the Apache License,
    Version 2.0 (the "License"); you may not use this file
    except in compliance with the License. You may obtain a
    copy of the License at:

    http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing,
    software distributed under the License is distributed on
    an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
    KIND, either express or implied. See the License for the
    specific language governing permissions and limitations
    under the License.

--%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page session="true" %>
<%@ page pageEncoding="UTF-8" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%String channel=request.getParameter("service") ;%>

<spring:theme code="mobile.custom.css.file" var="mobileCss" text="" />
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
	<head>
	    <title>CAS &#8211; Central Authentication Service</title>
        <c:choose>
           <c:when test="${not empty requestScope['isMobile'] and not empty mobileCss}">
                <meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;" />
                <meta name="apple-mobile-web-app-capable" content="yes" />
                <meta name="apple-mobile-web-app-status-bar-style" content="black" />
                <link type="text/css" rel="stylesheet" media="screen" href="<c:url value="/css/fss-framework-1.1.2.css" />" />
                <link type="text/css" rel="stylesheet" href="<c:url value="/css/fss-mobile-${requestScope['browserType']}-layout.css" />" />
                <link type="text/css" rel="stylesheet" href="${mobileCss}" />
           </c:when>
           <c:otherwise>
                <spring:theme code="standard.custom.css.file" var="customCssFile" />
                <link type="text/css" rel="stylesheet" href="<c:url value="${customCssFile}" />" />
           </c:otherwise>
        </c:choose>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.5/jquery-ui.min.js"></script>
        <script type="text/javascript" src="<c:url value="/js/cas.js" />"></script>
	    <link rel="icon" href="<c:url value="/favicon.ico" />" type="image/x-icon" />
		<link  href="<c:url value="/css/style.css" />" rel="stylesheet" type="text/css"  />
	</head>
	<body id="cas" class="loginbody" >

		<div id="msg" class="success">
			<h2><spring:message code="screen.logout.header" /></h2>

			<p>您已经成功退出系统，谢谢使用！<%-- 11<spring:message code="screen.logout.success" /> --%></p>
			<p><spring:message code="screen.logout.security" /></p>
		</div>
                <div  style="width:100%;height:50px;position:fixed;bottom:0px;left:0px;text-align:center;">
                    <div class="dblock">
					<div class="inline-block copyright">
                        <p>Copyright &copy; 2016 - 2020 <!--Jasig, Inc. All rights reserved.--></p>
                <!--        <p>Powered by <a href="http://www.jasig.org/cas">Jasig Central Authentication Service <%=org.jasig.cas.CasVersion.getVersion()%></a></p>-->
                    </div>
					</div>
                <!--    <a href="http://www.jasig.org" title="go to Jasig home page"><img alt="Jasig logo" id="logo" src="<c:url value="/images/ja-sig-logo.gif" />" width="118" height="31" alt="JA-SIG" title="go to Jasig home page" /></a>-->
                </div>
            
    </body>
</html>
