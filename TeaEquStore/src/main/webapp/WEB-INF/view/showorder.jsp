<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width" />
<title>cart</title>


<link rel="stylesheet" type="text/css" media="all" href="css/style1.css" />
<link rel="stylesheet" type="text/css" media="screen and (max-width: 980px)" href="css/lessthen980.css" />
<link rel="stylesheet" type="text/css" media="screen and (max-width: 600px)" href="css/lessthen600.css" />
<link rel="stylesheet" type="text/css" media="screen and (max-width: 480px)" href="css/lessthen480.css" />
<link rel="stylesheet" href="css/shop.css" type="text/css" media="all" />
<link rel="stylesheet" href="css/prettyPhoto.css" type="text/css" media="all" />
<link rel="stylesheet" href="css/tipsy.css" type="text/css" media="all" />
<link rel='stylesheet' href='css/jquery-rotating.css' type='text/css' media='all' />
<link rel='stylesheet' href='css/slider-cycle.css' type='text/css' media='all' />
<link rel="shortcut icon" type="image/x-icon" href="favicon.ico" />
<link rel="icon" type="image/x-icon" href="favicon.ico" />

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

	<div class="bgLight group">

		<div class="wrapper group">

			<div class="bgWrapper group">

				<div id="header" class="group">
					<%@ include file="includehead.jsp"%>
				</div>
				<div class="slider-mobile">

					<div id="slider" class="group mobile inner fixed-image">
						<img src="images/slider/001.jpg" width="960" height="338" alt="" />
					</div>

				</div>

				<div id="primary" class="inner group">
					<div class="layout-sidebar-no group">

						<div id="content" role="main" class="group">
							<div id="crumbs" class="theme_breadcumb">
								<a class="home" href="home.html">Home Page</a> &rsaquo; <a class="no-link current" href="#">Cart</a>
								<div class="breadcrumb-end"></div>
							</div>
							<h2>订单列表显示</h2>

							<div class="container header">
								<div class="span5"></div>
								<div class="span9">
									<div class="headerAd">
										<img src="" width="320" height="50" alt="正品保障" title="正品保障" />
									</div>
								</div>



							</div>

							<div class="container cart">

								<div class="span24">

									<div class="step step1">
										<ul>

											<li class="current"></li>
											<li>我的订单</li>
										</ul>
									</div>


									<table>
										<tbody>
											<c:forEach items="${orderList.list}" var="orList">
												<tr>
													<th colspan="5">订单编号:<c:out value="${orList.oid}" />&nbsp;&nbsp;&nbsp;&nbsp;订单金额:<font color="red"><c:out value="${orList.total}" /> </font> &nbsp;&nbsp;&nbsp;&nbsp; <font
														color="red"> <c:choose>
																<c:when test="${orList.orderState==0}">
																	<a href="findByOrderId?id=${orList.oid}">付款</a>
																</c:when>
																<c:when test="${orList.orderState==1}">已付款</c:when>
																<c:when test="${orList.orderState==2}">
																	<a href="">确认收货</a>
																</c:when>
																<c:when test="${orList.orderState==3}">交易成功</c:when>
															</c:choose>
													</font>
													</th>
												</tr>
												<tr>
													<th>图片</th>
													<th>商品</th>
													<th>价格</th>
													<th>数量</th>
													<th>小计</th>
												</tr>
												<c:forEach items="${orList.orderItems}" var="item">
													<tr>
														<td width="60"><img src="${item.good.equPicture}" /></td>
														<td><c:out value="${item.good.equName}" /></td>
														<td><c:out value="${item.good.sellPrice}" /></td>
														<td class="quantity" width="60"><c:out value="${item.goodNum}" /></td>
														<td width="140"><span class="subtotal">￥<c:out value="${item.subtotal}" />
														</span></td>
													</tr>
												</c:forEach>
											</c:forEach>
											<tr>
												<th colspan="5">
													<div class="pagination">
														<span>第${orderList.currentPage}/${orderList.countPage}页 </span>
														<c:if test="${orderList.currentPage != 1} ">
															<a href="showOrderList?page=1" class="firstPage">&nbsp;</a>
															<a href="showOrderList?page=${orderList.currentPage-1}" class="previousPage">&nbsp;</a>
														</c:if>
														<c:forEach var="i" begin="1" end="${orderList.countPage}">
															<c:choose>
																<c:when test="${ orderList.currentPage != i}">
																	<a href="showOrderList?page=${i}">${i}</a>
																</c:when>
																<c:otherwise>
																	<span class="currentPage">${ orderList.currentPage}</span>
																</c:otherwise>
															</c:choose>
														</c:forEach>
														<c:if test="${orderList.currentPage != orderList.countPage}">
															<a class="nextPage" href="showOrderList?page=${orderList.currentPage+1}">&nbsp;</a>
															<a class="lastPage" href="showOrderList?page=${orderList.countPage}">&nbsp;</a>
														</c:if>
													</div>
												</th>
											</tr>
										</tbody>
									</table>


								</div>

							</div>
							<div class="container footer">
								<div class="span24">
									<div class="footerAd">
										<img src="image\r___________renleipic_01/footer.jpg" alt="我们的优势" title="我们的优势" height="52" width="950">
									</div>
								</div>


							</div>


							<div id="comments"></div>

						</div>

					</div>

				</div>

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

			</div>

		</div>

	</div>

	<script type="text/javascript" src="js/jquery.custom.js"></script>
	<script type="text/javascript" src="js/contact.js"></script>


</body>
</html>