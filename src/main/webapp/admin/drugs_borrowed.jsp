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
    <h3 class="box-title">药材管理</h3>
</div>
<div class="box-body">

    <%--新增按钮：如果当前登录用户是管理员，页面展示新增按钮--%>
    <c:if test="${USER_SESSION.role =='admin'}">
        <div class="pull-left">
            <div class="form-group form-inline">
                <div class="btn-group">
                    <button type="button" class="btn btn-default" title="新建" data-toggle="modal"
                            data-target="#addOrEditModal1" onclick="resetStyle1()"> 新增
                    </button>
                </div>
            </div>
        </div>
    </c:if>
    <%--新增按钮 /--%>


    <!--工具栏 数据搜索 -->
    <div class="box-tools pull-right">
        <div class="has-feedback">
            <form action="${pageContext.request.contextPath}/searchDrugs" method="post">
                药材名称：<input name="d_name" value="${searchDrugs.d_name}">&nbsp&nbsp&nbsp&nbsp
                主治症状：<input name="d_indication" value="${searchDrugs.d_indication}">&nbsp&nbsp&nbsp&nbsp
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
                <th class="sorting_asc">药材名称</th>
                <th class="sorting_asc">主治症状</th>
                <th class="sorting">用法用量</th>
                <th class="sorting">药材图片</th>
                <th class="text-center">状态</th>
                <th class="text-center">操作</th>

            </tr>
            </thead>
            <tbody>
            <c:forEach items="${pageResult.rows}" var="drugs">
                <tr>
                    <td>${drugs.d_name}</td>
                    <td>${drugs.d_indication}</td>
                    <td>${drugs.d_use}</td>
                    <td><img id="images" src="/upload/${drugs.d_picture}" width="150px"height="100px" alt="图片加载失败"></td>
                    <td>
                        <c:if test="${drugs.d_status ==1}">已上架</c:if>
                        <c:if test="${drugs.d_status ==2}">已下架</c:if>
                    </td>
                    <td>${drugs.d_status}</td>
                    <td class="text-center">
                            <c:if test="${USER_SESSION.role =='admin'}">
                             <c:if test="${drugs.d_status ==1}">
                                <button type="button" class="btn bg-olive btn-xs" data-toggle="modal"
                                        data-target="#addOrEditModal2" onclick="findById2(${drugs.d_id},'edit_1')"> 编辑
                                </button>
                                 </br></br>
                                 <button type="button" class="btn bg-olive btn-xs" data-toggle="modal"
                                         data-target="#borrowModal1" onclick="findById2(${drugs.d_id},'edit_2')"> 下架
                                 </button>
                             </c:if>

                             <c:if test="${drugs.d_status ==2}">
                                <button type="button" class="btn bg-olive btn-xs" data-toggle="modal"
                                        data-target="#borrowModal2" onclick="findById2(${drugs.d_id},'edit_3')">上架
                                </button>
                            </c:if>
                            </c:if>
                    </td>

                </tr>
            </c:forEach>
            </tbody>
        </table>

        <%--分页插件--%>
        <div id="pagination" class="pagination"></div>
    </div>
    <!-- 数据表格 /-->
</div>
<!-- 数据表格 /-->
<%--引入存放模态窗口的页面--%>
<jsp:include page="/admin/drugs_add.jsp"></jsp:include>
<jsp:include page="/admin/drugs_modal.jsp"></jsp:include>


</body>

<script  type="text/javascript">
	/*分页插件展示的总页数*/
    pageargs.total = Math.ceil(${pageResult.total}/pageargs.pagesize);
	/*分页插件当前的页码*/
    pageargs.cur = ${pageNum}
	/*分页插件页码变化时将跳转到的服务器端的路径*/
	pageargs.gourl = "${gourl}"
	/*保存搜索框中的搜索条件，页码变化时携带之前的搜索条件*/
    bookVO.d_name = "${searchPrescript.d_name}"
    bookVO.d_indication = "${searchPrescript.d_indication}"

	/*分页效果*/
    pagination(pageargs);

    <%--//发送短信，提示--%>
    <%--$(document).on('click', '[id^="one_sms1_"]', function() {--%>
    <%--    // 发送短信前的确认提示--%>
    <%--    let confirmMsg = "你确定发送短信给该用户吗？";--%>
    <%--    if (!confirm(confirmMsg)) {--%>
    <%--        event.stopPropagation(); // 阻止事件冒泡--%>
    <%--        return false; // 阻止默认行为--%>
    <%--    }--%>
    <%--    // 获取表格单元格元素,手机号--%>
    <%--    const phone = $(this).closest('tr').find('.phone').text();--%>
    <%--    console.log("phone:"+phone)--%>
    <%--    // 发送ajax请求至后台控制层--%>
    <%--    $.ajax({--%>
    <%--        url: "${pageContext.request.contextPath}/oneSms",--%>
    <%--        type: "POST",--%>
    <%--        data: {--%>
    <%--            "phone": phone,--%>
    <%--        },--%>
    <%--        dataType: 'json',--%>
    <%--        success: function(result) { // 成功回调函数--%>
    <%--            if (result.success) {--%>
    <%--                // 操作成功--%>
    <%--                alert(result.msg);--%>
    <%--                console.log("result.redirectUrl:", result.redirectUrl);--%>
    <%--                window.location.href = result.redirectUrl;--%>
    <%--            } else {--%>
    <%--                // 操作失败--%>
    <%--                alert(result.msg);--%>
    <%--            }--%>
    <%--        },--%>
    <%--        error: function() {--%>
    <%--            // 请求失败，提示网络错误--%>
    <%--            alert('操作信息错误，请检查操作信息是否正确，稍后再试！');--%>
    <%--        }--%>
    <%--    });--%>
    <%--});--%>


</script>



</html>