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

				<div id="newsletter-form" class="group"></div>
			</div>

		</div>

	</div>

	<script type="text/javascript" src="js/jquery.custom.js"></script>
	<script type="text/javascript" src="js/contact.js"></script>


</body>
</html>