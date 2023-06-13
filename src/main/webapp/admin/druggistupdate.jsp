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
    <meta charset="UTF-8">
    <title>添加证书</title>
    <link href="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-5">
    <div class="card">
        <h5 class="card-header bg-primary text-white">修改</h5>
        <div class="card-body">
            <form method="post" action="/updatedgCertificate" enctype="multipart/form-data">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                <div>
                    <label>证书名称：</label>
                    <input type="text" name="dg_name" required />
                </div>
                <div>
                    <label>证书等级：</label>
                    <input type="text" name="dg_grades" required />
                </div>
                <div>
                    <label>证书图片：</label>
                    <input type="file" name="dg_picture" required />
                </div>
                <div>
                    <button type="submit">上传</button>
                    <button type="reset">重置</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.bootcdn.net/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.min.js"></script>
</body>
</html>