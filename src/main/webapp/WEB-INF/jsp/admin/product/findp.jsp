<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<HTML>
<HEAD>
    <meta http-equiv="Content-Language" content="zh-cn">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css" />
    <script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"></script>
    <!-- 引入自定义css文件 style.css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css" />
    <link href="${pageContext.request.contextPath}/css/Style1.css" rel="stylesheet" type="text/css" />
    <script language="javascript" src="${pageContext.request.contextPath}/js/public.js"></script>
    <script type="text/javascript">
        function addProduct(){
            window.location.href = "${pageContext.request.contextPath}/admin/showAddProduct.action";
        }
    </script>
</HEAD>
<body>
<br>
<form id="Form1" name="Form1" action="${pageContext.request.contextPath}/admin/find.action?curPage=1" method="post">
    <table cellSpacing="1" cellPadding="0" width="80%" align="center" bgColor="#808080" border="0">
        <TBODY>
        <tr>
            <td class="ta_01" align="center" bgColor="gray">
                <strong>商品列表</strong>
            </TD>
        </tr>

        <tr>
            <td class="ta_01" align="center" bgColor="#f5fafe">
                <table cellspacing="0" cellpadding="1" rules="all"
                       bordercolor="gray" border="1" id="DataGrid1"
                       style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
                    <tr
                            style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: gray">
                        <td align="center" width="18%">
                            序号
                        </td>
                        <td align="center" width="17%">
                            商品图片
                        </td>
                        <td align="center" width="17%">
                            商品名称
                        </td>

                        <td align="center" width="17%">
                            商品价格
                        </td>
                        <td align="center" width="17%">
                            商品数量
                        </td>
                        <td width="7%" align="center">
                            编辑
                        </td>
                        <td width="7%" align="center">
                            删除
                        </td>
                    </tr>
                    <c:forEach items="${page.list }" var="p" varStatus="vs">
                        <tr onmouseover="this.style.backgroundColor = 'white'"
                            onmouseout="this.style.backgroundColor = '#F5FAFE';">
                            <td style="CURSOR: hand; HEIGHT: 22px" align="center"
                                width="18%">
                                    ${vs.count }
                            </td>
                            <td style="CURSOR: hand; HEIGHT: 22px" align="center"
                                width="17%">
                                <img width="40" height="45" src="${ pageContext.request.contextPath }/pic/${p.pimage}">
                            </td>
                            <td style="CURSOR: hand; HEIGHT: 22px" align="center"
                                width="17%">
                                    ${p.pname }
                            </td>
                            <td style="CURSOR: hand; HEIGHT: 22px" align="center"
                                width="17%">
                                    ${p.shop_price }
                            </td>
                            <td style="CURSOR: hand; HEIGHT: 22px" align="center"
                                width="17%">
                                    ${p.pcount}
                            </td>
                            <td align="center" style="HEIGHT: 22px">
                                <a href="${ pageContext.request.contextPath }/admin/editProduct.action?pid=${p.pid}">
                                    <img src="${pageContext.request.contextPath}/images/i_edit.gif" border="0" style="CURSOR: hand">
                                </a>
                            </td>

                            <td align="center" style="HEIGHT: 22px">
                                <a href="${ pageContext.request.contextPath }/admin/deleteProduct.action?pid=${p.pid}">
                                    <img src="${pageContext.request.contextPath}/images/i_del.gif" width="16" height="16" border="0" style="CURSOR: hand">
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty page.list}">
                        <tr>
                            <td align="center" colspan="7">找不到该商品</td>
                        </tr>
                    </c:if>
                </table>
            </td>
        </tr>
        </TBODY>
    </table>
</form>
<div style="text-align: center;">
    <ul class="pagination">
        <c:if test="${page.curPage != 1 }">
            <li><a href="${pageContext.request.contextPath }/admin/find.action?curPage=${page.curPage - 1}" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
        </c:if>

        <c:forEach begin="1" end="${page.totalPage }" var="i">

            <c:if test="${page.curPage == i }">
                <li class="active"><a>${i } </a></li>
            </c:if>

            <c:if test="${page.curPage != i }">

                <li><a href="${pageContext.request.contextPath }/admin/find.action?curPage=${i}">${i }</a></li>
            </c:if>
        </c:forEach>
        <c:if test="${page.curPage != page.totalPage }">
            <li>
                <a href="${pageContext.request.contextPath }/admin/find.action?curPage=${page.curPage + 1}" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                </a>
            </li>
        </c:if>
    </ul>
</div>
</body>
</HTML>

