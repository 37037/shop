<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
	<head></head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>登录</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css" />
		<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"></script>
<!-- 引入自定义css文件 style.css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css"/>

<style>
  body{
   margin-top:20px;
   margin:0 auto;
 }
 .carousel-inner .item img{
	 width:100%;
	 height:300px;
 }
 .container .row div{ 
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
<body>

			<%@ include file="head.jsp" %>

			<c:if test="${not empty user}">
				<jsp:forward page="/index.action"></jsp:forward>
			</c:if>
 

<div class="container" style="width:100%;background:url('${pageContext.request.contextPath}/image/regist_bg.jpg');">
<div class="row"> 

	<div class="col-md-2"></div>




	<div class="col-md-8" style=" background:#f0f0f0; padding:40px 80px;margin:30px;border:7px solid #ccc;">
		<font>注册</font>USER REGISTER
		<form class="form-horizontal" style="margin-top:5px;" method="post" action="${pageContext.request.contextPath }/doRegist.action">
			 <div class="form-group">
			    <label for="username" class="col-sm-2 control-label">用户名</label>
			    <div class="col-sm-6">
			      <input type="text" class="form-control" id="username"  placeholder="请输入用户名" name="username">
					<div id="accountCheck"></div>
			    </div>
			  </div>
			   <div class="form-group">
			    <label for="inputPassword" class="col-sm-2 control-label">密码</label>
			    <div class="col-sm-6">
			      <input type="password" class="form-control" id="inputPassword"  placeholder="请输入密码" name="password">
					<div id="ptext"></div>
			    </div>
			  </div>
<%--			   <div class="form-group">--%>
<%--			    <label for="confirmpwd" class="col-sm-2 control-label">确认密码</label>--%>
<%--			    <div class="col-sm-6">--%>
<%--			      <input type="password" class="form-control" id="confirmpwd" placeholder="请输入确认密码">--%>
<%--			    </div>--%>
<%--			  </div>--%>
			  <div class="form-group">
			    <label for="inputEmail3" class="col-sm-2 control-label">Email</label>
			    <div class="col-sm-6">
			      <input type="email" class="form-control" id="inputEmail3" placeholder="Email" name="email">
					<div id="pemail"></div>

				</div>
			  </div>
			<div class="form-group">
				<label for="inputphone" class="col-sm-2 control-label">Phone</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" id="inputphone" placeholder="Phone" name="telephone" maxlength=11  Onkeyup="this.value=this.value.replace(/[^0-9-]+/,'');" >
					<div id="pphone"></div>

				</div>
			</div>
			 <div class="form-group">
			    <label for="name" class="col-sm-2 control-label">姓名</label>
			    <div class="col-sm-6">
			      <input type="text" class="form-control" id="name" placeholder="请输入姓名" name="name">
					<div id="pname"></div>

				</div>
			  </div>
			  <div class="form-group opt">  
			  <label for="sex" class="col-sm-2 control-label">性别</label>
			  <div class="col-sm-6">
<%--			    <label class="radio-inline">--%>
<%--			  <input type="radio" name="sex" id="inlineRadio1" value="male"> 男--%>
<%--			</label>--%>
<%--			<label class="radio-inline">--%>
<%--			  <input type="radio" name="sex" id="inlineRadio2" value="female"> 女--%>
<%--			</label>--%>
				<select name="sex" id="sex">
					<option value="男">男</option>
					<option value="女">女</option>
				</select>
			</div>
			  </div>		
			  <div class="form-group">
			    <label for="date" class="col-sm-2 control-label">出生日期</label>
			    <div class="col-sm-6">
			      <input type="date" class="form-control" id="birthday"  name="birthday">
					<div id="pbirthday"></div>

				</div>
			  </div>
			  <div class="form-group">
			    <div class="col-sm-offset-2 col-sm-10">
<%--			      <input type="submit"  width="100" value="注册" name="submit" border="0"--%>
<%--				    style="background: url('${pageContext.request.contextPath}/images/register.gif') no-repeat scroll 0 0 rgba(0, 0, 0, 0);--%>
<%--				    height:35px;width:100px;color:white;">--%>

			    </div>
			  </div>
			</form><button onclick="m()">注册</button>
	</div>
	<div class="col-md-2"></div>
  
</div>
</div>

	  
	
	

	

</body>
	<script>
		$("#inputPassword").blur(function () {
			var reg=/^[0-9]{6}$/;
			if(!reg.test($("#inputPassword").val())){
				$("#ptext").text("密码需要6个数字");
			}else {
				$("#ptext").text("密码可以使用");

			}
		})

		$("#inputEmail3").blur(function () {
			var reg= /^([[A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
			if(!reg.test($("#inputEmail3").val())){
				$("#pemail").text("邮箱格式不对");
			}else {
				$("#pemail").text("邮箱可以使用");

			}
		})

		$("#inputphone").blur(function () {
			var reg= /^1[3456789]\d{9}$/;
			if(!reg.test($("#inputphone").val())){
				$("#pphone").text("电话格式不对");
			}else {
				$("#pphone").text("电话可以使用");

			}
		})



		$("#name").blur(function () {

			if($("#name").val()!=""&&$("#name").val().trim()!=""){
				$("#pname").text("姓名可以使用");
			}else {
				$("#pname").text("姓名不能为空");

			}
		})
		$("#username").blur(function () {
			var reg=/^[A-z]{8}$/;
			if(reg.test($("#username").val())){

				$.ajax({
					type:"POST",
					url:"${pageContext.request.contextPath}/have.action",

					data:{"username":$("#username").val()},
					success:function(msg){
						if(msg == "yes"){
							$("#accountCheck").text("该用户名已存在");
						}else if(msg == "no"){
							$("#accountCheck").text("该用户名可以使用");

						}
					}

				})
			}else{
				$("#accountCheck").text("用户名需要8个字母");

			}
		})


		<%--$("#username").blur(function () {--%>
		<%--	var reg=/^[A-z]{8}$/;--%>
		<%--	if(reg.test($("#username").val())){--%>
		<%--		$.ajax({--%>
		<%--			type:"POST",--%>
		<%--			url:"${pageContext.request.contextPath}/have.action",--%>

		<%--			data:{"username":$("#username").val()},--%>
		<%--			success:function(msg){--%>
		<%--				if(msg == "yes"){--%>
		<%--					$("#accountCheck").text("该用户名已存在");--%>
		<%--				}else if(msg == "no"){--%>
		<%--					$("#accountCheck").text("该用户名可以使用");--%>

		<%--				}--%>
		<%--			}--%>

		<%--		})--%>
		<%--	}else {--%>
		<%--		$("#accountCheck").text("该用户名不可以使用");--%>
		<%--		alert("用户名需要8个字母");--%>

		<%--	}--%>

		<%--})--%>
		function m() {

			if($("#accountCheck").text()=="该用户名可以使用"&&$("#ptext").text()=="密码可以使用"&&$("#pemail").text()=="邮箱可以使用"&&$("#pphone").text()=="电话可以使用"&&$("#pname").text()=="姓名可以使用"){
				$(".form-horizontal").submit();

			}else {
				alert("请检查所有注册项符合要求！")
			}
		}


	</script>
</html>




