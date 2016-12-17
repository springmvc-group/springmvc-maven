<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>XXX-系统后台管理系统</title>

<jsp:include page="commons/header_easyui.jsp"/>
<style type="text/css">
.topbg {
	background:#B3DFDA;
	//background: url("images/top_bg.png") repeat;
	height: 65px;
	padding-top: 8px
}
</style>
</head>
<body class="easyui-layout">
	<!-- 上北 -->
	<div data-options="region:'north',border:false" class="topbg">
		<div class="easyui-layout" data-options="fit:true,border:false" >
			<div data-options="region:'west',border:false" style="width: 150px;background:#B3DFDA;">
				XXX管理系统
			</div>
			<div data-options="region:'center',border:false"
				style="text-align: right; padding-right: 10px;background:#B3DFDA;">
				<a href="#" class="easyui-linkbutton"
					data-options="iconCls:'icon-large-picture',size:'large',iconAlign:'top'">Picture</a>
				<a href="#" class="easyui-linkbutton"
					data-options="iconCls:'icon-large-clipart',size:'large',iconAlign:'top'">Clip
					Art</a> <a href="#" class="easyui-linkbutton"
					data-options="iconCls:'icon-large-shapes',size:'large',iconAlign:'top'">Shapes</a>
				<a href="#" class="easyui-linkbutton"
					data-options="iconCls:'icon-large-smartart',size:'large',iconAlign:'top'">SmartArt</a>
				<a href="#" class="easyui-linkbutton"
					data-options="iconCls:'icon-large-chart',size:'large',iconAlign:'top'">Chart</a>

			</div>
		</div>
	</div>
	<!-- 左西 -->
	<div data-options="region:'west',split:true,title:'系统菜单'"
		style="width: 200px; padding: 10px;">
		<!-- 系统侧边栏菜单 -->
		<ul id="sysTree" class="easyui-tree"></ul>
	</div>
	<!-- 右东-->
	<!-- 
	<div
		data-options="region:'east',split:true,collapsed:true,title:'East'"
		style="width: 100px; padding: 10px;">east region</div>
	 -->
	<!-- 下南-->
	<div data-options="region:'south',border:false"
		style="height: 30px;text-align:center; background:#B3DFDA; padding: 5px;">Copyright ©2010-2016 深圳市XXX软件开发有限公司 版权所有</div>
	<!-- 中心-->
	<div data-options="region:'center'">
		<!-- 主工作区用tab来组织 -->
		<div id="mainTabs" class="easyui-tabs" border="false" fit="true">
			<!-- 默认的首页 -->
			<div title="首页" style="overflow: hidden;">
				<iframe id="tabindex" src=""
					style="width: 100%; height: 100%; border: 0;"></iframe>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="js/main.js"></script>
</body>
</html>