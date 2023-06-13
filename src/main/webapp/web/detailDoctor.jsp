<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*,com.xmut.pojo.*,com.xmut.service.impl.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE HTML>
<html>

<head>
    <jsp:useBean id="Doctor" class="com.xmut.pojo.Doctor"></jsp:useBean>
    <%
        request.setCharacterEncoding("utf-8");
        Doctor doctor = (Doctor) request.getAttribute("doctor");
        List<Doctor> doctorList = (List<Doctor>) request.getAttribute("doctorList");
        User user = (User) request.getAttribute("user");
        System.out.println(user);
        System.out.println(doctor);
        System.out.println(doctorList);
    %>
    <title>History</title>
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
    <!-- Custom Theme files -->
    <link href="${pageContext.request.contextPath}/css/style.css" rel='stylesheet' type='text/css' media="all" />
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
        .nav1 {float: left; width:  100%;height: 45px; line-height: 45px;border-top: 3px solid #ddd;border-bottom: 1px solid #ddd;background: #f7f7f7;margin-top: 30px;}
        .nav_zhu {float: left;width:  80%;height: 45px; line-height: 45px;margin: 0px auto;padding-left: 175px;}
        .nav_zhu a:link{text-decoration:none;color:#000;}
        .denglu {float: right; width: 70px; line-height: 41px;}
        .denglujuti_zhuti{display: none;background: #fff; margin-top: 4px;position: absolute;}
        .denglu:hover ul {display: block;list-style:none;}
        .denglujuti_left {float: left;width: 185px;height: 260px;background-color: #6495ED;}
        /*.xinwenxuanxiala {float: right;background: url("image\新浪新闻下拉.gif");background-size:15px 22px;width: 15px;height: 22px;margin-top: 10px;border:1px solid #6495ED;border-left: none;padding-left: 2px;}*/
        .xinwenxuanxiala_menu{display: none;position: absolute;margin-top: 22px;}
        .xinwenxuanxiala:hover ul {display: block;list-style:none}
        .xinwenxuanxiala_menu li {width: 65px;line-height: 22px; border:1px solid #6495ED;margin-left: -50px; list-style:none;background: #fff;margin-left: -92px;}
        .zhuhezhi{float: left;width: 80%;margin-left:174px;text-align: center;}
        .zhuhezhi a {text-decoration:none;color:#000;}
        .main-nav {float: left;width: 1000px;height: 98px;margin-top: 20px;margin-left:20px;}
        .nav-mod-1 {float: left;width: 16%;height: 78px;list-style:none;}
        .nav-mod-1 ul {float: left;min-width: 175px;height: 26px;margin: 0px auto;font-size: 80%;padding:0px;}
        .nav-mod-1 ul li{float: left;min-width: 25%;line-height: 26px; list-style-type: none;}

        .nav-mod-2 {float: left;width: 17%;height: 78px;list-style:none;}
        .nav-mod-2 ul {float: left;min-width: 180px;height: 26px;list-style:none;font-size: 80%;margin: 0px auto;padding:0px;}
        .nav-mod-2 ul li{float: left;min-width: 25%;line-height: 26px;list-style:none;}
        .nav-mod-3 {float: left;width: 8%;height: 78px;list-style:none;}
        .nav-mod-3 ul {float: left;min-width: 58px;height: 26px;list-style:none;padding:0px;font-size: 80%;margin: 0px auto;}
        .nav-mod-3 ul li{float: left;min-width: 80%;line-height: 26px;list-style:none;}
        .nav-mod-4 {float: left;width: 19%;height: 78px;list-style:none;}
        .nav-mod-4 ul {float: left;min-width: 180px;height: 26px;list-style:none;font-size: 80%;margin: 0px auto;padding:0px;}
        .nav-mod-4 ul li{float: left;min-width: 25%;line-height: 26px;list-style:none;}
        /*.kong {float: left;background: url("image\新浪新闻空.gif");background-size:2px 80px;width: 2px;height: 80px;margin-top: 9px;margin-left: 1%;}*/
        .more-list {display: none;float: left;width: 42px;position: absolute;}
        .more-list li {float: left;width: 42px;line-height: 26px;background: #fff;list-style:none;border:1px solid #6495ED;}
        .more:hover ul {display: block;list-style:none;}
        .fanghui {float: left;margin-left: -150px;font-size: 30px;}
        .fanghui a{color: rgb(77, 75, 75);}
        a:hover{color: rgb(59, 136, 236);}
        .xiangqing{float: left;width: 80%;height:580px ;border: 1px solid rgb(202, 202, 202);margin-left: 10%;margin-top: 50px;  }
        .xiangqing-left{float: left;width:53%;}
        .ximg{float: left;width:100%;height:350px ;margin-left: 10px;margin-top: 10px;box-shadow: 5px 5px 3px #888888;}
        .ximg-down{float: left;width:31%;height:150px ;border: 1px solid rgb(59, 136, 236);;margin: 30px auto;margin-left: 11px;margin-top: -10px;}
        .ximg-down a img:hover {transform: scale(1.1,1.1);}
        .ximg-down a img {transition: all 0.8s;overflow: hidden;}
        .ximg-downb {float: left;width: 100%;height: 30px;font-size: 20px;color:rgb(59, 136, 236);font-weight: bold;margin-left: 10px;margin-bottom: 10px;margin-top: 10px; }
        .xiangqing-right{float: right;width:46%;height:580px ;}
        .text-left {float: left;width: 30%;font-weight: bold;height: 10px;line-height: 10px;font-size: 16px;margin:15px 0px 2px 20px;}
        .text-right {float: left;width: 60%;height: 10px;line-height: 10px;margin:15px 10px 10px 0px;}
        .btn {float: left;width: 100%;height: 30px;margin-left: 20px;margin-top: 20px;}
        .btn input{background-color: rgb(59, 136, 236);border:1px solid rgb(126, 127, 128);width: 100px;height: 40px;}
        .btn input a{color: #fff;}
        .jianjie {float: left;width: 90%;height: 300px;margin-left: 20px;margin-top: 40px;}
        .zhuneirong_left_up_up {float: left;width: 100%;height: 40px;border: 1px solid #ddd;background: #f7f7f7;border-right: none;border-left: none;}


        .zhuneirong_left_up_up1 {float: left;width: 15%;line-height: 40px;text-align: center;border:0px;background: #fff;}
        .zhuneirong_left_up_up2{float: left;width: 15%;line-height: 38px;text-align: center;border:0px;border-left: 1px solid #ddd;}
        /* .text{float: left;width:20%;height: 30px;line-height: 30px;font-size: 16px;margin-left: 10px;margin-top: 10px auto;font-weight: bold;}
        .text1 {float:right;color:#666;width: 80%;height: 30px;line-height: 30px;font-size: 15px;} */

        .foot {float: left;height: 28px;color: #666;margin-left:174px;width: 80%;text-align: center;}
        .foot1 {float: left;height: 28px;color: #666;margin-left:174px;width: 80%;text-align: center;}
        .foot2 {float: left;height: 28px;color: #666;margin-left:174px;width: 80%;text-align: center;}
        .foot3 {float: left;height: 28px;color: #666;padding-left: 40px;margin-top: 10px;margin-left:174px;width: 80%;text-align: center;}
        .foot3 li {float: left;line-height: 12px;list-style:none;font-size: 14px;color: #666;margin-left:100px;text-align: center;}
        .foot4 {float: left;height: 28px;color: #666;margin-left:174px;width: 80%;text-align: center;}
        .foot5 {float: left;height: 28px;color: #666;margin-left:174px;width: 80%;text-align: center;}
        a{text-decoration:none;color: #000;}
        a:hover{text-decoration:none;color: rgb(59, 136, 236);}
        .msg_board {
            width: 322px;
            height: 100px;
            border: solid 1px darkcyan;
            padding: 5px;
            overflow-y: scroll;
        // 文字长度大于div宽度时换行显示
        word-break: break-all;
        }
        /*set srcoll start*/
        ::-webkit-scrollbar
        {
            width: 10px;
            height: 10px;
            background-color: #D6F2FD;
        }
        ::-webkit-scrollbar-track
        {
            -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
            /*border-radius: 5px;*/
            background-color: #D6F2FD;
        }
        ::-webkit-scrollbar-thumb
        {
            height: 20px;
            /*border-radius: 10px;*/
            -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,.3);
            background-color: #89D7F7;
        }
        /*set srcoll end*/
    </style>
</head>

<body>

<div class="nav1">
    <div class="nav_zhu">
        <div class="fanghui"><a href="${pageContext.request.contextPath}/findByDep1?dc_department=${doctor.dc_department}">返回</a></div>
    </div>
</div>
<div class="xiangqing">
    <div class="xiangqing-left">
        <div class="ximg">
            <a href="#"><img src="${pageContext.request.contextPath}/images/${doctor.dc_image}" style="width:100%;height:350px;"></a>
        </div>
        <div class="ximg-downb">其他医生推荐</div>
        <c:forEach var="doctorList" items="${doctorList}">
            <div class="ximg-down" ><a href="${pageContext.request.contextPath }/detailDoctor?user_id=${doctorList.user_id}"><img src="${pageContext.request.contextPath }/images/${doctorList.dc_image}" style="width:100%;height:149px;"></a></div>
        </c:forEach>

    </div>
    <div class="xiangqing-right">
        <div class="detail">
            <div class="text-left">姓名：</div><div class="text-right">${doctor.user_name}
            <c:if test="${doctor.dc_isonline=='未在线'}"><font  style="color:red;padding-left: 50px">未在线</font></c:if>
            <c:if test="${doctor.dc_isonline=='在线'}"><font  style="color:green;padding-left: 50px">在线</font></c:if>
            </div>
            <div class="text-left">手机：</div><div class="text-right">${doctor.user_phone}</div>
            <div class="text-left">医生职称：</div><div class="text-right">${doctor.dc_title}</div>
            <div class="text-left">医生所属医院：</div><div class="text-right">${doctor.dc_hospital}</div>
            <div class="text-left">医生所属科室：</div><div class="text-right">${doctor.dc_department}</div>
            <div class="text-left">医生点赞数：</div><div class="text-right"><font style="color: #9f191f">${doctor.dc_evaluate}</font><a style="padding-left: 10px;color:darkred;" href="${pageContext.request.contextPath}/dianzan?user_id=${doctor.user_id}">点赞</a></div>
            <div class="btn">
                <c:if test="${user.role=='user'}">
                    <button type="button"   style="background-color:#fff;">
                        <a href="${pageContext.request.contextPath }/jifen?user_id=${doctor.user_id}" onclick="return confirm('此操作会扣除用户积分，确定进行此操作吗?')">进入聊天</a>
                            <%--                    class="insert_say_class"--%>
                    </button>
                </c:if>

<%--                <a href="javascript:void(0)" class="insert_say_class"><input type="button" value="进入聊天" style="color:#fff;"></a>--%>
            </div>
            <div class="jianjie">
                <div class="zhuneirong_left_up_up">
                    <div class="zhuneirong_left_up_up1"  onmouseover="disp(0)"><a href="#">特长</a></div>
                </div>
                <div class="box-content" id="first-disp">
                    <div class="zhuneirong_left_up_down" style="font-size:18px;">
                        <z>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${doctor.dc_speciality}</z>
                    </div>
                </div>
            </div>
            <!-- <input type="button" value="进入服务通道"> -->
        </div>
    </div>
</div>
<div class="box-body"  id="goSay" style="display:none;">
    <input type="hidden" id="input_roomName" size="10" maxlength="10" value=${doctor.user_id}>
    <input type="hidden" id="username" size="10" maxlength="10" value=${user.name}>
    <input type="button"  value="进入聊天室" onclick="initWebSocket()" />
    <input type="button" value="退出聊天室" onclick="closeWs()" /><br>
    <div class="msg_board"></div>
    <input id="input_msg" size="43" maxlength="40">
    <input type="button" value="发送" onclick="send_msg()" />
</div>
<div class="qita"></div>
<div class="foot">24小时客户服务热线：4000520066 010-82623378 <a href="#">常见问题解答</a> <a href="#">互联网违法和不良信息举报</a></div>
<div class="foot1">违法和不良信息举报电话：4000520066 举报邮箱：<a href="#">jubao@vip.sina.com</a></div>
<div class="foot2"><a href="#">医疗网中心意见反馈留言板</a></div>
<div class="foot3">
    <ul>
        <li><a href="#">医疗网站简介</a></li>
        <li><a href="#">广告服务</a></li>
        <li><a href="#">联系我们</a></li>
        <li><a href="#">网站律师</a></li>
        <li><a href="#">项目答疑</a></li>
    </ul>
</div>
<div class="foot4">Copyright © 1996-2020 SINA Corporation, All Rights Reserved</div>
<div class="foot5">zyj公司 <a href="#">版权所有</a></div>
<script src="${pageContext.request.contextPath }/js/jquery.js" type="text/javascript"></script>
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
    var LL=document.getElementsByClassName('zhuneirong_left_up_up1');
    var cont=document.getElementsByClassName('box-content');

    function disp(i){

        switch(i){
            case 0:
                cont[0].style="display:block";
                cont[1].style="display:none";
                LL[0].style="border-top:2px solid #fff;border-bottom:none;background-color:#fff;";
                LL[1].style="border-top:none;background-color:#eee;";
                break;
            case 1:
                cont[1].style="display:block";
                cont[0].style="display:none";
                LL[1].style="border-top:2px solid #fff;border-bottom:none;background-color:#fff;";
                LL[0].style="border-top:none;background-color:#eee;";
                break;

        }


    }
    function show(){
        cont[0].style="display:block";
        cont[1].style="display:none";

        LL[0].style="border-top:2px solid #fff;border-bottom:none;background-color:#fff;";
        LL[1].style="border-top:none;background-color:#eee;";

    }
    function deng(){
        var y= prompt("请输入zyj旅游网在线购票账号：");
        var m= prompt("请输入zyj旅游网在线购票密码：","******");

        if (y=='1705260213' && m=='******') {
            self.location='旅游景点.html';
        } else {
            alert("账户或密码错误！！！")
        }
    }
     var layer ;
   layui.use('layer', function(){
       layer = layui.layer;
   });
    $('.insert_say_class').on('click', function(){
        layer.open({
            type: 1,
            title:'聊天室',
            area: ['50%','400px'],
            shadeClose: true,
            content: $('#goSay'),
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
</script>
</body>
<script type="text/javascript">
    var webSocket;

    function send_msg() {
        if (webSocket != null) {
            var input_msg = document.getElementById("input_msg").value.trim();
            if (input_msg == "") {
                return;
            }
            webSocket.send(input_msg);
            // 清除input框里的信息
            document.getElementById("input_msg").value = "";
        } else {
            alert("您已掉线，请重新进入聊天室...");
        }
    };

    function closeWs() {
        webSocket.close();
    };

    function initWebSocket() {
        // alert(user_id+user_name);
        <%--var roomName = ${user.user_id}--%>
        var roomName =  document.getElementById("input_roomName").value;
        // 房间名不能为空
        if (roomName == null || roomName == "") {
            alert("请输入房间名");
            return;
        }
        <%--var username = ${user.user_name}--%>
        var username =document.getElementById("username").value.trim();
        if (username == "" || username==null) {
            alert("用户名不能为空")
            return;
        }
        if ("WebSocket" in window) {
            alert("您的浏览器支持 WebSocket!");
            if (webSocket == null) {
                var url = "ws://localhost:8080/MedicalPlatform/webSocket/chat/" + roomName+"/"+username;
                // 打开一个 web socket
                webSocket = new WebSocket(url);
            } else {
                window.location.href = "${pageContext.request.contextPath}/jifen?user_id="+${doctor.user_id}
                alert("您已进入聊天室...");
            }

            webSocket.onopen = function () {
                alert("已进入聊天室，畅聊吧...");
            };
            webSocket.onmessage = function (evt) {
                //alert(evt.data)
                var msg_board = document.getElementsByClassName("msg_board")[0];
                var received_msg = evt.data;
                var old_msg = msg_board.innerHTML;
                msg_board.innerHTML = old_msg + received_msg + "<br>";
                // 让滚动块往下移动
                msg_board.scrollTop = msg_board.scrollTop + 40;
            };

            webSocket.onclose = function () {
                // 关闭 websocket，清空信息板
                alert("连接已关闭...");
                webSocket = null;
                document.getElementsByClassName("msg_board")[0].innerHTML = "";
            };
        }
        else {
            // 浏览器不支持 WebSocket
            alert("您的浏览器不支持 WebSocket!");
        }
    }
    function redirectTo(url) {
        window.location.href = url;
    }


</script>
</html>