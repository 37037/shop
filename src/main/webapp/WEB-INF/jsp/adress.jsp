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
                   <tr>
                       <td align="center">收货人</td>
                       <td align="center">收货地址</td>
                       <td align="center">收货电话</td>
                       <td align="center">操作</td>
                   </tr>

                <c:forEach items="${list}" var="entry">
                    <tr>
                        <td width="5%" align="center">${entry.person}</td>
                        <td width="5%" align="center">${entry.address}</td>
                        <td width="5%" align="center">${entry.phone}</td>
                        <td width="5%" align="center"><a href="${pageContext.request.contextPath}/deleteaid.action?aid=${entry.aid}">删除</a></td>

                    </tr>

                </c:forEach>
               </table>
            </div>

            </div>

        <div class="col-md-5">
            <div style="width:440px;border:1px solid #E7E7E7;padding:20px 0 20px 30px;border-radius:5px;margin-top:200px;background:#fff;">
                <font>收货信息</font>

                <div style="color: red;">${msg }&nbsp;</div>
                <form class="form-horizontal" >


                    <div class="form-group">
                        <label for="person" class="col-sm-4 control-label">收货人</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="person" placeholder="请输入姓名" name="person">

                        </div>
                    </div>
                    <div class="form-group">
                        <label for="address" class="col-sm-4 control-label">收货地址</label>
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
                        <div class="col-sm-offset-2 col-sm-10">
                            <button id="sub">添加</button>
                        </div>
                    </div>
                </form>
            </div>



        </div>
    </div>
</div>




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
</script>
</html>