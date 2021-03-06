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
					<%@include file="includehead.jsp"%>
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
								<div class="breadcrumb-end"></div>
							</div>
							<h2>订单</h2>
							<!--订单列表start-->
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
											<li>生成订单成功</li>
										</ul>
									</div>


									<table>
										<tbody>
											<tr>
												<th colspan="5">订单编号:<c:out value="${order.oid}" />&nbsp;&nbsp;&nbsp;&nbsp;
												</th>
											</tr>
											<tr>
												<th>图片</th>
												<th>商品</th>
												<th>价格</th>
												<th>数量</th>
												<th>小计</th>
											</tr>
											<c:forEach items="${order.orderItems}" var="orderItems">
												<tr>
													<td width="60"><img src="${orderItems.good.equPicture}"></td>
													<td>${orderItems.good.equName}</td>
													<td>${orderItems.good.sellPrice}</td>
													<td class="quantity" width="60">${orderItems.goodNum}</td>
													<td width="140"><span class="subtotal">￥${orderItems.subtotal}</span></td>

												</tr>
											</c:forEach>
										</tbody>
									</table>
									<dl id="giftItems" class="hidden" style="display: none;">
									</dl>
									<div class="total">
										<em id="promotion"></em> 商品金额: <strong id="effectivePrice">￥${order.total}元 </strong>
									</div>
									<form id="orderForm" action="payforOrder" method="post">
										<input type="hidden" name="oid" value="${order.oid}" />
										<div class="span24">
											<p>
												收货地址：<input name="address" type="text" value="${ order.user.address}" style="width: 350px" /> <br /> 收货人&nbsp;&nbsp;&nbsp;：<input name="name" type="text" value="${order.user.addressName}"
													style="width: 150px" /> <br /> 联系方式：<input name="phone" type="text" value="${order.user.telephone}" style="width: 150px" />

											</p>

											<p>
												选择银行：<br /> <input type="radio" name="pd_FrpId" value="ICBC-NET-B2C" checked="checked" />工商银行 <img src="${ pageContext.request.contextPath }/bank_img/icbc.bmp" align="middle" />&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="radio" name="pd_FrpId" value="BOC-NET-B2C" />中国银行 <img src="${ pageContext.request.contextPath }/bank_img/bc.bmp" align="middle" />&nbsp;&nbsp;&nbsp;&nbsp; <input
													type="radio" name="pd_FrpId" value="ABC-NET-B2C" />农业银行 <img src="${ pageContext.request.contextPath }/bank_img/abc.bmp" align="middle" /> <br /> <input type="radio" name="pd_FrpId"
													value="BOCO-NET-B2C" />交通银行 <img src="${ pageContext.request.contextPath }/bank_img/bcc.bmp" align="middle" />&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="pd_FrpId"
													value="PINGANBANK-NET" />平安银行 <img src="${ pageContext.request.contextPath }/bank_img/pingan.bmp" align="middle" />&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="pd_FrpId"
													value="CCB-NET-B2C" />建设银行 <img src="${ pageContext.request.contextPath }/bank_img/ccb.bmp" align="middle" /> <br /> <input type="radio" name="pd_FrpId" value="CEB-NET-B2C" />光大银行 <img
													src="${ pageContext.request.contextPath }/bank_img/guangda.bmp" align="middle" />&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="pd_FrpId" value="CMBCHINA-NET-B2C" />招商银行 <img
													src="${ pageContext.request.contextPath }/bank_img/cmb.bmp" align="middle" />
											</p>

											<p style="text-align: right">
												<%-- <a href="payforOrder?id=${order.oid}"> <img src="${pageContext.request.contextPath}/images/finalbutton.gif" width="204" height="51" border="0" />
												</a> --%>
												<button type="submit"><img src="${pageContext.request.contextPath}/images/finalbutton.gif" width="204" height="51" border="0" /></button>
											</p>
										</div>
									</form>
								</div>

							</div>
							<div class="container footer">
								<div class="span24">
									<div class="footerAd">
										<img src="image\r___________renleipic_01/footer.jpg" alt="我们的优势" title="我们的优势" height="52" width="950">
									</div>
								</div>


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