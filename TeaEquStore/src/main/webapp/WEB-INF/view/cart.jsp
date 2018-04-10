<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width" />
<title>cart</title>

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
					<%@  include file="includehead.jsp"%>
				</div>
				<!-- END HEADER -->

				<div class="slider-mobile">
					<!-- START SLIDER -->
					<div id="slider" class="group mobile inner fixed-image">
						<img src="images/slider/001.jpg" width="960" height="338" alt="" />
					</div>
					<!-- END SLIDER -->
				</div>
				<!-- START PRIMARY SECTION -->
				<div id="primary" class="inner group">
					<div class="layout-sidebar-no group">
						<!-- START CONTENT -->
						<div id="content" role="main" class="group">
							<div id="crumbs" class="theme_breadcumb">
								<a class="home" href="home.html">Home Page</a> &rsaquo; <a class="no-link current" href="#">Cart</a>
								<div class="breadcrumb-end"></div>
							</div>
							<h2>Cart</h2>
							<!--订单列表start-->
							<div class="container cart">
								<c:choose>
									<c:when test="${cart.cartItems.size()!=0}">
										<div class="span24">
											<div class="step step1">购物车信息</div>
											<table>
												<tbody>
													<tr>
														<th>图片</th>
														<th>商品</th>
														<th>价格</th>
														<th>数量</th>
														<th>小计</th>
														<th>操作</th>
													</tr>
													<c:forEach items="${cart.cartItems}" var="cartItem">
														<tr>
															<td width="60"><img src="${cartItem.goods.equPicture}"></td>
															<td><a target="_blank"></a>${cartItem.goods.equName}</td>
															<td>￥${cartItem.goods.sellPrice}</td>
															<td class="quantity" width="60">${cartItem.goodNum}</td>
															<td width="140"><span class="subtotal">￥${cartItem.subtotal}</span></td>
															<td><a href="removeCart?gid=${cartItem.goods.e_id}" class="delete">删除</a></td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
											<dl id="giftItems" class="hidden" style="display: none;">
											</dl>
											<div class="total">
												<em id="promotion"></em> <em> 登录后确认是否享有优惠 </em> 赠送积分: <em id="effectivePoint"></em> 商品金额: <strong id="effectivePrice">￥${cart.total}元 </strong>
											</div>
											<div class="bottom">
												<a href="goodsShow?cateName=&mainPage=1&needPage=1&cateSecName=&search=" class="large green sc-button">继续购物</a> <a href="clearCart" id="clear" class="clear">清空购物车</a> <a href="submitOrder"
													id="submit" class="submit">提交订单</a>
											</div>

										</div>
									</c:when>
									<c:otherwise>
										<div id="post-12" class="post-12 page type-page status-publish hentry group">
											<p>亲，你的购物车是空的</p>
											<p>
												<a class="button" href="goodsShow?cateName=&mainPage=1&needPage=1&cateSecName=&search=">&larr; 返回购物</a>
											</p>

										</div>
									</c:otherwise>
								</c:choose>
							</div>

							<!--订单列表end-->

							<div id="comments">
								<!--<p class="nocomments">&nbsp;</p>-->
							</div>
							<!-- #comments -->
						</div>
						<!-- END CONTENT -->
						<!-- START SIDEBAR -->
						<!-- END SIDEBAR -->
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