<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">

<title>提示</title>
    <script src="https://cdn.staticfile.org/echarts/4.3.0/echarts.min.js"></script>

</head>
<body>




<table>
    <tr>
<td>

    <div id="main" style="width: 500px;height:400px;"></div>

</div>
</td>
        <td>
            <div id="main1" style="width: 500px;height:400px;"></div>
        </td>
        </tr>


</table>
<script type="text/javascript">
    var d=[];

    d=${list};
    var data=[{ name:"未付款订单",value:d[0]},
        { name:"已付款订单",value:d[1]},
        { name:"已发货订单",value:d[2]},
        { name:"已完成订单",value:d[3]},
        { name:"已评价订单",value:d[4]},]


    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('main'));

    myChart.setOption({
        tooltip: {
            trigger: 'item',
            formatter: '{a} <br/>{b}: {c} ({d}%)'
        },
        title: {
            text: '订单处理情况'
        },

        series: [
            {

                type: 'pie',
                radius: ['50%', '70%'],
                avoidLabelOverlap: false,
                label: {
                    show: false,
                    position: 'center'
                },
                emphasis: {
                    label: {
                        show: true,
                        fontSize: '30',
                        fontWeight: 'bold'
                    }
                },
                labelLine: {
                    show: false
                },
                data:this.data

            },

        ]

    })
</script>
<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    var myChart1 = echarts.init(document.getElementById('main1'));

    var d1=[];
    d1=${list1}


    var data1=[{ name:"未回复留言",value:d1[0]},
        { name:"未回复留言",value:d1[1]},
    ]

    // 指定图表的配置项和数据
    var option = {
        title: {
            text: '评价回复数据统计'
        },
        tooltip: {},
        legend: {
            data:['销量']
        },
        xAxis: {
            data: ["未回复","已回复"]
        },
        yAxis: {},
        series: [{
            name: '数值',
            type: 'bar',
            data: this.d1
        }]

    };

    // 使用刚指定的配置项和数据显示图表。
    myChart1.setOption(option);
</script>
</body>
</html>