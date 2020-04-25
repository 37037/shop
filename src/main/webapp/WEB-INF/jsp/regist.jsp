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
			      <input type="text" class="form-control" id="username" placeholder="请输入用户名" name="username">
					<div id="accountCheck"></div>
			    </div>
			  </div>
			   <div class="form-group">
			    <label for="inputPassword3" class="col-sm-2 control-label">密码</label>
			    <div class="col-sm-6">
			      <input type="password" class="form-control" id="inputPassword3" placeholder="请输入密码" name="password">
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
			    </div>
			  </div>
			<div class="form-group">
				<label for="inputphone" class="col-sm-2 control-label">Phone</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" id="inputphone" placeholder="Phone" name="telephone" maxlength=11  Onkeyup="this.value=this.value.replace(/[^0-9-]+/,'');" >
				</div>
			</div>
			 <div class="form-group">
			    <label for="usercaption" class="col-sm-2 control-label">姓名</label>
			    <div class="col-sm-6">
			      <input type="text" class="form-control" id="usercaption" placeholder="请输入姓名" name="name">
			    </div>
			  </div>
			  <div class="form-group opt">  
			  <label for="inlineRadio1" class="col-sm-2 control-label">性别</label>  
			  <div class="col-sm-6">
			    <label class="radio-inline">
			  <input type="radio" name="sex" id="inlineRadio1" value="male"> 男
			</label>
			<label class="radio-inline">
			  <input type="radio" name="sex" id="inlineRadio2" value="female"> 女
			</label>
			</div>
			  </div>		
			  <div class="form-group">
			    <label for="date" class="col-sm-2 control-label">出生日期</label>
			    <div class="col-sm-6">
			      <input type="date" class="form-control"  name="birthday">		      
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
		$("#username").blur(function () {
			$.ajax({
				type:"POST",
				url:"${pageContext.request.contextPath}/have.action",

				data:{"username":$("#username").val()},
				success:function(msg){
					if(msg == "yes"){
						$("#accountCheck").text("该用户名已存在");
						$("#accountCheck").css("color","red");
					}else if(msg == "no"){
						$("#accountCheck").text("该用户名可以使用");

					}
				}

			})
		})
		function m() {
			if($("#accountCheck").text()!="该用户名可以使用"){
				alert("该用户名已存在");
			}else{
				$(".form-horizontal").submit();
			}
		}


	</script>
</html>




