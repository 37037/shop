<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/4/9 0009
  Time: 下午 12:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        #notice{
            margin: 0  auto;
            width: 400px;
            margin-top: 50px;

        }
        .noticeboard{
            width: 400px;
            height: 100px;
            float: left;
        }
        .noticebtn{
            float: right;


        }
    </style>
</head>
<body>
<div id="notice">
    <form action="${pageContext.request.contextPath}/admin/updatenotice.action" method="post">
        <textarea placeholder="请填写公告" class="noticeboard" name="notice"></textarea>
        <p><input type="submit" class="noticebtn" value="确定修改"></p>

    </form>

</div>

</body>
</html>
