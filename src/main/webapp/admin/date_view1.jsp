<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="utf-8">
    <title>积分统计</title>
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <!-- 引入 ECharts 文件 -->
    <script src="${pageContext.request.contextPath}/js/echarts.min.js"></script>
    <script type="text/javascript" src="https://fastly.jsdelivr.net/npm/echarts@5.4.2/dist/echarts.min.js"></script>
</head>

<body style="height: 100%; margin: 0">
<script type="text/javascript">
    $(function () {
        // 1.基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('main1'));
        // 2.指定图表的配置项和数据 option
        option = {
            title: {
                text: '用户积分的数量',
                subtext: '数据库统计',
                left: 'center'
            },
            xAxis: {
                type: 'category',
                data: []
            },
            yAxis: {
                type: 'value'
            },
            series: [
                {
                    data: [],
                    type: 'bar',
                    showBackground: true,
                    backgroundStyle: {
                        color: 'rgba(180, 180, 180, 0.2)'
                    }
                }
            ]
        };
        $.ajax({
            url: "${pageContext.request.contextPath}/userPoints",
            datatype:"json",
            type:"post",
            async:false,//同步
            success : function(data) {
                console.log("data:", data);
                var userNames = [];
                var user_balance = [];
                for (var i = 0; i < data.length; i++) {
                    userNames.push(data[i].user_name);
                    user_balance.push(data[i].user_balance);
                }
                //给option赋值
                option.xAxis.data = userNames;
                option.series[0].data = user_balance;
                //使用刚指定的配置项和数据显示图表
                myChart.setOption(option);
            }
        })

    })

</script>

<div id="main1" style="width: 100%;height: 600px;"></div>


</body>

</html>

