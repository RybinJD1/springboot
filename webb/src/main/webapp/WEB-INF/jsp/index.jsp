<!DOCTYPE HTML>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>--%>


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

    <%--<script type="application/javascript">--%>
    <%--function addToOrder(product) {--%>

    <%--var xhttp = new XMLHttpRequest();--%>
    <%--var prod = encodeURIComponent(product);--%>

    <%--xhttp.onreadystatechange = function() {--%>
    <%--var backets = JSON.parse(this.responseText);--%>

    <%--};--%>
    <%--xhttp.open("POST", "/addToBucketOrder", true);--%>
    <%--xhttp.send();--%>

    <%--}--%>
    <%--</script>--%>


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
                        <li><a href="new-order"><spring:message code="page.neworder"/></a></li>
                        <li><a href="login"><spring:message code='page.login'/></a></li>
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
        <c:choose>
            <c:when test="${mode == 'MODE_HOME'}">
                <div class="container" id="homeDiv">
                    <div class="jumbotron text-center">
                        <h1><spring:message code='page.welcome'/></h1>
                    </div>
                </div>
            </c:when>
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
            <c:when test="${mode == 'MODE_PRODUCTS'}">
                <div class="container text-center" id="productsDiv">
                    <h3>Products</h3>
                    <hr>
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered text-left">
                            <thead>
                            <tr>
                                <th>name</th>
                                <th>description</th>
                                <th>cost</th>
                                <th>remainder</th>
                                <%--<th>quantity of goods</th>--%>
                                <th></th>
                                <th></th>
                                <th>get order</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${products}" var="product">
                                <tr>
                                    <td>${product.name}</td>
                                    <td>${product.description}</td>
                                    <td>${product.cost}</td>
                                    <td>${product.remainder}</td>
                                    <%--<td><input type="number" name="orderedQuantity" min="0" max="${product.remainder}" value="0"></td>--%>
                                    <td><a href="update-product?id=${product.id}"><span class="glyphicon glyphicon-pencil"></span></a></td>
                                    <td><a href="delete-product?id=${product.id}"><span class="glyphicon glyphicon-trash" onclick="return confirm('Удалить выбранный товар?')"></span></a></td>
                                    <td><input type="button" onclick="addToOrder(${product.id}}">add in order</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </c:when>
            <c:when test="${mode == 'MODE_NEW_PRODUCT' || mode == 'MODE_UPDATE_PRODUCT'}">
                <div class="container text-center">
                    <h3><spring:message code='page.fields'/></h3>
                    <hr>
                    <form class="form-horizontal" method="post" action="save-product">
                        <input type="hidden" name="id" value="${product.id}"/>
                        <div class="form-group">
                            <label class="control-label col-md-3">Name</label>
                            <div class="col-md-7">
                                <input type="text" class="form-control" name="name" placeholder="name" value="${product.name}"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3">Description</label>
                            <div class="col-md-7">
                                <input type="text" class="form-control" name="description" placeholder="description" value="${product.description}"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3">Cost</label>
                            <div class="col-md-7">
                                <input type="text" class="form-control" name="cost" placeholder="100" value="${product.cost}"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3">Remainder</label>
                            <div class="col-md-7">
                                <input type="text" class="form-control" name="remainder" placeholder="5" value="${product.remainder}"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <input type="submit" class="btn btn-primary" value="Save"/>
                        </div>
                    </form>
                </div>
            </c:when>
            <c:when test="${mode == 'MODE_ORDERS'}">
                <div class="container text-center" id="ordersDiv">
                    <h3>Orders</h3>
                    <hr>
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered text-left">
                            <thead>
                            <tr>
                                <th>RegistrationDate</th>
                                <th>Status</th>
                                <th>BuyerId</th>
                                <%--<th>NameBuyer</th>--%>
                                <th></th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${orders}" var="order">
                                <tr>
                                    <td><fmt:formatDate pattern="yyyy-MM-dd" value="${order.registrationDate}"/></td>
                                    <td>${order.status}</td>
                                    <td>${order.buyers_id}</td>
                                    <%--<td>${buyer.nameBuyer}</td>--%>
                                    <td><a href="update-order?id=${order.id}"><span class="glyphicon glyphicon-pencil"></span></a></td>
                                    <td><a href="delete-order?id=${order.id}"><span class="glyphicon glyphicon-trash" onclick="return confirm('Удалить выбранный заказ?')"></span></a></td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </c:when>
            <c:when test="${mode == 'MODE_UPDATE_ORDER'}">
                <div class="container text-center">
                    <h3><spring:message code='page.fields'/></h3>
                    <hr>
                    <form class="form-horizontal" method="post" action="save-order">
                        <input type="hidden" name="id" value="${order.id}"/>
                        <div class="form-group">
                            <label class="control-label col-md-3">Status</label>
                            <div class="col-md-7">
                                <input type="radio" class="col-sm-1" name="status" value="PROCESSING" checked/>
                                <div class="col-sm-3"><spring:message code='status.PROCESSING'/></div>
                                <input type="radio" class="col-sm-1" name="status" value="EXECUTED"/>
                                <div class="col-sm-3"><spring:message code='status.EXECUTED'/></div>
                                <input type="radio" class="col-sm-1" name="status" value="CANCELLED"/>
                                <div class="col-sm-3"><spring:message code='status.CANCELLED'/></div>
                                <input type="radio" class="col-sm-1" name="status" value="SENT"/>
                                <div class="col-sm-3"><spring:message code='status.SENT'/></div>
                            </div>
                        </div>
                    </form>
                </div>
            </c:when>
        </c:choose>

        <script src="../static/js/jquery-1.11.1.min.js"></script>
        <script src = "../static/js/bootstrap.min.js" ></script>

    </body>
</html>
