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

				<div style="margin:0 auto; margin-top:10px;">
					<strong>我的订单</strong>
					<table class="table table-bordered"><tr>
						<th colspan="2">订单编号</th>
						<th colspan="2">订单地址</th>
						<th colspan="2">收件人</th>
						<th colspan="2">电话号码</th>
						<th colspan="2">订单状态</th>
						<th colspan="2">订单时间</th>

					</tr>
						<c:forEach items="${page.list }" var="order">
							<tbody>

								<tr >
									<th colspan="2">${order.oid } </th>
									<th colspan="2">${order.address} </th>
									<th colspan="2">${order.name } </th>
									<th colspan="2">${order.telephone } </th>
									<th colspan="2">
										<!-- 判断，如果这个订单的state为0显示去付款 -->

											<c:if test="${order.state == 0 }">
												<a href="${pageContext.request.contextPath }/order/payorder.action?oid=${order.oid}">去付款</a>
											</c:if>
											<c:if test="${order.state == 1}">
												已付款（总金额${order.total}）等待发货
											</c:if>
										<c:if test="${order.state == 2}">
											已付款（总金额${order.total}）<a onclick="cl(this)">确认收货</a>
										</c:if>
											<c:if test="${order.state == 3}">
												已完成 <a href="${pageContext.request.contextPath }/order/listDetail1.action?oid=${order.oid}&curPage=1">去评价</a>
											</c:if>
										<c:if test="${order.state==4}">
											已完成
										</c:if>

									</th>
									<th colspan="2">${order.ordertime }
									<a href="${pageContext.request.contextPath }/order/listDetail.action?oid=${order.oid}&curPage=1">订单详情</a>
									</th>
									
								</tr>
								<!-- 
								<tr class="warning">
									<th>图片</th>
									<th>商品</th>
									<th>价格</th>
									<th>数量</th>
									<th>小计</th>
								</tr>
								<c:forEach items="${order.items }" var="item">
									<tr class="active">
										<td width="60" width="40%">
											<input type="hidden" name="id" value="22">
											<img src="${pageContext.request.contextPath}/${item.product.pimage}" width="70" height="60">
										</td>
										<td width="30%">
											<a target="_blank">${item.product.pname }</a>
										</td>
										<td width="20%">
											￥${item.product.shop_price }
										</td>
										<td width="10%">
											${item.count }
										</td>
										<td width="15%">
											<span class="subtotal">￥${item.subtotal }</span>
										</td>
									</tr>
								</c:forEach>  -->
							</tbody>
						</c:forEach>
					</table>
				</div>
			</div>
			<div style="text-align: center;">
				<ul class="pagination">
					<c:if test="${page.curPage != 1 }">
						<li><a href="${pageContext.request.contextPath }/order/orderlist.action?curPage=${page.curPage - 1}" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
					</c:if>
 
					<c:forEach begin="1" end="${page.totalPage }" var="i">
						<c:if test="${page.curPage == i }">
							<li class="active"><a>${i }</a></li>
						</c:if>
						
						<c:if test="${page.curPage != i }">
							<li><a href="${pageContext.request.contextPath }/order/orderlist.action?curPage=${i }">${i }</a></li>
						</c:if>
					</c:forEach>
					 
					<c:if test="${page.curPage != page.totalPage }">
						<li>
							<a href="${pageContext.request.contextPath }/order/orderlist.action?curPage=${page.curPage + 1}" aria-label="Next">
								<span aria-hidden="true">&raquo;</span>
							</a>
						</li>
					</c:if>
				</ul>
			</div>
		</div>

		
	</body>
	<script>
		function cl(obj) {
			var $th = $(obj).parents('tr').children('th');
			var oid=$th.eq(0).text();
			console.log(oid);

			$.ajax({
				type:"post",
				url:"${pageContext.request.contextPath }/order/utilOrder1.action?",
				data:{"oid":oid},
				success:function (msg) {
					alert("操作成功")
					history.go(0);
				}
			})
		}
	</script>

</html>