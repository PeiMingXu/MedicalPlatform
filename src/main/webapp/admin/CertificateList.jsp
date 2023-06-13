<%@ page import="java.util.List" %>
<%@ page import="com.xmut.pojo.Dg_certificate" %>
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
    <style>
        .vertical td {
            display: block;
        }
        .vertical td:first-child {
            font-weight: bold;
        }
    </style>
</head>
<body>

<table class="table table-hover text-center">
    <tr class="vertical">
        <td>药剂师账号：${druggist.user}</td>
    </tr>
    <tr class="vertical">
        <td>姓名：${druggist.name}</td>
    </tr>
    <tr class="vertical">
        <td>性别：${druggist.six}</td>
    </tr>
    <%--<tr class="vertical">--%>
        <%--<td>资历等级：${druggist.grades}</td>--%>
    <%--</tr>--%>
    <tr class="vertical">
        <td>类别：${druggist.clas}</td>
    </tr>
    <tr>
        <td colspan="2">
            <a class="button border-main" href="${pageContext.request.contextPath}/updateDruggist">
                <span class="icon-edit">修改密码</span>
            </a>
        </td>
    </tr>
    <script  type="text/javascript">
        /*分页插件展示的总页数*/
        pageargs.total = Math.ceil(${pageResult.total}/pageargs.pagesize)
        /*分页插件当前的页码*/
        pageargs.cur = ${pageNum}
            /*分页插件页码变化时将跳转到的服务器端的路径*/
            pageargs.gourl = "${gourl}"
        /*保存搜索框中的搜索条件，页码变化时携带之前的搜索条件*/
        bookVO.name = "${searchDruggist.druggist_view.name}"

        /*分页效果*/
        pagination(pageargs);
    </script>
</table>
</body>
</html>