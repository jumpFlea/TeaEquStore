<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html dir="ltr" lang="en-US">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width" />
<title>Sommerce Shop | The perfect e-commerce solution</title>

<!-- CSS -->
<link rel="stylesheet" type="text/css" media="all" href="css/style1.css" />
<link rel="stylesheet" type="text/css" media="screen and (max-width: 980px)" href="css/lessthen980.css" />
<link rel="stylesheet" type="text/css" media="screen and (max-width: 600px)" href="css/lessthen600.css" />
<link rel="stylesheet" type="text/css" media="screen and (max-width: 480px)" href="css/lessthen480.css" />
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
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
							<a href="index.html" title="Sommerce Shop"> <span class="logo-title">教学器材专卖店</span>
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
							Collect from <a href="http://www.mycodes.net/" title="网站模板">网站模板</a>
						</div>
						<!-- END LINKSBAR -->
						<div class="clear"></div>

						<!-- START NAV -->
						<div id="nav" class="group creative">
							<ul id="menu-navigation" class="level-1">
								<!--遍历出主页下的一二级分类-->
								<li><a href="goodsShow?needPage=1">主页</a>
									<ul class="sub-menu">
										<c:forEach items="${cate}" var="ca">
											<li><a href="home-version-2-elegant.html">${ca.cateName}</a>
												<ul class="sub-menu">
													<c:forEach items="${ca.categorysecond}" var="cat">
														<li><a href="home-version-2-elegant.html">${cat.cateSecName}</a></li>
													</c:forEach>
												</ul></li>

										</c:forEach>
									</ul></li>
								<!--遍历出主页下的一二级分类end-->

								<li class="megamenu"><a href="#">购物</a>
									<ul class="sub-menu">
										<li><a href="brand.html">Brand</a>
											<ul class="sub-menu">
												<li><a href="#">Wallmart</a></li>
												<li><a href="#">Ikea</a></li>
												<li><a href="#">Pathio</a></li>
												<li><a href="#">Furnishop</a></li>
												<li><a href="#">Brand name</a></li>
											</ul></li>
										<li><a href="categories.html">Categories</a>
											<ul class="sub-menu">
												<li><a href="#">Kitchen</a></li>
												<li><a href="#">Bedroom</a></li>
												<li><a href="#">Garden</a></li>
												<li><a href="#">Bathroom</a></li>
												<li><a href="#">Wood</a></li>
											</ul></li>
										<li><a href="#">价格</a>
											<ul class="sub-menu">
												<li><a href="#">100 &#8211; 200 &euro;</a></li>
												<li><a href="#">200 &#8211; 500 &euro;</a></li>
												<li><a href="#">500 &#8211; 800 &euro;</a></li>
												<li><a href="#">800 &#8211; 1000 &euro;</a></li>
												<li><a href="#">1000 &#8211; 1200 &euro;</a></li>
											</ul></li>
									</ul></li>
								<li><a href="my-account.html">我的账户</a>
									<ul class="sub-menu">
										<li><a href="change-password.html">Change Password</a></li>
										<li><a href="edit-address.html">Edit My Address</a></li>
										<li><a href="order-tracking.html">Track your order</a></li>
									</ul></li>
								<li><a href="shop.html">店</a></li>
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
								<li><a href="typography.html">简码</a>
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

				<!-- START SLIDER -->
				<div id="slider" class="group inner">
					<ul class="group">
						<li class="first slide-1 group image-content-type">
							<div class="slider-featured group">
								<a href="http://www.google.it"><img src="images/common/00111.jpg" width="960" height="338" alt="interior design" /></a>
							</div>
							<div class="slider-caption caption-right">
								<!-- TITLE -->
								<h2>
									<a href="http://www.google.it">interior design</a>
								</h2>
								<!-- TEXT -->
								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec pulvinar turpis velit. Morbi rutrum, neque non pulvinar faucibus, ligula eros viverra ligula, et aliquam libero neque ac
									nisl.</p>
								<p>
									<span class="special-font" style="font-size: 24px;">prices from <span style="font-size: 42px;">$45</span></span>
								</p>
							</div>
						</li>
						<li class="slide-2 group image-content-type">
							<div class="slider-featured group">
								<img src="images/common/0035.jpg" width="960" height="338" alt="Luxury gold" />
							</div>
							<div class="slider-caption caption-right">
								<!-- TITLE -->
								<h2>Luxury gold</h2>
								<!-- TEXT -->
								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec pulvinar turpis velit. Morbi rutrum, neque non pulvinar faucibus, ligula eros viverra ligula, et aliquam libero neque ac
									nisl.</p>
							</div>
						</li>
						<li class="last slide-3 group image-content-type">
							<div class="slider-featured group">
								<img src="images/common/0031.jpg" width="960" height="338" alt="Gold Parquet" />
							</div>
							<div class="slider-caption caption-right">
								<!-- TITLE -->
								<h2>Gold Parquet</h2>
								<!-- TEXT -->
								<p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum</p>
								<p>
									<span class="special-font" style="font-size: 24px;">prices from <span style="font-size: 42px;">$37</span></span>
								</p>
							</div>
						</li>
					</ul>
				</div>
				<!-- END SLIDER -->
				<div class="slider-mobile">
					<!-- START SLIDER -->
					<div id="slider" class="group mobile inner fixed-image">
						<img src="images/common/001.jpg" width="960" height="338" alt="" />
					</div>
					<!-- END SLIDER -->
					<script type="text/javascript">
						var yiw_slider_type = 'elegant', yiw_slider_elegant_easing = null, yiw_slider_elegant_fx = 'fade', yiw_slider_elegant_speed = 500, yiw_slider_elegant_timeout = 5000, yiw_slider_elegant_caption_speed = 500;
					</script>

				</div>
				<!-- START PRIMARY SECTION -->
				<div id="primary" class="inner group">
					<div id="slogan" class="inner">
						<h1>欢迎来到 教学器材专卖店, 带您走进一个不错的全新视角</h1>
						<h3>unlimited layout styles by changing fonts, colors, backgrounds, images and sliders</h3>
					</div>
					<div class="layout-sidebar-no">
						<!-- START CONTENT -->
						<div id="content" role="main" class="group wrapper-content">
							<div id="post-7" class="post-7 page type-page status-publish hentry group">
								<!--主页显示的主要内容-->
								<div class="boxed-content group">
									<div class="box-title group">
										<h3>主打产品</h3>
										<p>our selection of specials items</p>
									</div>
									<div class="box-content group">
										<ul class="products">
											<li class="product border shadow first last-row"><a href="product_single.html">
													<div class="thumbnail">
														<img width="150" height="150" src="images/common/interior-150x150.jpg" class="attachment-shop_small wp-post-image" alt="interior" title="interior" />
														<div class="thumb-shadow"></div>
														<strong class="below-thumb">Interior Black</strong>
													</div> <span class="price">&#36;60,000.00</span>
											</a>
												<div class="buttons">
													<a href="product_single.html" class="details">DETAILS</a>&nbsp;<a href="#" class="add-to-cart">ADD TO CART</a>
												</div></li>
										</ul>
										<div class="clear"></div>
									</div>
								</div>
								<!--主页显示的主要内容end-->

								<!--火热畅销产品-->
								<div class="boxed-content group">
									<div class="box-title group">
										<h3>火热销售中</h3>
										<p>爱上他们，没选择！</p>
									</div>
									<div class="box-content group">
										<ul class="products">
											<c:forEach items="${showGoodsList.list}" var="g">
												<li class="product border shadow first last-row"><a href="goodsDetails?goodsId=${g.e_id}">
														<div class="thumbnail">
															<img width="150" height="150" src="${g.equPicture}" class="attachment-shop_small wp-post-image" alt="001" title="001" />
															<div class="thumb-shadow"></div>
															<strong class="below-thumb">Elegant Glasses</strong>
														</div> <span class="price">&#36;${g.sellPrice}</span>
												</a>
													<div class="buttons">
														<a href="goodsDetails?goodsId=${g.e_id}" class="details">详情</a>&nbsp;<a href="#" class="add-to-cart">ADD TO CART</a>
													</div></li>
											</c:forEach>
										</ul>
										<div class="clear"></div>
									</div>

									<!--分页的样式-->
									<div class="page-num">
										<nav>
											<ul class="pagination">
												<c:if test="${showGoodsList.currentPage!=1}">
													<li><a href="goodsShow?needPage=${showGoodsList.currentPage-1}&type=${type}"><span aria-hidden="true">&laquo;</span></a></li>
												</c:if>
												<c:forEach var="i" begin="1" end="${showGoodsList.countPage}">
													<c:if test="${i==showGoodsList.currentPage}">
														<li class="active"><a>${i}</a></li>
													</c:if>
													<c:if test="${i!=showGoodsList.currentPage}">
														<li><a href="goodsShow?needPage=${i}">${i}</a></li>
													</c:if>
												</c:forEach>
												<c:if test="${showGoodsList.currentPage!=showGoodsList.countPage}">
													<li><a href="goodsShow?needPage=${showGoodsList.currentPage+1}&type=${type}"><span>&raquo;</span></a></li>
												</c:if>
											</ul>
										</nav>
									</div>
									<!--分页的样式-->
								</div>
								<!--火热畅销产品end-->


								<div class="call-to-action-two group">
									<div class="incipit">
										<p class="special-font">
											<span style="font-size: 52px;"><strong>35% </strong></span> <span style="font-size: 48px;">off everything </span> Sign in to our list before march 21 to enjoy our special sales!<br />
										</p>
									</div>
									<a href="#" class="call-button"> SIGN IN NOW </a>
								</div>
							</div>
						</div>
						<!-- END CONTENT -->
					</div>
					<!-- START EXTRA CONTENT -->
					<!-- END EXTRA CONTENT -->
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
						<p class="right">Collect from</p>
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
