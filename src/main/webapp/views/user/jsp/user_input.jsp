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
<script type="text/javascript"
	src="jquery.min.js"></script>
<script type="text/javascript">
	$.fn.serializeObject = function() {
		var o = {};
		var a = this.serializeArray();
		$.each(a, function() {
			if (o[this.name]) {
				if (!o[this.name].push) {
					o[this.name] = [ o[this.name] ];
				}
				o[this.name].push(this.value || '');
			} else {
				o[this.name] = this.value || '';
			}
		});
		return o;
	};

	$(function() {
		$("button:eq(0)").on("click", function() {
			var url = "save?userName=abc&password=122222";
			$.ajax({
				url : url,
				type : "get",
				success : function(data) {
					alert(data);
				}
			});
		});
		//注意：post传值要求data是一个json对象
		$("button:eq(1)").on("click", function() {
			var url = "save";
			//var dform = new FormData($("#userForm")[0]);
			var userData = {
				"userName" : "sssssssss"
			};
			$.ajax({
				url : url,
				type : "post",
				//contentType : "application/json;charset=utf-8",
				dataType : "json",
				data : userData,
				success : function(data) {
					alert(data);
				}
			});
		});
		//注意：传入json数据时，data要求是一个json字符串
		$("button:eq(2)").on("click", function() {
			var url = "save_json";
			//var dform = new FormData($("#userForm")[0]);
			var userData = {
				"userName" : "sssssssss"
			};
			$.ajax({
				url : url,
				type : "post",
				contentType : "application/json;charset=utf-8",
				dataType : "json",
				data : JSON.stringify(userData),
				success : function(data) {
					alert(data);
				}
			});
		});

		//注意：传入json数据时，data要求是一个json字符串
		$("button:eq(3)").on("click", function() {
			var url = "save_json";
			//json数组
			//var data = $("#userForm").serializeArray();
			//get传值字符串
			//var data=$("#userForm").serialize(); 
			//alert(data);

			//var data = $("#form1").serializeArray(); //自动将form表单封装成json  
			//alert(JSON.stringify(data));  
			var jsonuserinfo = $('#userForm').serializeObject();
			var data = JSON.stringify(jsonuserinfo);
			alert(data);

			$.ajax({
				url : url,
				type : "post",
				contentType : "application/json;charset=utf-8",
				dataType : "json",
				data : data,
				success : function(data) {
					alert(data);
				}
			});
		});
	})
</script>

</head>

<body>

	<button>send json-> get</button>
	<button>send json-> post--(name-value)</button>
	<button>send json-> json</button>
	<button>send json-> json--form</button>
	<br> input form
	<form id="userForm" action="user_save" method="get">
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
	<spring:message code="user.ui.username"></spring:message>
	<input onclick="testWin()" value="but1" type="button">
</body>
</html>
