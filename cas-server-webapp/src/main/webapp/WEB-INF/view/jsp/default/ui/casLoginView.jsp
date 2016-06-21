

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
    <div class="dataEye">
        
           <!-- <div id="header" class="flc-screenNavigator-navbar fl-navbar fl-table">
                <h1 id="app-name" class="fl-table-cell">Central Authentication Service (CAS)</h1>
            </div>-->		
            <div class="loginbox registbox" >
					<div class="logo-a">
		            </div>
			<form:form method="post" id="fm1" cssClass="fm-v clearfix" commandName="${commandName}" htmlEscape="true">
			    <form:errors path="*" cssClass="errors" id="status" element="div" />
                <div class=""  style="padding-left:40px;">
				<!--<div class="box fl-panel" id="login" >-->
                <!-- <spring:message code="screen.welcome.welcome" /> -->
                   <div class="loginbox-title" style="display:block;float:left;padding-left:20px;">
				     <h3>请登录</h3>
			       </div>
				   <div class="loginbox-title" style="display:block;float:left;padding-left:20px;">
				     <h3><a href="#" onclick="loginfn()">免费注册</a></h3>
			       </div>
                    <div class="row" style="padding-left:40px;">
                        <label for="username" class="field" ><spring:message code="screen.welcome.label.netid" /></label>
						<c:if test="${not empty sessionScope.openIdLocalId}">
						<strong>${sessionScope.openIdLocalId}</strong>
						<input type="hidden" id="username" name="username" value="${sessionScope.openIdLocalId}" />
						</c:if>

						<c:if test="${empty sessionScope.openIdLocalId}">
						<spring:message code="screen.welcome.label.netid.accesskey" var="userNameAccessKey" />
						<form:input cssClass="required" cssErrorClass="error" id="username" size="25" tabindex="1" accesskey="${userNameAccessKey}" path="username" autocomplete="false" htmlEscape="true" />
						</c:if>
                    </div>
                    <div class="row" style="padding-left:40px;">
                        <label for="password" class="field"><spring:message code="screen.welcome.label.password" /></label>
						<%--
						NOTE: Certain browsers will offer the option of caching passwords for a user.  There is a non-standard attribute,
						"autocomplete" that when set to "off" will tell certain browsers not to prompt to cache credentials.  For more
						information, see the following web page:
						http://www.geocities.com/technofundo/tech/web/ie_autocomplete.html
						--%>
						<spring:message code="screen.welcome.label.password.accesskey" var="passwordAccessKey" />
						<form:password cssClass="required" cssErrorClass="error" id="password" size="25" tabindex="2" path="password"  accesskey="${passwordAccessKey}" htmlEscape="true" autocomplete="off" />
                    </div>
            <!--        <div class="row check">
                        <input id="warn" name="warn" value="true" tabindex="3" accesskey="<spring:message code="screen.welcome.label.warn.accesskey" />" type="checkbox" />
                        <label for="warn"><spring:message code="screen.welcome.label.warn" /></label>
                    </div>-->
                    <div class="row btn-row" style="padding-left:80px;">
						<input type="hidden" name="lt" value="${flowExecutionKey}" />
						<input type="hidden" name="_eventId" value="submit" />
                        <input type="hidden" name="channel" value="<%=channel %>"/>
                        <input class="login-btncas" name="submit" accesskey="l" value="<spring:message code="screen.welcome.button.login" />" tabindex="4" type="submit" />
                        &npbs<input class="login-btncas" name="reset" accesskey="c" value="<spring:message code="screen.welcome.button.clear" />" tabindex="5" type="reset" />
                    </div>
                </div>
            </form:form>

         <%--   <div id="sidebar">
                <p class="fl-panel fl-note fl-bevel-white fl-font-size-80"><spring:message code="screen.welcome.security" /></p>
                <div id="list-languages" class="fl-panel">
                <%final String queryString = request.getQueryString() == null ? "" : request.getQueryString().replaceAll("&locale=([A-Za-z][A-Za-z]_)?[A-Za-z][A-Za-z]|^locale=([A-Za-z][A-Za-z]_)?[A-Za-z][A-Za-z]", "");%>
					<c:set var='query' value='<%=queryString%>' />
                    <c:set var="xquery" value="${fn:escapeXml(query)}" />
                  <h3>Languages:</h3>
                  <c:choose>
                     <c:when test="${not empty requestScope['isMobile'] and not empty mobileCss}">
                        <form method="get" action="login?${xquery}">
                           <select name="locale">
                               <option value="en">English</option>
                               <option value="es">Spanish</option>
                               <option value="fr">French</option>
                               <option value="ru">Russian</option>
                               <option value="nl">Nederlands</option>
                               <option value="sv">Svenskt</option>
                               <option value="it">Italiano</option>
                               <option value="ur">Urdu</option>
                               <option value="zh_CN">Chinese (Simplified)</option>
                               <option value="de">Deutsch</option>
                               <option value="ja">Japanese</option>
                               <option value="hr">Croatian</option>
                               <option value="cs">Czech</option>
                               <option value="sl">Slovenian</option>
                               <option value="pl">Polish</option>
                               <option value="ca">Catalan</option>
                               <option value="mk">Macedonian</option>
                           </select>
                           <input type="submit" value="Switch">
                        </form>
                     </c:when>
                     <c:otherwise>
                        <c:set var="loginUrl" value="login?${xquery}${not empty xquery ? '&' : ''}locale=" />
						<ul
							><li class="first"><a href="${loginUrl}en">English</a></li
							><li><a href="${loginUrl}es">Spanish</a></li
							><li><a href="${loginUrl}fr">French</a></li
							><li><a href="${loginUrl}ru">Russian</a></li
							><li><a href="${loginUrl}nl">Nederlands</a></li
							><li><a href="${loginUrl}sv">Svenskt</a></li
							><li><a href="${loginUrl}it">Italiano</a></li
							><li><a href="${loginUrl}ur">Urdu</a></li
							><li><a href="${loginUrl}zh_CN">Chinese (Simplified)</a></li
							><li><a href="${loginUrl}de">Deutsch</a></li
							><li><a href="${loginUrl}ja">Japanese</a></li
							><li><a href="${loginUrl}hr">Croatian</a></li
							><li><a href="${loginUrl}cs">Czech</a></li
							><li><a href="${loginUrl}sl">Slovenian</a></li
                            ><li><a href="${loginUrl}ca">Catalan</a></li
                            ><li><a href="${loginUrl}mk">Macedonian</a></li
							><li class="last"><a href="${loginUrl}pl">Polish</a></li
						></ul>
                     </c:otherwise>
                   </c:choose>
                </div>
            </div>--%>
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
            
        </div>
    </body>
	<script>
	function loginfn(){
		window.location.href="http://fengl2.com.cn:8080/artupsso/login";
	}
	</script>
</html>

