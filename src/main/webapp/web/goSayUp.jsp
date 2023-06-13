<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*,com.xmut.pojo.*,com.xmut.service.impl.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<body class="no-skin">
fsajofAS
<input type="button" onclick="" >${chat.u_id}
</body>
</html>