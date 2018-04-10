<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>发布界面</title>
<meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
<meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

<link rel="shortcut icon" href="favicon.ico">
<link href="css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
<link href="css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
<link href="css/animate.min.css" rel="stylesheet">
<link href="css/summernote.css" rel="stylesheet">
<link href="css/summernote-bs3.css" rel="stylesheet">
<link href="css/style.min862f.css?v=4.1.0" rel="stylesheet">

<style>
.droppable-active {
	background-color: #ffe !important
}

.tools a {
	cursor: pointer;
	font-size: 80%
}

.form-body .col-md-6, .form-body .col-md-12 {
	min-height: 400px
}

.draggable {
	cursor: move
}
</style>

</head>

<body class="gray-bg">
	<div class="wrapper wrapper-content">

		<div class="row">
			<div class="col-sm-5" style="margin-left: 30%">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>元素</h5>
						<div class="ibox-tools">
							<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
							</a> <a class="close-link"> <i class="fa fa-times"></i>
							</a>
						</div>
					</div>
					<div class="ibox-content">
						<div class="alert alert-info" style="text-align: center">
							<h3>发布商品</h3>
						</div>
						<form action="releaseGoods" class="form-horizontal m-t" enctype=multipart/form-data method="post">
							<div class="form-group draggable">
								<label class="col-sm-3 control-label">商品名:</label>
								<div class="col-sm-9">
									<input type="text" name="equName" class="form-control" placeholder="请输入文本"> <span class="help-block m-b-none"></span>
								</div>
							</div>
							<div class="form-group draggable">
								<label class="col-sm-3 control-label">下拉列表：</label>
								<div class="col-sm-9">
									<select class="form-control" name="cateSecId">
										<c:forEach items="${cateSecond}" var="c" varStatus="status">
											<option value="${c.cateSecId}">${c.cateSecName}</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="form-group draggable">
								<label class="col-sm-3 control-label">出售价格</label>
								<div class="col-sm-9">
									<input type="text" name="sellPrice" class="form-control" placeholder="请输入文本"> <span class="help-block m-b-none"></span>
								</div>
							</div>
							<div class="form-group draggable">
								<label class="col-sm-3 control-label">市场价格</label>
								<div class="col-sm-9">
									<input type="text" name="marketPrice" class="form-control" placeholder="请输入文本"> <span class="help-block m-b-none"></span>
								</div>
							</div>
							<div class="form-group draggable">
								<label class="col-sm-3 control-label">数量</label>
								<div class="col-sm-9">
									<input type="text" name="number" class="form-control" placeholder="请输入文本"> <span class="help-block m-b-none"></span>
								</div>
							</div>
							<div class="form-group draggable">
								<label class="col-sm-3 control-label">商品描述</label>
								<div class="col-sm-9">
									<textarea name="equDescription" class="form-control" placeholder="请输入文本"></textarea>
								</div>
							</div>
							<div class="form-group draggable">
								<label class="col-sm-3 control-label">上传图片</label>
								<div class="col-sm-9">

									<p class="input-wrap" style="margin-top: 7px">
										<a onClick="$('input[name=upload]').click()">添加图片</a>
									<div id="release_pic"></div>
									<input class="release_input" type="file" name="upload" onchange="previewImage(this)" style="display: none"> <span class="cover-show"></span>
									</p>

								</div>
							</div>
							<div class="hr-line-dashed" style="margin-top: 10px"></div>
							<div class="form-group draggable">
								<div class="col-sm-12 col-sm-offset-3">
									<button class="btn btn-primary" type="submit">保存内容</button>
									<button class="btn btn-white" type="submit">取消</button>
								</div>
							</div>
						</form>
						<div class="clearfix"></div>
					</div>
				</div>
			</div>

		</div>
	</div>
	<script src="js/backstage/jquery.min.js"></script>
	<script src="js/bootstrap.min.js?v=3.3.6"></script>
	<script src="js/content.min.js?v=1.0.0"></script>
	<script src="js/jquery-ui-1.10.4.min.js"></script>
	<script src="js/plugins/beautifyhtml/beautifyhtml.js"></script>

</body>

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




</html>