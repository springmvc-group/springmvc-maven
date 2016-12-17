$(function() {
	$("#sysTree").tree({
		url : "data/sys_tree_data.json",
		onClick : doMenuClick
	});

	function doMenuClick(node) {
		if ($("#sysTree").tree("isLeaf", node.target) == false)
			return;
		var id = node.id;
		var text = node.text;
		var url = node.url;
		if (!id)
			return;

		var elTab = parent.$('#mainTabs');
		if (elTab.tabs('exists', text)) {
			elTab.tabs('select', text);
		} else {
			var content = '<div style="width:100%;height:100%;overflow:hidden;">'
					+ '<iframe src="'
					+ url
					+ '" scrolling="auto" style="width:100%;height:100%;border:0;" ></iframe></div>';

			elTab.tabs('add', {
				title : text,
				content : content,
				// href: url,
				closable : true
			});
		}
	}
	
});

function isDelete(datagrid,callback){
	var row = $(datagrid).datagrid('getSelected');
	if (row) {
		$.messager.confirm('删除提示', '你确认删除选中的记录吗?', function(r) {
			if (r) {
				//alert(datagrid.deleteUrl);
				callback(row);
			}
		});
	} else {
		$.messager.alert('删除提示', '至少选择一条记录后才能删除!', 'warning');
	}
}
function sendFormByAjax(url,formId,callback){
	var data=$(formId).serialize()
	$.ajax({
		url :url,
		type : "post",
		//contentType : "application/json;charset=utf-8",
		dataType : "json",
		data : data,
		success : function(data) {
			callback(data);
		},
		error: function(data) {
             //alert("error:"+data.responseText);
			
        }
	});
	
}
