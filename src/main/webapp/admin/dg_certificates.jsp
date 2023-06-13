<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 90495
  Date: 2023/5/21
  Time: 13:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>药剂师平台</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/pintuer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">
    <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/js/pintuer.js"></script>
    <link rel="stylesheet" href="/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="/css/ace.min.css">
    <link rel="stylesheet" href="/css/ace-rtl.min.css"/>
    <link rel="stylesheet" href="/css/ace-skins.min.css">
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>
<div class="panel admin-penel">
    <form action="${pageContext.request.contextPath}/Certificate/findBySql" id="listform" method="post">
        <div class="padding border-bottom">
            <ul class="search" style="padding-left: 10px">
                <li>
                    <a class="button border-main icon-plus-square-o" href="${pageContext.request.contextPath}/admin/AddCertificate.jsp">添加证书</a>
                </li>
            </ul>
        </div>
    </form>
</div>

<table class="table table-hover text-center">
    <tr>
        <th>证书名称</th>
        <th>等级</th>
        <th>证书照片</th>
    </tr>
    <c:forEach items="${druggist.dg_certificateList}" var="data" varStatus="1">
        <tr>
            <td>${data.dg_name}</td>
            <td>${data.dg_grades}</td>
            <td><img width="80" height="100" src="../img/${data.dg_picture}"></td>
            <%--<td>--%>
                <%--<a class="button border-main" href="${pageContext.request.contextPath}/updatedgCertificate?dg_id=${data.dg_id}&dg_name=${data.dg_name}&dg_grades=${data.dg_grades}&dg_picture=${data.dg_picture}">--%>
                    <%--<span class="icon-edit">修改</span>--%>
                <%--</a>--%>
            <%--</td>--%>
        </tr>
    </c:forEach>
<script>
</script>
</body>
</html>
