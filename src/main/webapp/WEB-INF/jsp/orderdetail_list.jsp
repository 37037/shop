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
					<table class="table table-bordered">
							<tbody>
								<tr class="warning">
									<th>图片</th>
									<th>商品</th>
									<th>价格</th>
								
								</tr>
								
								<c:forEach items="${page.list }" var="orderitem">
									<tr class="active">
										<td width="60" width="40%">
											<input type="hidden" name="id" value="22">
											<img src="${pageContext.request.contextPath}/pic/${orderitem.product.pimage}" width="70" height="60">
										</td>
										<td width="30%">
											<a target="_blank">${orderitem.product.pname }</a>
										</td>
										<td width="20%">
											￥${orderitem.product.shop_price }
										</td>
									</tr>
								</c:forEach>
							</tbody>
					</table>
				</div>
			</div>
			<div style="text-align: center;">
				<ul class="pagination">
					<c:if test="${page.curPage != 1 }">
						<li><a href="${pageContext.request.contextPath }/order/listDetail.action?oid=${oid}&curPage=${page.curPage - 1}" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
					</c:if>
 
					<c:forEach begin="1" end="${page.totalPage }" var="i">
						<c:if test="${page.curPage == i }">
							<li class="active"><a>${i }</a></li>
						</c:if>
						
						<c:if test="${page.curPage != i }">
							<li><a href="${pageContext.request.contextPath }/order/listDetail.action?oid=${oid}&curPage=${i }">${i }</a></li>
						</c:if>
					</c:forEach>
					 
					<c:if test="${page.curPage != page.totalPage }">
						<li>
							<a href="${pageContext.request.contextPath }/order/listDetail.action?oid=${oid}&curPage=${page.curPage + 1}" aria-label="Next">
								<span aria-hidden="true">&raquo;</span>
							</a>
						</li>
					</c:if>
				</ul>
			</div>
		</div>

</body>
</html>