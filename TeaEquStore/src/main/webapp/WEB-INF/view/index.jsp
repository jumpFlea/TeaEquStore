<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html dir="ltr" lang="en-US">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width" />
<title>教学器材专卖点管理系统</title>

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
							<a href="goodsShow?cateName=&mainPage=1&needPage=1&cateSecName=&search=" title="教学器材"> <span class="logo-title">教学器材专卖店</span>
							</a>
							<p class="logo-description">
								<c:if test="${user!=null}">欢迎&nbsp;&nbsp;<font color="red">${user.userName}</font>
									<c:if test="${user.type==0}">&nbsp;&nbsp;用户</c:if>
									<c:if test="${user.type==1}">&nbsp;&nbsp;管理员</c:if>
									<c:if test="${user.type==2}">&nbsp;&nbsp;超级管理员</c:if>
								</c:if>
							</p>
						</div>
						<!-- END LOGO -->
						<!-- START LINKSBAR -->
						<ul id="linksbar" class="group">
							<li class="icon cart"><a class="trigger" href="myCart"> <span> 我的购物车</span>
							</a> |
								<div class="basketpopup">
									<h3>购物车</h3>
									<span class="empty">没有东西在购物车内</span>
								</div></li>
							<li><a href="showOrderList?page=1">我的订单</a> |</li>
							<c:if test="${user.type==1||user.type==2}">
								<li><a href="page/userManager">进入后台</a> |</li>
							</c:if>
							<li class="icon lock"><a href="#">退出</a> |</li>
						</ul>
						<div class="copyrights"></div>
						<!-- END LINKSBAR -->
						<div class="clear"></div>

						<!-- START NAV -->
						<div id="nav" class="group creative">
							<ul id="menu-navigation" class="level-1">
								<!--遍历出主页下的一二级分类-->
								<li><a href="goodsShow?cateName=&mainPage=1&needPage=1&cateSecName=&search=">主页</a>
									<ul class="sub-menu">
										<c:forEach items="${cate}" var="ca">
											<li><a href="goodsShow?cateName=${ca.cateName}&mainPage=1&needPage=1&cateSecName=&search=">${ca.cateName}</a>
												<ul class="sub-menu">
													<c:forEach items="${ca.categorysecond}" var="cat">
														<li><a href="goodsShow?cateName=${ca.cateName}&mainPage=1&needPage=1&cateSecName=${cat.cateSecName}&search=">${cat.cateSecName}</a></li>
													</c:forEach>
												</ul></li>
										</c:forEach>
									</ul></li>
								<!--遍历出主页下的一二级分类end-->

								<li class="megamenu"><a href="jumpRelease">发布商品</a></li>
								<li class="megamenu"><a href="shop.html">我的资料</a></li>
						</div>
						<!-- END NAV -->

						<!-- START SEARCH FORM -->
						<form role="search" method="post" id="searchform" action="goodsShow" class="group">
							<div>
								<input type="hidden" name="cateName" value="${cateName}"> <input type="hidden" name="cateSecName" value="${cateSecName}"> <input type="hidden" name="mainPage" value="1">
								<input type="hidden" name="needPage" value="1"> <label class="screen-reader-text" for="s">search</label> <input type="text" value="" name="search" id="s" /> <input type="submit"
									id="searchsubmit" value="&gt;" /> <input type="hidden" name="post_type" value="product" />
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
					</div>
					<div class="layout-sidebar-no">
						<!-- START CONTENT -->
						<div id="content" role="main" class="group wrapper-content">
							<div id="post-7" class="post-7 page type-page status-publish hentry group">
								<!--主页显示的主要内容-->
								<div class="boxed-content group">
									<div class="box-title group">
										<h3>主打产品</h3>
										<p></p>
									</div>
									<div class="box-content group">
										<ul class="products">
											<c:forEach items="${showGoodsAllList.list}" var="g">
												<li class="product border shadow first last-row"><a href="goodsDetails?goodsId=${g.e_id}">
														<div class="thumbnail">
															<img width="150" height="150" src="${g.equPicture}" class="attachment-shop_small wp-post-image" alt="001" title="001" />
															<div class="thumb-shadow"></div>
															<strong class="below-thumb">${g.equName}</strong>
														</div> <span class="price">&#36;${g.sellPrice}</span>
												</a>
													<div class="buttons">
														<a href="goodsDetails?goodsId=${g.e_id}" class="details">详情</a>&nbsp;<a href="addToCart?e_id=${g.e_id}&goodNum=1" class="add-to-cart">ADD TO CART</a>
													</div></li>
											</c:forEach>
										</ul>
										<div class="clear"></div>
									</div>

									<!--分页的样式-->
									<div class="page-num">
										<nav>
											<ul class="pagination">
												<c:if test="${showGoodsAllList.currentPage!=1}">
													<li><a href="goodsShow?mainPage=${showGoodsAllList.currentPage-1}&cateName=${cateName}&needPage=1&cateSecName=${cateSecName}&search=${search}"><span aria-hidden="true">&laquo;</span></a></li>
												</c:if>
												<c:forEach var="i" begin="1" end="${showGoodsAllList.countPage}">
													<c:if test="${i==showGoodsAllList.currentPage}">
														<li class="active"><a>${i}</a></li>
													</c:if>
													<c:if test="${i!=showGoodsAllList.currentPage}">
														<li><a href="goodsShow?mainPage=${i}&needPage=1&cateName=${cateName}&cateSecName=${cateSecName}&search=${search}">${i}</a></li>
													</c:if>
												</c:forEach>
												<c:if test="${showGoodsAllList.currentPage!=showGoodsAllList.countPage}">
													<li><a href="goodsShow?mainPage=${showGoodsAllList.currentPage+1}&cateName=${cateName}&needPage=1&cateSecName=${cateSecName}&search=${search}"><span>&raquo;</span></a></li>
												</c:if>
											</ul>
										</nav>
									</div>
									<!--分页的样式-->
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
													<li><a href="goodsShow?needPage=${showGoodsList.currentPage-1}&mainPage=1&cateName=&cateSecName=&search="><span aria-hidden="true">&laquo;</span></a></li>
												</c:if>
												<c:forEach var="i" begin="1" end="${showGoodsList.countPage}">
													<c:if test="${i==showGoodsList.currentPage}">
														<li class="active"><a>${i}</a></li>
													</c:if>
													<c:if test="${i!=showGoodsList.currentPage}">
														<li><a href="goodsShow?needPage=${i}&mainPage=1&cateName=&cateSecName=">${i}</a></li>
													</c:if>
												</c:forEach>
												<c:if test="${showGoodsList.currentPage!=showGoodsList.countPage}">
													<li><a href="goodsShow?needPage=${showGoodsList.currentPage+1}&mainPage=1&cateName=&cateSecName="><span>&raquo;</span></a></li>
												</c:if>
											</ul>
										</nav>
									</div>
									<!--分页的样式-->
								</div>
								<!--火热畅销产品end-->



							</div>
						</div>
						<!-- END CONTENT -->
					</div>

				</div>
				<!-- END PRIMARY SECTION -->
				<!-- START NEWSLETTER FORM -->
				<div id="newsletter-form" class="group">
					<div class="inner"></div>
				</div>
				<!-- ENDSTART NEWSLETTER FORM -->
				<!-- START FOOTER -->
				<div id="footer" class="group footer-sidebar-right columns-3"></div>
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
