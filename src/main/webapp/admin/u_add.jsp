<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2023/5/18
  Time: 21:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isErrorPage="true" %>

<!-- 添加和编辑图书的模态窗口 -->
<div class="modal fade" id="addOrEditModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h3 id="myModalLabel">用户信息</h3>
            </div>
            <div class="modal-body">
                <form id="addOrEditBook">
                    <span><input type="hidden" id="id" name="id"></span>
                    <table id="addOrEditTab" class="table table-bordered table-striped" width="800px">
                        <%--图书的id,不展示在页面--%>
                        <tr>
                            <td>用户名称</td>
                            <td><input class="form-control" placeholder="用户名称" name="name" id="name"></td>
                            <td>用户密码</td>
                            <td><input class="form-control" placeholder="用户密码" name="password" id="password"></td>
                        </tr>
                        <tr>
                            <td>用户账号</td>
                            <td><input class="form-control" placeholder="用户手机号" name="phone" id="phone"></td>
                            <td>用户角色</td>
                            <td>
                                <select class="form-control" name="role" id="role">
                                    <option value="admin">管理员</option>
                                    <option value="user">普通用户</option>
                                    <option value="pharmacist">药剂师</option>
                                    <option value="doctor">医生</option>
                                </select>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>

            <div class="modal-footer">
                <button class="btn btn-success" data-dismiss="modal" aria-hidden="true" id="addUser">保存
                </button>
                <button class="btn btn-default" data-dismiss="modal" aria-hidden="true">关闭</button>
            </div>
        </div>
    </div>
</div>

<!-- 添加和编辑图书的模态窗口 -->
<div class="modal fade" id="addOrEditModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h3 id="myModalLabel1">用户信息</h3>
            </div>
            <div class="modal-body">
                <form id="addOrEditBook1">
                    <span><input type="hidden" id="id1" name="id"></span>
                    <table id="addOrEditTab1" class="table table-bordered table-striped" width="800px">
                        <%--图书的id,不展示在页面--%>
                        <tr>
                            <td>用户名称</td>
                            <td><input class="form-control" placeholder="用户名称" name="name" id="name1"></td>
                            <td>用户密码</td>
                            <td><input class="form-control" placeholder="用户密码" name="password" id="password1"></td>
                        </tr>
                        <tr>
                            <td>用户账号</td>
                            <td><input class="form-control" placeholder="用户手机号" name="phone" id="phone1"></td>
                            <td>用户角色</td>
                            <td>
                                <select class="form-control" name="role" id="role1">
                                    <option value="admin">管理员</option>
                                    <option value="user">普通用户</option>
                                    <option value="pharmacist">药剂师</option>
                                    <option value="doctor">医生</option>
                                </select>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>

            <div class="modal-footer">
                <button class="btn btn-success" data-dismiss="modal" aria-hidden="true" id="editUser">保存
                </button>
                <button class="btn btn-default" data-dismiss="modal" aria-hidden="true">关闭</button>
            </div>
        </div>
    </div>
</div>



<script>
    $("#addUser").click(
        function () {
            var id = $("#id").val();
            var name = $("#name").val();
            var password = $("#password").val();
            var phone = $("#phone").val();
            var role = document.getElementById("role").value;
            var status = $("ustatus").val();

            if (name === "") {
                alert("请输入名称");
                return false;
            }
            if (password === "") {
                alert("请输入密码");
                return false;
            }
            if (phone === "") {
                alert("请输入手机号");
                return false;
            }
            if (role === "") {
                alert("请输入角色");
                return false;
            }

            // 发送ajax请求至后台控制层
            $.ajax(
                {
                    url:" ${pageContext.request.contextPath}/addByUser",
                    type:"POST",
                    data:{
                        id:id,
                        name:name,
                        password:password,
                        phone:phone,
                        role:role,
                        status:status
                    },
                    dataType: 'json',
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

    $("#editUser").click(
        function () {
            var id = $("#id1").val();
            var name = $("#name1").val();
            var password = $("#password1").val();
            var phone = $("#phone1").val();
            var role = document.getElementById("role1").value;
            var status = $("ustatus").val();

            if (name === "") {
                alert("请输入名称");
                return false;
            }
            if (password === "") {
                alert("请输入密码");
                return false;
            }
            if (phone === "") {
                alert("请输入手机号");
                return false;
            }
            if (role === "") {
                alert("请输入角色");
                return false;
            }

            // 发送ajax请求至后台控制层
            $.ajax(
                {
                    url:" ${pageContext.request.contextPath}/editUser",
                    type:"POST",
                    data:{
                        id:id,
                        name:name,
                        password:password,
                        phone:phone,
                        role:role,
                        status:status
                    },
                    dataType: 'json',
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