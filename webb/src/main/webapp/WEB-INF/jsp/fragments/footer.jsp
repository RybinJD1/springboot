<%--<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>--%>
<%--<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>--%>

<html>
<head>
</head>
<body>
<div th:fragment="footer">

    <div class="container">

        <footer>
            <!-- this is footer -->
            © 2017 webmarket.com
            <span sec:authorize="isAuthenticated()">
                | Logged user: <span sec:authentication="name"></span> |
                Roles: <span sec:authentication="principal.authorities"></span> |
                <a th:href="@{/logout}">Sign Out</a>
            </span>

            <script type="text/javascript"
                    src="../../static/js/bootstrap.min.js"></script>

        </footer>
    </div>

</div>
</body>
</html>