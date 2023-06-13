<%--
  Created by IntelliJ IDEA.
  User: 90495
  Date: 2023/5/24
  Time: 17:27
  To change this template use File | Settings | File Templates.
--%>
<%@page language="java" contentType="text/html; character=UTF-8" pageEncoding="UTF-8" %>
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
<div class="width1200 center_yh hidden_yh font14" style="height: 40px;line-height: 40px;">
    <span>当前位置：</span><a href="#" class="c_66">首页</a>
    ><a href="#" class="c_66">个人信息</a>
    ><a href="#" class="c_66">修改密码</a>
<%--<c:forEach items="${druggist.dg_certificateList}" var="data" varStatus="1">--%>
    <%--<td>数据${druggist.pwd}</td>--%>
<%--</c:forEach>--%>
</div>
<!DOCTYPE html>
<html lang="zh-CN">
        <!DOCTYPE html>
        <html>
        <head>
        <meta charset="UTF-8">
                             <title>修改密码</title>
        <!-- 加载 Bootstrap 样式 -->
        <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.3.1/css/bootstrap.min.css">
            <style>
                .form-group {
                    margin-bottom: 1rem;
                }
        .form-label {
            font-weight: bold;
        }
        .form-error {
            color: red;
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <h2 class="mb-4">修改密码</h2>
    <form id="update-form">
        <div class="form-group">
            <label class="form-label" for="old-password">旧密码：</label>
            <input type="password" class="form-control" id="old-password" name="oldPassword" required>
        </div>
        <div class="form-group">
            <label class="form-label" for="new-password">新密码：</label>
            <input type="password" class="form-control" id="new-password" name="newPassword" required>
        </div>
        <div class="form-group">
            <label class="form-label" for="confirm-password">确认新密码：</label>
            <input type="password" class="form-control" id="confirm-password" name="confirmPassword" required>
            <div class="form-error" id="password-error"></div>
        </div>
        <button type="submit" class="btn btn-primary">提交</button>
    </form>
    <div class="mt-4" id="result-message"></div>
</div>
<!-- 加载 jQuery 库 -->
<script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
    $(function() {
        var updateForm = $('#update-form');
        var oldPasswordInput = $('#old-password');
        var newPasswordInput = $('#new-password');
        var confirmPasswordInput = $('#confirm-password');
        var passwordError = $('#password-error');
        var resultMessage = $('#result-message');

        // 验证两次输入的密码是否一致
        function validatePassword() {
            var newPassword = newPasswordInput.val();
            var confirmPassword = confirmPasswordInput.val();
            if (newPassword !== confirmPassword) {
                passwordError.text('两次输入的密码不一致，请重新输入。');
                return false;
            } else {
                passwordError.empty();
                return true;
            }
        } // 补全 validatePassword 函数体右大括号

        // 提交修改密码请求
        function submitUpdateRequest() {
            var oldPassword = oldPasswordInput.val();
            var newPassword = newPasswordInput.val();
            $.post('/updateDruggist', { oldPassword: oldPassword, newPassword: newPassword })
                .done(function(data) {
                    console.log('响应数据：', data); // 添加日志输出
                    resultMessage.text(data.result === 'success' ? '密码修改失败！' : '密码修改成功！。');
                    if (data.result === 'fail') {
                        alert('密码修改失败！');
                        resultMessage.text('密码修改失败！');
                    } else {
                        alert('密码修改成功！');
                        resultMessage.text('密码修改成功！');
                        window.location.href = "${pageContext.request.contextPath}/CertificateUpdate    "; // 密码修改成功后跳转到CertificateList.jsp界面
                    }
                });
        } // 补全 submitUpdateRequest 函数体右大括号

        // 绑定表单提交事件
        updateForm.on('submit', function(event) {
            event.preventDefault();
            if (validatePassword()) {
                submitUpdateRequest();
            }
        });
    }); // 补全 $(function() {}) 函数体右大括号
</script>
</body>
</html>