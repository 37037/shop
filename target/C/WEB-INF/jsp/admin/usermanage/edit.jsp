<%@ page language="java" pageEncoding="UTF-8"%>
<HTML>
<HEAD>
    <meta http-equiv="Content-Language" content="zh-cn">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <LINK href="${pageContext.request.contextPath}/css/Style1.css" type="text/css" rel="stylesheet">
</HEAD>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"></script>

<body>
<!--  -->
<form id="userAction_save_do" name="Form1" action="${pageContext.request.contextPath}/admin/updatemessage.action" method="post"  ><!-- enctype="multipart/form-data" -->


    &nbsp;
    <table cellSpacing="1" cellPadding="5" width="80%" align="center" bgColor="#808080" style="border: 1px solid #808080" border="0">
        <tr>
            <td class="ta_01" align="center" bgColor="gray" colSpan="4"
                height="26">
                <strong><STRONG>修改用户信息</STRONG>
                </strong>
            </td>
        </tr>

        <tr>
            <td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
                用户名：
            </td>
            <td class="ta_01" bgColor="#ffffff">
                <input type="text" name="username" value="${user.username}" id="userAction_save_do_logonName" class="bg" readonly/>
            </td>
            <td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
                密码：
            </td>
            <td class="ta_01" bgColor="#ffffff">
                <input type="text" name="password" value="${user.password}" id="password" maxlength=6  Onkeyup="this.value=this.value.replace(/[^0-9-]+/,'');">
                <div id="ptext"></div>
            </td>
        </tr>
        <tr>
            <td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
                姓名：
            </td>
            <td class="ta_01" bgColor="#ffffff">
                <input type="text" name="name" value="${user.name}" id="name" class="bg"/>
                <div id="pname"></div>

            </td>
            <td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
               邮箱：
            </td>
            <td class="ta_01" bgColor="#ffffff">
                <input type="text" name="email" value="${user.email}" id="email" class="bg"/>
                <div id="pemail"></div>

            </td>
        </tr>
        <tr>
            <td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
                电话：
            </td>
            <td class="ta_01" bgColor="#ffffff">
                <input type="text" name="telephone" value="${user.telephone}" id="phone" maxlength=11  Onkeyup="this.value=this.value.replace(/[^0-9-]+/,'');"/>
                <div id="pphone"></div>

            </td>

            <td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
               性别：
            </td>
            <td class="ta_01" bgColor="#ffffff">
                <input type="text" name="sex"  id="sex" value="${user.sex}">
                <div id="psex"></div>

            </td>

        </tr>
<%--        <tr>--%>
<%--            <td width="18%" align="center" bgColor="#f5fafe" class="ta_01">--%>
<%--                生日：--%>
<%--            </td>--%>
<%--            <td class="ta_01" bgColor="#ffffff" colspan="3">--%>
<%--                <input type="date" value="${u.birthday}" name="birthday">--%>
<%--            </td>--%>

<%--        </tr>--%>

        <tr>
            <td class="ta_01" style="WIDTH: 100%" align="center"
                bgColor="#f5fafe" colSpan="4">
                <button type="button" onclick="m()" id="userAction_save_do_submit" value="确定" class="button_ok">
                    &#30830;&#23450;
                </button>


                <FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
                <INPUT class="button_ok" type="button" onclick="history.go(-1)" value="返回"/>
                <span id="Label1"></span>
            </td>
        </tr>
    </table>
</form>
</body>
<script>
    $("#password").blur(function () {
        var reg=/^[0-9]{6}$/;
        if(!reg.test($("#password").val())){
            $("#ptext").text("密码需要6个数字");
        }else {
            $("#ptext").text("密码可以使用");

        }
    })

    $("#email").blur(function () {
        var reg= /^([[A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
        if(!reg.test($("#email").val())){
            $("#pemail").text("邮箱格式不对");
        }else {
            $("#pemail").text("邮箱可以使用");

        }
    })

    $("#phone").blur(function () {
        var reg= /^1[3456789]\d{9}$/;
        if(!reg.test($("#phone").val())){
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
    $("#sex").blur(function () {

        if($("#sex").val()=="男"||$("#sex").val()=="女"){
            $("#psex").text("性别可以使用");
        }else {
            $("#psex").text("性别只能为男或女");

        }
    })
    function m() {

        if($("#ptext").text()=="密码可以使用"&&$("#pemail").text()=="邮箱可以使用"&&$("#pphone").text()=="电话可以使用"&&$("#pname").text()=="姓名可以使用"&&($("#sex").val()=="男"||$("#sex").val()=="女")){
            $("#userAction_save_do").submit();

        }else {
            alert("请检查所有项符合要求且不为空！")
        }
    }
    window.onload=function () {
        function x() {
            var reg=/^[0-9]{6}$/;
            if(!reg.test($("#password").val())){
                $("#ptext").text("密码需要6个数字");
            }else {
                $("#ptext").text("密码可以使用");

            }
        }

      function x1() {
            var reg= /^([[A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
            if(!reg.test($("#email").val())){
                $("#pemail").text("邮箱格式不对");
            }else {
                $("#pemail").text("邮箱可以使用");

            }
        }

       function x2() {
            var reg= /^1[3456789]\d{9}$/;
            if(!reg.test($("#phone").val())){
                $("#pphone").text("电话格式不对");
            }else {
                $("#pphone").text("电话可以使用");

            }
        }



      function x3() {

            if($("#name").val()!=""&&$("#name").val().trim()!=""){
                $("#pname").text("姓名可以使用");
            }else {
                $("#pname").text("姓名不能为空");

            }
        }
       function x4 () {

            if($("#sex").val()=="男"||$("#sex").val()=="女"){
                $("#psex").text("性别可以使用");
            }else {
                $("#psex").text("性别只能为男或女");

            }
        }
        x();
        x1();
        x2();
        x3();
        x4();
    }


</script>
</HTML>