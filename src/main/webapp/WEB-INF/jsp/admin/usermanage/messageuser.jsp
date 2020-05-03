<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<HTML>
<HEAD>
    <meta http-equiv="Content-Language" content="zh-cn">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="${pageContext.request.contextPath}/css/Style1.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css" />
    <script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/layer/layer.js"></script>
    <style>
        tr{
            height: 40px;
        }
    </style>
</HEAD>

<body>
<br>
<form id="Form1" name="Form1"  method="post">
    <table cellSpacing="1" cellPadding="0" width="80%" align="center" bgColor="#808080" border="0">
        <TBODY>
        <tr>
            <td class="ta_01" align="center" bgColor="gray">
                <strong>用户列表</strong>
            </TD>
        </tr>

        <tr>
            <td class="ta_01" align="center" bgColor="white">
                <table cellspacing="0" cellpadding="1" rules="all"
                       bordercolor="gray" border="1" id="DataGrid1"
                       style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
                    <tr
                            style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: gray">

                        <td align="center" width="10%">
                            用户名
                        </td>
                        <td align="center" width="10%">
                            密码
                        </td>
                        <td align="center" width="10%">
                            姓名
                        </td>
                        <td align="center" width="10%">
                            电话
                        </td>
                        <td align="center" width="10%">
                            邮箱
                        </td>
                        <td align="center" width="10%" class="info">
                            性别
                        </td>
                        <td align="center" width="10%" class="info">
                            出生日期：
                        </td>
                        <td align="center" width="5%">
                            修改
                        </td>
                        <td align="center" width="5%">
                            删除
                        </td>
                    </tr>
                    <c:forEach items="${page.list }" var="o" varStatus="vs">
                        <tr>
                            <td style="CURSOR: hand; HEIGHT: 22px" align="center"
                                width="10%">
                                    ${o.username }
                            </td>
                            <td style="CURSOR: hand; HEIGHT: 22px" align="center"
                                width="10%">
                                    ${o.password}
                            </td>
                            <td style="CURSOR: hand; HEIGHT: 22px" align="center"
                                width="10%">
                                    ${o.name }
                            </td>
                            <td style="CURSOR: hand; HEIGHT: 22px" align="center"
                                width="17%">
                                    ${o.telephone}
                            </td>
                            <td style="CURSOR: hand; HEIGHT: 22px" align="center"
                                width="10%">
<%--                                   <c:if test="${o.state == 0}">--%>
        <%--                                    未付款--%>
        <%--                                </c:if>--%>
        <%--                                <c:if test="${o.state == 1 }">--%>
        <%--                                    <a href = "${pageContext.request.contextPath }/admin/utilOrder.action?oid=${o.oid}" id="sub">去发货</a>--%>
        <%--                                </c:if>--%>
        <%--                                <c:if test="${o.state == 2 }">--%>
        <%--                                    已发货--%>
        <%--                                </c:if>--%>
        <%--                                <c:if test="${o.state== 3 }">--%>
        <%--                                    订单完成--%>
        <%--                                </c:if>--%>
                                ${o.email}

                            </td>
                            <td align="center" style="HEIGHT: 22px">
                                ${o.sex}
                            </td>
                            <td align="center" style="HEIGHT: 22px">
                                    ${o.birthday}
                            </td>
                            <td align="center" style="HEIGHT: 22px">
                                <a href = "${pageContext.request.contextPath }/admin/updateuser.action?uid=${o.uid}">
                                    <img src="${pageContext.request.contextPath}/images/i_edit.gif" border="0" style="CURSOR: hand">

                                </a>
                            </td>
                            <td align="center" style="HEIGHT: 22px">
                                <a href = "${pageContext.request.contextPath }/admin/deleteuser.action?uid=${o.uid}">
                                    <img src="${pageContext.request.contextPath}/images/i_del.gif" width="16" height="16" border="0" style="CURSOR: hand">

                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </td>
        </tr>
        </TBODY>
    </table>
    <div style="text-align: center;">
        <ul class="pagination">
            <c:if test="${page.curPage != 1 }">
                <li><a href="${pageContext.request.contextPath }/admin/getuser.action?curPage=${page.curPage - 1}" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
            </c:if>

            <c:forEach begin="1" end="${page.totalPage }" var="i">
                <c:if test="${page.curPage == i }">
                    <li class="active"><a>${i }</a></li>
                </c:if>

                <c:if test="${page.curPage != i }">
                    <li><a href="${pageContext.request.contextPath }/admin/getuser.action?curPage=${page.curPage - 1}">${i }</a></li>
                </c:if>
            </c:forEach>
            <c:if test="${page.curPage != page.totalPage }">
                <li>
                    <a href="${pageContext.request.contextPath }/admin/getuser.action?curPage=${page.curPage - 1}" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </c:if>
        </ul>
    </div>

</body>
<script>

</script>
</HTML>

