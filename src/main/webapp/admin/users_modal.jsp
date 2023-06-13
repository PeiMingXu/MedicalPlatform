<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isErrorPage="true" %>
<!-- 账号封禁，默认是隐藏的 -->
<div class="modal fade" id="borrowModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">

    <div class="modal-dialog">

        <div class="modal-content">

            <div class="modal-header">
                <h3 id="myModalLabel">用户信息</h3>
            </div>

            <div class="modal-body">
                <form id="borrowUser">

                    <table class="table table-bordered table-striped" width="800px">
                        <%--图书的id，不展示在页面--%>
                        <span>
                            <input type="hidden" id="uid" name="id">
                        </span>
                        <tr>
                            <td>用户名称</td>
                            <td><input class="form-control" readonly name="name" id="uname"></td>
                            <td>用户密码</td>
                            <td><input class="form-control" readonly name="password" id="upassword"></td>
                        </tr>

                        <tr>
                            <td>用户账号</td>
                            <td><input class="form-control" readonly name="phone" id="uphone"></td>
                            <td>用户角色</td>
                            <td><input class="form-control" readonly name="role" id="urole"></td>
                        </tr>

                        <tr>
                            <td>用户状态</td>
                            <td><input class="form-control" readonly name="status" id="ustatus"></td>
                        </tr>
                    </table>
                </form>
            </div>

            <div class="modal-footer">
                <%--点击保存按钮时，隐藏模态窗口并调用js文件中的borrow()方法--%>
                <button class="btn btn-success" data-dismiss="modal" aria-hidden="true" id="borrow">封禁</button>
                <button class="btn btn-default" data-dismiss="modal" aria-hidden="true">关闭</button>
            </div>
        </div>
    </div>
</div>

<%--解封账号--%>
<div class="modal fade" id="borrowModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">

    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h3 id="myModalLabel1">用户信息</h3>
            </div>

            <div class="modal-body">
                <form id="borrowUser1">

                    <table class="table table-bordered table-striped" width="800px">
                        <%--用户的id，不展示在页面--%>
                        <span>
                            <input type="hidden" id="uid1" name="id">
                        </span>
                        <tr>
                            <td>用户名称</td>
                            <td><input class="form-control" readonly name="name" id="uname1"></td>
                            <td>用户密码</td>
                            <td><input class="form-control" readonly name="password" id="upassword1"></td>
                        </tr>
                        <tr>
                            <td>用户账号</td>
                            <td><input class="form-control" readonly name="phone" id="uphone1"></td>
                            <td>用户角色</td>
                            <td><input class="form-control" readonly name="role" id="urole1"></td>
                        </tr>
                        <tr>
                            <td>用户状态</td>
                            <td><input class="form-control" readonly name="status" id="ustatus1"></td>
                        </tr>
                    </table>
                </form>
            </div>

            <div class="modal-footer">
                <%--点击保存按钮时，隐藏模态窗口并调用js文件中的borrow()方法--%>
                <button class="btn btn-success" data-dismiss="modal" aria-hidden="true" id="borrow1">解封</button>
                <button class="btn btn-default" data-dismiss="modal" aria-hidden="true">关闭</button>
            </div>
        </div>
    </div>
</div>




<script>

    $("#borrow").click(
        function () {
            var id = $("#uid").val();
            var name = $("#uname").val();
            var password = $("#upassword").val();
            var phone = $("#uphone").val();
            var role = $("#urole").val();
            var status = $("#ustatus").val();
           // 发送ajax请求至后台控制层
           $.ajax(
                   {
                   url:" ${pageContext.request.contextPath}/borrowUser",
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

    $("#borrow1").click(
        function () {
            var id = $("#uid1").val();
            var name = $("#uname1").val();
            var password = $("#upassword1").val();
            var phone = $("#uphone1").val();
            var role = $("#urole1").val();
            var status = $("#ustatus1").val();
            // 发送ajax请求至后台控制层
            $.ajax(
                {
                    url:" ${pageContext.request.contextPath}/borrowUser",
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