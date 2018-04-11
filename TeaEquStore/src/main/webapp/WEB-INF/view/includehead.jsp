<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		<c:if test="${user.type==1||user.type==2}">
			<li><a href="page/userManager">进入后台</a> |</li>
		</c:if>
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

			<li class="megamenu"><a href="jumpRelease">发布商品</a></li>
			<li><a href="shop.html">我的资料</a></li>
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

