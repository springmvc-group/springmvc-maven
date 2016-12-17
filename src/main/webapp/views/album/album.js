//相册公用的函数
var album={
	key:"id",
	saveUri:"save",
	editUri:"edit",
	deleteUri:"delete",
	updateUri:"update",
	viewUri:"view",
	findUri:"find",
	datagridId:"#albumDatagrid",
	inputWinId:"#inputAlbumWin",
	editWinId:"#editAlbumWin",
	viewWinId:"#viewAlbumWin",
	toolbar:"#toolbar",
	saveFormId:"#albumForm",
	showInputWin:function(){
		$(this.inputWinId).dialog({
			left : 0,
			top : 0,
			closed : false,
			cache : false,
			// href: 'input_user.html',
			modal : false
		});
	},
	showEditWin:function(){
		
	},
	doSave:function(form){
		var temp=this;
		var saveHandler=function(data){
			alert(data)
			$(temp.datagridId).datagrid('reload');
		}
		sendFormByAjax(this.saveUri,this.saveFormId,saveHandler);	
	},
	doUpdate:function(){
		var temp=this;
		var saveHandler=function(data){
			alert(data)
			$(temp.datagridId).datagrid('reload');
		}
		sendFormByAjax(this.updateUri,this.saveFormId,saveHandler);
	},
	doDelete:function(){
		var temp=this;
		
		var deleteHandler=function(row){
			var delUrl=temp.deleteUri+"?id="+row.id
			$.ajax({
				url :delUrl,
				success:function(){
					$(temp.datagridId).datagrid('reload');
				}
			})
		}
		isDelete(this.datagridId,deleteHandler);
	},
	initGrid:function(){
		// 定义冻结列
		var frozenColumns = [ [ {
			field : 'id', // 如果生成的checkbox为 <input type="checkbox" name="code"
			// value="xxx" > 则方便form提交
			checkbox : true
		}, {
			field : 'name',
			title : '相册名称',
			width : 80
		} ] ];

		// 定义标题栏
		var columns = [ [ {
			field : 'description',
			title : '相册描述',
			width : 200
		}, {
			field : 'number',
			title : '相册编号',
			width : 100
		} ] ];
	
		var url = "find";
		var temp=this;
		// 创建grid
		$(this.datagridId).datagrid({
			iconCls : 'icon-forward',
			fit : true,
			border : false,
			rownumbers : true,
			striped : true,
			// pageList: [30,50,100],
			pagination : true,
			singleSelect : true,
			// method:'get',
			//singleSelect : true,
			//toolbar : toolbar1,
			toolbar : temp.toolbar,
			url : temp.findUri,
			idField : temp.key,
			frozenColumns : frozenColumns,
			columns : columns
		});
		
	}
};

$(function() {
	album.initGrid();
	// TIP: 配合body解决页面跳动和闪烁问题
	$("body").css({
		visibility : "visible"
	});
});
