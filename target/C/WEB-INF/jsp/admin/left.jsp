<%@ page language="java" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>菜单</title>
<link href="${pageContext.request.contextPath}/css/left.css" rel="stylesheet" type="text/css"/>
<link rel="StyleSheet" href="${pageContext.request.contextPath}/css/dtree.css" type="text/css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css" />
    <script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"></script>

    <style>
        p{
            text-align: center;
        }
        div{

        }
        a{

            text-decoration:none;

        }
    </style>
</head>
<%--<body>--%>
<%--<table width="100" border="0" cellspacing="0" cellpadding="0">--%>
<%--  <tr>--%>
<%--    <td height="12"></td>--%>
<%--  </tr>--%>
<%--</table>--%>
<%--<table width="100%" border="0">--%>
<%--  <tr>--%>
<%--    <td>--%>
<%--<div class="dtree">--%>

<%--	<a href="javascript: d.openAll();">展开所有</a> | <a href="javascript: d.closeAll();">关闭所有</a>--%>

<%--	<script type="text/javascript" src="${pageContext.request.contextPath}/js/dtree.js"></script>--%>
<%--	<script type="text/javascript">--%>

<%--		d = new dTree('d');--%>
<%--		d.add('01',-1,'系统菜单树');//添加根节点，第一个参数表示添加的节点的"id",第二个参数表示"父节点的id"，第三个参数表示添加的节点的"文字描述"--%>

<%--		d.add('0101','01','分类管理','','','');--%>
<%--		//第四个参数表示，当点击这个节点的时候跳转的路径，第五个参数表示当鼠标悬停在这个节点上的时候显示的文字,第六个参数表示在哪里打开新页面--%>

<%--		d.add('010101','0101','所有分类','${pageContext.request.contextPath}/admin/listCategory.action','','mainFrame');--%>
<%--		d.add('010102','0101','添加分类','${pageContext.request.contextPath}/admin/addCategory.action','','mainFrame');--%>


<%--		d.add('0102','01','商品管理','','','');--%>
<%--		d.add('010201','0102','所有商品','${pageContext.request.contextPath}/admin/listProduct.action?curPage=1','','mainFrame');--%>
<%--		d.add('010202','0102','添加商品','${pageContext.request.contextPath}/admin/showAddProduct.action','','mainFrame');--%>

<%--		d.add('0103','01','订单管理','','','');--%>
<%--		d.add('010301','0103','所有订单','${pageContext.request.contextPath}/admin/listOrder.action?curPage=1','','mainFrame');--%>
<%--		d.add('010302','0103','未付款订单','${pageContext.request.contextPath}/admin/listOrderQita.action?curPage=1&state=0','','mainFrame');--%>
<%--		d.add('010303','0103','已付款订单','${pageContext.request.contextPath}/admin/listOrderQita.action?curPage=1&state=1','','mainFrame');--%>
<%--		d.add('010304','0103','已发货订单','${pageContext.request.contextPath}/admin/listOrderQita.action?curPage=1&state=2','','mainFrame');--%>
<%--		d.add('010305','0103','已完成订单','${pageContext.request.contextPath}/admin/listOrderQita.action?curPage=1&state=3','','mainFrame');--%>
<%--		document.write(d);--%>

<%--	</script>--%>
<%--</div>	</td>--%>
<%--  </tr>--%>
<%--</table>--%>
<div>
<%--    <p ><a href="${pageContext.request.contextPath}/admin/listCategory.action" target="mainFrame">所有分类</a></p>--%>
<%--    <p><a href="${pageContext.request.contextPath}/admin/addCategory.action" target="mainFrame">添加分类</a></p>--%>
<%--    <p><a href="${pageContext.request.contextPath}/admin/listProduct.action?curPage=1" target="mainFrame">所有商品</a></p>--%>
<%--    <p><a href="${pageContext.request.contextPath}/admin/showAddProduct.action" target="mainFrame">添加商品</a></p>--%>
<%--    <p><a href="${pageContext.request.contextPath}/admin/listOrder.action?curPage=1" target="mainFrame">所有订单</a></p>--%>
<%--    <p><a href="${pageContext.request.contextPath}/admin/listOrderQita.action?curPage=1&state=0" target="mainFrame">未付款订单</a></p>--%>
<%--    <p><a href="${pageContext.request.contextPath}/admin/listOrderQita.action?curPage=1&state=1" target="mainFrame">已付款订单</a></p>--%>
<%--    <p><a href="${pageContext.request.contextPath}/admin/listOrderQita.action?curPage=1&state=2" target="mainFrame">已发货订单</a></p>--%>
<%--    <p><a href="${pageContext.request.contextPath}/admin/listOrderQita.action?curPage=1&state=3" target="mainFrame">已完成订单</a></p>--%>
<%--    <p><a href="${pageContext.request.contextPath}/admin/notice.action" target="mainFrame">公告管理</a></p>--%>
<%--    <p><a href="${pageContext.request.contextPath}/admin/getuser.action?curPage=1" target="mainFrame">用户管理</a></p>--%>
<%--    <div class="container">--%>
<%--        <div class="row">--%>
<%--            <div class="span8">--%>
<%--                <ul class="nav nav-tabs nav-stacked">--%>


<%--                    <li><a href="${pageContext.request.contextPath}/admin/msg.action" target="mainFrame">首页</a></li>--%>

<%--                    <li><a href="${pageContext.request.contextPath}/admin/listCategory.action" target="mainFrame">所有分类</a></li>--%>
<%--                    <li><a href="${pageContext.request.contextPath}/admin/addCategory.action" target="mainFrame">添加分类</a></li>--%>
<%--                    <li><a href="${pageContext.request.contextPath}/admin/listProduct.action?curPage=1" target="mainFrame">所有商品</a></li>--%>
<%--                    <li><a href="${pageContext.request.contextPath}/admin/showAddProduct.action" target="mainFrame">添加商品</a></li>--%>
<%--                    <li><a href="${pageContext.request.contextPath}/admin/listOrder.action?curPage=1" target="mainFrame">所有订单</a></li>--%>
<%--                    <li><a href="${pageContext.request.contextPath}/admin/listOrderQita.action?curPage=1&state=0" target="mainFrame">未付款订单</a></li>--%>
<%--                    <li><a href="${pageContext.request.contextPath}/admin/listOrderQita.action?curPage=1&state=2" target="mainFrame">已发货订单</a></li>--%>
<%--                    <li><a href="${pageContext.request.contextPath}/admin/listOrderQita.action?curPage=1&state=1" target="mainFrame">已付款订单</a></li>--%>
<%--                    <li><a href="${pageContext.request.contextPath}/admin/listOrderQita.action?curPage=1&state=3" target="mainFrame">已完成订单</a></li>--%>
<%--                    <li><a href="${pageContext.request.contextPath}/admin/notice.action" target="mainFrame">公告管理</a></li>--%>
<%--                    <li><a href="${pageContext.request.contextPath}/admin/getuser.action?curPage=1" target="mainFrame">用户管理</a></li>--%>
<%--                    <li><a href="${pageContext.request.contextPath}/admin/anser.action?curPage=1" target="mainFrame">未回复评论</a></li>--%>
<%--                    <li><a href="${pageContext.request.contextPath}/admin/yesanser.action?curPage=1" target="mainFrame">已回复评论</a></li>--%>
<%--                </ul>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
    <div class="panel-group" id="accordion">
        <div class="panel panel-default" style="margin-top: 5px">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion"
                       href="">
                        <a href="${pageContext.request.contextPath}/admin/msg.action" target="mainFrame" style='text-decoration:none;'>首页</a>
                    </a>
                </h4>
            </div>
        </div>

        <div class="panel panel-default" >
            <div class="panel-heading">
            <h4 class="panel-title">
                <a data-toggle="collapse" data-parent="#accordion"
                   href="#collapseOne" style='text-decoration:none;'>
                    分类管理
                </a>
            </h4>
        </div>
            <div id="collapseOne" class="panel-collapse collapse open">
                <div class="panel-body">
                    <ul class="nav nav-tabs nav-stacked">
                   <li><a href="${pageContext.request.contextPath}/admin/listCategory.action" target="mainFrame">所有分类</a></li>
                    <li><a href="${pageContext.request.contextPath}/admin/addCategory.action" target="mainFrame">添加分类</a></li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion"
                       href="#collapseTwo" style='text-decoration:none;'>
                        商品管理
                    </a>
                </h4>
            </div>
            <div id="collapseTwo" class="panel-collapse collapse open">
                <div class="panel-body">
                    <ul class="nav nav-tabs nav-stacked">
                        <li><a href="${pageContext.request.contextPath}/admin/listProduct.action?curPage=1" target="mainFrame">所有商品</a></li>
                        <li><a href="${pageContext.request.contextPath}/admin/showAddProduct.action" target="mainFrame">添加商品</a></li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion"
                       href="#collapse3" style='text-decoration:none;'>
                       订单管理
                    </a>
                </h4>
            </div>
            <div id="collapse3" class="panel-collapse collapse open">
                <div class="panel-body">
                    <ul class="nav nav-tabs nav-stacked">
                        <li><a href="${pageContext.request.contextPath}/admin/listOrderQita.action?curPage=1&state=0" target="mainFrame">未付款订单</a></li>
                        <li><a href="${pageContext.request.contextPath}/admin/listOrderQita.action?curPage=1&state=2" target="mainFrame">已发货订单</a></li>
                        <li><a href="${pageContext.request.contextPath}/admin/listOrderQita.action?curPage=1&state=1" target="mainFrame">已付款订单</a></li>
                        <li><a href="${pageContext.request.contextPath}/admin/listOrderQita.action?curPage=1&state=3" target="mainFrame">已完成订单</a></li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="panel panel-default" style='text-decoration:none;'>
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion"
                       href="#collapse4" style='text-decoration:none;'>
                        用户及公告管理
                    </a>
                </h4>
            </div>
            <div id="collapse4" class="panel-collapse collapse open">
                <div class="panel-body">
                    <ul class="nav nav-tabs nav-stacked">
                        <li><a href="${pageContext.request.contextPath}/admin/notice.action" target="mainFrame">公告管理</a></li>
                        <li><a href="${pageContext.request.contextPath}/admin/getuser.action?curPage=1" target="mainFrame">用户管理</a></li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion"
                       href="#collapse5" style='text-decoration:none;'>
                        评论回复管理
                    </a>
                </h4>
            </div>
            <div id="collapse5" class="panel-collapse collapse open">
                <div class="panel-body">
                    <ul class="nav nav-tabs nav-stacked">
                        <li><a href="${pageContext.request.contextPath}/admin/anser.action?curPage=1" target="mainFrame">未回复评论</a></li>
                        <li><a href="${pageContext.request.contextPath}/admin/yesanser.action?curPage=1" target="mainFrame">已回复评论</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
