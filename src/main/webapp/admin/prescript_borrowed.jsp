<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="utf-8">
    <title>药方管理</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/AdminLTE.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/pagination.css">
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.js" ></script>
    <script src="${pageContext.request.contextPath}/js/pagination.js" ></script>
    <script src="${pageContext.request.contextPath}/js/my.js"></script>
</head>

<body class="hold-transition skin-red sidebar-mini">
<!-- .box-body -->
<div class="box-header with-border">
    <h3 class="box-title">药方管理</h3>
</div>
<div class="box-body">
    <%--新增按钮：如果当前登录用户是管理员，页面展示新增按钮--%>
    <c:if test="${USER_SESSION.role =='admin'}">
        <div class="pull-left">
            <div class="form-group form-inline">
                <div class="btn-group">
                    <button class="btn btn-success" data-dismiss="modal"
                            aria-hidden="true" name="sendBtn123" id="sendBtn123")>多条提醒</button>
                </div>
            </div>
        </div>
    </c:if>
    <%--新增按钮 /--%>


    <!--工具栏 数据搜索 -->
    <div class="box-tools pull-right">
        <div class="has-feedback">
            <form action="${pageContext.request.contextPath}/searchPrescript" method="post">
                患者姓名：<input name="user_name" value="${searchPrescript.user.name}">&nbsp&nbsp&nbsp&nbsp
                手机号：<input name="phone" value="${searchPrescript.user.phone}">&nbsp&nbsp&nbsp&nbsp
                <input class="btn btn-default" type="submit" value="查询">
            </form>
        </div>
    </div>
    <!--工具栏 数据搜索 /-->
    <!--数据列表-->
    <div class="table-box">
        <!-- 数据表格 -->
        <table id="dataList" class="table table-bordered table-striped table-hover dataTable text-center">
            <thead>
            <tr>
                <th><input type="checkbox" id="selectAll"></th>

                <th class="sorting_asc">患者姓名</th>
                <th class="sorting_asc">手机号</th>
                <th class="sorting">症状</th>
                <th class="sorting">药品名称</th>
                <th class="sorting">开单医生</th>
                <th class="sorting">审核药师</th>
                <th class="text-center">操作</th>
            </tr>
            </thead>

            <tbody>
            <c:forEach items="${pageResult.rows}" var="prescript">
                <tr>
                    <td>
                    <input type="checkbox" class="selectSingle" data-phone="${prescript.user.phone}" <c:if test="${prescript.p_status ==1}">disabled</c:if>>
                    </td>

                    <td>${prescript.user.name}</td>
                    <td id="phone">${prescript.user.phone}</td>
                    <td>${prescript.p_symptom}</td>
                    <td>${prescript.p_drugs}</td>
                    <td>${prescript.user1.name}</td>
                    <td>${prescript.user2.name}</td>
                    <td>
                        <c:if test="${prescript.p_status ==1}">未审核</c:if>
                        <c:if test="${prescript.p_status ==2}">已审核</c:if>
                    </td>
                    <td>${prescript.p_status}</td>

                    <td class="text-center">
                        <c:if test="${prescript.p_status ==1}">
                            <button type="button" class="btn bg-olive btn-xs" disabled="true">药师审核中
                            </button>
                        </c:if>

                        <c:if test="${prescript.p_status ==2}">
                            <button class="btn btn-success" data-dismiss="modal" aria-hidden="true" name="one_sms1" id="one_sms1_${prescript.id}")>用药提醒</button>
<%--                             <c:if test="${USER_SESSION.role =='admin'}">--%>

<%--                             </c:if>--%>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <!-- 数据表格 /-->
        <%--分页插件--%>
        <div id="pagination" class="pagination"></div>
    </div>
    <!-- 数据表格 /-->
</div>

</body>

<script  type="text/javascript">
	/*分页插件展示的总页数*/
    pageargs.total = Math.ceil(${pageResult.total}/pageargs.pagesize);
	/*分页插件当前的页码*/
    pageargs.cur = ${pageNum}
	/*分页插件页码变化时将跳转到的服务器端的路径*/
	pageargs.gourl = "${gourl}"
	/*保存搜索框中的搜索条件，页码变化时携带之前的搜索条件*/
    bookVO.user_name = "${searchPrescript.user.name}"
    bookVO.phone = "${searchPrescript.user.phone}"

	/*分页效果*/
    pagination(pageargs);

    //发送短信，单独一条提示
    $(document).on('click', '[id^="one_sms1_"]', function() {
        // 发送短信前的确认提示
        let confirmMsg = "你确定发送短信给该用户吗？";
        if (!confirm(confirmMsg)) {
            event.stopPropagation(); // 阻止事件冒泡
            return false; // 阻止默认行为
        }
        // 获取表格单元格元素,手机号
        // const phone = $(this).closest('tr').find('.phone').text();
        var phone=document.getElementById("phone").innerHTML;
        console.log("phone:"+phone)
        // 发送ajax请求至后台控制层
        $.ajax({
            url: "${pageContext.request.contextPath}/oneSms",
            type: "POST",
            data: {
                phone: phone,
            },
            dataType: 'json',
            success: function(result) { // 成功回调函数
                if (result.success) {
                    // 操作成功
                    alert(result.msg);
                    console.log("result.redirectUrl:", result.redirectUrl);
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

    //全选按钮
 $(document).ready(function() {
        // 获取全选checkbox元素
        const selectAll = document.querySelector('#selectAll');
        // 获取所有未被禁用的checkbox元素
        const enabledCheckboxes = document.querySelectorAll('input.selectSingle:not(:disabled)');
        // 给全选checkbox绑定点击事件
        selectAll.addEventListener('click', function () {
        // 如果当前全选checkbox被选中
        if (this.checked) {
            // 将所有未被禁用的checkbox设置为选中状态
            enabledCheckboxes.forEach(function (checkbox) {
                checkbox.checked = true;
            });
        } else {
            // 将所有未被禁用的checkbox设置为未选中状态
            enabledCheckboxes.forEach(function (checkbox) {
                checkbox.checked = false;
            });
        }
        });

        $('#sendBtn123').click(function() {
            // 发送短信前的确认提示
            let confirmMsg = "你确定发送短信给该用户吗？";
            if (!confirm(confirmMsg)) {
                event.stopPropagation(); // 阻止事件冒泡
                return false; // 阻止默认行为
            }
            //定义一个数组
            var phones = [];
            $('.selectSingle:checked').each(function() {
                var phone = $(this).data('phone');
                console.log(phone);
                phones.push(phone);
            });
            console.log("phone = " + JSON.stringify(phones));
            $.ajax({
                url: "${pageContext.request.contextPath}/determinate_oneSms",
                type: "POST",
                data: {
                    phone:phones,
                },
                dataType : "json",
                traditional: true,//这里设置为true
                success: function(result) { // 成功回调函数
                    if (result.success) {
                        // 操作成功
                        alert(result.msg);
                        console.log("result.redirectUrl:", result.redirectUrl);
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
    });


</script>



</html>