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

<table class="table table-hover text-center">
    <tr>
        <th>药单ID</th>
        <th>病人姓名</th>
        <th>症状</th>
        <th>医生</th>
        <th>药品清单</th>
        <th>用药备注</th>
    </tr>
    <c:forEach items="${dg_prescripts.dg_prescriptList}" var="dg_prescript">
        <tr>
            <td>${dg_prescript.p_id}</td>
            <td>${dg_prescript.u_name}</td>
            <td>${dg_prescript.p_symptom}</td>
            <td>${dg_prescript.dc_name}</td>
            <td>${dg_prescript.p_drugs}</td>
            <td>${dg_prescript.dr_comment}</td>
        </tr>
    </c:forEach>
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
