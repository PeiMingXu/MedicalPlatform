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
        List<Doctor> allList = (List<Doctor>) request.getAttribute("doctorList");
        System.out.println(allList);
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
    <link href='${pageContext.request.contextPath}/http://fonts.useso.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
    <link href='${pageContext.request.contextPath}/http://fonts.useso.com/css?family=Poiret+One' rel='stylesheet' type='text/css'>
    <!-- //fonts -->
    <link rel="icon" href="${pageContext.request.contextPath}/images/logo.png" type="image/x-icon">
    <style>
        .list-container {
            width: 100%;
            height: 300px;
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }

        .list-item {
            width: 100%;
            height: 150px;
            margin-bottom: 30px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        }

        .item-image {
            float: left;
            padding-left: 20px;
            margin-top: 20px;
            width: 150px;
            height: 120%;
            overflow: hidden;
        }

        .item-image img {
            width: 120%;
            height: auto;
            object-fit: cover;
        }

        .item-info {
            float: left;
            padding: 20px;
            width: 80%;
        }

        .item-info h3 {
            margin-top: 0;
            font-size: 20px;
        }

        .item-info p {
            margin: 0px;
            font-size: 16px;
            color: #666;
        }
    </style>
</head>

<body>

<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
    <div class="show-top-grids">
        <div class="main-grids news-main-grids">
            <div class="recommended-info">
                <div class="slideshow-container">
                    <div class="slideshow">

                        <img src="${pageContext.request.contextPath}/images/gl1.jpg"  width="1250" height="250">
                        <img src="${pageContext.request.contextPath}/images/gl2.jpg"  width="1250" height="250">
                        <img src="${pageContext.request.contextPath}/images/gl3.jpg"  width="1250" height="250">
                        <img src="${pageContext.request.contextPath}/images/gl4.jpg"  width="1250" height="250">
                        <img src="${pageContext.request.contextPath}/images/gl5.jpg"  width="1250" height="250">

                    </div>
                </div>

                <div class="list-container" style="margin-top: 20px;">
                    <c:forEach var="doctorList" items="${doctorList}">

                        <div class="list-item">
                            <a href="${pageContext.request.contextPath }/detailDoctor?user_id=${doctorList.user_id}">
                            <div class="item-image" width="100" height="120">
                                <img src="${pageContext.request.contextPath }/images/${doctorList.dc_image}">
                            </div>
                            <div class="item-info">
                                <h3>${doctorList.user_name}<font  style="font-size: 14px;"> | ${doctorList.dc_title} | ${doctorList.dc_hospital} | ${doctorList.dc_department}</font></h3><h4 style="float: right;color: #9f191f;margin-top: 20px;">点赞数：${doctorList.dc_evaluate}</h4>
                                <p></p>
                                <p style="margin-top: -10px;"><font  style="font-size: 16px;font-weight: bolder;">特长：</font>${doctorList.dc_speciality}</p>
                            </div>
                            </a>
                        </div>

                    </c:forEach>
                </div>

    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        var slideIndex = 0;
        var slides = document.getElementsByClassName("slideshow")[0].children;
        var timer;

        showSlide(slideIndex);

        function showSlide(index) {
            if (index >= slides.length) {
                slideIndex = 0;
            } else if (index < 0) {
                slideIndex = slides.length - 1;
            } else {
                slideIndex = index;
            }
            for (var i = 0; i < slides.length; i++) {
                slides[i].style.display = "none";
            }
            slides[slideIndex].style.display = "block";
        }

        function nextSlide() {
            showSlide(slideIndex + 1);
        }

        function prevSlide() {
            showSlide(slideIndex - 1);
        }

        function startSlideShow() {
            timer = setInterval(function() {
                nextSlide();
            }, 3000);
        }

        function stopSlideShow() {
            clearInterval(timer);
        }

        startSlideShow();

    </script>
    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
</div>
</body>

</html>