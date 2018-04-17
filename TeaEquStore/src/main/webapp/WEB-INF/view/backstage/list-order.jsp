<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/tool/tool.jsp"%>

<!DOCTYPE html>
<html>
<head>
<title>订单列表</title>

<link rel="stylesheet" type="text/css" href="${ctx}/css/bootstrap.css">
<link rel="stylesheet" href="${ctx}/css/bootstrap-table.min.css">
<!-- Data Tables -->
<link href="${ctx }/css/dataTables.bootstrap.css" rel="stylesheet">
<link href="${ctx }/css/style4.css" rel="stylesheet">
<link href="${ctx }/css/pagebar.css" rel="stylesheet">

<style type="text/css">
.ver-T {
	display: inline-block;
	*display: inline;
	*zoom: 1;
	vertical-align: top;
}

.order-list-head {
	border: 1px solid #d9d9d9;
	background-color: #f6f6f6;
}

.order-list-head div {
	text-align: center;
	height: 50px;
	line-height: 49px;
	font-weight: bold;
	font-size: 14px;
}

.order-list-tr {
	border: 1px solid #d9d9d9;
}

.orderRemark {
	max-width: 110px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.order-list-tr .order-list-tr-content>div:last-child {
	/* white-space:nowrap;   */
	
}

.order-list-tr-head {
	border-bottom: 1px solid #d9d9d9;
	background-color: #f6f6f6;
	padding: 10px;
}

.order-list-tr-content>div {
	text-align: center;
	height: 100%;
	line-height: 1.5;
	padding-top: 10px;
	padding-bottom: 10px;
	display: table;
}

.order-list-tr-content>div>div {
	vertical-align: middle;
	display: table-cell;
	float: none;
}

.order-list-tr-content>div.table-div {
	display: table;
	height: 100%;
	padding: 0;
}

.order-list-tr-content>div.table-div>p {
	display: table-cell;
	vertical-align: middle;
	line-height: 1.5
}

.order-list-tr-content div .content {
	height: 60px;
	max-width: 66%;
	margin-left: 15px;
}

.order-list-tr-content div .content>div {
	display: table;
	width: 100%;
	height: 100%;
}

.order-list-tr-content div .content>div p {
	display: table-cell;
	vertical-align: middle;
	line-height: 20px;
	text-align: left;
}

.order-list-tr-content div img {
	width: 60px;
	height: 60px;
	border: 1px solid #d9d9d9;
}

#myModal .modal-body table th {
	white-space: nowrap
}

#myModal .modal-body table tbody {
	display: block;
	max-height: 360px;
	overflow-y: scroll;
}

#myModal .modal-body table thead, #myModal .modal-body tbody tr {
	display: table;
	width: 100%;
	table-layout: fixed;
}

#startPage {
	width: 15%;
	display: inline;
}

#endPage {
	width: 15%;
	display: inline;
}
/*  .panel-body .input-group{
				width: 440px;
			}
			.panel-body .form-group{
				width: 440px;
			} */
</style>
</head>
<body class="gray-bg">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
			<div class="col-sm-12">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h3>订单列表</h3>
						<div class="ibox-tools">
							<a class="collapse-link" onclick="myRefresh()"> <i class="glyphicon glyphicon-refresh"></i>
							</a>
							<!-- <a class="close-link" onclick="myHistory()">
                                <i class="glyphicon glyphicon-menu-left"></i>
                            </a> -->
						</div>
					</div>
					<div class="ibox-content">
						<div class="panel-body  bg-from pad0B">
							<form id="exprot" action="${ctx }/admin/orderInfo/export" method="post">
								<div class="col-lg-4 form-group" style="margin-bottom: 15px; width: 40%; float: left">
									<div class="input-group">
										<span class="input-group-btn">
											<button class="btn btn-primary" type="button">
												<font>订单编号：</font>
											</button>
										</span><input type="text" id="orderNumber" name="oid" class="form-control trimInput">
									</div>
								</div>
								<div class="col-lg-4 form-group" style="margin-bottom: 15px; width: 40%; float: left">
									<div class="input-group">
										<span class="input-group-btn">
											<button class="btn btn-primary" type="button">
												<font>商品编号：</font>
											</button>
										</span><input type="text" id="productSerial" name="eid" class="form-control trimInput">
									</div>
								</div>
								<div class="col-lg-4 form-group" style="margin-bottom: 15px; width: 40%; float: left">
									<div class="input-group">
										<span class="input-group-btn">
											<button class="btn btn-primary" type="button">
												<font>商品名称：</font>
											</button>
										</span><input type="text" id="productName1" name="equName" class="form-control trimInput">
									</div>
								</div>
								<div class="col-lg-4 form-group" style="margin-bottom: 15px; width: 40%; float: left">
									<div class="input-group">
										<span class="input-group-btn">
											<button class="btn btn-primary" type="button">
												<font>收货人：</font>
											</button>
										</span><input type="text" id="receiveName" name="name" class="form-control trimInput">
									</div>
								</div>
								<div class="col-lg-4 form-group" style="margin-bottom: 15px; width: 40%; float: left">
									<div class="input-group">
										<span class="input-group-btn">
											<button class="btn btn-primary" type="button">
												<font>收货人手机号：</font>
											</button>
										</span><input type="text" id="receivePhone" name="phone" class="form-control trimInput">
									</div>
								</div>
								<!-- <div class="col-lg-4 form-group">
									<div class="input-group">
										<span class="input-group-btn">
											<button class="btn btn-primary" type="button">
												<font>供货类型</font>
											</button>
										</span> <select id="isSelf" name="isSelf" class="form-control">
											<option value="">全部</option>
											<option value="0">非自营</option>
											<option value="1">自营</option>
										</select>
									</div>
								</div> -->
								<!-- <div class="col-lg-4 form-group">
									<div class="input-group">
										<span class="input-group-btn">
											<button class="btn btn-primary" type="button">
												<font>订单类型</font>
											</button>
										</span> <select id="type" name="type" class="form-control">
											<option value="">全部</option>
											<option value="0">普通订单</option>
											<option value="1">创业注册订单</option>
										</select>
									</div>
								</div> -->
								<div class="col-lg-5 form-group" style="margin-bottom: 15px; width: 40%; float: left">
									<div class="input-group">
										<span class="input-group-btn">
											<button class="btn btn-primary" type="button">
												<font>下单时间：</font>
											</button>
										</span> <input type="text" id="beginCreateTime" name="orderStart" class="form-control"> <span class="input-group-btn">
											<button tabindex="-1" class="btn btn-white" type="button">--</button>
										</span> <input type="text" id="endCreateTime" name="orderEnd" class="form-control">

									</div>
								</div>

								<div class="col-lg-6 form-group" style="margin-bottom: 0px;">
									<input type="hidden" name="totalResults" id="totalResults" /> <input class="glyphicon-search" type="hidden" name="state" id="state" />
									<div id="btnSearch" class="btn btn-primary btn-outline glyphicon glyphicon-search">搜索</div>
									<div id="btnReset" class="btn btn-primary btn-outline glyphicon glyphicon-refresh btn_reset">刷新</div>
									第<input class="form-control trimInput" id="startPage" name="startPage">页至第<input class="form-control trimInput" id="endPage" name="endPage">页 <input type="button"
										class="btn btn-primary btn-outline glyphicon glyphicon-search" id="exportBtn" value="导出订单" />
									<!-- <div id="btn-import" class="btn btn-primary btn-outline glyphicon">导入</div> -->
									<div id="batch-clearance" class="btn btn-primary btn-outline glyphicon">批量清关</div>
								</div>
							</form>
						</div>
						<div class="row">
							<div class="col-sm-12">
								<div class="tabs-container" style="margin-left: 10px;">
									<ul class="nav nav-tabs">
										<li class="active"><a data-toggle="tab" id="tab" onclick="getOrderByState(0);" href="#tab-1" aria-expanded="true"> 全部</a></li>
										<li class=""><a data-toggle="tab" id="tab1" onclick="getOrderByState(1);" href="#tab-2" aria-expanded="false">待付款</a></li>
										<li class=""><a data-toggle="tab" id="tab3" onclick="getOrderByState(3);" href="#tab-3" aria-expanded="false">配货中</a></li>
										<li class=""><a data-toggle="tab" id="tab4" onclick="getOrderByState(4);" href="#tab-4" aria-expanded="false">清关中</a></li>
										<li class=""><a data-toggle="tab" id="tab5" onclick="getOrderByState(5);" href="#tab-5" aria-expanded="false">已发货</a></li>
										<li class=""><a data-toggle="tab" id="tab6" onclick="getOrderByState(6);" href="#tab-6" aria-expanded="false">已完成</a></li>
										<li class=""><a data-toggle="tab" id="tab8" onclick="getOrderByState(8);" href="#tab-7" aria-expanded="false">已归档</a></li>
										<li class=""><a data-toggle="tab" id="tab9" onclick="getOrderByState(9);" href="#tab-8" aria-expanded="false">已关闭</a></li>
									</ul>
									<div class="tab-content">
										<div id="tab-1" class="tab-pane active ">
											<div class="col-sm-12 m-b order-list-head">
												<div class="col-sm-2">
													<input type="checkbox" style="margin-top: 10px; margin-left: -5px;" class="check-all-btn" id="selectAll" name="selectAll" /> 商品名称
												</div>
												<div class="col-sm-1"></div>
												<div class="col-sm-1">单价</div>
												<div class="col-sm-1">收货人</div>
												<div class="col-sm-1">付款/元</div>
												<div class="col-sm-1">状态</div>
												<div class="col-sm-3">操作</div>
											</div>

											<div class="col-sm-12 dataContent" style="padding-left: 0px; padding-right: 0px;"></div>
											<div class="col-sm-12">
												<div class="pageBar"></div>
											</div>
										</div>

									</div>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
	<!-- 发货弹窗 -->
	<div class="modal inmodal" id="myModal" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog" style="width: 800px;">
			<div class="modal-content animated bounceInRight">
				<div class="modal-header">
					<div class="col-md-12 modal-title">
						<div class="col-md-4 modal-title-info">填写物流</div>
					</div>
				</div>
				<form id="submitSave">
					<div class="modal-body">
						<div class="form-group">
							<label class="col-sm-3 control-label">配送形式：</label>
							<div class="col-sm-8">
								<label class="radio-inline"> <input type="radio" checked="" style="margin-left: -15px; margin-top: 2px;" value="0" id="all" name="state">全部配送
								</label>
								<!-- disabled="disabled"  -->
								<label class="radio-inline"> <input type="radio" value="1" style="margin-left: -15px; margin-top: 2px;" id="batches" name="state">分批配送
								</label>
							</div>
						</div>
					</div>
					<div class="modal-body all">
						<div class="form-group">
							<label class="col-sm-3 control-label">物流公司：</label>
							<div class="col-sm-8">
								<select id="companyId" name="companyId" class="form-control">
									<option value="">请选择</option>
									<c:forEach items="${company }" var="li">
										<option value="${li.id }">${li.company }</option>
									</c:forEach>
								</select>
							</div>
						</div>
					</div>
					<div class="modal-body all">
						<div class="form-group">
							<label class="col-sm-3 control-label">物流单号：</label>
							<div class="col-sm-8">
								<input type="text" id="companyNumber" name="companyNumber" class="form-control trimInput">
							</div>
						</div>
					</div>

					<div class="modal-body batches" style="display: none; height: 30px;">
						<div class="form-group" style="margin-top: -20px;">
							<div id="newPackage" class="btn btn-primary btn-outline glyphicon">添加包裹</div>
						</div>
					</div>
					<input type="hidden" id="orderId" name="orderId" value="">
					<div class="modal-body batches" style="display: none;">
						<table class="table table-striped datatable check-group table-bordered table-hover product-table" style="text-align: center">
							<thead>
								<tr>
									<th style="text-align: center">包裹</th>
									<th style="text-align: center">商品</th>
									<th style="text-align: center">数量</th>
									<th style="text-align: center">物流公司</th>
									<th style="text-align: center">物流单号</th>
									<th style="text-align: center">操作</th>
								</tr>
							</thead>

							<tbody>

							</tbody>
						</table>
					</div>
				</form>
				<div class="modal-footer">
					<button type="button" class="btn btn-white" id="closePackage" data-dismiss="modal">关闭</button>
					<div type="button" class="btn btn-primary" id="savePackage">保存</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 选择商品弹窗 -->
	<div class="modal inmodal" id="add-product-modal" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog" style="width: 800px;">
			<div class="modal-content animated bounceInRight">
				<div class="modal-header">
					<div class="col-md-12 modal-title">
						<div class="col-md-4 modal-title-info">选择商品</div>
						<div class="col-md-7"></div>
						<div class="col-md-1">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
							</button>
						</div>
					</div>
					<form id="submitForm">
						<div class="col-md-12 modal-search">
							<div class="col-md-5">
								<div class="input-group">
									<span class="input-group-btn">
										<button class="btn btn-primary" type="button">
											<font>商品类别：</font>
										</button>
									</span>
									<div class="productType-group">
										<input type="text" class="productTypeName form-control trimInput" readonly name="productTypeName" placeholder="商品类别"> <input type="hidden" class="productTypeId" name="productTypeId"
											id="productTypeId"> <input type="hidden" class="totalPage" value=""> <input type="hidden" class="totalResults" value="">
										<div class="dd productType-nestable"></div>
									</div>
								</div>
							</div>
							<div class="col-md-5 form-group">
								<div class="input-group">
									<span class="input-group-btn">
										<button class="btn btn-primary" type="button">
											<font>商品名称：</font>
										</button>
									</span> <input type="text" id="productName" name="productName" class="form-control trimInput names" placeholder="商品名称">
								</div>
							</div>
							<div class="col-sm-1 form-group" style="margin-bottom: 0px;">
								<div id="product-search" title="搜索" class="btn btn-sm btn-primary btn-outline ">搜索</div>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-body">
					<table class="table table-striped datatable check-group table-bordered table-hover select-product-table" style="text-align: center">
						<thead>
							<tr>
								<th style="text-align: center">
									<div class="checkbox i-checks ids" title="全选/全不选">
										<label> <input type="checkbox" style="margin-top: 3px; margin-left: -18px;" class="check-all-btn" onclick="selectAll(this)" id="select-all-product" name="selectAll" />
										</label>
									</div>
								</th>
								<th style="text-align: center">商品类别</th>
								<th style="text-align: center">商品编号</th>
								<th style="text-align: center">商品名称</th>
								<th style="text-align: center">订购商品数量</th>
								<th style="text-align: center">实际发货数量</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
					<div id="add-product-submit-btn" type="button" class="btn btn-primary">保存</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 后台备注弹框 -->
	<div class="modal inmodal" id="background-remark" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content animated bounceInRight">
				<div class="modal-header">
					<div class="col-md-12 modal-title">
						<div class="col-md-4 modal-title-info">备注</div>
					</div>
				</div>
				<div class="modal-body all">
					<div class="form-group">
						<label class="col-sm-2 control-label">标记：</label>
						<div class="col-sm-10">
							<label class="radio-inline" style="margin-right: -5px;"> <input type="radio" checked="" value="1" name="backgroundMemoMark" style="margin-top: 5px;">&nbsp; <img
								src="${ctx }/images/flag/pic1.png">
							</label> <label class="radio-inline" style="margin-right: -5px;"> <input type="radio" value="2" name="backgroundMemoMark" style="margin-top: 5px;">&nbsp; <img
								src="${ctx }/images/flag/pic2.png">
							</label> <label class="radio-inline" style="margin-right: -5px;"> <input type="radio" value="3" name="backgroundMemoMark" style="margin-top: 5px;">&nbsp; <img
								src="${ctx }/images/flag/pic3.png">
							</label> <label class="radio-inline" style="margin-right: -5px;"> <input type="radio" value="4" name="backgroundMemoMark" style="margin-top: 5px;">&nbsp; <img
								src="${ctx }/images/flag/pic4.png">
							</label> <label class="radio-inline" style="margin-right: -5px;"> <input type="radio" value="5" name="backgroundMemoMark" style="margin-top: 5px;">&nbsp; <img
								src="${ctx }/images/flag/pic5.png">
							</label> <label class="radio-inline" style="margin-right: -5px;"> <input type="radio" value="6" name="backgroundMemoMark" style="margin-top: 5px;">&nbsp; <img
								src="${ctx }/images/flag/pic6.png">
							</label>
						</div>
					</div>
				</div>
				<div class="modal-body " style="height: 150px;">
					<div class="form-group">
						<label class="col-sm-2 control-label">备注：</label>
						<div class="col-sm-10">
							<textarea rows="4" cols="50" id="backgroundRemark" name="backgroundRemark"></textarea>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
					<div type="button" class="btn btn-primary" id="saveRemark">保存</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 导入弹框 -->
	<div class="modal inmodal" id="import-order" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content animated bounceInRight">
				<div class="modal-header">
					<div class="col-md-12 modal-title">
						<div class="col-md-4 modal-title-info">导入订单</div>
					</div>
				</div>
				<div class="modal-body all">
					<div class="form-group">
						<label class="col-sm-3 control-label">选择文件：</label>
						<div class="col-sm-8">
							<input type="file" id="file" name="file" onchange="ajaxFileUpload2($(this))" /> <input type="hidden" id="filePath" name="filePath">
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
					<div type="button" class="btn btn-primary" id="batch-shipment">批量发货</div>
				</div>
			</div>
		</div>
	</div>
	<script src="${ctx}/js/backstage/jquery2.1.1.min.js"></script>
	<script src="${ctx}/js/backstage/bootstrap.js"></script>

	<script src="${ctx}/js/backstage/bootstrap-table.min.js"></script>
	<script src="${ctx}/js/backstage/bootstrap-table-mobile.min.js"></script>
	<script src="${ctx}/js/backstage/locale/bootstrap-table-zh-CN.min.js"></script>
	<script src="${ctx}/js/backstage/sweetalert.min.js"></script>

	<script src="${ctx }/js/backstage/jquery.pagebar.1.0.0.js?v=${version}"></script>
	<script src="${ctx }/js/backstage/jquery.dataTables.js"></script>
	<script src="${ctx }/js/backstage/laydate/laydate.js"></script>
	<script src="${ctx }/js/backstage/pageBarCommon.js?v=${version}"></script>
	<script src="${ctx }/js/backstage/jquery-ui.js?v=${version}"></script>
	<script src="${ctx }/js/backstage/list-order.js?v=${version}"></script>
	<script type="text/javascript">
		function middle() {
			$(".order-list-tr-content").each(function() {
				var height = $(this).height();
				$(this).height(height);
			});
		}
		middle();
		$("#add-product-submit-btn").click(
				function() {
					ids = $("input:checkbox[name='productId']:checked").map(function(index, elem) {
						return $(elem).val();
					}).get().join(',');
					if (ids == "") {
						layer.alert("未选择要发送的商品");
						return;
					}
					var productType = "";
					var productSerial = "";
					var productName = "";
					var quantity = "";
					for (var i = 0; i < $('.select-product-table tbody tr td:first-child+td').length; i++) {
						if ($($('.selected')[i]).is(':checked')) {
							var selQuantity = Number($($('.select-product-table tbody tr td .quantityInput')[i]).val());
							var oldQuantity = Number($($('.select-product-table tbody tr td:first-child+td+td+td+td')[i]).html());
							if (selQuantity > oldQuantity) {
								layer.alert("选择商品数量大于订购数量，请重新选择。");
								return;
							}
							if (selQuantity <= 0) {
								layer.alert("要发货的商品数量应大于零。");
								return;
							}
							productType += $($('.select-product-table tbody tr td:first-child+td')[i]).html();
							productSerial += $($('.select-product-table tbody tr td:first-child+td+td')[i]).html();
							productName += $($('.select-product-table tbody tr td:first-child+td+td+td')[i]).html() + ",";
							quantity += selQuantity + ",";

						}
					}
					productName = (productName.substring(productName.length - 1) == ',') ? productName.substring(0, productName.length - 1) : productName;
					quantity = (quantity.substring(quantity.length - 1) == ',') ? quantity.substring(0, quantity.length - 1) : quantity;
					j++;
					var html = '<tr><td>' + j + '<input type="hidden" name="listOrderDeliveryRecord[' + (j - 1) + '].itemIds" value="' + ids + '"></td>'
							+ '<td><input type="hidden" name="listOrderDeliveryRecord[' + (j - 1) + '].productNames" value="' + productName + '"><a style="color:black;" >' + productName + '</a></td>'
							+ '<td><input type="hidden" name="listOrderDeliveryRecord[' + (j - 1) + '].quantitys" value="' + quantity + '"><a style="color:black;">' + quantity + '</a></td>' + '<td>'
							+ '<select name="listOrderDeliveryRecord[' + (j - 1) + '].companyId" class="form-control">' + '<option value="">全部</option><c:forEach items="${company }" var="li">'
							+ '<option value="${li.id }">${li.company }</option></c:forEach></select></td>' +

							'<td><input type="text" name="listOrderDeliveryRecord[' + (j - 1) + '].companyNumber" class="form-control quantityInput"></td>'
							+ '<td><button class="btn btn-danger" type="button" onclick="del(this);" ><font>删除</font>' + '</button></td></tr>';
					$(".product-table tbody").append(html);
					console.log("111111")
					$("#add-product-modal").modal("hide");
				});

		laydate.render({
			elem : '#beginCreateTime',
			type : 'datetime',
		});
		laydate.render({
			elem : '#endCreateTime',
			type : 'datetime'
		});
		laydate.render({
			elem : '#beginPayTime',
			type : 'datetime'
		});
		laydate.render({
			elem : '#endPayTime',
			type : 'datetime'
		});
		//全选/全不选
		$("#selectAll").click(function() {
			var $this = $(this);
			if ($this.prop("checked")) {
				$("input[name='id']").prop("checked", true);
			} else {
				$("input[name='id']").prop("checked", false);
			}
		});
		$(".dataContent")
				.initPageBar(				
						{
							url : ctx + "/backorders/ordersListController", // 数据加载所调用的url
							ctrlContent : $(".pageBar"), // 分页控件的容器对象，分页空间指的是：上一页，下一页，首页，尾页……等
							htmlContent : function(data) {// 拼接返回的数据作为页面展示的html代码。
								var html = "";
								alert("DDDD");
								if (data.list == null || data.list.length == 0) {
									html = '<p style="text-align: center;">暂无数据</p>';
									return html;
								}
								$(".totalPage").val(data.totalPage);
								$("#totalResults").val(data.totalResults);
								alert(data.list);
								for ( var i = 0; i < data.list.length; i++) {
									var order = data.list[i];
									if(1==1){
										
										var deliverType='';
										var orderType='';
										/* if(order.orderType==1){
											orderType= '<a style="color:red">(拼团'+order.orderTypeStateStr+')</a>';
										}
										if(order.orderType==2){
											orderType= '<a style="color:red">(砍价'+order.orderTypeStateStr+')</a>';
										} */	
							
										html += '<div class="col-sm-12 order-list-tr"  style="padding-left: 0px;padding-right: 0px;">' +
										'<div class="col-sm-12 order-list-tr-head">' +
											'<div class="col-sm-2"><input type="checkbox" value="'+order.oid+'" name="id" />&nbsp;&nbsp;' + order.name +'</div>' ;
											
											html += '<div class="col-sm-4 remark-'+order.oid+'">';
											html+= '<img style="display:none" class="img" src="">';
											/* if(order.backgroundMemoMark>0){
												html+= '<img class="old-img" src="${ctx }/images/flag/pic'+order.backgroundMemoMark+'.png">';
											} */
											
											html += '订单编号 : ' + order.oid+'<span style="margin-left:20px;">'+getIsSelfStr(order.orderItems[0].isSelf)+orderType+'</span></div>' ;
											html+='<div class="col-sm-3">下单时间 : ' + order.changTime + '</div>';
											if(order.orderState==0){
											html +=	'<div class="col-sm-3">订单状态 : 未付款  </div>' +'</div>';
											}else if(order.orderState==1){
											html +=	'<div class="col-sm-3">订单状态 : 已付款  </div>' +'</div>';
											}else if(order.orderState==2){
											html +=	'<div class="col-sm-3">订单状态 : 待发货  </div>' +'</div>';
											}else{
											html +=	'<div class="col-sm-3">订单状态 : 待收货  </div>' +'</div>';
											}
											//var orderItem = order.orderItems[x];
											html += 
											'<div class="col-sm-12 order-list-tr-content">' ;
												
												html += '<div class="col-sm-3">';
												for(var index = 0 ; index < order.orderItems.length ; index++){
													html += '<div class="col-sm-12 text-left pull-left" style="line-height:30px"><img class="ver-T" src="' +ctx +'/'+ order.orderItems[index].good.equPicture + '"><div class="ver-T content"><div><p>' + order.orderItems[index].good.equName + '</p></div></div></div>' ;
												}
												html += '</div>';
												html += '<div class="col-sm-1">';
												for(var index = 0 ; index < order.orderItems.length ; index++){
													html += '<div class="col-sm-12 pull-left" style="line-height:60px">'+ order.orderItems[index].subtotal + '</div>' ;
												}
												html += '</div>';
												
												
												html +=
												'<div class="col-sm-1" style="display:table;height:100%"><div style="display:table-cell;vertical-align:middle;">' + order.name +"<br>"+ order.phone + '</div></div>' +
												'<div class="col-sm-1" style="display:table;height:100%"><div style="display:table-cell;vertical-align:middle;">' + order.subtotal + '</div></div>' +
												'<div class="col-sm-2" style="display:table;height:100%"><div class="orderRemark" style="display:table-cell;vertical-align:middle;">' + order.remark + '</div></div>' ;
												if(order.refundType==0 && order.refundState!=7 ){
													html += '<div class="col-sm-1 table-div order-'+order.id+'"><p>' + order.stateStr + '<a style="color:red">('+getRefundSater(order.refundState,0)+')</a></p></div>' ;
												}else if(order.refundType==1 && order.refundState!=7 ){
													html += '<div class="col-sm-1 table-div order-'+order.id+'"><p>' + order.stateStr + '<a style="color:red">('+getRefundSater(order.refundState,1)+')</a></p></div>' ;
												} else{
													html += '<div class="col-sm-1 table-div order-'+order.id+'"><p>' + order.stateStr + '</p></div>' ;		
												}
																							
												html += '<div class="col-sm-2"><div style="display:table-cell;vertical-align:middle;">' +
												
													'<shiro:hasPermission name="orderInfo:order:detail"><a title = "订单详情" class="btn btn-primary newTab" data-url="'+ctx +'/admin/orderInfo/go/detail-order?id='+ order.id +'"  >查看详情</a></shiro:hasPermission>&nbsp;&nbsp;' ;
													
														html += '<shiro:hasPermission name="orderInfo:order:deliver"><a class="btn btn-primary deliver-'+order.id+' " style="display:none;" onclick="deliver('+order.id+')"  >发货</a></shiro:hasPermission>' ;

														if(order.state == 3 && order.isAbord == 0){
															html += '<shiro:hasPermission name="orderInfo:order:deliver"><a class="btn btn-primary btn-deliver-'+order.id+'" onclick="deliver('+order.id+')"  >发货</a></shiro:hasPermission>&nbsp;&nbsp;' ;
														}
														if(order.state == 3 && order.isAbord == 1){
															html += '<shiro:hasPermission name="orderInfo:order:clearance"><a class="btn btn-primary clearance-'+order.id+'" onclick="customsClearance(4,'+order.id+');" >清关</a></shiro:hasPermission>&nbsp;&nbsp;' ;
														}
														if(order.state == 4 ||order.state == 5&&deliverType.length>0){
															html += '<shiro:hasPermission name="orderInfo:order:deliver"><a class="btn btn-primary btn-deliver-'+order.id+'" onclick="deliver('+order.id+')"  >发货</a></shiro:hasPermission>&nbsp;&nbsp;' ;
														} 
														/* if(order.refundType == 0 ||order.refundType == 1 ){
															html += '<a class="btn btn-primary"  >查看售后单详情</a>&nbsp;&nbsp;' ;
														}  */
														if(order.orderType==3&&order.state!=8){
															html += '<a class="btn btn-primary archive-'+order.id+'" onclick="customsArchive(8,'+order.id+');" >归档</a>' ;
														}
														if(order.state < 9){		
															if(order.isCloseRefund == 0&&order.orderType!=3){
																html += '<shiro:hasPermission name="orderInfo:close:refund"><a class="btn btn-primary close-refund-'+order.id+'" onclick="closeRefund('+order.id+')"  >关闭售后</a></shiro:hasPermission>&nbsp;&nbsp;' ;
															}	
															if(order.state == 1 ||order.refundType==0 ||order.refundType==1){
																html += '<shiro:hasPermission name="orderInfo:close:order"><a class="btn btn-primary close-order-'+order.id+'" onclick="closeOrder('+order.id+');"  >关闭订单</a></shiro:hasPermission>&nbsp;&nbsp;' ;
															}
															if(order.refundType==0 ||order.refundType==1&&order.state!=8){
																html += '<a class="btn btn-primary archive-'+order.id+'" onclick="customsArchive(8,'+order.id+');" >归档</a>' ;
															}
														}
														html += '<shiro:hasPermission name="orderInfo:order:remark"><a class="btn btn-primary" onclick="backgroundRemark('+order.id+');"  >备注</a></shiro:hasPermission>&nbsp;&nbsp;' ;
													
												html += '</div></div></div>';
											
										html += '</div>';
										
									}else{
										html += '<div class="col-sm-12 order-list-tr"  style="padding-left: 0px;padding-right: 0px;">' +
										'<div class="col-sm-12 order-list-tr-head">' +
											'<div class="col-sm-2">' + order.userName + "(  "+order.userSerial+"  )"+'</div>' ;
											
											html += '<div class="col-sm-4">订单编号 : ' + order.originOrderNumber + "  (<a style='color:red'>原始</a>)"+'</div>' +
											
											'<div class="col-sm-3">订单类型 : ' + order.typeStr + '</div>' +
										'</div>';
										var listSplitSingle = order.listSplitSingle;
										for ( var j = 0;j < listSplitSingle.length;j++){
											
											//发货状态
											var deliverType='';
											
											for( var x = 0;x < listSplitSingle[j].orderItems.length;x++){
												if(listSplitSingle[j].orderItems[x].notDelivered > 0){
													deliverType='(<a style="color:red">部分发货</a>)';
												}
											}
											
											html+= '<div class="col-sm-12 order-list-tr-head">' +
												'<div class="col-sm-4 remark-'+order.listSplitSingle[j].id+'"><input type="checkbox" value="'+listSplitSingle[j].id+'" name="id" />&nbsp;&nbsp;';
												html+= '<img style="display:none;" src="${ctx }/images/flag/pic'+order.listSplitSingle[j].backgroundMemoMark+'.png">';
												if(order.listSplitSingle[j].backgroundMemoMark>0){
													html+= '<img src="${ctx }/images/flag/pic'+order.listSplitSingle[j].backgroundMemoMark+'.png">';
												}
												if(order.listSplitSingle[j].state==5){
													html += '订单编号 : ' + listSplitSingle[j].orderNumber+deliverType+'</div>' ;
												} else{
													html += '订单编号 : ' + listSplitSingle[j].orderNumber+'</div>' ;
												}
												
												html+= '<div class="col-sm-3">下单时间 : ' + listSplitSingle[j].createTime + '<span style="margin-left: 20px;">'+ getIsSelfStr(listSplitSingle[j].orderItems[0].isSelf) +'</span></div>' +
											'</div>';
											//遍历所有商品信息	
											html += 
												'<div class="col-sm-12 order-list-tr-content">' ;
												
													html += '<div class="col-sm-3">';
													for(var index = 0 ; index < listSplitSingle[j].orderItems.length ; index++){
														html += '<div class="col-sm-12 text-left pull-left" style="line-height:30px"><img class="ver-T" src="' + listSplitSingle[j].orderItems[index].productPic + '"@120w_120h_1e_1c_75Q.jpg"><div class="ver-T content"><div><p>' + listSplitSingle[j].orderItems[index].productName + '</p></div></div></div>' ;
													}
													html += '</div>';
													html += '<div class="col-sm-1">';
													for(var index = 0 ; index < listSplitSingle[j].orderItems.length ; index++){
														html += '<div class="col-sm-12 pull-left">' + listSplitSingle[j].orderItems[index].price +"*"+listSplitSingle[j].orderItems[index].quantity +  '</div>' ;
													}
													html += '</div>';
																		
													html +=
														'<div class="col-sm-1" style="display:table;height:100%"><div style="display:table-cell;vertical-align:middle;">' + listSplitSingle[j].receiveName +"<br>"+ listSplitSingle[j].receivePhone + '</div></div>' +
														'<div class="col-sm-1" style="display:table;height:100%"><div style="display:table-cell;vertical-align:middle;">' + listSplitSingle[j].payPrice + '</div></div>' +
														'<div class="col-sm-2" style="display:table;height:100%"><div style="display:table-cell;vertical-align:middle;">' + listSplitSingle[j].remark + '</div></div>' ;
																
													if(order.listSplitSingle[j].refundType==0  && order.listSplitSingle[j].refundState!=7 ){
														html += '<div class="col-sm-1  table-div order-'+order.id+'"><p>' + order.listSplitSingle[j].stateStr + '(<a style="color:red">'+getRefundSater(order.listSplitSingle[j].refundState,0)+'</a>)</p></div>' ;
													}else if(order.listSplitSingle[j].refundType==1 && order.listSplitSingle[j].refundState!=7 ){
														html += '<div class="col-sm-1  table-div order-'+order.listSplitSingle[j].id+'"><p>' + order.listSplitSingle[j].stateStr + '(<a style="color:red">'+getRefundSater(order.listSplitSingle[j].refundState,1)+'</a>)</p></div>' ;
													} else{
														html += '<div class="col-sm-1  table-div order-'+order.listSplitSingle[j].id+'"><p>' + order.listSplitSingle[j].stateStr + '</p></div>' ;		
													}

													html+= '<div class="col-sm-2" style="display:table;height:100%"><div style="display:table-cell;vertical-align:middle;">' +
														'<shiro:hasPermission name="orderInfo:order:detail"><a title = "订单详情" class="btn btn-primary newTab" data-url="'+ctx +'/admin/orderInfo/go/detail-order?id='+order.listSplitSingle[j].id+'"  >查看详情</a></shiro:hasPermission>&nbsp;&nbsp;' ;
														html += '<shiro:hasPermission name="orderInfo:order:deliver"><a class="btn btn-primary deliver-'+order.listSplitSingle[j].id+' deliver" style="display:none;" onclick="deliver('+order.listSplitSingle[j].id+')"  >发货</a></shiro:hasPermission>' ;
														if(order.listSplitSingle[j].state == 3 && order.listSplitSingle[j].isAbord == 0){
															html += '<shiro:hasPermission name="orderInfo:order:deliver"><a class="btn btn-primary btn-deliver-'+order.listSplitSingle[j].id+'" onclick="deliver('+order.listSplitSingle[j].id+')"  >发货</a></shiro:hasPermission>&nbsp;&nbsp;' ;
														}
														if(order.listSplitSingle[j].state == 3 && order.listSplitSingle[j].isAbord == 1){
															html += '<shiro:hasPermission name="orderInfo:order:clearance"><a class="btn btn-primary clearance-'+order.listSplitSingle[j].id+'" onclick="customsClearance(4,'+order.listSplitSingle[j].id+');" >清关</a></shiro:hasPermission>&nbsp;&nbsp;' ;
														}
														if(order.listSplitSingle[j].state == 4 || order.listSplitSingle[j].state == 5 && deliverType.length >0 ){
															html += '<shiro:hasPermission name="orderInfo:order:deliver"><a class="btn btn-primary btn-deliver-'+order.listSplitSingle[j].id+'" onclick="deliver('+order.listSplitSingle[j].id+')"  >发货</a></shiro:hasPermission>&nbsp;&nbsp;' ;
														}
														
														if(order.listSplitSingle[j].state < 9){
															if(order.listSplitSingle[j].isCloseRefund == 0 ){
																html += '<shiro:hasPermission name="orderInfo:close:refund"><a class="btn btn-primary close-refund-'+order.id+'" onclick="closeRefund('+order.listSplitSingle[j].id+')"  >关闭售后</a></shiro:hasPermission>&nbsp;&nbsp;' ;
															}
															if(order.listSplitSingle[j].state == 1 ||order.listSplitSingle[j].refundType==0 ||order.listSplitSingle[j].refundType==1){
																html += '<shiro:hasPermission name="orderInfo:close:order"><a class="btn btn-primary close-order-'+order.id+'" onclick="closeOrder('+order.listSplitSingle[j].id+');"  >关闭订单</a></shiro:hasPermission>&nbsp;&nbsp;' ;
															}									
														}
													html += '<shiro:hasPermission name="orderInfo:order:remark"><a class="btn btn-primary" onclick="backgroundRemark('+order.listSplitSingle[j].id+');" >备注</a></shiro:hasPermission>&nbsp;&nbsp;' ;
													
												html += '</div></div></div>';
											
										}
										html+='</div>';
										
									}
								}
								$("input[name='selectAll']").prop("checked", false);
								return html;
							}
						}, {
							pageNumber : 1,
							pageSize : 30,

						/* orderColumn : 1,
						orderBy : 1 */
						});
		$("#btnSearch").btnPageBarCondQuery();

		function getIsSelfStr(isSelf) {
			var str = "自营";
			if (isSelf == 0) {
				str = "非自营";
			}
			return str;
		};

		function getRefundSater(refundSater, refundType) {
			var str = "";
			if (refundType == 0 && refundSater == 1) {
				str = "买家申请退款";
			}
			if (refundType == 1) {
				if (refundSater == 1) {
					str = "买家申请退货退款";
				} else if (refundSater == 2) {
					str = "等待买家退货";
				} else if (refundSater == 3) {
					str = "买家退货中";
				}
			}
			if (refundSater == 4) {
				str = "待退款";
			} else if (refundSater == 5) {
				str = "售后完成";
			} else if (refundSater == 6) {
				str = "已拒绝售后";
			} else if (refundSater == 8) {
				str = "售后退款中";
			}
			return str;
		}

		function getTypeStr(state) {
			var str = "普通订单";
			if (state == 1) {
				str = "标准店开店礼包";
			} else if (state == 2) {
				str = "创业店开店礼包";
			} else if (state == 3) {
				str = "店铺升级礼包";
			}
			return str;
		};
		//查看详情
		function viewDetails(id) {
			location.href = ctx + '/admin/orderInfo/go/detail-order?id=' + id;
		}
		function getOrderByState(state) {
			if (state > 0) {
				$("#state").val(state);
			} else {
				$("#state").val("");
			}
			$("#btnSearch").click();
			middle();
		}
		//保存后台备注
		$("#saveRemark").click(function() {
			var id = $("#orderId").val();
			var backgroundMemoMark = $('input:radio[name="backgroundMemoMark"]:checked').val();
			var backgroundRemark = $("#backgroundRemark").val();
			$.ajax({
				url : ctx + "/admin/orderInfo/edit-background-remark",
				type : 'post',
				dataType : 'json',
				data : {
					id : id,
					backgroundMemoMark : backgroundMemoMark,
					backgroundRemark : backgroundRemark
				},
				success : function(data) {
					//$(".ui-button").removeAttr("disabled");
					if (data.success) {
						layer.msg("保存成功!");
						//html = '<img src="${ctx }/images/flag/pic'+backgroundMemoMark+'.png">';
						$(".remark-" + id + " img ").show();
						$(".remark-" + id + " img ").attr('src', "${ctx }/images/flag/pic" + backgroundMemoMark + ".png");
						$(".remark-" + id + " img ").next().remove();
						//setTimeout('goListOrder()', 800);
					} else {
						layer.msg(data.info);
					}
				},
				error : function(data) {
					$(".ui-button").removeAttr("disabled");
					layer.msg(data.info);
				}
			});
			$("#backgroundMemoMark").val(0);
			$("#backgroundRemark").val('');
			$("#background-remark").modal("hide");
		});

		//导出excel
		$("#exportBtn").click(function() {
			var rule = /^[1-9]*[1-9][0-9]*$/;
			var startPage = $("#startPage").val();
			var endPage = $("#endPage").val();
			var totalPage = $(".totalPage").val();
			if (startPage == "" && endPage != "") {
				alert("请输入开始页数");
				return;
			}
			if (startPage != "" && endPage == "") {
				alert("请输入结束页数");
				return;
			}
			if (startPage != "" && endPage != "") {
				if (!rule.test(startPage)) {
					alert("请输入正确的开始页数");
					return;
				}
				if (!rule.test(endPage)) {
					alert("请输入正确的结束页数");
					return;
				}
				if (parseInt(startPage) > parseInt(totalPage)) {
					alert("请输入小于等于总页数的开始页数");
					return;
				}
				if (parseInt(startPage) > parseInt(totalPage)) {
					alert("请输入小于等于总页数的结束页数");
					return;
				}
				if (parseInt(startPage) > parseInt(endPage)) {
					alert("请输入小于等于开始页数的结束页数");
					return;
				}
			}
			$("#exprot").submit();
		});
		//关闭售后
		function closeRefund(id) {
			layer.confirm("确认关闭售后？", {
				skin : 'layui-layer-molv',
				title : '系统提示'
			}, function(layero, index) {
				$.ajax({
					url : ctx + "/admin/orderInfo/close-refund",
					type : 'post',
					dataType : 'json',
					data : {
						id : id,
						isCloseRefund : 1,
					},
					success : function(data) {
						$(".ui-button").removeAttr("disabled");
						if (data.success) {
							layer.msg("关闭售后成功!");
							$(".close-refund-" + id).hide();
						} else {
							layer.msg(data.info);
						}
					},
					error : function(data) {
						$(".ui-button").removeAttr("disabled");
						layer.msg(data.info);
					}
				});
			});
		}
		function closeOrder(id) {
			layer.confirm("确定关闭订单？", {
				skin : 'layui-layer-molv',
				title : '系统提示'
			}, function(layero, index) {
				$.ajax({
					url : ctx + "/admin/orderInfo/customs-clearance",
					type : 'post',
					dataType : 'json',
					data : {
						orderId : id,
						state : 10,
					},
					success : function(data) {
						$(".ui-button").removeAttr("disabled");
						if (data.success) {
							layer.msg("关闭订单成功!");
							var html = $(".order-" + id + " a").html();
							if (html) {
								$(".order-" + id).html("<p>超时已关闭<a style='color:red'>" + html + "</a></p>");
							} else {
								$(".order-" + id).html("<p>超时已关闭</p>");
							}
							$(".close-order-" + id).hide();
							$(".clearance-" + id).hide();
							$("btn-deliver-" + id).hide();
						} else {
							layer.msg(data.info);
						}
					},
					error : function(data) {
						$(".ui-button").removeAttr("disabled");
						layer.msg(data.info);
					}
				});
			});
		}

		$("#btn-import").click(function() {
			$("#import-order").modal("show");
		});
		function ajaxFileUpload2(_this) {
			var obj = _this;
			var extStart = obj.val().lastIndexOf(".");
			var suffix = obj.val().substring(extStart, obj.val().length);
			if (suffix != '.xls' && suffix != '.xlsx') {
				layer.msg('上传失败，只能上传后缀为：xls、xlsx的文件哦');
				return false;
			}
			var id = obj.attr("id");
			$.ajaxFileUpload({
				url : ctx + '/ajaxfileupload-local', // 需要链接到服务器地址
				secureuri : false,
				fileElementId : id,// 文件选择框的id属性
				dataType : 'json', // 服务器返回的格式，可以是json
				type : 'post',
				success : function(data, status) {
					if (data.success) {
						//$("#exFile").val(data.originalName);
						$("#filePath").val(data.filePath);
						layer.msg("上传成功");
					} else {
						layer.alert(data.info, {
							skin : 'layui-layer-molv',
							title : "系统提示"
						});
					}
				},
				error : function(data, status, e) {
					layer.alert("导入文件失败！", {
						skin : 'layui-layer-molv',
						title : "系统提示"
					});
				}
			});
		}
		$("#batch-shipment").click(function() {
			$.ajax({
				url : ctx + "/api/test/send-order",
				type : 'post',
				dataType : 'json',
				data : {
					filePath : $("#filePath").val(),
				},
				success : function(data) {
					$(".ui-button").removeAttr("disabled");
					if (data.success) {
						layer.msg("发货成功");

					} else {
						layer.msg(data.info);
					}
				},
				error : function(data) {
					$(".ui-button").removeAttr("disabled");
					layer.msg(data.info);
				}
			});
		});
		//批量清关
		$("#batch-clearance").click(function() {
			ids = $("input:checkbox[name='id']:checked").map(function(index, elem) {
				return $(elem).val();
			}).get().join(',');
			if (ids == "") {
				layer.alert("未选择要清关的订单");
				return;
			}
			$.ajax({
				url : ctx + "/admin/orderInfo/batch-clearance",
				type : 'post',
				dataType : 'json',
				data : {
					ids : ids,
				},
				success : function(data) {
					$(".ui-button").removeAttr("disabled");
					if (data.success) {
						layer.msg("批量清关成功");
						var orderIds = data.clearanceIds;
						$.each(orderIds, function(index, item) {
							console.log(orderIds[index]);
							var html = $(".order-" + orderIds[index] + " a").html();
							if (html) {
								$(".order-" + orderIds[index]).html("<p>清关中<a style='color:red'>" + html + "</a></p>");
							} else {
								$(".order-" + orderIds[index]).html("<p>清关中</p>");
							}
							$(".clearance-" + orderIds[index]).hide();
							$(".deliver-" + orderIds[index]).show();
						});
						$("input[name='selectAll']").prop("checked", false);
						$("input[name='id']").prop("checked", false);
					} else {
						layer.msg(data.info);
					}
				},
				error : function(data) {
					$(".ui-button").removeAttr("disabled");
					layer.msg(data.info);
				}
			});
		});
	</script>
	<script type="text/javascript">
		middle();

		$(document).on("show.bs.modal", ".modal", function() {
			$(this).draggable({
				/*  handle: ".modal-header", // 只能点击头部拖动 */
				cursor : "crosshair"
			});
			$(this).css("overflow", "hidden"); // 防止出现滚动条
		})
	</script>
</body>

</html>
