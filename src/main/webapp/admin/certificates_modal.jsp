<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isErrorPage="true" %>
<!-- 药材下架，默认是隐藏的 -->
<div class="modal fade" id="borrowModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">

    <div class="modal-dialog">

        <div class="modal-content">

            <div class="modal-header">
                <h3 id="myModalLabel">证书信息</h3>
            </div>

            <div class="modal-body">
                <form id="borrowCertificates">
                    <%--图书的id，不展示在页面--%>
                        <span>
                            <input type="hidden" id="c_id" name="c_id">
                        </span>

                    <table class="table table-bordered table-striped" width="800px">
                        <tr>
                            <td>证书名称</td>
                            <td><input class="form-control" readonly name="c_name" id="c_name"></td>
                            <td>证书等级</td>
                            <td><input class="form-control" readonly name="c_grades" id="c_grades"></td>
                        </tr>

                        <tr>
                            <td>上传者</td>
                            <td><input class="form-control" readonly name="dg_id" id="dg_id"></td>

                            <td>证书状态</td>
                            <td><input class="form-control" readonly name="c_status" id="c_status"></td>
                            </tr>
                    </table>
                </form>
            </div>

            <div class="modal-footer">
                <%--点击保存按钮时，隐藏模态窗口并调用js文件中的borrow()方法--%>
                <button class="btn btn-success" data-dismiss="modal" aria-hidden="true" id="borrow1">审核</button>
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
                <h3 id="myModalLabel1">证书信息</h3>
            </div>

            <div class="modal-body">
                <form id="borrowCertificates1">
                    <%--图书的id，不展示在页面--%>
                    <span>
                            <input type="hidden" id="c_id1" name="c_id1">
                        </span>
                    <table class="table table-bordered table-striped" width="800px">
                        <tr>
                            <td>证书名称</td>
                            <td><input class="form-control" readonly name="c_name1" id="c_name1"></td>
                            <td>证书等级</td>
                            <td><input class="form-control" readonly name="c_grades1" id="c_grades1"></td>
                        </tr>
                        <tr>
                            <td>上传者</td>
                            <td><input class="form-control" readonly name="dg_id1" id="dg_id1"></td>
                            <td>证书状态</td>
                            <td><input class="form-control" readonly name="c_status1" id="c_status1"></td>
                        </tr>
                        <tr>
                            <td style="width:200px;">驳回原因</td>
                            <td>
                                <textarea class="form-control" name="dg_reason1"
                                      id="dg_reason1" style="width:100px;height:100px;"
                                      placeholder="请输入驳回原因"></textarea>
                           </td>
                        </tr>

                    </table>
                </form>
            </div>

            <div class="modal-footer">
                <%--点击保存按钮时，隐藏模态窗口并调用js文件中的borrow()方法--%>
                <button class="btn btn-success" data-dismiss="modal"  aria-hidden="true" id="borrow2">驳回</button>
                <button class="btn btn-default" data-dismiss="modal" aria-hidden="true">关闭</button>
            </div>
        </div>
    </div>
</div>



<script>

    $("#borrow1").click(
        function () {
            var id = $("#c_id").val();
            var dg_name = $("#c_name").val();
            var dg_grades = $("#c_grades").val();
            var dg_status = $("#c_status").val();


           // 发送ajax请求至后台控制层
           $.ajax(
                   {
                   url:" ${pageContext.request.contextPath}/borrowCertificates",
                   type:"POST",
                   data:{
                       id:id,
                       dg_name:dg_name,
                       dg_grades:dg_grades,
                       dg_status:dg_status,
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
            var dg_name = $("#c_name1").val();
            var dg_grades = $("#c_grades1").val();
            var dg_status = $("#c_status1").val();
            var dg_reason = $("#dg_reason1").val();
            // 发送ajax请求至后台控制层
            $.ajax(
                {
                    url:" ${pageContext.request.contextPath}/borrowCertificates1",
                    type:"POST",
                    data:{
                        dg_name:dg_name,
                        dg_grades:dg_grades,
                        dg_status:dg_status,
                        dg_reason:dg_reason,
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