<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>


<title>My JSP 'info_user.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<body>
	info user
	<br>
	<table>
		<tr>
			<td>id</td>
			<td>${user.userId }</td>
		</tr>
		<tr>
			<td>userName</td>
			<td>${user.userName }</td>
		</tr>
		<tr>
			<td>password</td>
			<td>${user.password }</td>
		</tr>
		<tr>
			<a href="user_find">list user</a>
		</tr>
	</table>
</body>
</html>
