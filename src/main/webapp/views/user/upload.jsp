<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>上传文件</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/views/js/jquery-3.1.0.js"></script>
<script type="text/javascript">
	$(function() {
		$("#ajax_but1").on("click", upload);
	})

	/* 上传文件*/
	function upload() {
		var formData = new FormData($("#upload_ajax_form")[0]);
		$.ajax({
			type : "post",
			url : "upload_more",
			dataType : "json",//预期想要得到的结果
			data : formData,
			async : false,
			cache : false,
			/**   
			 *必须false才会自动加上正确的Content-Type   
			 */
			contentType : false,
			/**   
			 * 必须false才会避开jQuery对 formdata 的默认处理   
			 * XMLHttpRequest会对 formdata 进行正确的处理   
			 */
			processData : false,
			success : function(data) {//从后端返回数据进行处理
				alert(data)
			},
			error : function(err) {//提交出错
				$("#serverMsg").html(JSON.stringify(err));//打出响应信息
				alert("服务器无响应");
			}
		});
	}
</script>


</head>
<body>

	<form action="upload" method="post" enctype="multipart/form-data">
		<fieldset>
			<legend> 单文件上传</legend>
			<input type="file" name="file" /> <input type="submit"
				value="Submit" />
		</fieldset>
	</form>
	<form action="upload_more" method="post" enctype="multipart/form-data">
		<fieldset>
			<legend>多文件上传</legend>
			<table>
				<tr>
					<td>file1:</td>
					<td><input type="file" name="files" /></td>
				</tr>
				<tr>
					<td>file2:</td>
					<td><input type="file" name="files" /></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="Submit" /></td>
				</tr>
			</table>
		</fieldset>
	</form>
	<div id="serverMsg"></div>
	<form id="upload_ajax_form" method="post" enctype="multipart/form-data">
		<fieldset>
			<legend>AJAX文件上传</legend>
			<table>
				<tr>
					<td>file1:</td>
					<td><input type="file" name="files" /></td>
				</tr>
				<tr>
					<td>file2:</td>
					<td><input type="file" name="files" /></td>
				</tr>
				<tr>
					<td colspan="2"><input id="ajax_but1" type="button"
						value="Submit" /></td>
				</tr>
			</table>
		</fieldset>
	</form>
</body>
</html>