/**
 * 
 */

$(document).ready(function() {
	$("#goodsListTable").bootstrapTable({
		url : ctx + "/backgoods/goodsListController",
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
			field : 'e_id',
			title : 'ID',
			align : 'center',
			valign : 'middle',
		}, {
			field : 'equName',
			title : '器材名',
			align : 'center',
			valign : 'middle'
		}, {
			field : 'sellPrice',
			title : '出售价格',
			align : 'center',
			valign : 'middle'
		}, {
			field : 'number',
			title : '拥有数量',
			align : 'center',
			valign : 'middle',
			formatter : function(value, row, index) {
				if (row.number <= 5) {
					return '<label style="color: red">' + row.number + '</label>' + '&nbsp;&nbsp;&nbsp;<span class="label label-warning">告急</span>';
				} else {
					return '<label style="color: blue">' + row.number + '</label>';
				}
			}
		}, {
			field : 'sellNumber',
			title : '销售数量',
			align : 'center',
			valign : 'middle',
			field : 'number',
			formatter : function(value, row, index) {
				if (row.sellNumber >= 50) {
					return '<label style="color: red">' + row.sellNumber + '</label>' + '&nbsp;&nbsp;&nbsp;<span class="label label-danger">火热</span>';
				} else {
					return '<label>' + row.sellNumber + '</label>';
				}
			}
		}, {
			field : 'status',
			title : '状态',
			align : 'center',
			valign : 'middle',
			formatter : function(value, row, index) {
				if (row.status == 1) {
					return "<label style='color: green'>上线</label>";
				} else {
					return "<label style='color: red'>下线</label>";
				}
			}
		}, {
			field : 'opt',
			title : '操作',
			align : 'center',
			valign : 'middle',
			formatter : function(value, row, index) {
				if (row.status === 0) {
					return '<button type="button" class="btn btn-outline btn-primary"   onClick=openStatus(' + row.e_id

					+ ')>上线</button>';
				} else {
					return '<button type="button" class="btn btn-outline btn-default" onClick=closeStatus(' + row.e_id

					+ ')>下线</button>';
				}
			}
		} ]
	});
});

/* 上线 */
function openStatus(id) {
	var id = id;
	alert(id);
	$.post(ctx + "/backgoods/updateGoodsStatus", {
		"id" : id,
		"status" : 1,
	}, function(data) {
		if (data.success == true) {
			alert("success");
			$('#goodsListTable').bootstrapTable('refresh');
			/* location.reload(); */
		}
	})
}

/* 下线 */
function closeStatus(id) {
	var id = id;
	alert(id);
	$.post(ctx + "/backgoods/updateGoodsStatus", {
		"id" : id,
		"status" : 0,
	}, function(data) {
		if (data.success == true) {
			alert("success");
			$('#goodsListTable').bootstrapTable('refresh');
		}
	})
}

/* 修改用户之显示界面 */
$(document).on('click', '#updateShowGoods', function(e) {
	// 获取被选中的记录
	var rows = $("#goodsListTable").bootstrapTable('getSelections');
	if (rows.length == 0) {
		alert("请先选择要修改的记录!");
		return;
	} else if (rows.length == 1) {
		$("#eid").val(rows[0].e_id);
		$("#equName").val(rows[0].equName);
		$("#sellPrice").val(rows[0].sellPrice);
		$("#marketPrice").val(rows[0].marketPrice);
		$("#number").val(rows[0].number);
		$("#sellNumber").val(rows[0].sellNumber);
		$("#isHot").val(rows[0].isHot);
		$("#isNew").val(rows[0].isNew);
		$("#equDescription").val(rows[0].equDescription);
		$("#showImage").attr("src", ctx + "/" + rows[0].equPicture);
		$("#cateSecId").val(rows[0].cateSecId);
		$("#uid").val(rows[0].uid);
		$("#status").val(rows[0].status);
		$("#status").val(rows[0].status);
		$("#releaseTime").val(rows[0].releaseTime);
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
	$.ajaxFileUpload({
		type : "POST",
		url : ctx + "/backgoods/updateSelectGoods",
		data : {
			e_id : $("#eid").val(),
			equName : $("#equName").val(),
			sellPrice : $("#sellPrice").val(),
			marketPrice : $("#marketPrice").val(),
			number : $("#number").val(),
			sellNumber : $("#sellNumber").val(),
			isHot : $("#isHot").val(),
			isNew : $("#isNew").val(),
			equDescription : $("#equDescription").val(),
			cateSecId : $("#cateSecId").val(),
			uid : $("#uid").val(),
			status : $("#status").val()
		/* releaseTime : $("#releaseTime").val() */
		},// 要传到后台的参数，没有可以不写
		secureuri : false,// 是否启用安全提交，默认为false
		fileElementId : 'upload',// 文件选择框的id属性
		dataType : 'json',// 服务器返回的格式
		async : false,
		success : function(data) {
			if (data.success == true) {
				alert("success");
			} else {
				alert("亲，fail");
			}
		},
	});
	$("#updateModal").modal("hide");
	$('#goodsListTable').bootstrapTable('refresh');

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
			$("#updateModal").modal("hide");
			$('#goodsListTable').bootstrapTable('refresh');
		} else {
			alert("sorry");
		}
	});

}

function enableAccountAjax(id) {
	$.post(ctx + "/updateStatus", {
		"id" : id,
		"status" : 1,
	}, function(data) {
		if (data.success == true) {
			alert("success");
			$('#goodsListTable').bootstrapTable('refresh');
		}
	})
}

/* 批量删除 */
$(document).on('click', '#selectMoreDelete', function(e) {
	// 获取所有被选中的记录
	var rows = $("#goodsListTable").bootstrapTable('getSelections');
	if (rows.length == 0) {
		alert("请先选择要删除的记录!");
		return;
	}
	var ids = '';
	for (var i = 0; i < rows.length; i++) {
		ids += rows[i]['e_id'] + ",";
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
			$('#goodsListTable').bootstrapTable('refresh');
		} else {
			alert("亲,操作失败！")
		}
	});
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
