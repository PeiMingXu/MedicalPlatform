<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*,com.xmut.pojo.*,com.xmut.service.impl.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:include page="goSayUp.jsp"></jsp:include>
<!DOCTYPE HTML>
<html>

<head>
    <jsp:useBean id="drugs" class="com.xmut.pojo.Drugs"></jsp:useBean>
    <%
        request.setCharacterEncoding("utf-8");
        Doctor doctor = (Doctor) request.getAttribute("doctor");
        List<Doctor> doctorList = (List<Doctor>) request.getAttribute("doctorList");
        List<Drugs> drugsList = (List<Drugs>) request.getAttribute("drugsList");
        User user = (User) request.getAttribute("user");
        Chat chat = (Chat) request.getAttribute("chat");
        System.out.println(chat);
        System.out.println(user);
        System.out.println(doctor);
        System.out.println(doctorList);
        System.out.println(drugsList);
    %>
    <title>聊天</title>
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
    <link href='${pageContext.request.contextPath}/http://fonts.useso.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
    <link href='${pageContext.request.contextPath}/http://fonts.useso.com/css?family=Poiret+One' rel='stylesheet' type='text/css'>
    <!-- //fonts -->
    <link rel="stylesheet" href="https://cdn.bootcdn.net/ajax/libs/layui/2.5.6/css/layui.min.css">
    <script src="https://cdn.bootcdn.net/ajax/libs/layui/2.5.6/layui.min.js"></script>
    <link rel="icon" href="${pageContext.request.contextPath}/images/logo.png" type="image/x-icon">
    <style type="text/css">
        /*.msg_board {*/
        /*    width: 1250px;*/
        /*    height: 100%;*/
        /*    border: solid 1px darkcyan;*/
        /*    padding: 5px;*/
        /*    overflow-y: scroll;*/
        /*// 文字长度大于div宽度时换行显示*/
        /*word-break: break-all;*/
        /*}*/
        /*!*set srcoll start*!*/
        /*::-webkit-scrollbar*/
        /*{*/
        /*    width: 10px;*/
        /*    height: 10px;*/
        /*    background-color: #D6F2FD;*/
        /*}*/
        /*::-webkit-scrollbar-track*/
        /*{*/
        /*    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);*/
        /*    !*border-radius: 5px;*!*/
        /*    background-color: #D6F2FD;*/
        /*}*/
        /*::-webkit-scrollbar-thumb*/
        /*{*/
        /*    height: 20px;*/
        /*    !*border-radius: 10px;*!*/
        /*    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);*/
        /*    background-color: #89D7F7;*/
        /*}*/
        /*!*set srcoll end*!*/
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
        }
        #chatbox {
            border: 1px solid #ccc;
            border-radius: 5px;
            width: 1250px;
            height: 500px;
            margin: 50px auto;
            padding: 10px;
            overflow-y: scroll;
            background-color: #fff;
        }
        #chatbox p {
            margin: 10px 0;
            display: flex;
        }

        #chatbox p img {
            width: 30px;
            height: 30px;
            margin-right: 10px;
            border-radius: 50%;
        }
        #chatbox p .input_msg {
            flex: 1;
        }
        #inputbox {
            width: 100%;
            margin-top: 10px;
            display: flex;
        }
        #inputbox input[type="text"] {
            flex: 1;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }
        #inputbox input[type="submit"] {
            margin-left: 10px;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }
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
            width: 98%;
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

<body onload="initWebSocket()">
<div id="chatbox" class="msg_board" style="width: 80%;"></div>
<div id="inputbox">
<input id="input_roomName" type="hidden" size="10" maxlength="10"  value=${chat.chat_number}>
<input id="username" type="hidden" size="10" maxlength="10" value=${user.name}>
<c:if test="${user.role=='doctor'}">
    <input type="button"  class="insert_yaodan_class" value="开药单"  /></c:if>
<input type="button" value="退出聊天室" onclick="closeWs()" /><br>
<%--<div class="msg_board" style=""></div>--%>
<input type="text" id="input_msg" placeholder="输入消息...">
<input type="submit" value="发送" onclick="send_msg()" />
</div>
<div class="box-body"  id="insert_yaodan" style="display:none;width: 100%;margin-top: 20px;">
    <h1 style="margin-top: 10px;">药单信息</h1>
<form  style="margin-top: 10px;"
      enctype="multipart/form-data">
    <input type="hidden" id="p_user"  name="p_user" value=${chat.u_id} readonly="readonly" required><br>
    <input type="hidden" id="dc_id"  name="dc_id" value=${chat.dc_id} readonly="readonly" required><br>
    <label for="p_symptom">症状：</label>
    <input type="text" id="p_symptom" name="p_symptom" required><br>

<%--    <select id="fruits" name="fruits" multiple onchange="updateInput()">--%>
<%--        <option value="apple">Apple</option>--%>
<%--        <option value="banana">Banana</option>--%>
<%--        <option value="orange">Orange</option>--%>
<%--        <option value="pear">Pear</option>--%>
<%--    </select>--%>
    <label >药品：</label>
    <select style="width: 100%;" id="fruits" name="fruits" multiple onchange="updateInput()">
        <%

            for (int i = 0; i < drugsList.size(); i++) {
                drugs = drugsList.get(i);
        %>
        <option value="<%=drugs.getD_name()%>" selected><%=drugs.getD_name()%>(<%=drugs.getD_indication()%>)</option>
        <%
            }
        %>
    </select>
    <br>
    <input type="text" id="p_drugs" name="p_drugs">






    <input type="submit" value="提交" id="editUser" style="margin-left: 45% !important;;">
</form>
</div>
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
    var values = [];
    function updateInput() {
        var select = document.getElementById("fruits");
        values.push(select.value)
        document.getElementById("p_drugs").value = values.join(",");
    }
    $('.insert_yaodan_class').on('click', function(){
        layer.open({
            type: 1,
            title:'',
            area: ['100%','500px'],
            shadeClose: true,
            content: $('#insert_yaodan'),
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
    function clickButton(src){
        switch(src){
            case 1:
                document.getElementById('iframe').src="${pageContext.request.contextPath}/findByDep1?dc_department=内科";
                return;
        }
    }
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
        var roomName = document.getElementById("input_roomName").value;
        // 房间名不能为空
        if (roomName == null || roomName == "") {
            alert("请输入房间名");
            return;
        }
        var username = document.getElementById("username").value.trim();
        if (username == "" || username==null) {
            alert("用户名不能为空")
            return;
        }
        if ("WebSocket" in window) {
            // alert("您的浏览器支持 WebSocket!");
            if (webSocket == null) {
                <%--alert(${user.dc_image} === null ? 'default.jpg' : ${user.dc_image});--%>

                var url = "ws://localhost:8080/MedicalPlatform/webSocket/chat/" + roomName+"/"+username+"/${user.dc_image!=null?user.dc_image:'m1.jpg'}";
                // 打开一个 web socket
                // alert(url);
                webSocket = new WebSocket(url);
            } else {
                // window.location.href = "https://www.example.com";
                alert("您已进入聊天室...");
            }

            webSocket.onopen = function () {

                alert("已进入聊天室，畅聊吧...");
            };
            webSocket.onmessage = function (evt) {
                var received_msg = evt.data;
                var msg = received_msg.split('/')
                const chatbox = document.getElementById('chatbox');
                const p = document.createElement('p');
                const img = document.createElement('img');
                // alert("tu"+msg[0]);
                img.src = '${pageContext.request.contextPath}/images/'+msg[0]; // 请替换为实际的头像地址
                const span = document.createElement('span');
                span.className = 'input_msg';
                // alert("chu"+msg[1]);
                span.innerText = msg[1];
                p.appendChild(img);
                p.appendChild(span);
                chatbox.appendChild(p);
                chatbox.scrollTop = chatbox.scrollHeight;
            };

            webSocket.onclose = function () {
                // 关闭 websocket，清空信息板
                alert("连接已关闭...");
                webSocket = null;
                window.location.href = "${pageContext.request.contextPath}/xiaxianChat?dc_department=内科";

                // document.getElementById('chatbox').innerHTML = "";
            };
        }
        else {
            // 浏览器不支持 WebSocket
            alert("您的浏览器不支持 WebSocket!");
        }
    }
    $("#editUser").click(
        function () {
            var p_user = $("#p_user").val();
            var dc_id = $("#dc_id").val();
            var p_symptom = $("#p_symptom").val();
            var p_drugs = $("#p_drugs").val();

            closeWs()
            // 发送ajax请求至后台控制层
            $.ajax(
                {
                    url:" ${pageContext.request.contextPath}/updateDcPrescript",
                    type:"POST",
                    data:{
                        p_user:p_user,
                        dc_id:dc_id,
                        p_symptom:p_symptom,
                        p_drugs:p_drugs,
                    },
                    dataType: 'json',
                    success:function(result) { // 成功回调函数
                        if (result.success) {
                            // 操作成功
                            alert(result.msg);
                            webSocket.close();
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
</script>
<script type="text/javascript">

    //下拉框的数据，视讯编号/视讯名称
    var initlist = ['001/点播视讯','002/直播视讯','003/咪咕视讯'];

    //多选下拉框所在的div
    var selecteddiv = document.getElementById("selectdiv");

    //鼠标是否在【多选下拉框div】上面（如果在div上面，需要控制鼠标的点击事件，不让div隐藏；否则要让该div隐藏）
    var indiv = false;

    //模糊查询input
    var fuzzysearchinput = document.getElementById("fuzzysearch");

    //选中的视讯类型（需要传到后台的参数）
    var selectedlist = [];
    //选中的视讯名称（展示在前台给业务员看的）

    //var selectednamelist = ['点播视讯'];
    var selectednamelist = [];

    window.onload = function(){

        //动态创建所有的checkbox元素
        <%

        for (int i = 0; i < drugsList.size(); i++) {
            drugs=drugsList.get(i);
        %>
            var tmpdiv = document.createElement("div");
            var tmpinput = document.createElement("input");
            tmpinput.setAttribute("name","mycheckbox");
            tmpinput.setAttribute("type","checkbox");
            tmpinput.setAttribute("onclick","mycheck(this)");
            tmpinput.setAttribute("value",<%=drugs.getD_id()%>);


            var tmptext = document.createTextNode(<%=drugs.getD_name()%>);

            tmpdiv.appendChild(tmpinput);
            tmpdiv.appendChild(tmptext);
            //	tmpinput.setAttribute("checked","checked");
            selectdiv.appendChild(tmpdiv);
        <% }%>

        //鼠标点击事件，如果点击在 selectedbutton，或者是在多选框div中的点击事件，不作处理。其他情况的点击事件，将多选空div隐藏
        document.onclick=function(event){
            if(event.target.id=="selectButton" || indiv){
                return;
            }
            selectdiv.style.display="none";
            document.getElementById("fuzzysearchdiv").style.display="none";
        };

        // 设法循环点击 checkbox 使之触发全选
        defaultChecked();

        // 页面加载时 循环遍历 生成初始化默认选择checkbox
        function defaultChecked(){
            for(var i = 0; i < initlist.length; i++){
                //   alert('i======'+i);
            }
        }


    };

    //点击selectButton，展示多选框
    function myclick (){
        //document.getElementById("fuzzysearchdiv").style.display="block";
        selectdiv.style.display="block";
    }

    //鼠标进入多选框的div【selectdiv】
    function mousein(){
        indiv = true;
    }

    //鼠标离开多选框的div【selectdiv】
    function  mouseout(){
        indiv = false;
    }

    //checkbox的点击事件
    function mycheck(obj){

        if(obj.checked){
            selectedlist.push(obj.value);
            selectednamelist.push(obj.nextSibling.nodeValue);
        }else{
            for(var i = 0; i < selectedlist.length; i++){
                if(selectedlist[i] == obj.value){
                    selectedlist.splice(i,1);
                    selectednamelist.splice(i,1);
                }
            }
        }
        document.getElementById("selectButton").value=selectednamelist;
    }

    //模糊查询
    function myfuzzysearch(){
        var checkboxlist = document.getElementsByName("mycheckbox");
        for(var i = 0; i < checkboxlist.length; i++){
            if(checkboxlist[i].nextSibling.nodeValue.indexOf(fuzzysearchinput.value) == -1){
                checkboxlist[i].parentNode.style.display = "none";
            }else{
                checkboxlist[i].parentNode.style.display = "block";
            }
        }
    }


</script>
</html>