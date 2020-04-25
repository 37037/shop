<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/4/5 0005
  Time: 下午 5:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>管理员登录</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css" />
    <script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"></script>
    <link rel="stylesheet" href="https://cdn.staticfile.org/font-awesome/4.7.0/css/font-awesome.css">
    <style>
        body{
            background-image: url("../../../C/pic/123.jpg");
            background-repeat:no-repeat;
            background-size: 100% auto;
        }
        #one{
            margin: 0 auto;
            height: auto;
            width: 500px;
            margin-top: 100px;
background: #2F3F5B40;
            border: 1px solid #2F3F5B;
            text-align: center;
            padding: 20px 50px;
            color: white;





        }
        #one .two{
            margin-top: 50px;
        }
        input{
            border: 0;
            border-bottom: 2px solid #f1f1f1;
            padding: 5px 10px;
            background: #00000000;
            color: white;
            width: 260px;


        }
        .three{
            margin-top: 40px;

        }
        button{
            color: black;
            width: 180px;
            height: 30px;
            font-size: 18px;
            font-weight: 700;
            background-image: linear-gradient(120deg, #a6c0fe 0%, #f68084 100%);
        }
    </style>
</head>
<body>

<div id="one">
    <h1>adminLogin</h1>
    <div class="two">

        <div class="three">
            <i class="fa fa-user-circle-o" > </i>
            <input type="text" id="acount" name="acount" placeholder="username">
        </div>

        <div class="three">
            <i class="fa fa-key" aria-hidden="true"> </i>
             <input type="password" id="pwd" name="pwd" placeholder="password">
        </div>

    </div>

    <br>
    <button id="sub" >Login</button>
</div>
</body>
<script>
    $("#sub").click(function () {
        $.ajax({

            type:"POST",
            url:"${pageContext.request.contextPath}/admin/doLogin.action",
            data:{"pwd":$("#pwd").val(),
                "acount":$("#acount").val(),

            },
            success:function(msg){
                if(msg == "yes"){
                    alert("成功");
                    window.location.href ="index.action";
                }else if(msg == "no"){
                    alert("登录失败");
                }
            }
        });
    })
</script>
</html>
