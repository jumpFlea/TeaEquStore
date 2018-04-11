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


<!--Bootstrap table css 和js-->

<link rel="stylesheet" href="${ctx}/css/bootstrap-table.min.css">
<script src="${ctx}/js/backstage/bootstrap-table.min.js"></script>
<script src="${ctx}/js/backstage/bootstrap-table-mobile.min.js"></script>
<script src="${ctx}/js/backstage/locale/bootstrap-table-zh-CN.min.js"></script>
<script type="text/javascript" src="${ctx}/js/backstage/iframe_goods.js"></script>
</head>


<body>
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title text-center">
				商品列表 <input id="getUserType" value="${user.type}" type="hidden"></input> <span class="panel-title text-right" style="display: block; margin-right: 0px">欢迎 <c:if
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
				<button type="button" class="btn btn-info" id="updateShowGoods">
					<span class="glyphicon glyphicon-plus"></span>修改
				</button>
				<button type="button" class="btn btn-info" id="selectMoreDelete">
					<span class="glyphicon glyphicon-plus"></span>批量删除&nbsp;&nbsp;
				</button>
				<button type="button" class="btn btn-info" id="updateMoreGoods">
					<span class="glyphicon glyphicon-plus"></span>批量审核&nbsp;&nbsp;
				</button>
			</div>
		</div>

		<table id="goodsListTable" data-detail-view="true">

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
					<h4 class="modal-title" id="myModalLabel">当前商品:</h4>
				</div>
				<div class="modal-body">
					<form id='searchForm' class="bs-example bs-example-form" role="form">
						<div class="input-group" style="width: 100%">
							<input type="hidden" class=" form-control" name="eid" id="eid"> <span class="input-group-addon text-center" style="width: 95px">器材名<i class="icon-th"></i></span> <input type="text"
								class=" form-control" name="equName" id="equName">
						</div>
						<div class="input-group" style="width: 100%">
							<span class="input-group-addon" style="width: 95px">出售价格<i class="icon-th"></i></span> <input type="text" class="form-control" name="sellPrice" id="sellPrice">
						</div>

						<div class="input-group" style="width: 100%">
							<span class="input-group-addon text-center" style="width: 95px">市场价格<i class="icon-th"></i></span> <input type="text" class=" form-control" name="marketPrice" id="marketPrice">
						</div>
						<div class="input-group" style="width: 100%">

							<span class="input-group-addon text-center" style="width: 95px">存留数量<i class="icon-th"></i></span> <input type="text" class=" form-control" name="number" id="number">
						</div>
						<div class="input-group" style="width: 100%">
							<span class="input-group-addon text-center" style="width: 95px">出售数量<i class="icon-th"></i></span> <input type="text" class=" form-control" name="sellNumber" id="sellNumber">
						</div>
						<div class="input-group" style="width: 100%">
							<span class="input-group-addon text-center" style="width: 95px">是否热销<i class="icon-th"></i></span> <input type="text" class=" form-control" name="isHot" id="isHot">
						</div>
						<div class="input-group" style="width: 100%">

							<span class="input-group-addon text-center" style="width: 95px">是否新品<i class="icon-th"></i></span> <input type="text" class=" form-control" name="isNew" id="isNew">
						</div>
						<div class="input-group" style="width: 100%">
							<span class="input-group-addon text-center" style="width: 95px">商品描述<i class="icon-th"></i></span> <input type="text" class=" form-control" name="equDescription" id="equDescription">
						</div>
						<div class="input-group" style="width: 100%">
							<span class="input-group-addon text-center" style="width: 95px">二级id名<i class="icon-th"></i></span> <input type="text" class=" form-control" name="cateSecId" id="cateSecId">
						</div>
						<div class="input-group" style="width: 100%">
							<span class="input-group-addon text-center" style="width: 95px">商品:</span>
							<div class="form-group draggable">
								<label class="col-sm-3 control-label"></label>
								<div class="col-sm-9">

									<p class="input-wrap" style="margin-top: 7px">
										<a onClick="$('input[name=upload]').click()">添加图片</a>
									<div id="release_pic"><img src="images/common/interior-150x150.jpg" id="showImage"></div>
									<input class="release_input" type="file" name="upload" onchange="previewImage(this)" style="display: none"> <span class="cover-show"></span>
									</p>

								</div>
							</div>
						</div>
						<div class="input-group" style="width: 100%">
							<span class="input-group-addon text-center" style="width: 95px">发布人id:<i class="icon-th"></i></span> <input type="text" class=" form-control" name="uid" id="uid">
						</div>
						<div class="input-group" style="width: 100%">
							<span class="input-group-addon text-center" style="width: 95px">当前状态<i class="icon-th"></i></span> <input type="text" class=" form-control" name="status" id="status">
						</div>
						<div class="input-group" style="width: 100%">
							<span class="input-group-addon text-center" style="width: 95px">发布时间<i class="icon-th"></i></span> <input type="text" class=" form-control" name="type" id="type">
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

	<script type="text/javascript">
		function previewImage(file) {
			var MAXWIDTH = 180;
			var MAXHEIGHT = 180;
			var div = document.getElementById('release_pic');
			if (file.files && file.files[0]) {
				div.innerHTML = '<img id=imghead>';
				var img = document.getElementById('imghead');
				img.onload = function() {
					var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
					img.width = rect.width;
					img.height = rect.height;
					img.style.marginLeft = rect.left + 'px';
					img.style.marginTop = rect.top + 'px';
				}
				var reader = new FileReader();
				reader.onload = function(evt) {
					img.src = evt.target.result;
				}
				reader.readAsDataURL(file.files[0]);
			}
		}

		function clacImgZoomParam(maxWidth, maxHeight, width, height) {
			var param = {
				top : 0,
				left : 0,
				width : width,
				height : height
			};
			if (width > maxWidth || height > maxHeight) {
				rateWidth = width / maxWidth;
				rateHeight = height / maxHeight;
				if (rateWidth > rateHeight) {
					param.width = maxWidth;
					param.height = Math.round(height / rateWidth);
				} else {
					param.width = Math.round(width / rateHeight);
					param.height = maxHeight;
				}
			}
			param.left = Math.round((maxWidth - param.width) / 2);
			param.top = Math.round((maxHeight - param.height) / 2);
			return param;
		}
</script>
		</body>
		</html>
	