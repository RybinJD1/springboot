<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<jsp:include page="/WEB-INF/jsp/fragments/header.jsp"/>
<head>
    <title>Buyers</title>
</head>
<body>
    <c:when test="${mode == 'MODE_BUYERS'}">
        <div class="container text-center" id="buyersDiv">
            <h3><spring:message code='page.list.buyers'/></h3>
            <hr>
            <div class="table-responsive">
                <table class="table table-striped table-bordered text-left">
                    <thead>
                    <tr>
                        <th><spring:message code='buyer.role'/></th>
                        <th><spring:message code='buyer.name'/></th>
                        <th><spring:message code='buyer.surname'/></th>
                        <th><spring:message code='buyer.email'/></th>
                        <th><spring:message code='buyer.password'/></th>
                        <th><spring:message code='buyer.phone'/></th>
                        <th><spring:message code='buyer.address'/></th>
                        <th></th>
                        <th></th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${buyers}" var="buyer">
                        <tr>
                            <td>${buyer.role}</td>
                            <td>${buyer.name}</td>
                            <td>${buyer.surname}</td>
                            <td>${buyer.email}</td>
                            <td>${buyer.password}</td>
                            <td>${buyer.phone}</td>
                            <td>${buyer.address}</td>
                            <td><a href="update-buyer?id=${buyer.id}"><span class="glyphicon glyphicon-pencil"></span></a></td>
                            <td><a href="delete-buyer?id=${buyer.id}"><span class="glyphicon glyphicon-trash" onclick="return confirm('Удалить выбранного пользователя?')"></span></a></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </c:when>
    <c:when test="${mode == 'MODE_NEW_BUYER' || mode == 'MODE_UPDATE_BUYER'}">
        <div class="container text-center">
            <h3><spring:message code='page.fields'/></h3>
            <hr>
            <form class="form-horizontal" method="POST" action="save-buyer">
                <input type="hidden" name="id" value="${buyer.id}"/>
                <div class="form-group">
                    <label class="control-label col-md-3"><spring:message code='buyer.role'/></label>
                    <div class="col-md-7">
                        <input type="radio" class="col-sm-1" name="role" value="USER" checked/>
                        <div class="col-sm-3"><spring:message code='role.USER'/></div>
                        <input type="radio" class="col-sm-1" name="role" value="ADMIN"/>
                        <div class="col-sm-3"><spring:message code='role.ADMIN'/></div>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-3"><spring:message code='buyer.name'/></label>
                    <div class="col-md-7">
                        <input type="text" class="form-control" name="name" placeholder="Ivan" value="${buyer.name}"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-3"><spring:message code='buyer.surname'/></label>
                    <div class="col-md-7">
                        <input type="text" class="form-control" name="surname" placeholder="Ivanov" value="${buyer.surname}"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-3"><spring:message code='buyer.email'/></label>
                    <div class="col-md-7">
                        <input type="text" class="form-control" name="email" placeholder="ivanov@gmail.ru" value="${buyer.email}"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-3"><spring:message code='buyer.password'/></label>
                    <div class="col-md-7">
                        <input type="text" class="form-control" name="password" placeholder="password" value="${buyer.password}"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-3"><spring:message code='buyer.phone'/></label>
                    <div class="col-md-7">
                        <input type="text" class="form-control" name="phone" placeholder="phone" value="${buyer.phone}"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-3"><spring:message code='buyer.address'/></label>
                    <div class="col-md-7">
                        <input type="text" class="form-control" name="address" placeholder="address" value="${buyer.address}"/>
                    </div>
                </div>
                <div class="form-group">
                    <input type="submit" class="btn btn-primary" value="<spring:message code='page.save'/>"/>
                </div>
            </form>
        </div>
    </c:when>
</body>
</html>
