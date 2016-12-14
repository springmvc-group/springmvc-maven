<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>


<title>edit</title>

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
	edit
	<form action="user_update">
		<table border="1px">
			<tr>
				<td>id</td>
				<td><input name="userId" value="${user.userId }" /></td>
			</tr>
			<tr>
				<td>name</td>
				<td><input name="userName" value="${user.userName }" /></td>

			</tr>
			<tr>
				<td>pass</td>
				<td><input name="password" value="${user.password}" /></td>

			</tr>
			<tr>
				<td colspan="2"><input value="update" type="submit" /></td>
			</tr>
		</table>
		<form>
</body>
</html>
