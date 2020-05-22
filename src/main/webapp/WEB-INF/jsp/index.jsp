<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>跳骚市场</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css" />
		<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/layer/layer.js"></script>

	</head>
	<script type="text/javascript">
		// $(function() {
		<%--	$.getJSON("${pageContext.request.contextPath}/hotProduct.action",function(result){--%>
		<%--		$(result).each(function(index,element) {--%>
		<%--			$("#hot").append("<div class='col-md-2' style='text-align:center;height:200px;padding:10px 0px;'>" +--%>
		<%--					"<a href='${pageContext.request.contextPath}/infoProduct.action?pid="+element.pid+"'>" +--%>
		<%--					"<img src='${pageContext.request.contextPath}/pic/"+element.pimage+"' width='130' height='130' style='display: inline-block;'></a>" +--%>
		<%--					"<p><a href='${pageContext.request.contextPath}/infoProduct.action?pid="+element.pid+"' style='color:#666'>"+element.pname+"</a></p>" +--%>
		<%--					"<p><font color='#E4393C' style='font-size:16px'>&yen;"+element.shop_price+"</font></p>" +--%>
		<%--					"</div>")--%>
		<%--		})--%>
		<%--	})--%>
		<%--	--%>
		<%--	--%>
		<%--	//发送请求，获取最新商品信息--%>
		<%--	$.getJSON("${pageContext.request.contextPath}/latestProduct.action",function(result){--%>
		<%--		$(result).each(function(index,element) {--%>
		<%--			$("#latest").append("<div class='col-md-2' style='text-align:center;height:200px;padding:10px 0px;'><a href='${pageContext.request.contextPath}/infoProduct.action?pid="+element.pid+"'><img src='${pageContext.request.contextPath}/pic/"+element.pimage+"' width='130' height='130' style='display: inline-block;'></a><p><a href='${pageContext.request.contextPath}/infoProduct.action?pid="+element.pid+"' style='color:#666'>"+element.pname+"</a></p><p><font color='#E4393C' style='font-size:16px'>&yen;"+element.shop_price+"</font></p></div>")--%>
		<%--		})--%>
		<%--	})--%>
		<%--})--%>
		function gg(){
			var content="";
			$.getJSON("${pageContext.request.contextPath}/getnotice.action",function(result){



				layer.open({
					type: 1,//0:信息框; 1:页面; 2:iframe层;	3:加载层;	4:tip层
					title:"公告",//标题
					area: ['800px', '500px'],//大小
					shadeClose: true, //点击弹层外区域 遮罩关闭
					//弹框里面的内容
					content:result.notice
				})
			})

		}

	</script>
	<body>
	

			<%--静态包含 --%>
			<%@ include file="head.jsp" %>
			
          
			<div class="container-fluid" style="width: 80%;">
				<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
					<!-- Indicators -->
					<ol class="carousel-indicators">
						<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
						<li data-target="#carousel-example-generic" data-slide-to="1"></li>
						<li data-target="#carousel-example-generic" data-slide-to="2"></li>
					</ol>

					<!-- Wrapper for slides -->
					<div class="carousel-inner" role="listbox" >
						<div class="item active">
							<img src="${pageContext.request.contextPath}/img/e.jpg" style="height: 400px;width: 100%">
							<div class="carousel-caption">

							</div>
						</div>
						<div class="item">
							<img src="${pageContext.request.contextPath}/img/c.jpg" style="height: 400px;width: 100%">
							<div class="carousel-caption">

							</div>
						</div>
						<div class="item">
							<img src="${pageContext.request.contextPath}/img/b.jpg" style="height: 400px;width: 100%">
							<div class="carousel-caption">

							</div>
						</div>
					</div>

					<!-- Controls -->
					<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
						<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a>
					<a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
						<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>
			</div>
			<br>
			
			
			<div class="container-fluid">
				<div class="col-md-12">
					<h2>热门商品&nbsp;&nbsp;<img src="${pageContext.request.contextPath}/img/title2.jpg"/></h2>
				</div>
				<div  id="hot">
					<c:forEach items="${p}" var="p">
					<div class="panel panel-default col-md-3" style="height: 220px">
						<div class="panel-heading" align="center">
							<a href="${pageContext.request.contextPath}/infoProduct.action?pid=${p.pid}"><img src="${pageContext.request.contextPath}/pic/${p.pimage}" width='100' height='100' style='display: inline-block;' alt="">
							</a>
						</div>
						<div class="panel-body" align="center">
							<p><a href="${pageContext.request.contextPath}/infoProduct.action?pid=${p.pid}">${p.pname}</a>
							</p>
							<p><span style="float: left">销量：${p.is_latest}</span> <span style="float: right">￥：${p.shop_price}</span>
							</p>
						</div>
					</div>
					</c:forEach>
				</div>
			</div>
		
            <br>
            
			<div class="container-fluid">
				<div class="col-md-12">
					<h2>最新商品&nbsp;&nbsp;<img src="${pageContext.request.contextPath}/img/title2.jpg"/></h2>
				</div>
				<div  id="latest">
					<c:forEach items="${p1}" var="p">
						<div class="panel panel-default col-md-3" style="height: 220px">
							<div class="panel-heading" align="center">
								<a href="${pageContext.request.contextPath}/infoProduct.action?pid=${p.pid}"><img src="${pageContext.request.contextPath}/pic/${p.pimage}" width='100' height='100' style='display: inline-block;' alt="">
								</a>
							</div>
							<div class="panel-body" align="center">
								<p><a href="${pageContext.request.contextPath}/infoProduct.action?pid=${p.pid}">${p.pname}</a>
								</p>
								<p><span style="float: left">销量：${p.is_latest}</span> <span style="float: right">￥：${p.shop_price}</span>
								</p>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>			
		
			<div style="height: 50px;background: grey" align="center">联系客服：QQ1303051288</div>
	</body>

</html>