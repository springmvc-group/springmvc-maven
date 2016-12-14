<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>


<title>spring user input</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript" src="js/wins.js"></script>
</head>

<body>
	<spring:message code="user.ui.username"></spring:message>
	input form
	<form action="user_save" method="get">
		<table border="1px">
			<tr>
				<td>id</td>
				<td><input name="userId" /></td>

			</tr>
			<tr>
				<td>name</td>
				<td><input name="userName" /></td>

			</tr>
			<tr>
				<td>pass</td>
				<td><input name="password" /></td>

			</tr>
			<tr>
				<td colspan="2"><input value="save" type="submit" /></td>
			</tr>
		</table>
	</form>

	<input onclick="testWin()" value="but1" type="button">
</body>
</html>
