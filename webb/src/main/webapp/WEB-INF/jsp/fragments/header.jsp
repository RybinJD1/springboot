<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head lang="en">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-Control" content="no-cache">
    <meta http-equiv="Expires" content="Sat, 01 Dec 2001 00:00:00 GMT">

    <title>WebMarket | Home</title>

    <link href="../static/css/bootstrap.min.css" rel="stylesheet">
    <link href="../static/css/style.css" rel="stylesheet">
</head>
<body>
    <div role="navigation">
        <div class="navbar navbar-inverse">
            <a href="/" class="navbar-brand"><spring:message code='page.home'/></a>
            <div class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li><a href="new-product"><spring:message code="page.newproduct"/></a></li>
                    <li><a href="all-products"><spring:message code="page.allproducts"/></a></li>
                    <li><a href="new-buyer"><spring:message code="page.newbuyer"/></a></li>
                    <li><a href="all-buyers"><spring:message code='page.allbuyers'/></a></li>
                    <li><a href="all-orders"><spring:message code="page.allorders"/></a></li>
                    <li class="dropdown text-right" >
                        <a href="#" class="dropdown-toggle text-right" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" ><spring:message code='page.language'/><span class="caret text-right"></span></a>
                        <ul class="dropdown-menu text-right">
                            <li><a href="?lang=en"><spring:message code='language.english'/></a></li>
                            <li><a href="?lang=ru"><spring:message code='language.russian'/></a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</body>
</html>