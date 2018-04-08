<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/tool/tool.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>用户管理</title>

<script src="${ctx}/js/backstage/jquery2.1.1.min.js"></script>

<script src="${ctx}/js/backstage/bootstrap.js"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/css/bootstrap.css">


<!--Bootstrap table css 和js-->

<link rel="stylesheet" href="${ctx}/css/bootstrap-table.min.css">
<script src="${ctx}/js/backstage/bootstrap-table.min.js"></script>
<script src="${ctx}/js/backstage/bootstrap-table-mobile.min.js"></script>
<script src="${ctx}/js/backstage/locale/bootstrap-table-zh-CN.min.js"></script>
<script type="text/javascript" src="${ctx}/js/backstage/iframe_user.js"></script>
</head>


<body>
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title text-center">
				用户列表 <input id="getUserType" value="${user.type}" type="hidden"></input> <span class="panel-title text-right" style="display: block; margin-right: 0px">欢迎 <c:if
						test="${user.userStatus == '1'}">
						<font color="red">${user.userName}</font>
					</c:if> <c:if test="${user.userStatus == '2'}">
						<font color="blue">${user.userName}</font>
					</c:if>
				</span>
			</h3>

		</div>
		<div class="panel-body">
			<div class="list-op" id="list_op">
				<button type="button" class="btn btn-info" id="addAccount">
					<span class="glyphicon glyphicon-plus"></span>增加
				</button>
				<button type="button" class="btn btn-info" id="updateShowAccount">
					<span class="glyphicon glyphicon-plus"></span>修改
				</button>
				<button type="button" class="btn btn-info" id="selectMoreDelete">
					<span class="glyphicon glyphicon-plus"></span>批量删除&nbsp;&nbsp;
				</button>
			</div>
		</div>

		<table id="userListTable" data-detail-view="true">

		</table>
	</div>

	<!-- 模态框（Modal） -->
	<!-- 按钮触发模态框 -->

	<!-- 模态框（Modal） -->
	<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4 class="modal-title" id="myModalLabel">当前用户</h4>
				</div>
				<div class="modal-body">
					<form id='searchForm' class="bs-example bs-example-form" role="form">
						<div class="input-group" style="width: 100%">
							<input type="hidden" class=" form-control" name="userName" id="userId"> <span class="input-group-addon text-center" style="width: 95px">用户名<i class="icon-th"></i></span> <input
								type="text" class=" form-control" name="userName" id="userName">
						</div>
						<div class="input-group" style="width: 100%">
							<span class="input-group-addon" style="width: 95px">密码：<i class="icon-th"></i></span> <input type="text" class="form-control" name="userPassWord" id="userPassWord">
						</div>

						<div class="input-group" style="width: 100%">
							<span class="input-group-addon text-center" style="width: 95px">邮件<i class="icon-th"></i></span> <input type="text" class=" form-control" name="email" id="email">
						</div>
						<div class="input-group" style="width: 100%">

							<span class="input-group-addon text-center" style="width: 95px">电话号码<i class="icon-th"></i></span> <input type="text" class=" form-control" name="telephone" id="telephone">
						</div>
						<div class="input-group" style="width: 100%">
							<span class="input-group-addon text-center" style="width: 95px">状态<i class="icon-th"></i></span> <input type="text" class=" form-control" name="userStatus" id="userStatus">
						</div>
						<div class="input-group" style="width: 100%">
							<span class="input-group-addon text-center" style="width: 95px">收货人姓名<i class="icon-th"></i></span> <input type="text" class=" form-control" name="addressName" id="addressName">
						</div>
						<div class="input-group" style="width: 100%">

							<span class="input-group-addon text-center" style="width: 95px">收货人地址<i class="icon-th"></i></span> <input type="text" class=" form-control" name="address" id="address">
						</div>
						<div class="input-group" style="width: 100%">
							<span class="input-group-addon text-center" style="width: 95px">类型<i class="icon-th"></i></span> <input type="text" class=" form-control" name="type" id="type">
						</div>
					</form>


				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="sureSumbit">提交更改</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

</body>
<!-- <script type="text/javascript">
/*批量删除*/
$("#selectMoreDelete").on("click",function(){
	alert("HAODE");
})
</script> -->
</html>