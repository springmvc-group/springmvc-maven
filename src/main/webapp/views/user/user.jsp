<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user</title>
<jsp:include page="../commons/header_easyui.jsp"></jsp:include>
</head>

<body class="easyui-layout" data-options="border:false">
	<!-- footer:'#userFt', -->
	<table id="userDg" class="easyui-datagrid" title="用户信息管理"
		data-options="rownumbers:true,singleSelect:true,url:'datagrid_data1.json',method:'get',toolbar:'#userTb',pagination:true,fit:true">
		<thead>
			<tr>
				<th data-options="field:'itemid',width:80">Item ID</th>
				<th data-options="field:'productid',width:100">Product</th>
				<th data-options="field:'listprice',width:80,align:'right'">List
					Price</th>
				<th data-options="field:'unitcost',width:80,align:'right'">Unit
					Cost</th>
				<th data-options="field:'attr1',width:240">Attribute</th>
				<th data-options="field:'status',width:60,align:'center'">Status</th>
			</tr>
		</thead>
	</table>
	<div id="userTb" >
		<div style="padding:2px 5px;">
			<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true"
				onclick="showInputUserPage()">增减</a> <a href="#"
				class="easyui-linkbutton" iconCls="icon-edit" plain="true">编辑</a> <a
				href="#" class="easyui-linkbutton" iconCls="icon-save" plain="true">保存</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-cut" plain="true">剪切</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-remove"
				plain="true" onclick="getSelectedUser()">删除</a>
		</div>
		<div class="datagrid-toolbar"></div>
		<div style="padding:2px 5px;">
			Date From1: <input class="easyui-datebox" style="width: 110px">
			To: <input class="easyui-datebox" style="width: 110px">
			Language: <select class="easyui-combobox" panelHeight="auto"
				style="width: 100px">
				<option value="java">Java</option>
				<option value="c">C</option>
				<option value="basic">Basic</option>
				<option value="perl">Perl</option>
				<option value="python">Python</option>
			</select> <a href="#" class="easyui-linkbutton" iconCls="icon-search">Search</a>
		</div>
	</div>


	<!-- input form page -->
	<div id="inputUserPage" class="easyui-dialog" title="录入用户信息"
		style="width: 400px; height: 400px; padding: 10px"
		data-options="
				closed:true,
				iconCls: 'icon-save',
				toolbar: [{
					text:'新增',
					iconCls:'icon-add',
					handler:function(){
						alert('add');
						//$('#userForm').form('clear');
					}
				},'-',{
					text:'保存',
					iconCls:'icon-save',
					handler:function(){
						alert('save')
					}
				}],
				buttons: [{
					text:'保存',
					handler:function(){
						alert('ok');
						//$('#userForm').form('submit');
					}
				},{
					text:'关闭',
					handler:function(){
						$('#inputPage').dialog('close')
					}
				}]
			">
		<div class="easyui-layout">
			<form id="userForm" method="post">
				<div style="margin-bottom: 20px">
					<input class="easyui-textbox" name="name" style="width: 100%"
						data-options="label:'Name:',required:true">
				</div>
				<div style="margin-bottom: 20px">
					<input class="easyui-textbox" name="email" style="width: 100%"
						data-options="label:'Email:',required:true,validType:'email'">
				</div>
				<div style="margin-bottom: 20px">
					<input class="easyui-textbox" name="subject" style="width: 100%"
						data-options="label:'Subject:',required:true">
				</div>
				<div style="margin-bottom: 20px">
					<input class="easyui-textbox" name="message"
						style="width: 100%; height: 60px"
						data-options="label:'Message:',multiline:true">
				</div>
			</form>
		</div>
	</div>
	<script>
		function showInputUserPage(){
			$('#inputUserPage').dialog({
			    left:0,
			    top:0,
			    closed: false,
			    cache: false,
			    //href: 'input_user.html',
			    modal: false
			});
		}
		function getSelectedUser(){
			var row = $('#userDg').datagrid('getSelected');
			if (row){
				$.messager.confirm('删除提示', '你确认删除选中的记录吗?', function(r){
					if (r){
						alert('确认: '+r);
					}
				});
			}else{
				$.messager.alert('删除提示','至少选择一条记录后才能删除!','warning');
			}
		}
	</script>
</body>
</html>