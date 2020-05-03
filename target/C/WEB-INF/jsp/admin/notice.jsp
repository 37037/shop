<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
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
            height: 150px;

        }
        .noticeboard{
            width: 400px;
            height: 100px;
            float: left;
        }
        .noticebtn{
            float: right;


        }
        #one{
            margin: 0 auto;
            margin-top: 100px;
        }
    </style>
</head>
<body>

    <form id="notice" action="${pageContext.request.contextPath}/admin/updatenotice.action" method="post">
        <textarea placeholder="请填写公告" class="noticeboard" name="notice"></textarea>
        <p><input type="submit" class="noticebtn" value="确定修改"></p>
    </form>




    <table id="one" border="1">
        <tr>
            <th align="center">序号</th>
            <th align="center">内容</th>
            <th align="center">时间</th>
            <th align="center">操作</th>
        </tr>
        <c:forEach items="${list}" var="o"  varStatus="vs">
            <tr>
                <td align="center" width="5%">${vs.count}</td>
                <td align="center" width="5%">${o.notice}</td>
                <td align="center" width="5%"><fmt:formatDate value="${o.time}" pattern="yyyy-MM-dd"/></td>
                <td align="center" width="5%"><a href="${pageContext.request.contextPath}/admin/deletenotice.action?nid=${o.nid}">删除</a></td>
            </tr>
        </c:forEach>
    </table>

</body>
</html>
