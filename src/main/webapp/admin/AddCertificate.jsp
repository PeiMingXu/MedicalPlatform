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
        <h5 class="card-header bg-primary text-white">添加证书</h5>
        <div class="card-body">
            <form id="add-form" enctype="multipart/form-data" method="post" action="/MedicalPlatform/insertdgCertificate">
                <div class="form-group row">
                    <label for="input-name" class="col-sm-2 col-form-label">证书名称</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="input-name" name="dg_certificate.dg_name" required>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="input-grades" class="col-sm-2 col-form-label">证书等级</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="input-grades" name="dg_certificate.dg_grades" required>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="input-picture" class="col-sm-2 col-form-label">证书图片</label>
                    <div class="col-sm-10">
                        <input type="file" class="form-control-file" id="input-picture" name="dg_picture" accept="image/*">
                    </div>
                </div>
                <button type="submit" class="btn btn-primary">添加</button>
            </form>
        </div>
    </div>
</div>

<script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.bootcdn.net/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.min.js"></script>
</body>
</html>