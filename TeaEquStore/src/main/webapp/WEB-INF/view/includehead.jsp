<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
		<li class="icon cart"><a class="trigger" href="myCart"> <span> 0 items &ndash; &euro;0.00 </span>
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
			<li><a href="goodsShow?cateName=&mainPage=1&needPage=1&cateSecName=">主页</a>
				<ul class="sub-menu">
					<c:forEach items="${cate}" var="ca">
						<li><a href="goodsShow?cateName=${ca.cateName}&mainPage=1&needPage=1&cateSecName=">${ca.cateName}</a>
							<ul class="sub-menu">
								<c:forEach items="${ca.categorysecond}" var="cat">
									<li><a href="goodsShow?cateName=${ca.cateName}&mainPage=1&needPage=1&cateSecName=${cat.cateSecName}">${cat.cateSecName}</a></li>
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

