<%@ tag description="Template Tag" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!doctype>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>Bank</title>
    <!-- Latest compiled and minified CSS -->
    <link href="<c:url value="/resources/bootstrap/css/bootstrap.min.css" />" rel="stylesheet">

    <!-- Optional theme -->
    <link href="<c:url value="/resources/bootstrap/css/bootstrap-theme.min.css" />" rel="stylesheet">

    <link href="<c:url value="/resources/css/main.css" />" rel="stylesheet">

    <script src="/resources/js/jquery-1.11.3.min.js"></script>
    <script src="/resources/bootstrap/js/transition.js"></script>
    <script src="/resources/bootstrap/js/collapse.js"></script>
    <script src="/resources/bootstrap/js/bootstrap.min.js"></script>

    <script language="javascript" type="text/javascript">
        var tr = {
            youAreGoing: "<spring:message code="js.youAreGoingToDelete"/>",
            areYouSure: "<spring:message code="js.areYouSure"/>"
        }
    </script>
</head>
<body>

<nav class="navbar navbar-default navbar-static-top">
    <div class="container">
        <div class="navbar-header">
                <a class="navbar-brand" href="/">
                    <img style="max-width:100px; margin-top: -10px; height: 36px; display: inline" src="/resources/img/logo.png"/>
                    Helix Bank
                </a>
         </div>
        <nav id="bs-navbar" class="navbar-collapse collapse in" aria-expanded="true">

            <ul class="nav navbar-nav">
                <li><a href="/clients"><spring:message code="nav.clients"/></a></li>
                <li><a href="/accounts"><spring:message code="nav.accounts"/></a></li>
                <li><a href="/payments"><spring:message code="nav.payments"/></a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <sec:authorize access="isAuthenticated()">
                        <li><a href="/info"><spring:message code="nav.info"/></a></li>
                    </sec:authorize>
                </li>
                <li>
                    <div class="languages-nav">
                        <a href="?lang=en">en</a>
                        |
                        <a href="?lang=ru">ru</a>
                    </div>
                </li>
            </ul>
        </nav>
    </div>
</nav>

<div class="content" style="width:77%;margin:0 auto;">
    <c:if test="${not empty breadcrumbs}">
        <ol class="breadcrumb">
            <c:forEach items="${breadcrumbs}" var="breadcrumb">
              <li>
                  <a href="${breadcrumb.getLink()}">
                      <c:choose>
                          <c:when test="${breadcrumb.isTranslatable()}">
                              <spring:message code="${breadcrumb.getTitle()}"/>
                          </c:when>
                          <c:when test="${!breadcrumb.isTranslatable()}">
                             ${breadcrumb.getTitle()}
                          </c:when>
                      </c:choose>
                  </a>
              </li>
            </c:forEach>
        </ol>
    </c:if>
    <jsp:doBody/>
</div>
</body>
</html>