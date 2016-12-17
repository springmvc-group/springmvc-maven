<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"  %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>


<title>user find</title>

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
	<a href="user_input">add </a> user list:
	<br>
	<table border="1px">
		<tr>
			<td>id</td>
			<td>userName</td>
			<td>password</td>
			<td>edit</td>
			<td>delete</td>
		</tr>
		<c:forEach var="item" items="${queryAndResult['list']}">
			<tr>
				<td>${item.userId }</td>
				<td>${item.userName }</td>
				<td>${item.password }</td>
				<td><a
					href='user_edit?userId=${item.userId }'>edit</a>
				</td>
				<td><a
					href='user_delete?userId=${item.userId }'>delete</a>
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>
