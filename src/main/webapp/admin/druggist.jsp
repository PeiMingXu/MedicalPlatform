<%--
  Created by IntelliJ IDEA.
  User: 90495
  Date: 2023/5/21
  Time: 13:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  pageEncoding="utf-8" %>
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
<body style="background-color: #75B178">
<div class="header bg-main">
    <div class="header-inner">
        <div class="logo margin-big-left fadein-top">
            <img src="${pageContext.request.contextPath}/img/20230531203859.png" width="220" height="60" alt="药剂师平台logo">
        </div>
        <div class="head-links">
            <div class="right_yh" id="fast_jump" style="font-size: 120%; text-align: right;">
                <c:if test="${dbUser!=null}">
                    <a href="#">欢迎您：${username}</a>
                    <div class="head-l" style="margin-left: 60%">
                        <a class="button button-little bg-blue" href="#" onclick="(logout);">
                            <span class="icon-home"></span>前台首页
                        </a>
                        <a class="button button-little bg-red" href="#" onclick="logout();">
                            <span class="icon-power-off"></span>退出登录
                        </a>
                    </div>
                </c:if>
            </div>
        </div>
        </div>
    </div>

</body>
    <ul class="nav nav-list" id="nav_list">
        <li><a target="right" style="width: 180px; font-family: 'Microsoft YaHei', sans-serif; font-size: 16px;">药剂师平台</a></li>
        <li><a href="${pageContext.request.contextPath}/selectDg_PrescriptAll" target="right"style="width: 180px"><i class="icon-bank"></i>审核药单</a></li>
        <li><a href="${pageContext.request.contextPath}/CertificateUpdate" target="right"style="width: 180px"><i class="icon-child"></i>个人信息</a></li>
        <li><a href="${pageContext.request.contextPath}/dg_certificates" target="right"style="width: 180px;"><i class="icon-book"></i>我的证书</a></li>
        <li><a href="${pageContext.request.contextPath}/selectDg_PrescriptByUser"target="right"style="width: 180px"><i class="icon-folder-open"></i>查看药单审核记录</a></li>
    </ul>
    <div class="admin">
        <iframe name="right" scrolling="auto" frameborder="0" width="100%" height="100%"></iframe>
    </div>
<script>
    function logout() {
        // 发送GET请求到/logout接口注销当前用户，并在成功回调函数中跳转到登录页面
        $.ajax({
            type: 'GET',
            url: '/logout',
            success: function () {
                // 注销成功后跳转到登录页面
                window.location.href = 'index.jsp';
            },
            error: function (xhr, status, error) {
                console.log('AJAX 请求失败：', error);
            }
        });
    }
</script>
    </body>
    </html>
