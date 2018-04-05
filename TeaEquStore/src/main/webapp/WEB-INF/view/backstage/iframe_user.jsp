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
				用户列表
				<input id="getUserType" value="${user.type}" type="hidden"></input>
					<span class="panel-title text-right" style="display: block;margin-right: 0px">欢迎 <c:if test="${user.userStatus == '1'}">
							<font color="red">${user.userName}</font>
						</c:if> <c:if test="${user.userStatus == '2'}">
							<font color="blue">${user.userName}</font>
						</c:if>
					</span>
			</h3>

		</div>

		<table id="userListTable" data-detail-view="true">

		</table>
	</div>

</body>

</html>