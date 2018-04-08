<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html dir="ltr" lang="en-US">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width" />
<title>Sommerce Shop | The perfect e-commerce solution</title>

<!-- CSS -->
<link rel="stylesheet" type="text/css" media="all" href="css/style1.css" />
<link rel="stylesheet" type="text/css" media="screen and (max-width: 980px)" href="css/lessthen980.css" />
<link rel="stylesheet" type="text/css" media="screen and (max-width: 600px)" href="css/lessthen600.css" />
<link rel="stylesheet" type="text/css" media="screen and (max-width: 480px)" href="css/lessthen480.css" />
<link rel="stylesheet" href="css/shop.css" type="text/css" media="all" />
<link rel="stylesheet" href="css/prettyPhoto.css" type="text/css" media="all" />
<link rel="stylesheet" href="css/tipsy.css" type="text/css" media="all" />
<link rel='stylesheet' href='css/jquery-rotating.css' type='text/css' media='all' />
<link rel='stylesheet' href='css/slider-cycle.css' type='text/css' media='all' />

<!-- [favicon] begin -->
<link rel="shortcut icon" type="image/x-icon" href="favicon.ico" />
<link rel="icon" type="image/x-icon" href="favicon.ico" />
<!-- [favicon] end -->

<!-- FONT -->


<!-- SCRIPTS -->
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery.prettyPhoto.js"></script>
<script type="text/javascript" src="js/jquery.tipsy.js"></script>
<script type="text/javascript" src="js/jquery.tweetable.js"></script>
<script type="text/javascript" src="js/jquery.nivo.slider.pack.js"></script>
<script type="text/javascript" src="js/jquery.cycle.min.js"></script>
<script type="text/javascript" src="js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="js/comment-reply.js"></script>

<link rel="stylesheet" type="text/css" media="all" href="css/home.css" />

</head>
<body class="responsive boxed-layout no_js">
	<!-- START LIGHT WRAPPER -->
	<div class="bgLight group">
		<!-- START WRAPPER -->
		<div class="wrapper group">
			<!-- START BG WRAPPER -->
			<div class="bgWrapper group">
				<!-- START HEADER -->
				<div id="header" class="group">
					<div id="header" class="group">
						<%@ include file="includehead.jsp"%>
					</div>

				</div>
				<!-- END HEADER -->


				<!-- START PRIMARY SECTION -->
				<div id="primary" class="inner group" />
				<div class="layout-sidebar-no group">
					<div id="container">
						<div id="content" role="main">

							<div id="breadcrumb">
								<a class="home" href="home.html">首页</a> &rsaquo; <a href="#"></a> &rsaquo; <a href="#"></a> &rsaquo; Gold mahibo
							</div>

							<div class="product type-product status-publish hentry">

								<div class="images">
									<a href="${goods.equPicture}" class="zoom" rel="prettyphoto[gallery]"> <img width="530" height="345" src="${goods.equPicture}" class="attachment-530x345 wp-post-image"
										alt="originalparquet_001_big" title="originalparquet_001_big" />
									</a>

									<div class="thumbnails">
										<a href="${goods.equPicture}" title="albatros_niwa_001_big" rel="prettyphoto[gallery]" class="zoom first"> <img width="90" height="90" src="${goods.equPicture}" class="attachment-90x90"
											alt="albatros_niwa_001_big" title="albatros_niwa_001_big" />
										</a> <a href="${goods.equPicture}" title="palaceliving_002_big" rel="prettyphoto[gallery]" class="zoom "> <img width="90" height="90" src="${goods.equPicture}" class="attachment-90x90"
											alt="palaceliving_002_big" title="palaceliving_002_big" />
										</a>
									</div>
									<span class="onsale">Sale!</span>
								</div>

								<div class="summary">
									<h1 class="product_title page-title">${goods.equName}</h1>
									<p class="price">
										<del>&#36;${goods.marketPrice}</del>
										<ins>&#36;${goods.sellPrice}</ins>
									</p>
									<p>${goods.equDescription}</p>
									<p>
										剩余数量：<input type="text" readonly="true" name="quantity" value="${goods.number}" size="4" title="Qty" class="input-text qty text" maxlength="12" />
									<p>
									<form action="addToCart" class="cart" method="post">
										<div class="quantity">
											<input name="goodNum" value="1" size="4" title="Qty" class="input-text qty text" maxlength="12" /> <input name="e_id" type="hidden" value="${goods.e_id}" />
										</div>
										<button type="submit" class="button-alt">添加到购物车</button>
										<input type="hidden" id="_n" name="_n" value="a93bb4a4c2" /><input type="hidden" name="_wp_http_referer" value="/demo/sommerce/shop/gold-mahibo/" />
									</form>
									<div class="product_meta"></div>
								</div>
								<div id="product-tabs">
									<ul class="tabs">
										<li class="active"><a href="#related-products">联系产品</a></li>
										<li><a href="#tab-description">详情描述</a></li>
									</ul>
									<div class="containers">
										<div class="panel" id="related-products">
											<div class="related products">
												<ul class="products">
													<li class="product border shadow last-row"><a href="#">
															<div class="thumbnail">
																<img width="150" height="150" src="images/common/warmroom-150x150.jpg" class="attachment-shop_small wp-post-image" alt="kitchen" title="kitchen" />
																<div class="thumb-shadow"></div>
																<strong class="below-thumb">器材</strong>
															</div> <span class="price">&#36;940.00</span>
													</a>
														<div class="buttons">
															<a href="#" class="details">详情</a>&nbsp;<a href="#" class="add-to-cart">添加到购物车</a>
														</div></li>
												</ul>
												<div class="clear"></div>
											</div>
										</div>
										<div class="panel" id="tab-description">
											<p>${goods.equDescription}</p>
										</div>
										<div class="panel" id="tab-attributes">
											<h2>Additional Information</h2>
										</div>
										<div class="panel" id="tab-reviews"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- END PRIMARY SECTION -->
				<!-- START NEWSLETTER FORM -->
				<div id="newsletter-form" class="group">
					<div class="inner">
						<div class="newsletter-section group">
							<p class="description special-font">
								<strong>Stay Updated:</strong> subscribe our special newsletter
							</p>
							<form method="post" action="#">
								<fieldset>
									<ul class="group">
										<li><label for="fullname">Your name</label><input type="text" name="fullname" id="fullname" class="name-field text-field autoclear" /></li>
										<li><label for="email">Your email</label><input type="text" name="email" id="email" class="email-field text-field autoclear" /></li>
										<li><input type="submit" value="Subscribe" class="submit-field" /></li>
									</ul>
								</fieldset>
							</form>
						</div>
					</div>
				</div>
				<!-- ENDSTART NEWSLETTER FORM -->
				<!-- START FOOTER -->

				<!-- END FOOTER -->

			</div>
			<!-- END BG WRAPPER -->
		</div>
		<!-- END WRAPPER -->
	</div>
	<!-- END LIGHT WRAPPER -->
	<script type="text/javascript" src="js/jquery.custom.js"></script>
	<script type="text/javascript" src="js/contact.js"></script>


</body>
</html>
