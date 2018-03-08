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
					<!-- .inner -->
					<div class="inner group">
						<!-- START LOGO -->
						<div id="logo" class="group">
							<a href="index.html" title="Sommerce Shop"> <span class="logo-title">Sommerce Shop</span>
							</a>
							<p class="logo-description">The perfect e-commerce solution</p>
						</div>
						<!-- END LOGO -->

						<!-- START LINKSBAR -->
						<ul id="linksbar" class="group">
							<li class="icon cart"><a class="trigger" href="cart.html"> <span> 0 items &ndash; &euro;0.00 </span>
							</a> |
								<div class="basketpopup">
									<h3>购物车</h3>
									<span class="empty">没有东西在购物车内</span>
								</div></li>
							<li class="icon lock"><a href="#">退出</a> |</li>
							<li><a href="contact.html">联系我们</a> |</li>
						</ul>
						<div class="copyrights">
							Collect from
						</div>
						<!-- END LINKSBAR -->
						<div class="clear"></div>

						<!-- START NAV -->
						<div id="nav" class="group creative">
							<ul id="menu-navigation" class="level-1">
								<li><a href="goodsShow?needPage=1">首页</a>
									<ul class="sub-menu">
										<c:forEach items="${cate}" var="ca">
											<li><a href="home-version-2-elegant.html">${ca.cateName}</a></li>
										</c:forEach>
									</ul></li>
								<li class="megamenu"><a href="#">Shopping By</a>
									<ul class="sub-menu">
										<li><a href="brand.html">Brand</a>
											<ul class="sub-menu">
												<li><a href="#">Wallmart</a></li>
											</ul></li>
										<li><a href="categories.html">Categories</a>
											<ul class="sub-menu">
												<li><a href="#">Kitchen</a></li>
											</ul></li>
										<li><a href="#">Prices</a>
											<ul class="sub-menu">
												<li><a href="#">100 &#8211; 200 &euro;</a></li>
											</ul></li>
									</ul></li>
								<li><a href="my-account.html">My Account</a>
									<ul class="sub-menu">
										<li><a href="change-password.html">Change Password</a></li>
										<li><a href="edit-address.html">Edit My Address</a></li>
										<li><a href="order-tracking.html">Track your order</a></li>
									</ul></li>
								<li><a href="shop.html">Shop</a></li>
								<li><a href="blog.html">Blog</a>
									<ul class="sub-menu">
										<li><a href="blog.html">Big Image</a></li>
										<li><a href="blog-small.html">Small Image</a></li>
									</ul></li>
								<li><a href="#">Pages</a>
									<ul class="sub-menu">
										<li><a href="testimonials.html">Testimonials</a></li>
										<li><a href="faq.html">Faq</a></li>
										<li><a href="contact.html">Get in Touch</a></li>

									</ul></li>
								<li><a href="typography.html">Shortcode</a>
									<ul class="sub-menu">
										<li><a href="typography.html">Typography</a></li>
										<li><a href="alert-box-buttons.html">Alert box &#038; buttons</a></li>
										<li><a href="icon-sections.html">Icon Sections</a></li>
										<li><a href="nivo-slider.html">Nivo Slider</a></li>
										<li><a href="media-widgets.html">Media &amp; Widgets</a></li>
										<li><a href="table-box-prices.html">Table &#038; Box prices</a></li>
										<li><a href="mix-various.html">Mix &#038; Various</a></li>
										<li><a href="shop-shortcodes.html">Shop shortcodes</a></li>
									</ul></li>
							</ul>
						</div>
						<!-- END NAV -->

						<!-- START SEARCH FORM -->
						<form role="search" method="get" id="searchform" action="#" class="group">
							<div>
								<label class="screen-reader-text" for="s">search</label> <input type="text" value="" name="s" id="s" /> <input type="submit" id="searchsubmit" value="&gt;" /> <input type="hidden"
									name="post_type" value="product" />
							</div>
						</form>
						<!-- END SEARCH FORM -->

					</div>
					<!-- end .inner -->

				</div>
				<!-- END HEADER -->


				<!-- START PRIMARY SECTION -->
				<div id="primary" class="inner group" />
				<div class="layout-sidebar-no group">
					<div id="container">
						<div id="content" role="main">

							<div id="breadcrumb">
								<a class="home" href="home.html">首页</a> &rsaquo; <a href="#">Categories</a> &rsaquo; <a href="#">Garden</a> &rsaquo; Gold mahibo
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
									<p>剩余数量：<input name="quantity" value="${goods.number}" size="4" title="Qty" class="input-text qty text" maxlength="12" /><p>
								
								<form action="#" class="cart" method="post">
									<div class="quantity">
										<input name="quantity" value="1" size="4" title="Qty" class="input-text qty text" maxlength="12" />
									</div>
									<button type="submit" class="button-alt">Add to cart</button>
									<input type="hidden" id="_n" name="_n" value="a93bb4a4c2" /><input type="hidden" name="_wp_http_referer" value="/demo/sommerce/shop/gold-mahibo/" />
								</form>
								<div class="product_meta">
									<span class="sku">SKU: 27.</span> <span class="posted_in">Posted in <a href="#" rel="tag">Garden</a>, <a href="#" rel="tag">Pathio</a>, <a href="#" rel="tag">Wood</a>.
									</span>
								</div>
							</div>
							<div id="product-tabs">
								<ul class="tabs">
									<li class="active"><a href="#related-products">Related Products</a></li>
									<li><a href="#tab-description">Description</a></li>
								</ul>
								<div class="containers">
									<div class="panel" id="related-products">
										<div class="related products">
											<ul class="products">
												<li class="product border shadow first last-row"><a href="#">
														<div class="thumbnail">
															<img width="150" height="150" src="images/common/001.png" class="attachment-shop_small wp-post-image" alt="001" title="001" />
															<div class="thumb-shadow"></div>
															<strong class="below-thumb">Elegant Glasses</strong>
														</div> <span class="price">&#36;250.00</span>
												</a>
													<div class="buttons">
														<a href="#" class="details">DETAILS</a>&nbsp;<a href="#" class="add-to-cart">ADD TO CART</a>
													</div></li>
												<li class="product border shadow last-row"><a href="#">
														<div class="thumbnail">
															<img width="150" height="150" src="images/common/warmroom-150x150.jpg" class="attachment-shop_small wp-post-image" alt="warmroom" title="warmroom" />
															<div class="thumb-shadow"></div>
															<strong class="below-thumb">Hot Room</strong>
														</div> <span class="price">&#36;730.00</span>
												</a>
													<div class="buttons">
														<a href="#" class="details">DETAILS</a>&nbsp;<a href="#" class="add-to-cart">ADD TO CART</a>
													</div></li>
												<li class="product border shadow last-row"><a href="#">
														<div class="thumbnail">
															<img width="150" height="150" src="images/common/ktichen21-150x150.jpg" class="attachment-shop_small wp-post-image" alt="ktichen2" title="ktichen2" />
															<div class="thumb-shadow"></div>
															<strong class="below-thumb">Wood Kitchen</strong>
														</div> <span class="price">&#36;367.00</span>
												</a>
													<div class="buttons">
														<a href="#" class="details">DETAILS</a>&nbsp;<a href="#" class="add-to-cart">ADD TO CART</a>
													</div></li>
												<li class="product border shadow last-row"><a href="#">
														<div class="thumbnail">
															<img width="150" height="150" src="images/common/warmroom-150x150.jpg" class="attachment-shop_small wp-post-image" alt="kitchen" title="kitchen" />
															<div class="thumb-shadow"></div>
															<strong class="below-thumb">Dark Kitchen</strong>
														</div> <span class="price">&#36;940.00</span>
												</a>
													<div class="buttons">
														<a href="#" class="details">DETAILS</a>&nbsp;<a href="#" class="add-to-cart">ADD TO CART</a>
													</div></li>
											</ul>
											<div class="clear"></div>
										</div>
									</div>
									<div class="panel" id="tab-description">
										<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don&#8217;t look
											even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn&#8217;t anything embarrassing hidden in the middle of text. All the Lorem Ipsum
											generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.</p>
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
			<div id="footer" class="group footer-sidebar-right columns-3">
				<div class="inner">
					<div class="footer-main">
						<div id="nav_menu-3" class="widget-1 widget-first widget widget_nav_menu">
							<h3>Categories</h3>
							<div class="menu-categories-footer-container">
								<ul id="menu-categories-footer" class="menu">
									<li><a href="#">Kitchen</a></li>
									<li><a href="#">Bedroom</a></li>
									<li><a href="#">Garden</a></li>
									<li><a href="#">Bathroom</a></li>
									<li><a href="#">Wood</a></li>
								</ul>
							</div>
						</div>
						<div id="nav_menu-4" class="widget-2 widget widget_nav_menu">
							<h3>Utilities</h3>
							<div class="menu-utilities-container">
								<ul id="menu-utilities" class="menu">
									<li><a href="testimonials.html">Testimonial</a></li>
									<li><a href="faq.html">FAQ</a></li>
									<li><a href="blog.html">Blog</a></li>
									<li><a href="contact.html">Get in Touch</a></li>
									<li><a href="#">Privacy Policy</a></li>
								</ul>
							</div>
						</div>
						<div id="nav_menu-5" class="widget-3 widget-last widget widget_nav_menu">
							<h3>Get in touch</h3>
							<div class="menu-get-in-touch-container">
								<ul id="menu-get-in-touch" class="menu">
									<li><a href="#">Newsletter</a></li>
									<li><a href="http://www.facebook.com">Facebook</a></li>
									<li><a href="http://twitter.com">Twitter</a></li>
									<li><a href="blog.html">Blog</a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="footer-sidebar">
						<div id="recent-posts-3" class="widget-1 widget-first widget recent-posts">
							<h3>Last News</h3>
							<div class="recent-post group">
								<div class="hentry-post group">
									<a href="article.html" title="-50% on all vintage glasses, enjoy it" class="title">-50% on all vintage glasses, enjoy it</a>
									<p>Phasellus gravida augue sit amet leo dapibus a congue velit [...]</p>
								</div>
								<div class="hentry-post group">
									<a href="article.html" title="Sommerce &ndash; a beautiful ecommerce solution" class="title">Sommerce &#8211; a beautiful ecommerce solution</a>
									<p>Etiam semper magna sit amet augue blandit vel cursus erat [...]</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- END FOOTER -->
			<!-- START COPYRIGHT -->
			<div id="copyright" class="group two-columns">
				<div class="inner group">
					<p class="left">
						<img src="images/logo1.png" alt="" /> <span style="padding-left: 10px;"> <img src="images/credit-cards/paypal.png" alt="paypal" style="margin-right: 8px" /> <img
							src="images/credit-cards/visa.png" alt="visa" style="margin-right: 8px" /> <img src="images/credit-cards/mastercard.png" alt="mastercard" style="margin-right: 8px" /> <img
							src="images/credit-cards/cirrus.png" alt="cirrus" style="margin-right: 8px" /> <img src="images/credit-cards/amex.png" alt="amex" style="margin-right: 8px" /> <img
							src="images/credit-cards/bank-check.png" alt="bank-check" style="margin-right: 8px" /> <img src="images/credit-cards/discover.png" alt="discover" style="margin-right: 8px" />
						</span>
					</p>
					<p class="right">
						Collect from <a href="http://www.mycodes.net/" title="源码之家" target="_blank">源码之家</a>
					</p>
				</div>
			</div>
			<!-- END COPYRIGHT -->
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
