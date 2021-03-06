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
			valign : 'middle',
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

					+ "," + row.type + ')>禁用 </button> &nbsp; &nbsp;' + '<button type="button" class="btn btn-outline btn-default"  onClick=deleteAccount(' + row.u_id

					+ "," + row.type + ')>删除 </button>';
				} else {
					return '<button type="button" class="btn btn-outline btn-default" onClick=enableAccount(' + row.u_id

					+ "," + row.type + ')>启用</button> &nbsp; &nbsp;' + '<button type="button" class="btn btn-outline btn-default"  onClick=deleteAccount(' + row.u_id

					+ "," + row.type + ')>删除 </button>';
				}
			}
		} ]
	});
});

/* 禁用用户 */
function disableAccount(id, type) {
	var id = id;
	var userType = $("#getUserType").val();
	if (userType > type) {
		disableAccountAjax(id);
	} else if (userType = type && userType == 2) {
		disableAccountAjax(id);
	} else if (userType = type && userType != 2) {
		alert("等级不够无法操作！");
	} else {
		alert("亲，等级不够哦！");
	}
}

function disableAccountAjax(id) {
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

/* 启用用户 */
function enableAccount(id, type) {
	var id = id;
	var userType = $("#getUserType").val();
	if (userType > type) {
		enableAccountAjax(id);
	} else if (userType = type && userType == 2) {
		enableAccountAjax(id);
	} else if (userType = type && userType != 2) {
		alert("等级不够无法操作！");
	} else {
		alert("亲，等级不够哦！");
	}

}

function enableAccountAjax(id) {
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

/* 删除用户 */
function deleteAccount(id, type) {
	var userType = $("#getUserType").val();
	if (userType > type) {
		deleteAccountAjax(id);
	} else if (userType = type && userType == 2) {
		deleteAccountAjax(id);
	} else if (userType = type && userType != 2) {
		alert("等级不够无法操作");
	} else {
		alert("亲，不可以删除");
	}
}

function deleteAccountAjax(id) {
	$.post(ctx + "/deleteAccount", {
		"id" : id
	}, function(result) {
		if (result.success == true) {
			alert("删除成功");
			$('#userListTable').bootstrapTable('refresh');
		} else
			alert("删除失败");
	});
}

/* 批量删除 */
$(document).on('click', '#selectMoreDelete', function(e) {
	// 获取所有被选中的记录
	var rows = $("#userListTable").bootstrapTable('getSelections');
	if (rows.length == 0) {
		alert("请先选择要删除的记录!");
		return;
	}
	var ids = '';
	for (var i = 0; i < rows.length; i++) {
		ids += rows[i]['u_id'] + ",";
	}
	ids = ids.substring(0, ids.length - 1);
	if (confirm("请谨慎操作,确定删除?")) {
		deleteMore(ids);
	}

});

function deleteMore(ids) {

	$.post(ctx + "/deleteMoreAccount", {
		"id" : ids
	}, function(data) {
		if (data.success == true) {
			alert("成功操作！")
			$('#userListTable').bootstrapTable('refresh');
		} else {
			alert("亲,操作失败！")
		}
	});
}

/* 修改用户之显示界面 */
$(document).on('click', '#updateShowAccount', function(e) {
	// 获取被选中的记录
	var rows = $("#userListTable").bootstrapTable('getSelections');
	if (rows.length == 0) {
		alert("请先选择要修改的记录!");
		return;
	} else if (rows.length == 1) {
		$("#userId").val(rows[0].u_id);
		$("#userName").val(rows[0].userName);
		$("#userPassWord").val(rows[0].userPassWord);
		$("#email").val(rows[0].email);
		$("#telephone").val(rows[0].telephone);
		$("#userStatus").val(rows[0].userStatus);
		$("#addressName").val(rows[0].addressName);
		$("#address").val(rows[0].address);
		$("#type").val(rows[0].type);
		$("#updateModal").modal({
			show : true
		});
	} else {
		alert("不支持多个框同时修改！");
		return;
	}
})
/* 确认修改操作 */
$(document).on('click', '#sureSumbit', function(e) {
	// 获取被选中的记录
	var userType = $("#getUserType").val();
	var type = $("#type").val();
	var status = $("#userStatus").val();
	if (userType == 2) {
		updateAccountAjax();
	} else if (userType <= type && userType != 2) {
		alert("等级不够,无法修改抱歉");
	} else if (type < 0 || type > 3 || status < 0 || status > 1) {
		alert("请检查type和status,");
	} else
		updateAccountAjax();
})

function updateAccountAjax() {
	$.post(ctx + "/updateAccount", {
		"u_id" : $("#userId").val(),
		"userName" : $("#userName").val(),
		"userPassWord" : $("#userPassWord").val(),
		"email" : $("#email").val(),
		"telephone" : $("#telephone").val(),
		"userStatus" : $("#userStatus").val(),
		"addressName" : $("#addressName").val(),
		"address" : $("#address").val(),
		"type" : $("#type").val(),
	}, function(data) {
		if (data.success == yes) {
			alert("success");
		} else {
			alert("sorry");
		}
	});
	$("#updateModal").modal("hide");
	$('#userListTable').bootstrapTable('refresh');
}

/* 新增数据 */
$(document).on('click', '#addAccount', function(e) {
	// 获取被选中的记录
	var userType = $("#getUserType").val();
	if (userType == 2 || userType == 1) {
		$("#updateModal").modal({
			show : true
		});
	} else
		alert("不是管理员");
})



function queryParams(params) {
	var temp = { // 这里的键的名字和控制器的变量名必须一致，这边改动，控制器也需要改成一样的
		pageSize : params.limit, // 页面大小 点击下一页自动增长
		currentPage : params.offset, // 页码
		keyWord : $("div.pull-right.search > input").val()
	};
	return temp;
}
