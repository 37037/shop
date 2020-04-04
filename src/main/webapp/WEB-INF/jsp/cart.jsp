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
			
			.container .row div {
				/* position:relative;
	 float:left; */
			}
			
			font {
				color: #3164af;
				font-size: 18px;
				font-weight: normal;
				padding: 0 10px;
			}
		</style>
	</head>
	<script type="text/javascript">
		function fn1(cid) {
			//这就是将商品移出购物车的方法
			//1.弹出一个确认框
			var flag = confirm("你不买了吗?")
			if(flag){
				//表示确实买不起了。。。
				//发送请求到服务器删除
				location.href = "${pageContext.request.contextPath}/car/delcar.action?&cid="+cid;
			}
		}
	</script>
	<body>
		<%@ include file="head.jsp" %>
		<div class="container">
			<c:if test="${empty carts}">
				<h1>购物车空空如也</h1>
			</c:if>
			
			<c:if test="${not empty carts }">
				<div class="row">

					<div style="margin:0 auto; margin-top:10px;width:950px;">
						<strong style="font-size:16px;margin:5px 0;">购物车详情</strong>
						<table class="table table-bordered" id="my">
							<tbody>
								<tr class="warning">
									<th>图片</th>
									<th>商品</th>
									<th>价格(单位：￥)</th>
									<th>数量</th>
									<th>小计(单位：￥)</th>
									<th>操作</th>
								</tr>
								<c:forEach items="${carts}" var="entry">

									<tr class="active">
										<td width="60" width="40%">
											<input type="hidden" name="id" value="22">
											<img src="${pageContext.request.contextPath}//pic//${entry.product}" width="70" height="60">
										</td>
										<td width="30%">
											<a target="_blank">${entry.uid}</a>
										</td>
										<td width="20%">
											${entry.price }
										</td>
										<td width="10%">
											<input disabled="disabled" type="text" name="quantity" value="${entry.count }" maxlength="4" size="10">
										</td>
										<td width="15%" id="total">
											<span class="subtotal">${entry.count*entry.price}</span>
										</td>
										<td>
											<a href="javascript:;" class="delete" onclick="fn1('${entry.cid}')">删除</a>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				
			</c:if>

			<div style="margin-right:130px;">
				<div style="text-align:right;">
					<em style="color:#ff6600;">
				登录后确认是否享有优惠&nbsp;&nbsp;
			</em> 赠送积分: <em style="color:#ff6600;">596</em>&nbsp; 商品金额(单位：￥): <input type="text" id="in" readonly>
				</div>
				<div style="text-align:right;margin-top:10px;margin-bottom:10px;">
					<a href="${pageContext.request.contextPath }/car/clearcar.action? id="clear" class="clear">清空购物车</a>
					<a href="${pageContext.request.contextPath }/order/addOrder.action">
						<input type="submit" width="100" value="提交订单" name="submit" border="0" style="background: url('${pageContext.request.contextPath}/images/register.gif') no-repeat scroll 0 0 rgba(0, 0, 0, 0);
						height:35px;width:100px;color:white;">
					</a>
				</div>
			</div>

		</div>

		
	</body>
	<script>
		$(function () {
			var totalRow = 0
			$('#my tr').each(function() {
				$(this).find('td:eq(4)').each(function(){
					totalRow += parseFloat($(this).text());
				});
			});
			$("#in").val(totalRow)
			console.log(totalRow)
			// $('#totalRow').append('<td>合计</td><td></td><td>'+totalRow+'</td><td></td>');
		})
	</script>
</html>