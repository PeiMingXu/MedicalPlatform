<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="utf-8">
    <title>数据分析</title>
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <!-- 引入刚刚下载的 ECharts 文件 -->
    <script src="${pageContext.request.contextPath}/js/echarts.min.js"></script>
    <script type="text/javascript" src="https://fastly.jsdelivr.net/npm/echarts@5.4.2/dist/echarts.min.js"></script>

</head>
<body style="height: 100%; margin: 0">

<script type="text/javascript">
    $(function () {
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('main'));
        // 指定图表的配置项和数据
        option = {
            title: {
                text: '医生点赞数量',
                subtext: '数据库统计',
                left: 'center'
            },
            xAxis: {
                text: '姓名',
                type: 'category',
                data: []
            },
            yAxis: {
                text: '点赞数',
                type: 'value'
            },
            series: [
                {
                    data: [],
                    type: 'line'
                }
            ]
        };
        $.ajax({
            url: "${pageContext.request.contextPath}/doctorHits",
            datatype:"json",
            type:"post",
            async:false,//同步
            success : function(data) {
                console.log("data:", data);
                var userNames = [];
                var dcEvaluates = [];
                for (var i = 0; i < data.length; i++) {
                    userNames.push(data[i].user_name);
                    dcEvaluates.push(data[i].dc_evaluate);
                }
                //给option赋值
                option.xAxis.data = userNames;
                option.series[0].data = dcEvaluates;
                //使用刚指定的配置项和数据显示图表
                myChart.setOption(option);
            }
        })

    })

</script>

<div id="main" style="width: 100%;height: 600px;"></div>



</body>

</html>

