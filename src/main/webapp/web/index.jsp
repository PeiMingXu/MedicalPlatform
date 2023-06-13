<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*,com.xmut.pojo.*,com.xmut.service.impl.*"%>
<%@ page import="com.xmut.utils.Pagination" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
    <%
        request.setCharacterEncoding("utf-8");
        Chat chat = (Chat) request.getAttribute("chat");
        List<Chat> chatList = (List<Chat>) request.getAttribute("chatList");
        List<DcPrescript> dcPrescriptList = (List<DcPrescript>) request.getAttribute("dcPrescriptList");
        User user = (User) request.getAttribute("user");
        System.out.println(page);
        System.out.println(user);
        System.out.println(chat);
        System.out.println(chatList);
        System.out.println(dcPrescriptList);
    %>
    <title>智慧医疗</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="My Play Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template,
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
    <script type="application/x-javascript">
        addEventListener("load", function() {
            setTimeout(hideURLbar, 0);
        }, false);

        function hideURLbar() {
            window.scrollTo(0, 1);
        }
    </script>

    <!-- bootstrap -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel='stylesheet' type='text/css' media="all" />
    <!-- //bootstrap -->
    <link href="${pageContext.request.contextPath}/css/dashboard.css" rel="stylesheet">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/style.css">
    <!-- Custom Theme files -->
    <link href="${pageContext.request.contextPath}/css/style1.css" rel='stylesheet' type='text/css' media="all" />

    <script src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
    <!--start-smoth-scrolling-->
    <!-- fonts -->
    <link href='http://fonts.useso.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
    <link href='http://fonts.useso.com/css?family=Poiret+One' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="https://cdn.bootcdn.net/ajax/libs/layui/2.5.6/css/layui.min.css">
    <script src="https://cdn.bootcdn.net/ajax/libs/layui/2.5.6/layui.min.js"></script>
    <!-- //fonts -->
    <link rel="icon" href="${pageContext.request.contextPath}/images/logo.png" type="image/x-icon">
    <style>
        .dropbtn {
            background-color:rgb(5, 90, 215) ;
            color: white;
            padding: 0px;
            font-size: 16px;
            border: none;
        }
        .dropdown {
            padding-left: 20px;
            position: relative;
            display: inline-block;
        }
        .dropdown-content {
            display: none;
            position: absolute;
            background-color: lightgrey;
            min-width: 50px;
            z-index: 1;
        }
        .dropdown-content a {
            padding: 10px 10px;
            width: 50px;
            text-decoration: none;
            display: block;
        }
        .dropdown-content a:hover {background-color: white;}
        .dropdown:hover .dropdown-content {display: block;}
        .dropdown:hover .dropbtn {background-color: rgb(5, 90, 215);}
        .box-body h1 {
            text-align: center;
            color: #333;
        }
        .box-body form {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        }
        .box-body label {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
            color: #333;
        }
        .box-body input[type="text"],
        .box-body input[type="number"],
        .box-body input[type="email"],
        .box-body input[type="tel"] {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 5px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
            font-size: 16px;
            color: #333;
            margin-bottom: 20px;
        }
        .box-body input[type="radio"] {
            margin-right: 10px;
        }
        .box-body input[type="submit"] {
            background-color: #4CAF50;
        : #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .box-body input[type="submit"]:hover {
            background-color: #3e8e41;
        }
        .box-body .error {
            color: red;
            font-size: 14px;
            margin-top: 5px;
        }
    </style>
</head>

<body>

<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="${pageContext.request.contextPath}/index.html">
                <h1><img width="220" height="60" src="${pageContext.request.contextPath}/images/yi.png" alt="" /></h1>
            </a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <div class="top-search" >
                <form class="navbar-form navbar-right" id="search-form">
<%--                    <input type="text" class="form-control"  placeholder="搜索...">--%>
<%--                    <input type="submit" value=" ">--%>
                    <input type="text" class="form-control" name="user_name" placeholder="搜索..." id="search-input">
                    <input type="submit" value=" ">
                </form>
            </div>
            <div class="header-top-right">
<%--                <div class="file">--%>
<%--                    <div class="dropdown">--%>
<%--                        <button class="dropbtn">个人中心</button>--%>
<%--                        <div class="dropdown-content">--%>
<%--                            <a href="javascript:void(0)" >完善信息</a>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
    <div class="file">

        <a href="javascript:void(0)" class="yao_List" style="margin-right: 10px;">药单</a>
    </div>
                <c:if test="${user.role=='doctor'}">


                    <div class="file">

                        <a href="javascript:void(0)" class="view_List">聊天</a>
                    </div>
                    <div class="signin">
                        <a href="javascript:void(0)"  class="update_Doctor_class">完善信息</a>
                    </div>
                </c:if>
                    <div class="signin" style="margin-right: 10px;">
                        <div class="dropdown">
                            <button class="dropbtn">个人中心</button>
                            <div class="dropdown-content">
                                <a href="${pageContext.request.contextPath}/admin/login.jsp" class="play-icon popup-with-zoom-anim">登录</a>
                                <a href="${pageContext.request.contextPath}/admin/login.jsp" class="play-icon popup-with-zoom-anim">注册</a>
                            </div>

                        </div>
                    </div>

<%--                <div class="signin">--%>
<%--                    <a href="${pageContext.request.contextPath}/admin/login.jsp" class="play-icon popup-with-zoom-anim">注册</a>--%>
<%--                </div>--%>
<%--                <div class="signin">--%>

<%--                    </div>--%>
<%--                </div>--%>
                <div class="clearfix"> </div>
            </div>
        </div>
        <div class="clearfix"> </div>
    </div>
</nav>
<div class="col-sm-3 col-md-2 sidebar">
    <div class="top-navigation">
        <div class="t-menu">菜单</div>
        <div class="t-img">
            <img src="./images/lines.png" alt="" />
        </div>
        <div class="clearfix"> </div>
    </div>
    <div class="drop-navigation drop-navigation">
        <ul class="nav nav-sidebar">
            <li><a onclick="clickButton(1)" class="home-icon"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>内科</a></li>
<%--            <li><a onclick="clickButton(1)" class="home-icon"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>内科</a></li>--%>
            <li><a onclick="clickButton(2)" class="home-icon"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>外科</a></li>
    <li><a onclick="clickButton(3)" class="home-icon"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>妇产科学</a></li>
    <li><a onclick="clickButton(4)" class="home-icon"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>骨外科</a></li>
    <li><a onclick="clickButton(5)" class="home-icon"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>儿科</a></li>


            <!-- script-for-menu -->
<%--            <script>--%>
<%--                $("li a.menu1").click(function() {--%>
<%--                    $("ul.cl-effect-2").slideToggle(300, function() {--%>
<%--                        // Animation complete.--%>
<%--                    });--%>
<%--                });--%>
<%--            </script>--%>

            <!-- script-for-menu -->
            <script>
                $("li a.menu").click(function() {
                    $("ul.cl-effect-1").slideToggle(300, function() {
                        // Animation complete.
                    });
                });
            </script>
         </ul>
        <!-- script-for-menu -->
        <script>
            $(".top-navigation").click(function() {
                $(".drop-navigation").slideToggle(300, function() {
                    // Animation complete.
                });
            });
        </script>
    </div>
</div>
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
    <div style="border:0; width:100%;height:600px; background-color:#FFF;">
        <iframe id="iframe" style="width:100%;height:100%;"  frameborder="0" src="${pageContext.request.contextPath}/findByDep1?dc_department=内科">  </iframe>
    </div>
</div>
    <!-- footer -->
    <div class="footer" style="padding-left: 200px;">
        <div class="container">
            <div class="footer-top">
                <div class="footer-top-nav" >
                    <ul style="margin-top: 50px;">
                        <li><a href="${pageContext.request.contextPath}/web/about.html">关于</a></li>
                        <li><a href="${pageContext.request.contextPath}/web/press.html">出版社</a></li>
                        <li><a href="${pageContext.request.contextPath}/web/copyright.html">版权</a></li>
                        <li><a href="${pageContext.request.contextPath}/web/creators.html">创作者</a></li>
                        <li><a href="#">广告</a></li>
                        <li><a href="${pageContext.request.contextPath}/web/developers.html">开发者</a></li>
                    </ul>
                </div>
                <div class="footer-bottom-nav">
                    <ul>
                        <li><a href="${pageContext.request.contextPath}/web/terms.html">条款</a></li>
                        <li><a href="${pageContext.request.contextPath}/web/privacy.html">隐私</a></li>
                        <li><a href="#small-dialog4" class="play-icon popup-with-zoom-anim">发送反馈</a></li>
                        <li><a href="${pageContext.request.contextPath}/web/privacy.html">政策和安全 </a></li>
                        <li><a href="${pageContext.request.contextPath}/web/try.html">尝试新的东西！</a></li>
                        <li>
                            <p>版权 &copy; 2023.厦门理工

                            </p>
                        </li>
                    </ul>
                </div>
            </div>

        </div>
    </div>
</div>
<div class="Manager_style"  id="char_List" style="display:none;">
    <table class="table table-striped table-bordered table-hover">
        <thead>
        <tr align="center">
            <td>姓名</td>
            <td>房间号</td>
            <td>是否在线</td>
<%--            <td>初始聊天创建时间</td>--%>
            <td>操作</td>
        </tr>
        <c:forEach items="${chatList}" var="chat">
            <tr align="center">
<%--                <td>${chat.id}</td>--%>
                <td>${chat.u_name}</td>
                <td>${chat.chat_number}</td>

                <td><c:if test="${chat.status=='在线'}"><font  style="color:green">在线</font></c:if>
                    <c:if test="${chat.status=='未在线'}"><font  style="color:red">未在线</font></c:if>
                </td>
<%--                <td><fmt:formatDate value="${chat.create_time}"--%>
<%--                                    pattern="yyyy-MM-dd HH:mm:ss" /></td>--%>
                <td>
                    <a onclick="clickButton(6,${chat.u_id})"  class="btn btn-primary">进入聊天</a>
                </td>





            </tr>
        </c:forEach>
        </thead>

    </table>
    <button type="button" onclick="shangxian()" class="btn btn-primary" style="float: right;margin-right: 50px;">上线</button>
    <button type="button" onclick="xiaxian()" class="btn btn-primary" style="float: right;margin-right: 50px;">下线</button>
</div>
<div class="Manager_style"  id="gru_List" style="display:none;">
    <table class="table table-striped table-bordered table-hover">
        <thead>
        <tr align="center">
            <td>患者</td>
            <td>医生</td>
            <td>审核状态</td>
            <%--            <td>初始聊天创建时间</td>--%>
            <td>症状</td>
            <td>药品</td>
            <td>药剂师备注说明</td>
        </tr>
        <c:forEach items="${dcPrescriptList}" var="dcPrescript">
            <tr align="center">
                    <%--                <td>${chat.id}</td>--%>
                <td>${dcPrescript.username}</td>
                <td>${dcPrescript.doctorname}</td>

                <td><c:if test="${dcPrescript.p_status==2}"><font  style="color:green">已审核</font></c:if>
                    <c:if test="${dcPrescript.p_status==1}"><font  style="color:red">未审核</font></c:if>
                </td>
                        <td>${dcPrescript.p_symptom}</td>
                        <td>${dcPrescript.p_drugs}</td>
                        <td>${dcPrescript.dr_comment}</td>





            </tr>
        </c:forEach>
        </thead>

    </table>
</div>
<div class="box-body"  id="update_doctor" style="display:none;">
    <form id="myForm"
          enctype="multipart/form-data">
        <input type="hidden" id="user_id"  name="user_id" value=${user.id} readonly="readonly" required><br>
        <label for="user_name">姓名：</label>
        <input type="text" id="user_name" name="user_name" value=${user.name} readonly="readonly" required><br>
        <label for="dc_title">医生职称：</label>
        <input type="text" id="dc_title" name="dc_title" required><br>
        <label for="dc_hospital">医生所属医院：</label>
        <input type="text" id="dc_hospital" name="dc_hospital" required><br>
        <label for="dc_department">医生所属科室：</label>
        <input type="text" id="dc_department" name="dc_department" required><br>
        <label for="dc_speciality">医生特长：</label>
        <input type="text" id="dc_speciality" name="dc_speciality" required><br>
            <label>上传图片：</label>


            <input type="file"  name="file"
                   accept="images/jpeg" id='file' onchange='change()'>


            <label>图片预览：</label>

            <input type="hidden" name="oldimg" id='oldimg' >
            <img
                    src="${pageContext.request.contextPath }/DisplayImage?src=${user.dc_image}"
                    alt="" width="100" height="120" id='preview' /></a>



        <input type="submit" value="提交" id="editUser" style="margin:0 auto !important;">
    </form>
</div>
    <!-- Bootstrap core JavaScript
================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
<!--[if !IE]> -->
<script type="text/javascript">
    window.jQuery || document.write("<script src='${pageContext.request.contextPath }/assets/js/jquery-2.0.3.min.js'>"+"<"+"script>");
</script>
<script src="${pageContext.request.contextPath }/assets/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/typeahead-bs2.min.js"></script>
<!-- page specific plugin scripts -->
<!--[if lte IE 8]>
<script src="${pageContext.request.contextPath }/assets/js/excanvas.min.js"></script>
<![endif]-->
<!-- ace scripts -->
<script src="${pageContext.request.contextPath }/assets/js/ace-elements.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/ace.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/layer/layer.js" type="text/javascript"></script>
<script type="text/javascript">

</script>
<script type="text/javascript">
    function shangxian(){
        window.location.href="${pageContext.request.contextPath}/shangxian"
    }
    function xiaxian(){
        window.location.href="${pageContext.request.contextPath}/xiaxian"
    }
    document.getElementById("search-form").addEventListener("submit", function(event) {
        event.preventDefault();
        var query = document.getElementById("search-input").value;
        search(query);
    });

    function search(query) {
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    var results = JSON.parse(xhr.responseText);
                    displayResults(results);
                } else {
                    console.log("请求出错：" + xhr.status);
                }
            }
        };
        document.getElementById('iframe').src="${pageContext.request.contextPath}/findByName?user_name="+ encodeURIComponent(query);
        return
    }
    function displayResults(results) {
        var ul = document.createElement("ul");
        for (var i = 0; i < results.length; i++) {
            var li = document.createElement("li");
            var a = document.createElement("a");
            a.href = results[i].url;
            a.textContent = results[i].title;
            li.appendChild(a);
            ul.appendChild(li);
        }
        document.body.appendChild(ul);
    }
    // function showPopup() {
        $('.view_List').on('click', function () {
            var index=layer.open({
                type: 1,
                title: '我的聊天  ${user.dc_isonline}',
                area: ['800px', '300px'],
                shadeClose: true,
                content: $('#char_List')
            });

        });
        $('#btn btn-primary').click(function() {
            // 关闭弹窗
            layer.close(index);
        });
    $('.yao_List').on('click', function () {
        var index=layer.open({
            type: 1,
            title: '我的药单',
            area: ['800px', '300px'],
            shadeClose: true,
            content: $('#gru_List')
        });

    });
    $('#btn btn-primary').click(function() {
        // 关闭弹窗
        layer.close(index);
    });
    // }

    function clickButton(src,id){
        switch(src){
            case 1:
                document.getElementById('iframe').src="${pageContext.request.contextPath}/findByDep1?dc_department=内科";
                return;
            case 2:
                document.getElementById('iframe').src="${pageContext.request.contextPath}/findByDep1?dc_department=外科";
                return;
            case 3:
                document.getElementById('iframe').src="${pageContext.request.contextPath}/findByDep1?dc_department=妇产科学";
                return;
            case 4:
                document.getElementById('iframe').src="${pageContext.request.contextPath}/findByDep1?dc_department=骨外科";
                return;
            case 5:
                document.getElementById('iframe').src="${pageContext.request.contextPath}/findByDep1?dc_department=儿科";
                return;
            case 6:
                document.getElementById('iframe').src="${pageContext.request.contextPath}/goSayByDc?u_id="+id;
                return;
            case 7:
                document.getElementById('iframe').src="${pageContext.request.contextPath}/findByDep1?dc_department=内科";
                return;
            // case 5:
            //     document.getElementById('iframe').src="lossList";
            //     return;
            // case 6:
            //     document.getElementById('iframe').src="supplierList";
            //     return;
            // case 7:
            //     document.getElementById('iframe').src="commentList";
            //     return;
        }
    }
    $('.update_Doctor_class').on('click', function(){
        layer.open({
            type: 1,
            title:'完善信息',
            area: ['50%','500px'],
            shadeClose: true,
            content: $('#update_doctor'),
            /* btn:['确认提交'], */
            yes:function(index, layero){
                if ($("#password").val()==""){
                    layer.alert('原密码不能为空!',{
                        title: '提示框',
                        icon:0,

                    });
                    return false;
                }
                if ($("#Nes_pas").val()==""){
                    layer.alert('新密码不能为空!',{
                        title: '提示框',
                        icon:0,

                    });
                    return false;
                }

                if ($("#c_mew_pas").val()==""){
                    layer.alert('确认新密码不能为空!',{
                        title: '提示框',
                        icon:0,

                    });
                    return false;
                }
                if(!$("#c_mew_pas").val || $("#c_mew_pas").val() != $("#Nes_pas").val() )
                {
                    layer.alert('密码不一致!',{
                        title: '提示框',
                        icon:0,

                    });
                    return false;
                }
                else{
                    document.getElementById("submit").click();
                    layer.alert('修改成功！',{
                        title: '提示框',
                        icon:1,
                    });
                    layer.close(index);
                }
            }
        });
    });
    //图片预览
    function change() {
        var pic = document.getElementById("preview"), file = document
            .getElementById("file");
        var ext = file.value.substring(file.value.lastIndexOf(".") + 1)
            .toLowerCase();
        // gif在IE浏览器暂时无法显示
        if (ext != 'png' && ext != 'jpg' && ext != 'jpeg') {
            alert("图片的格式必须为png或者jpg或者jpeg格式！");
            file.value = '';
            return;
        }
        var isIE = navigator.userAgent.match(/MSIE/) != null, isIE6 = navigator.userAgent
            .match(/MSIE 6.0/) != null;
        if (isIE) {
            file.select();
            var reallocalpath = document.selection.createRange().text;
            // IE6浏览器设置img的src为本地路径可以直接显示图片
            if (isIE6) {
                pic.src = reallocalpath;
            } else {
                // 非IE6版本的IE由于安全问题直接设置img的src无法显示本地图片，但是可以通过滤镜来实现
                pic.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod='image',src=\""
                    + reallocalpath + "\")";
                // 设置img的src为base64编码的透明图片 取消显示浏览器默认图片
                pic.src = 'data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw==';
            }
        } else {
            html5Reader(file);
        }
    }
    function html5Reader(file) {
        var file = file.files[0];
        var reader = new FileReader();
        reader.readAsDataURL(file);
        reader.onload = function(e) {
            var pic = document.getElementById("preview");
            pic.src = this.result;
        }
    }
    $("#editUser").click(
        function () {
            var user_id = $("#user_id").val();
            var user_name = $("#user_name").val();
            var dc_title = $("#dc_title").val();
            var dc_hospital = $("#dc_hospital").val();
            var dc_department = $("#dc_department").val();
            var dc_speciality = $("#dc_speciality").val();
            var file = $("#file").val();
            // var f1 = f0.split('\\');
            // var file = ''
            // for(var i = 0; i < f1.length; i++) {
            //    if('.jpg'in f1[i] || '.png'in f1[i]){
            //        file = f1[i]
            //    }
            //
            // };


            // 发送ajax请求至后台控制层
            $.ajax(
                {
                    url:" ${pageContext.request.contextPath}/updateDoctor",
                    type:"POST",
                    data:{
                        user_id:user_id,
                        user_name:user_name,
                        dc_title:dc_title,
                        dc_hospital:dc_hospital,
                        dc_department:dc_department,
                        dc_speciality:dc_speciality,
                        dc_image:file
                    },
                    dataType: 'json',
                    success:function(result) { // 成功回调函数
                        if (result.success) {
                            // 操作成功
                            alert(result.msg);
                            console.log("result.redirectUrl:",result.redirectUrl);
                            clickButton(1)
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
    const form = document.getElementById('myForm');
    const name = document.getElementById('user_name');
    const title = document.getElementById('dc_title');
    const hospital = document.getElementsByName('dc_hospital');
    const department = document.getElementById('dc_department');
    const speciality = document.getElementById('dc_speciality');

    // form.addEventListener('submit', (event) => {
    //     event.preventDefault();
    //     if (validateForm()) {
    //         submitForm();
    //     }
    // });

    // function validateForm() {
    //     let isValid = true;
    //     clearErrors();
    //
    //     return isValid;
    // }
    //
    // function setError(input, message) {
    //     const error = input.parentElement.querySelector('.error');
    //     error.innerText = message;
    //     input.classList.add('error');
    // }
    //
    // function clearErrors() {
    //     const errors = form.querySelectorAll('.error');
    //     errors.forEach(error => {
    //         error.innerText = '';
    //         error.previousElementSibling.classList.remove('error');
    //     });
    // }
    //
    // function submitForm() {
    //     alert("hfj ")
    //     const data = new FormData(form);
    //     fetch('/updateDoctor', {
    //         method: 'POST',
    //         body: data
    //     })
    //         .then(response => {
    //             if (response.ok) {
    //                 alert('提交成功');
    //                 form.reset();
    //             } else {
    //                 alert('提交失败，请稍后再试');
    //             }
    //         })
    //         .catch(error => {
    //             alert('提交失败，请稍后再试');
    //         });
    // }
</script>
</body>

</html>