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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css" />

    <style>
        body {
            margin-top: 20px;
            margin: 0 auto;
        }

        .carousel-inner .item img {
            width: 100%;
            height: 300px;
        }
    </style>
</head>

<body>

<%@ include file="head.jsp" %>

<div class="container">
    <div class="row">

        <div style="margin:0 auto; margin-top:10px;width:950px;">
            <strong>订单详情</strong>
            <form action="${pageContext.request.contextPath }/tocomments.action?oid=${oid}">
            <table class="table table-bordered">
                <tbody>
                <tr class="warning">
                    <th>图片</th>
                    <th>商品</th>

                    <th>评论</th>
<%--                    <th>操作</th>--%>
                    <th style="display: none">id</th>
                    <th style="display: none">oid</th>



                </tr>

                <c:forEach items="${list }" var="orderitem" varStatus="v">
                    <tr class="active">
                        <td  width="20%">
                            <input type="hidden"  value="22">
                            <img src="${pageContext.request.contextPath}/pic/${orderitem.product.pimage}" width="70" height="60">
                        </td>

                        <td width="20%">
                            <a>${orderitem.product.pname }</a>
                        </td>
                        <td width="10%">
                            <input type="text" name="comment${v.index}" placeholder="请评论">
                        </td>
<%--                        <td width="10%">--%>
<%--                           <button type="button" onclick="my(this)" >确定</button>--%>
<%--                        </td>--%>
                        <td width="10%" style="display: none" >
                            <input type="text" name="pid${v.index}" value="${orderitem.product.pid}">
                        </td>
                        <td width="10%" style="display: none" >
                        <input type="text" name="oid${v.index}" value="${oid}">
                    </td>
                    </tr>
                </c:forEach>
                <tr>
                    <td colspan="4" align="center"><input class="btn btn-success" type="submit" width="100px"></td>
                </tr>
                </tbody>
            </table>
            </form>
        </div>
    </div>

</div>

</body>
<script>

<%--function my(obj) {--%>
<%--    var $td = $(obj).parents('tr').children('td');--%>
<%--    var pid= $td.eq(4).find("a").text();--%>
<%--    var comments= $td.eq(2).find("input").val();--%>
<%--    $(obj).parents('tr').style.display="none";--%>
<%--    console.log(pid);--%>
<%--    console.log(comments);--%>
<%--    $.ajax({--%>
<%--            url:"${pageContext.request.contextPath }/tocomments.action",--%>
<%--            type:"post",--%>
<%--            data: {"pid":pid,--%>
<%--                "comments":comments},--%>
<%--            success: function(msg){--%>
<%--                if(msg=="yes"){--%>
<%--                    alert("success")--%>

<%--                }else {--%>
<%--                    alert("fail")--%>

<%--                }--%>
<%--            }--%>

<%--        }--%>
<%--    )--%>
<%--}--%>

var oid=${oid};
console.log(oid);

</script>
</html>