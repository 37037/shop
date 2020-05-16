<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>登录</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css" />
    <script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"></script>

    <!-- 引入自定义css文件 style.css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/city.css" type="text/css"/>

    <style>
        body{
            margin-top:20px;
            margin:0 auto;
        }
        .carousel-inner .item img{
            width:100%;
            height:300px;
        }
        .container .row div{
            /* position:relative;
            float:left; */
        }

        font {
            color: #666;
            font-size: 22px;
            font-weight: normal;
            padding-right:17px;
        }
    </style>
</head>

<body>




<%@ include file="head.jsp" %>


<%--<c:if test="${not empty user }">--%>
<%--    <jsp:forward page="/index.jsp"></jsp:forward>--%>
<%--</c:if>--%>





<div class="container"  style="width:100%;height:600px;">
    <div class="row">
        <div class="col-md-7">
            <!--<img src="${pageContext.request.contextPath}/image/login.jpg" width="500" height="330" alt="会员登录" title="会员登录">-->
            <div class="list" style="width:400px; height:300px;padding:20px 0 20px 50px;border-radius:5px;margin:80px 0 0 50px;background:#fff;">
               <table border="1">
<%--                   <tr>--%>
<%--                       <td align="center">收货人</td>--%>
<%--                       <td align="center">收货地址</td>--%>
<%--                       <td align="center">收货电话</td>--%>
<%--                       <td align="center">操作</td>--%>
<%--                   </tr>--%>

                <c:forEach items="${list}" var="entry">
                    <tr>
<%--                        <td width="5%" align="center">${entry.person}</td>--%>
<%--                        <td width="5%" align="center">${entry.address}</td>--%>
<%--                        <td width="5%" align="center">${entry.phone}</td>--%>
<%--                        <td width="5%" align="center"><a href="${pageContext.request.contextPath}/deleteaid.action?aid=${entry.aid}">删除</a></td>--%>
                        <div class=" panel panel-default">

                            <div class="panel-heading" >
                               <p>  收货人：${entry.person}</p>
                                 <p>收货电话：${entry.phone}</p>
                            </div>
                            <div class="panel-body">
                                    ${entry.address}
                            </div>
                            <div class="panel-footer" align="center">
                                <a href="${pageContext.request.contextPath}/deleteaid.action?aid=${entry.aid}"><button class="btn btn-success">删除</button></a>
                            </div>
                        </div>
                    </tr>

                </c:forEach>
               </table>
            </div>

            </div>

        <div class="col-md-5">
            <div style="width:440px;border:1px solid #E7E7E7;padding:20px 0 20px 30px;border-radius:5px;margin-top:70px;background:#fff;">
                <font>收货信息</font>

                <div style="color: red;">${msg }&nbsp;</div>
                <form class="form-horizontal" >


                    <!--省份选择-->
                    <select id="prov" onchange="showCity(this)">
                        <option >=请选择省份=</option>

                    </select>

                    <!--城市选择-->
                    <select id="city" onchange="showCountry(this)">
                        <option>=请选择城市=</option>
                    </select>

                    <!--县区选择-->
                    <select id="country" onchange="selecCountry(this)" onblur="showAddr()">
                        <option>=请选择县区=</option>
                    </select>
                    <div style="height: 50px " >

                    </div>



                    <div class="form-group">
                        <label for="address" class="col-sm-4 control-label">收货地址</label>
                        <div class="col-sm-6">
                            <input type="text" id="addr-show" class="form-control" name="address1"  placeholder="省，市，区" readonly>

                        </div>
                    </div>
                    <div class="form-group">
                        <label for="address" class="col-sm-4 control-label">收货详细地址</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="address" placeholder="请输入地址" name="address" >

                        </div>
                    </div>
                    <div class="form-group">
                        <label for="phone" class="col-sm-4 control-label">收货人电话</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="phone" placeholder="请输入电话号码" name="phone" required minlength="11" maxlength="11">

                        </div>
                    </div>
                    <div class="form-group">
                        <label for="person" class="col-sm-4 control-label">收货人</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="person" placeholder="请输入姓名" name="person">

                        </div>
                    </div>
                         <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button id="sub" class="btn met1">添加</button>
                        </div>
                    </div>
                </form>
            </div>



        </div>
    </div>
</div>


<script src="${pageContext.request.contextPath}/js/city.js" ></script>


</body>
<script>
    $('#sub').click(function(){
        if( $("#address").val()!=""&&$("#phone").val()!=""&&$("#person").val()!=""){

            //异步提交请求
            $.ajax({
                type:"POST",
                url:"${pageContext.request.contextPath}/add.action",
                data: {"address":$("#address").val(),
                    "phone":$("#phone").val(),
                    "person":$("#person").val(),
                    "address1":$("#addr-show").val(),
                },//提交整个表单的数据
                success: function(msg){
                    if(msg=='yes'){  //修改成功
                        alert("添加成功");
                        history.go(0)
                    }else{ //修改失败
                        alert("添加失败")
                    }
                }
            });
        }else {
            alert("请填写完整的信息")
        }
    });
    /*根据id获取对象*/
    function my(str) {
        return document.getElementById(str);
    }

    var addrShow = my('addr-show');
    var btn = document.getElementsByClassName('met1')[0];
    var prov = my('prov');
    var city = my('city');
    var country = my('country');
    /*用于保存前所选的省市区*/
    var current = {
        prov: '',
        city: '',
        country: ''
    };

    /*自动加载省份列表*/
    (function showProv() {
        btn.disabled = true;
        var len = provice.length;
        for (var i = 0; i < len; i++) {
            var provOpt = document.createElement('option');
            provOpt.innerText = provice[i]['name'];
            provOpt.value = i;
            prov.appendChild(provOpt);
        }
    })();

    /*根据所选的省份来显示城市列表*/
    function showCity(obj) {
        var val = obj.options[obj.selectedIndex].value;
        if (val != current.prov) {
            current.prov = val;
            addrShow.value = '';
            btn.disabled = true;
        }
        //console.log(val);
        if (val != null) {
            city.length = 1;
            var cityLen = provice[val]["city"].length;
            for (var j = 0; j < cityLen; j++) {
                var cityOpt = document.createElement('option');
                cityOpt.innerText = provice[val]["city"][j].name;
                cityOpt.value = j;
                city.appendChild(cityOpt);
            }
        }
    }

    /*根据所选的城市来显示县区列表*/
    function showCountry(obj) {
        var val = obj.options[obj.selectedIndex].value;
        current.city = val;
        if (val != null) {
            country.length = 1; //清空之前的内容只留第一个默认选项
            var countryLen = provice[current.prov]["city"][val].districtAndCounty.length;
            if (countryLen == 0) {
                addrShow.value = provice[current.prov].name + '-' + provice[current.prov]["city"][current.city].name;
                return;
            }
            for (var n = 0; n < countryLen; n++) {
                var countryOpt = document.createElement('option');
                countryOpt.innerText = provice[current.prov]["city"][val].districtAndCounty[n];
                countryOpt.value = n;
                country.appendChild(countryOpt);
            }
        }
    }

    /*选择县区之后的处理函数*/
    function selecCountry(obj) {
        current.country = obj.options[obj.selectedIndex].value;
        if ((current.city != null) && (current.country != null)) {
            btn.disabled = false;
        }
    }

    /*点击确定按钮显示用户所选的地址*/
    function showAddr() {
        addrShow.value = provice[current.prov].name + '-' + provice[current.prov]["city"][current.city].name + '-' + provice[current.prov]["city"][current.city].districtAndCounty[current.country];
    }


</script>
</html>