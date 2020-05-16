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
		<link rel="stylesheet" href="https://cdn.staticfile.org/font-awesome/4.7.0/css/font-awesome.css">
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
									<th>选择</th>
									<th>图片</th>
									<th>商品</th>
									<th>价格(单位：￥)</th>
									<th>数量</th>
									<th>小计(单位：￥)</th>
									<th>操作</th>
									<th style="display: none">购物号</th>
									<th style="display: none;">商品pid</th>
								</tr>
								<c:forEach items="${carts}" var="entry">
									<tr class="active">
										<td width="8%"><input type="checkbox" name="option" class="select" onclick="getMoney()" >选中
										</td>
										<td  width="12%">

											<img src="${pageContext.request.contextPath}//pic//${entry.product.pimage}" width="70" height="60">
										</td>
										<td width="20%">
											<a target="_blank">${entry.product.pname}</a>
										</td>
										<td width="20%">
											${entry.product.shop_price }
										</td>
										<td width="20%">
											<input onblur="up(this)" id="count" onchange="Xiaoji()"   patten="[1-9][0-9]?" oninput="if(value<1){value=1}else if(value>=10){value=10}"  type="number" name="quantity" value="${entry.count }" maxlength="4" size="10">
										</td>
										<td width="10%" id="total">
											<span class="subtotal" name="price"></span>
										</td>
										<td width="10%">
											<a href="javascript:;" class="delete" onclick="fn1('${entry.cid}')">删除</a>
										</td>
										<td style="display: none">
											<span>${entry.cid}</span>
										</td>
										<td style="display: none;">
											<a>${entry.product.pid}</a>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				
			</c:if>
			<div>
				<c:if test="${not empty carts}">
					<input style="margin-left: 100px" type="checkbox"   id="all">全选
				</c:if>

			</div>
			<div style="margin-right:130px;">
				<div style="text-align:right;">

			&nbsp; 商品金额(单位：￥): <input type="text" id="in" readonly>
				</div>
				<div style="text-align:right;margin-top:10px;margin-bottom:10px;">
					<a href="${pageContext.request.contextPath }/car/clearcar.action? id="clear" class="clear">清空购物车</a>

                    <button id="submi" class="btn btn-success" onclick="Getcid()">提交订单</button>

				</div>
			</div>

		</div>

		
	</body>
	<script>
        function my() {
            window.location.href="${pageContext.request.contextPath }/order/addOrder.action?totalRow="+totalRow;

        }

		function up(obj) {
			var $td = $(obj).parents('tr').children('td');
			var name= $td.eq(8).find("a").text();
			var count= $td.eq(4).find("input").val();
			console.log(name+11);
			console.log(name)
			$.ajax({
				type: "post",
				url: "${pageContext.request.contextPath }/car/updatecount.action",
				data: {"name":name,
						"count":count},
				success: function(msg){
					if(msg=="yes"){
						console.log(1);
						// history.go(0);

					}else {
						console.log(0)

					}
				}
			});


		}

		window.onload=function (ev) {
        	Xiaoji();
			var all=document.getElementById("all");
			var inputs=document.getElementsByClassName("select");
			all.addEventListener('change',function () {
				for(i=0;i<inputs.length;i++){
					if(all.checked){
						inputs[i].checked=all.checked;
						getMoney();
					}else {
						inputs[i].checked=false;
						$("#in").val(0)

					}
				}
			})
		for(var i=0;i<inputs.length;i++){
			inputs[i].addEventListener('change',function () {
				qx();
			});

		}
		var qx=function () {
			var  count=0;
			for(var j=0;j<inputs.length;j++){
				if(inputs[j].checked){
					count++;
				}if(count==inputs.length){
					all.checked=true;
				}else {
					all.checked=false;
				}
			}

		}

		}
		// var totalRow = 0;
		// function sum1() {
		// 	$(":checkbox:checked").parents("tr").find('td:eq(5)').each(function(){
		// 		totalRow += parseFloat($(this).text());
		// 		console.log(totalRow);
		// 	});
		// 	$("#in").val(totalRow)
		// 	console.log(totalRow)
		//
		//
		// 	// var checks=document.getElementsByClassName('select').checked
		// 	var options=document.getElementsByName("option");
		// 	// for(var i=0;i<options.length;i++){
		// 	// 	if(options[i].checked){
		// 	// 		$('#my tr').each(function() {
		// 	//
		// 	// 			$(this).find('td:eq(4)').each(function(){
		// 	// 				totalRow += parseFloat($(this).text());
		// 	// 			});
		// 	// 		});
		// 	// 		$("#in").val(totalRow)
		// 	// 		console.log(totalRow)
		// 	// 	}
		// 	// }
		// }
		function getMoney() {
			var totalRow=0;

			$(":checkbox:checked").parents("tr").find('td:eq(5)').each(function(){
				totalRow += parseFloat($(this).text());
				console.log(totalRow);
			});
			$("#in").val(totalRow)


		}
		function Xiaoji() {
			var tb=document.getElementById("my")
			var rows=tb.rows;
			for(var i=1;i<rows.length;i++){
				rows[i].cells[5].innerHTML= parseFloat(rows[i].cells[3].innerHTML)*parseFloat(rows[i].cells[4].getElementsByTagName("INPUT")[0].value)
				getMoney();
			}
		}
		function Getcid() {
			var arr=new Array();
			$(":checkbox:checked").parents("tr").find('td:eq(7)').each(function(){

				arr.push($(this).find("span").text());
			})
			var t=$("#in").val();
			console.log(arr);
			var inputs=document.getElementsByClassName("select");
			var  count=0;
			for(var j=0;j<inputs.length;j++){
				if(inputs[j].checked){
					count++;
				}}
			if(count==0){
				$("#submi").attr("disabled",false);
				alert("已选商品为空，请至少选择一件商品")

			}else {			window.location.href="${pageContext.request.contextPath }/order/addOrder.action?"+"totalRow="+t+"&arr="+arr;
			}

		}

	</script>
</html>