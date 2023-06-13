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
    <h3 class="box-title">证书审核</h3>
</div>

    <!--工具栏 数据搜索 -->
    <div class="box-tools pull-right">
        <div class="has-feedback">
            <form action="${pageContext.request.contextPath}/searchCertificates" method="post">
                药师姓名：<input name="user_name" value="${searchCertificates.user.name}">&nbsp&nbsp&nbsp&nbsp
                证书等级：<input name="phone" value="${searchCertificates.dg_grades}">&nbsp&nbsp&nbsp&nbsp
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
                <th class="sorting_asc">证书名字</th>
                <th class="sorting_asc">证书等级</th>
                <th class="sorting">证书图片</th>
                <th class="sorting">药剂师</th>
                <th class="sorting">证书状态</th>
                <th class="text-center">操作</th>
            </tr>
            </thead>

            <tbody>
            <c:forEach items="${pageResult.rows}" var="certificates">
                <tr>
                    <td>${certificates.dg_name}</td>
                    <td>${certificates.dg_grades}</td>
                    <td>
                        <img id="images" src="${pageContext.request.contextPath}/img/${certificates.dg_picture}" width="100px" height="50px" alt="图片加载失败">
                    </td>
                    <td>${certificates.user.name}</td>

                    <td>
                        <c:if test="${certificates.dg_status ==1}">未审核</c:if>
                        <c:if test="${certificates.dg_status ==2}">申请驳回</c:if>
                        <c:if test="${certificates.dg_status ==3}">已审核</c:if>
                    </td>

                    <td>${certificates.dg_status}</td>
                    <td class="text-center">
                        <c:if test="${certificates.dg_status ==2}">
                            <button type="button" class="btn bg-olive btn-xs" disabled="true">申请驳回
                            </button>
                        </c:if>

                        <c:if test="${certificates.dg_status ==1}">

                            <c:if test="${USER_SESSION.role =='admin'}">
                            <button type="button" class="btn bg-olive btn-xs" data-toggle="modal"
                                    data-target="#borrowModal1" onclick="findById3(${certificates.id},'edit_5')">审核
                            </button>

                            <button type="button" class="btn bg-olive btn-xs" data-toggle="modal"
                                    data-target="#borrowModal2" onclick="findById3(${certificates.id},'edit_6')">驳回
                            </button>
                            </c:if>
                        </c:if>

                        <c:if test="${certificates.dg_status ==3}">
                            <button type="button" class="btn bg-olive btn-xs" disabled="true">审核通过
                            </button>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>

            </tbody>
        </table>
        <!-- 数据表格 /-->
        <%--分页插件--%>
        <div id="pagination" class="pagination"></div>

        <%--引入存放模态窗口的页面--%>
        <jsp:include page="/admin/certificates_modal.jsp"></jsp:include>

    </div>
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
    bookVO.user_name = "${certificates.user.name}"
    bookVO.phone = "${certificates.user.dg_grades}"

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

</script>



</html>