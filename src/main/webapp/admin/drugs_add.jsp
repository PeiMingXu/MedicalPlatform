<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2023/5/18
  Time: 21:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isErrorPage="true" %>
<head>
    <meta http-equiv="Content-Type" content="multipart/form-data; charset=utf-8" />
</head>

<!-- 添加和编辑图书的模态窗口 -->
<div class="modal fade" id="addOrEditModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h3 id="myModalLabel">药材信息</h3>
            </div>
            <div class="modal-body">
                <form id="addDrugs1" enctype="multipart/form-data" method="post">
                    <span><input type="hidden" id="id" name="id"></span>
                    <table id="addOrEditTab" class="table table-bordered table-striped" width="800px">
                        <%--药材的id,不展示在页面--%>
                        <tr>
                            <td>药材名称</td>
                            <td><input class="form-control" placeholder="药材名称" name="d_name1" id="d_name1"></td>
                            <td>主治症状</td>
                            <td><input class="form-control" placeholder="主治症状" name="d_indication1" id="d_indication1"></td>
                        </tr>
                        <tr>
                            <td>用法用量</td>
                            <td><input class="form-control" placeholder="用法用量" name="d_use1" id="d_use1"></td>
                            <td>药材图片</td>
                            <td><input type="file" class="form-control"  name="file1" multiple="multiple" id="file1"></td>
                        </tr>
                    </table>
                </form>
            </div>

            <div class="modal-footer">
                <button type="submit" class="btn btn-success"  data-dismiss="modal" aria-hidden="true"  id="addDrugs">保存
                </button>
                <button class="btn btn-default" data-dismiss="modal" aria-hidden="true">关闭</button>
            </div>
        </div>
    </div>
</div>





<!-- 添加和编辑图书的模态窗口 -->
<div class="modal fade" id="addOrEditModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h3 id="myModalLabel2">药材信息</h3>
            </div>
            <div class="modal-body">
                <form id="editDrugs2" enctype="multipart/form-data" method="post">
                    <span><input type="hidden" id="d_id2" name="d_id2"></span>
                    <table id="addOrEditTab2" class="table table-bordered table-striped" width="800px">
                        <%--药材的id,不展示在页面--%>
                        <tr>
                            <td>药材名称</td>
                            <td><input class="form-control" placeholder="药材名称" name="d_name2" id="d_name2"></td>
                            <td>主治症状</td>
                            <td><input class="form-control" placeholder="主治症状" name="d_indication2" id="d_indication2"></td>
                        </tr>
                        <tr>
                            <td>用法用量</td>
                            <td><input class="form-control" placeholder="用法用量" name="d_use2" id="d_use2"></td>
                            <td>药材图片</td>
                            <td><input type="file" class="form-control" name="file2" multiple="multiple" id="file2"></td>
                        </tr>
                    </table>
                </form>
            </div>
            <div class="modal-footer">
                <button  type="submit" class="btn btn-success"  data-dismiss="modal" aria-hidden="true" id="editDrugs">保存
                </button>
                <button class="btn btn-default" data-dismiss="modal" aria-hidden="true">关闭</button>
            </div>
        </div>
    </div>
</div>



<script type="text/javascript">

    $("#addDrugs").click(function() {
        // 获取表单对象
        var formData = new FormData();
        formData.append("d_name1", $("#d_name1").val());
        formData.append("d_indication1", $("#d_indication1").val());
        formData.append("d_use1", $("#d_use1").val());
        formData.append("file1", $("#file1")[0].files[0]);
        //控制台打印
        console.log("d_name1:", formData.get("d_name1"));
        console.log("d_indication1:", formData.get("d_indication1"));
        console.log("d_use1:", formData.get("d_use1"));
        console.log("file1:", formData.get("file1"));

        if (formData.get("d_name1") === "") { // 如果药材名称为空
                alert("请输入药材名称"); // 弹出提示框
                return false; // 阻止表单提交
        }
        if (formData.get("d_indication1") === "") { // 如果主治症状为空
                alert("请输入主治症状"); // 弹出提示框
                return false; // 阻止表单提交
        }
        if (formData.get("d_use1") === "") { // 如果用法用量为空
                alert("请输入用法用量"); // 弹出提示框
                return false; // 阻止表单提交
        }
        if (formData.get("file1").name === "") { // 如果药材图片为空
                alert("请上传药材图片"); // 弹出提示框
                return false; // 阻止表单提交
        }
            // 发送ajax请求至后台控制层
        $.ajax(
                {
                    url: "${pageContext.request.contextPath}/addByDrugs",
                    type: "POST",
                    data: formData, // 请求的数据
                    cache: false,
                    processData: false, // 不对表单数据进行序列化处理
                    contentType: false, // 让浏览器自动根据表单数据类型设置Content-Type
                    success:function(result) { // 成功回调函数
                        if (result.success) {
                            // 操作成功
                            alert(result.msg);
                            console.log("result.redirectUrl:",result.redirectUrl);
                            window.location.href = result.redirectUrl;
                        } else {
                            // 操作失败
                            alert(result.msg);
                        }
                    },
                    error: function() {
                        // 请求失败，提示网络错误
                        alert('操作信息错误，请检查操作信息是否正确，稍后再试！');
                    }
                });
    });

    //药材编辑
    $("#editDrugs").click(function() {
        // 获取表单对象
        var formData = new FormData();
        formData.append("d_id2", $("#d_id2").val())
        formData.append("d_name2", $("#d_name2").val());
        formData.append("d_indication2", $("#d_indication2").val());
        formData.append("d_use2", $("#d_use2").val());
        formData.append("file2", $("#file2")[0].files[0]);
        //控制台打印
        console.log("d_name2:", formData.get("d_name2"));
        console.log("d_indication2:", formData.get("d_indication2"));
        console.log("d_use2:", formData.get("d_use2"));
        console.log("file2:", formData.get("file2"));

        if (formData.get("d_name2") === "") { // 如果药材名称为空
            alert("请输入药材名称"); // 弹出提示框
            return false; // 阻止表单提交
        }
        if (formData.get("d_indication2") === "") { // 如果主治症状为空
            alert("请输入主治症状"); // 弹出提示框
            return false; // 阻止表单提交
        }
        if (formData.get("d_use2") === "") { // 如果用法用量为空
            alert("请输入用法用量"); // 弹出提示框
            return false; // 阻止表单提交
        }
        if (formData.get("file2").name === "") { // 如果药材图片为空
            alert("请上传药材图片"); // 弹出提示框
            return false; // 阻止表单提交
        }
        // 发送ajax请求至后台控制层
        $.ajax(
            {
                url: "${pageContext.request.contextPath}/editByDrugs",
                type: "POST",
                data: formData, // 请求的数据
                cache: false,
                processData: false, // 不对表单数据进行序列化处理
                contentType: false, // 让浏览器自动根据表单数据类型设置Content-Type
                success:function(result) { // 成功回调函数
                    if (result.success) {
                        // 操作成功
                        alert(result.msg);
                        console.log("result.redirectUrl:",result.redirectUrl);
                        window.location.href = result.redirectUrl;
                    } else {
                        // 操作失败
                        alert(result.msg);
                    }
                },
                error: function() {
                    // 请求失败，提示网络错误
                    alert('操作信息错误，请检查操作信息是否正确，稍后再试！');
                }
            });
    });





</script>