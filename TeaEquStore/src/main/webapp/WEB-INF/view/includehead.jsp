<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- .inner -->
<div class="inner group">
	<!-- START LOGO -->
	<div id="logo" class="group">
		<a href="goodsShow?cateName=&mainPage=1&needPage=1&cateSecName=&search=" title="Sommerce Shop"> <span class="logo-title">教学器材专卖店</span>
		</a>
		<p class="logo-description"></p>
	</div>
	<!-- END LOGO -->
	<!-- START LINKSBAR -->
	<ul id="linksbar" class="group">
		<li class="icon cart"><a class="trigger" href="myCart"> <span>我的购物车</span>
		</a> |
			<div class="basketpopup">
				<h3>购物车</h3>
				<span class="empty">没有东西在购物车内</span>
			</div></li>
		<li class="icon lock"><a href="#">退出</a> |</li>
		<li><a href="contact.html">联系我们</a> |</li>
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
						<li><a href="goodsShow?cateName=${ca.cateName}&mainPage=1&needPage=1&cateSecName=">${ca.cateName}</a>
							<ul class="sub-menu">
								<c:forEach items="${ca.categorysecond}" var="cat">
									<li><a href="goodsShow?cateName=${ca.cateName}&mainPage=1&needPage=1&cateSecName=${cat.cateSecName}&search=${search}">${cat.cateSecName}</a></li>
								</c:forEach>
							</ul></li>
					</c:forEach>
				</ul></li>
			<!--遍历出主页下的一二级分类end-->

			<li class="megamenu"><a href="#">购物</a>
				<ul class="sub-menu">
				</ul></li>
			<li><a href="#">我的账户</a>
				<ul class="sub-menu">
					<li><a href="change-password.html">Change Password</a></li>
				</ul></li>
			<li><a href="#">店</a></li>
			<li><a href="#">Blog</a>
				<ul class="sub-menu">
					<li><a href="blog.html">Big Image</a></li>
				</ul></li>
			<li><a href="#">Pages</a>
				<ul class="sub-menu">
					<li><a href="#">Testimonials</a></li>
				</ul></li>
			<li><a href="#">简码</a>
				<ul class="sub-menu">
					<li><a href="typography.html">Typography</a></li>
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

