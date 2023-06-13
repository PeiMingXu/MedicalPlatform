<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isErrorPage="true" %>
<!-- 药材下架，默认是隐藏的 -->
<div class="modal fade" id="borrowModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">

    <div class="modal-dialog">

        <div class="modal-content">

            <div class="modal-header">
                <h3 id="myModalLabel">药材信息</h3>
            </div>

            <div class="modal-body">
                <form id="borrowDrugs">

                    <table class="table table-bordered table-striped" width="800px">
                        <%--图书的id，不展示在页面--%>
                        <span>
                            <input type="hidden" id="d_id4" name="d_id">
                        </span>

                        <tr>
                            <td>药材名称</td>
                            <td><input class="form-control" readonly name="d_name" id="d_name4"></td>
                            <td>主治症状</td>
                            <td><input class="form-control" readonly name="d_indication" id="d_indication4"></td>
                        </tr>
                        <tr>
                            <td>用法用量</td>
                            <td><input class="form-control" readonly name="d_use" id="d_use4"></td>
                            <td>用户图片</td>
                            <td><input class="form-control" readonly name="d_picture" id="d_picture4"></td>
                            </tr>
                        <tr>
                            <td>用户状态</td>
                            <td><input class="form-control" readonly name="d_status" id="d_status4"></td>
                        </tr>
                    </table>
                </form>
            </div>

            <div class="modal-footer">
                <%--点击保存按钮时，隐藏模态窗口并调用js文件中的borrow()方法--%>
                <button class="btn btn-success" data-dismiss="modal" aria-hidden="true" id="borrow1">下架</button>
                <button class="btn btn-default" data-dismiss="modal" aria-hidden="true">关闭</button>
            </div>
        </div>
    </div>
</div>



<%--上夹药材--%>
<div class="modal fade" id="borrowModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">

    <div class="modal-dialog">

        <div class="modal-content">

            <div class="modal-header">
                <h3 id="myModalLabel1">药材信息</h3>
            </div>

            <div class="modal-body">
                <form id="borrowDrugs1">

                    <table class="table table-bordered table-striped" width="800px">
                        <%--图书的id，不展示在页面--%>
                        <span>
                            <input type="hidden" id="d_id3" name="d_id">
                        </span>
                        <tr>
                            <td>药材名称</td>
                            <td><input class="form-control" readonly name="d_name" id="d_name3"></td>
                            <td>主治症状</td>
                            <td><input class="form-control" readonly name="d_indication" id="d_indication3"></td>
                        </tr>

                        <tr>
                            <td>用法用量</td>
                            <td><input class="form-control" readonly name="d_use" id="d_use3"></td>
                            <td>用户图片</td>
                            <td><input class="form-control" readonly name="d_picture" id="d_picture3"></td>
                        </tr>

                            <tr>
                                <td>用户状态</td>
                                <td><input class="form-control" readonly name="d_status" id="d_status3"></td>
                            </tr>

                    </table>
                </form>
            </div>

            <div class="modal-footer">
                <%--点击保存按钮时，隐藏模态窗口并调用js文件中的borrow()方法--%>
                <button class="btn btn-success" data-dismiss="modal" aria-hidden="true" id="borrow2">上架</button>
                <button class="btn btn-default" data-dismiss="modal" aria-hidden="true">关闭</button>
            </div>
        </div>
    </div>
</div>



<script>

    $("#borrow1").click(
        function () {
            var d_id = $("#d_id4").val();
            var d_name = $("#d_name4").val();
            var d_indication = $("#d_indication4").val();
            var d_use = $("#d_use4").val();
            var d_picture = $("#d_picture4").val();
            var d_status = $("#d_status4").val();

           // 发送ajax请求至后台控制层
           $.ajax(
                   {
                   url:" ${pageContext.request.contextPath}/borrowDrugs",
                   type:"GET",
                   data:{
                       d_id:d_id,
                       d_name:d_name,
                       d_indication:d_indication,
                       d_use:d_use,
                       d_picture:d_picture,
                       d_status:d_status,
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

    $("#borrow2").click(
        function () {
            var d_id = $("#d_id3").val();
            var d_name = $("#d_name3").val();
            var d_indication = $("#d_indication3").val();
            var d_use = $("#d_use3").val();
            var d_picture = $("#d_picture3").val();
            var d_status = $("#d_status3").val();
            // 发送ajax请求至后台控制层
            $.ajax(
                {
                    url:" ${pageContext.request.contextPath}/borrowDrugs",
                    type:"GET",
                    data:{
                        d_id:d_id,
                        d_name:d_name,
                        d_indication:d_indication,
                        d_use:d_use,
                        d_picture:d_picture,
                        d_status:d_status,
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