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





<div class="container"  style="width:100%;height:600px;background:url('${pageContext.request.contextPath}/image/regist_bg.jpg');">
    <div class="row">
        <div class="col-md-4">
            <!--<img src="${pageContext.request.contextPath}/image/login.jpg" width="500" height="330" alt="会员登录" title="会员登录">-->
        </div>

        <div class="col-md-5">
            <div style="width:440px;border:1px solid #E7E7E7;padding:20px 0 20px 30px;border-radius:5px;margin-top:200px;background:#fff;">
                <font>修改密码</font>

                <div style="color: red;">${msg }&nbsp;</div>
                <form class="form-horizontal" >


                    <div class="form-group">
                        <label for="upwd" class="col-sm-2 control-label">原密码</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="upwd" placeholder="请输入密码" name="upwd">
                            <div id="accountCheck"></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="npwd" class="col-sm-2 control-label">新密码</label>
                        <div class="col-sm-6">
                            <input type="password" class="form-control" id="npwd" placeholder="请输入新密码" name="npwd" required minlength="6" maxlength="15">

                        </div>
                    </div>
                    <!--
   <div class="form-group">
        <label for="inputPassword3" class="col-sm-2 control-label">验证码</label>
    <div class="col-sm-3">
      <input type="text" class="form-control" id="inputPassword3" placeholder="请输入验证码" name="vcode">
    </div>
    <div class="col-sm-3">
      <img src="${pageContext.request.contextPath}/code"/>
    </div>
    -->
                    <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <%--                    <input type="submit"  width="100" value="修改" name="submit" border="0"--%>
                        <%--                           style="background: url('${pageContext.request.contextPath}/images/login.gif') repeat scroll 0 0 rgba(0, 0, 0, 0);--%>
                        <%--                                   height:35px;width:100px;color:white;">--%>
                        <button id="sub">修改</button>
                    </div>
                </div>
            </div>



        </div>
    </div>
</div>




</body>
<script>
    $('#upwd').blur(function(){
        var upwd = $("#upwd").val();
        if (upwd == null || upwd == "") {
            $("#accountCheck").text("原密码不能为空！");
            $("#accountCheck").css("color","red");

        }else{
            $.ajax({
                type:"POST",
                url:"${pageContext.request.contextPath}/pass.action",
                data:{"upwd":$("#upwd").val()},
                success:function(msg){
                    if(msg == "yes"){
                        $("#accountCheck").text("yes");
                    }else if(msg == "no"){
                        $("#accountCheck").text("原密码错误");
                        $("#accountCheck").css("color","red");
                    }
                }
            });
        }

    });
    $('#sub').click(function(){
        //读取用户的输入——表单序列化

        //密码正确，并且新密码也符合规范才进行ajax请求来修改密码
        if( $("#accountCheck").text()=="yes"){
            //异步提交请求
            $.ajax({
                async: true,
                type: 'POST',
                url: "${pageContext.request.contextPath}/pass2.action",
                data: {"npwd":$("#npwd").val()},//提交整个表单的数据
                success: function(msg){
                    // alert("*"+txt+"*");
                    if(msg=='yes'){  //修改成功
                        alert("修改成功");
                        window.location.href ="index.action";
                    }else{ //修改失败
                       alert("修改失败")
                    }
                }
            });
        }else {
            alert("原密码不正确")
        }
    });
</script>
</html>