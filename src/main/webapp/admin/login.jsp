<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>云在线-医疗管理系统</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/webbase.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/pages-login-manage.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/my1.js"></script>
</head>
<body>
<div class="loginmanage">
    <div class="py-container">
        <h4 class="manage-title">云在线-医疗管理系统后台</h4>
        <div class="loginform">
            <ul class="sui-nav nav-tabs tab-wraped">
                <li class="active">
                    <h3>用户登录</h3>
                </li>
            </ul>
            <div class="tab-content tab-wraped">
                <%--登录提示信息--%>
                <span style="color: red">${msg}</span>

                <div id="profile" class="tab-pane  active">
                    <form id="loginform" class="sui-form"  method="post">
                        <div class="input-prepend">
                            <span class="add-on loginname">用户名</span>
                            <input type="text" placeholder="个人手机号" id="phone" class="span2 input-xfat" name="phone">
                        </div>
                        <div class="input-prepend">
                            <span class="add-on loginpwd">密码</span>
                            <input type="password" placeholder="请输入密码" id="password" class="span2 input-xfat" name="password">
                        </div>

                        <div>

                            <table style="width: 100%">
                                <tr >
                                    <td>
                                        <input type="text" id="Code" placeholder="请输入验证码" />
                                    </td>
                                    <td height="34px">
                                        <%--<input type="button" value="获取验证码" id="sendBtn" >--%>
                                     <button id="sendBtn" onclick="startTimer()">验证码</button>
                                     <span id="timer"></span>
                                    </td>
                                </tr>
                            </table>

                        </div>

                        <div class="logined">
                        </br><input class="sui-btn btn-block btn-xlarge btn-danger"  id="login" type="button" value="登&nbsp;&nbsp;录">
                        </div>
                        </br>
                        <div class="logined">
                            <a class="sui-btn btn-block btn-xlarge btn-danger"
                               href='./admin/logon.jsp' target="_self">注&nbsp;&nbsp;册</a>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>

<script type="text/javascript">
    /**
     * 登录超时 展示区跳出iframe
     */
    var _topWin = window;
    while (_topWin != _topWin.parent.window) {
        _topWin = _topWin.parent.window;
    }

    if (window != _topWin)
        _topWin.document.location.href = '${pageContext.request.contextPath}/admin/login.jsp';


        // 点击发送验证码按钮
    $("#sendBtn").click(
           function () {
            // 获取手机号码
            var phone = $("#phone").val();
            var length = phone.length;

            if (phone!="" && phone){

            if(length == 11 && /^0?1[3|4|5|6|7|8|9][0-9]\d{8}$/.test(phone)){
                console.log("phone:==", phone);
                var phone=phone

                var url ="${pageContext.request.contextPath}/sendMss";
                console.log("url:",url);

                // 发送ajax请求至后台控制层
                $.ajax(
                    {
                        url:" ${pageContext.request.contextPath}/sendMss",
                        type:"POST",
                        dataType:'json',
                        data:{"phone":phone},
                        // contentType: "application/json",
                        success: function (result) {
                            // 处理发送结果
                            if (result == "success") {
                                alert("验证码发送成功！请在手机查看验证码");
                            } else {
                                alert("验证码发送失败，请稍后重试！");
                            }
                        },
                        error: function () {
                            alert("发送验证码时发生错误，请稍后重试！");
                        }
                    });

               }else{
                   return alert("手机号格式不正确！请输入正确的手机号");
               }
            }else {
                alert("手机号为空！！！");
            }

           });


    //给登录按钮添加点击事件
    $("#login").click(
        function () {

        // //获取验证码
        // var Code=$("#Code").val();
        //获取手机号
        var phone = $("#phone").val();
        //获取密码
        var password = $("#password").val();
        // 对用户输入的信息进行校验
        //     if (Code === "") {
        //         alert("请输入验证码");
        //         return false;
        //     }
            if (phone === "") {
                alert("请输入手机号");
                return false;
            }
            if (password === "") {
                alert("请输入密码");
                return false;
            }
            $.ajax(
                {
                    url:" ${pageContext.request.contextPath}/login",
                    type:"POST",
                    data:{
                        phone:phone,
                        password:password,
                        // Code:Code
                         },
                    dataType: 'json',
                    success:function(result) { // 成功回调函数
                        if (result.success) {
                            // 登录成功，跳转到主页
                            alert(result.msg);
                            console.log("result.redirectUrl:",result.redirectUrl);
                            window.location.href = result.redirectUrl;

                        } else {
                            // 登录失败，提示错误信息
                            alert(result.msg);
                        }
                    },
                    error: function() {
                        // 请求失败，提示网络错误
                        alert('输入信息错误，请检查登陆信息是否正确，稍后再试！');
                    }
                });
        });

</script>

</html>