<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" pageEncoding="UTF-8"%>
<html>
	<head>
		<meta http-equiv="Content-Language" content="zh-cn">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <style>
		body
		{
			SCROLLBAR-ARROW-COLOR: #ffffff;  SCROLLBAR-BASE-COLOR: #dee3f7;
		}
    </style>
  </head>
	<c:if test="${ empty admin }">
		<jsp:forward page="/admin/adminLogin.action"></jsp:forward>
	</c:if>
	<frameset rows="103,*,43" frameborder=0 border="0" framespacing="0">
	  <frame src="top.action" name="topFrame" scrolling="NO" noresize>
	  <frameset cols="159,*" frameborder="0" border="0" framespacing="0">
			<frame src="left.action" name="leftFrame" noresize scrolling="YES">
			<frame src="welcome.action" name="mainFrame">
	  </frameset>
	  <frame src="bottom.action" name="bottomFrame" scrolling="NO"  noresize>
	</frameset>
</html>
