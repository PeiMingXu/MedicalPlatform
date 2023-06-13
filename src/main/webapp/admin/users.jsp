<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="utf-8">
    <title>用户管理</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/AdminLTE.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/pagination.css">
    <script src="${pageContext.request.contextPath}/js/jquery.min.js" ></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
    <script  type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/js/pagination.js"></script>
    <script src="${pageContext.request.contextPath}/js/my.js"></script>
</head>

<body class="hold-transition skin-red sidebar-mini">
<!-- .box-body -->
<div class="box-header with-border">
    <h3 class="box-title">用户管理</h3>
</div>
<div class="box-body">

    <%--新增按钮：如果当前登录用户是管理员，页面展示新增按钮--%>
    <c:if test="${USER_SESSION.role =='admin'}">
        <div class="pull-left">
            <div class="form-group form-inline">
                <div class="btn-group">
                    <button type="button" class="btn btn-default" title="新建" data-toggle="modal"
                            data-target="#addOrEditModal" onclick="resetFrom()"> 新增
                    </button>
                </div>
            </div>
        </div>
    </c:if>
    <%--新增按钮 /--%>

    <!--工具栏 数据搜索 -->
    <div class="box-tools pull-right">
        <div class="has-feedback">
            <form action="${pageContext.request.contextPath}/search" method="post">
                用户名称：<input name="name" value="${search.name}">&nbsp&nbsp&nbsp&nbsp
                用户账号：<input name="phone" value="${search.phone}">&nbsp&nbsp&nbsp&nbsp
                用户角色：<input name="role" value="${search.role}">&nbsp&nbsp&nbsp&nbsp
                <input class="btn btn-default" type="submit" value="查询">
            </form>
        </div>
    </div>

    <!--工具栏 数据搜索 /-->
    <!-- 数据列表 -->
    <div class="table-box">

        <!-- 数据表格 -->
        <table id="dataList" class="table table-bordered table-striped table-hover dataTable text-center">
            <thead>
            <tr>
                <th class="sorting_asc">用户名称</th>
                <th class="sorting">用户密码</th>
                <th class="sorting">用户账号</th>
                <th class="sorting">用户角色</th>
                <th class="sorting">用户状态</th>
                <th class="text-center">操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${pageResult.rows}" var="user">
                <tr>

                    <td> ${user.name}</td>
                    <td>${user.password}</td>
                    <td>${user.phone}</td>
                    <td>${user.role}</td>

                    <td>
                        <c:if test="${user.status ==0}">正常</c:if>
                        <c:if test="${user.status ==1}">禁用</c:if>
                    </td>

                    <td>${user.status }</td>
                    <td class="text-center">

                        <c:if test="${user.status ==0}">
                            <c:if test="${user.phone!=USER_SESSION.phone}">
                            <button type="button" class="btn bg-olive btn-xs" data-toggle="modal"
                                    data-target="#borrowModal" onclick="findById(${user.id},'borrow')"> 封禁
                            </button>
                            </c:if>

                            <c:if test="${USER_SESSION.role =='admin'}">
                                <button type="button" class="btn bg-olive btn-xs" data-toggle="modal"
                                        data-target="#addOrEditModal1" onclick="findById(${user.id},'edit')"> 编辑
                                </button>
                            </c:if>
                        </c:if>
                        <c:if test="${user.status ==1 }">
                            <button type="button" class="btn bg-olive btn-xs" disabled="true">禁用</button>
                            <button type="button" class="btn bg-olive btn-xs" data-toggle="modal"
                                    data-target="#borrowModal1" onclick="findById(${user.id},'borrow1')">解封</button>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <!--数据表格/-->
        <%--分页插件--%>
        <div id="pagination" class="pagination"></div>
    </div>
    <!--数据列表/-->
</div>

<!-- /.box-body -->
<%--引入存放模态窗口的页面--%>
<jsp:include page="/admin/users_modal.jsp"></jsp:include>
<jsp:include page="/admin/u_add.jsp"></jsp:include>


</body>


<script type="text/javascript">
    /*分页插件展示的总页数*/
    pageargs.total = Math.ceil(${pageResult.total}/pageargs.pagesize);
    /*分页插件当前的页码*/
    pageargs.cur = ${pageNum}
    /*分页插件页码变化时将跳转到的服务器端的路径*/
    pageargs.gourl = "${gourl}"
    /*保存搜索框中的搜索条件，页码变化时携带之前的搜索条件*/
    bookVO.name = "${search.name}"
    bookVO.author = "${search.phone}"
    bookVO.press = "${search.role}"
    /*分页效果*/
    pagination(pageargs);




</script>

</html>