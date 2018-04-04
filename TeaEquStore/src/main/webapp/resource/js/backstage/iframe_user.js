/**
 * 
 */

$(document).ready(function() {
	$("#userListTable").bootstrapTable({
		url : ctx + "/userListController",
		method : "post",
		contentType : "application/x-www-form-urlencoded",
		toolbar : '#toolbar', // 工具按钮用哪个容器
		striped : true, // 是否显示行间隔色
		cache : false, // 是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
		pagination : true, // 是否显示分页（*）
		sortable : false, // 是否启用排序
		sortOrder : "asc", // 排序方式 */
		queryParams : queryParams,// 传递参数（*）
		sidePagination : "server", // 分页方式：client客户端分页，server服务端分页（*）
		pageNumber : 1, // 初始化加载第一页，默认第一页
		pageSize : 5, // 每页的记录行数（*）
		pageList : [ 5, 10, 20, 100 ], // 可供选择的每页的行数（*）
		smartDisplay : true,
		search : true, // 是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
		strictSearch : true,
		showColumns : true, // 是否显示所有的列
		showRefresh : true, // 是否显示刷新按钮
		minimumCountColumns : 2, // 最少允许的列数
		clickToSelect : true, // 是否启用点击选中行
		/* height : 300, //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度 */
		uniqueId : "id", // 每一行的唯一标识，一般为主键列
		// showToggle : false,
		// //是否显示详细视图和列表视图的切换按钮
		cardView : false, // 是否显示详细视图
		detailView : true, // 是否显示父子表
		columns : [ {
			checkbox : true, // 显示一个勾选框
			align : 'center',
			valign : 'bottom'
		},// 居中显示
		{
			field : 'u_id',
			title : 'ID',
			align : 'center',
			valign : 'middle'
		}, {
			field : 'userName',
			title : '用户名',
			align : 'center',
			valign : 'middle'
		}, {
			field : 'userPassWord',
			title : '密码',
			align : 'center',
			valign : 'middle'
		}, {
			field : 'type',
			title : '账号类型',
			align : 'center',
			valign : 'middle',
			formatter : function(value, row, index) {
				if (row.type === 2) {
					return '<button type="button" class="btn btn-outline btn-primary"   onClick=SuperVipAccount(' + row.id

					+ ')>超级管理员 </button>';
				} else if (row.type === 1) {
					return '<button type="button" class="btn btn-outline btn-danger" onClick=VipAccount(' + row.id

					+ ')>普通管理员</button>';
				} else {
					return '<button type="button" class="btn btn-outline btn-default" onClick=NolmalAccount(' + row.id

					+ ')>普通用户</button>';
				}
			}
		}, {
			field : 'userStatus',
			title : '状态',
			align : 'center',
			valign : 'middle',
			formatter : function(value, row, index) {
				if (row.userStatus == 1) {
					return "<label style='color: green'>正常</label>";
				} else {
					return "<label style='color: red'>已禁用</label>";
				}
			}
		}, {
			field : 'opt',
			title : '操作',
			align : 'center',
			valign : 'middle',
			formatter : function(value, row, index) {
				if (row.userStatus == 1) {
					return '<button type="button" class="btn btn-outline btn-default"  onClick=disableAccount(' + row.u_id

					+ ')>禁用 </button> &nbsp; &nbsp;' + '<button type="button" class="btn btn-outline btn-default"  onClick=deleteAccount(' + row.u_id

					+ ')>删除 </button>';
				} else {
					return '<button type="button" class="btn btn-outline btn-default" onClick=enableAccount(' + row.u_id

					+ ')>启用</button> &nbsp; &nbsp;' + '<button type="button" class="btn btn-outline btn-default"  onClick=deleteAccount(' + row.u_id

					+ ')>删除 </button>';
				}
			}
		} ]
	});
});

function disableAccount(id) {
	var id = id;
	$.post(ctx + "/updateStatus", {
		"id" : id,
		"status" : 0,
	}, function(data) {
		if (data.success == true) {
			alert("success");
			$('#userListTable').bootstrapTable('refresh');
			/* location.reload(); */
		}
	})
}
function enableAccount(id) {
	var id = id;
	$.post(ctx + "/updateStatus", {
		"id" : id,
		"status" : 1,
	}, function(data) {
		if (data.success == true) {
			alert("success");
			$('#userListTable').bootstrapTable('refresh');

		}
	})
}
function deleteAccount(id){
	
}

function queryParams(params) {
	var temp = { // 这里的键的名字和控制器的变量名必须一致，这边改动，控制器也需要改成一样的
		pageSize : params.limit, // 页面大小 点击下一页自动增长
		currentPage : params.offset, // 页码
		keyWord : $("div.pull-right.search > input").val()
	};
	return temp;
}
