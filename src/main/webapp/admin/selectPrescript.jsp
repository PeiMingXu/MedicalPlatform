<%@ page import="java.util.List" %>
<%@ page import="com.xmut.pojo.Dg_certificate" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
        <th>用户名</th>
        <th>症状描述</th>
        <th>医生姓名</th>
        <th>开药品</th>
        <th>操作</th>
    </tr>
    <c:forEach var="prescript" items="${dg_prescript}">
    <tr>
        <td>${prescript.u_name}</td>
        <td>${prescript.p_symptom}</td>
        <td>${prescript.dc_name}</td>
        <td>${prescript.p_drugs}</td>
        <td>

            <button type="button" class="button border-main" onclick="showDialog(${prescript.p_id})">通过</button>

            <div id="dialog-${prescript.p_id}" class="dialog" style="display: none;">

                <div class="dialog-content">
                    <h2>用药备注</h2>
                    <textarea id="audit-comment-${prescript.p_id}" rows="5" cols="40"></textarea>
                    <div style="display:block">
                        <button type="button" class="button primary" onclick="updatePrescription(${prescript.p_id})">确定</button>
                        <button type="button" class="button" onclick="hideDialog(${prescript.p_id})">取消</button>
                    </div>

                </div>
            </div>

            <style>
                .dialog {
                    position: absolute;
                    top: 50%;
                    left: 50%;
                    transform: translate(-50%, -50%);
                    background-color: #fff;
                    padding: 20px;
                    border-radius: 5px;
                    box-shadow: 0 0 10px rgba(0,0,0,0.3);
                    z-index: 99999;
                }
                .dialog-content {
                    text-align: center;
                }
            </style>

        <script>
        function showDialog(prescriptId) {
        var dialog = document.getElementById('dialog-' + prescriptId);
        if (dialog) {
        dialog.style.display = 'block';
        }
        }

        function hideDialog(prescriptId) {
        var dialog = document.getElementById('dialog-' + prescriptId);
        if (dialog) {
        dialog.style.display = 'none';
        }
        }

        function updatePrescription(prescriptId) {
        var comment = document.getElementById('audit-comment-' + prescriptId).value;
        if (!comment) {
        alert('请输入审核意见！');
        return;
        }

            $.ajax({
                type: 'POST',
                url: '${pageContext.request.contextPath}/updatePrescriptionById',
                data: {
                    p_id: prescriptId,
                    p_status: 2,
                    dr_comment: comment
                },
                success: function(result) {
                    if (result.success) {
                        alert('操作失败，请重试！');
                        location.reload();
                    } else {
                        alert('操作成功,审核通过！');
                        location.reload();
                    }
                },
                error: function(xhr, status, error) {
                    console.log('AJAX 请求失败：', error);
                    alert('操作失败，请重试！');
                    location.reload();
                }
            });
        }
        </script>

    </c:forEach>
</table>
</body>
</html>
