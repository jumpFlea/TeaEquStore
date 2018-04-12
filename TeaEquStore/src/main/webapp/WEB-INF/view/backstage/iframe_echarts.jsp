<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/tool/tool.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>商品管理</title>

<script src="${ctx}/js/backstage/jquery2.1.1.min.js"></script>

<script src="${ctx}/js/backstage/bootstrap.js"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="${ctx}/css/style3.css">


<!--Bootstrap table css 和js-->

<link rel="stylesheet" href="${ctx}/css/bootstrap-table.min.css">
<script src="${ctx}/js/backstage/bootstrap-table.min.js"></script>
<script src="${ctx}/js/backstage/bootstrap-table-mobile.min.js"></script>
<script src="${ctx}/js/backstage/locale/bootstrap-table-zh-CN.min.js"></script>
<script type="text/javascript" src="${ctx}/js/backstage/ajaxfileupload.js"></script>

</head>


<body>
	<div class="col-sm-6">
		<div class="row">
			<div class="col-sm-12">
				<div class="ibox float-e-margins"></div>
				<div class="ibox-content">
					<div class="echarts" id="echarts-pie-chart"></div>
				</div>
			</div>
		</div>
	</div>

</body>
<script type="text/javascript" src="${ctx}/js/backstage/echarts.min.js"></script>
<script type="text/javascript" src="${ctx}/js/backstage/echarts-demo.js"></script>
		</html>
	