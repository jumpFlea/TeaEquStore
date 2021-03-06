<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/tool/tool.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<title>后台管理</title>

<meta name="keywords" content="后台管理">
<meta name="description" content="后台管理">


<link rel="shortcut icon" href="favicon.ico">
<link href="${ctx}/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
<link href="${ctx}/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
<link href="${ctx}/css/animate.min.css" rel="stylesheet">
<link href="${ctx}/css/style.min862f.css?v=4.1.0" rel="stylesheet">

</head>

<body class="fixed-sidebar full-height-layout gray-bg" style="overflow: hidden">
	<div id="wrapper">
		<!--左侧导航开始-->
		<nav class="navbar-default navbar-static-side" role="navigation">
		<div class="nav-close">
			<i class="fa fa-times-circle"></i>
		</div>
		<div class="sidebar-collapse">
			<ul class="nav" id="side-menu">
				<li class="nav-header">
					<div class="dropdown profile-element">
						<span><img alt="image" class="img-circle" src="img/profile_small.jpg" /></span> <a data-toggle="dropdown" class="dropdown-toggle" href="#"> <span class="clear"> <span
								class="block m-t-xs"><strong class="font-bold">Beaut-zihan</strong></span> <span class="text-muted text-xs block">超级管理员<b class="caret"></b></span>
						</span>
						</a>
						<ul class="dropdown-menu animated fadeInRight m-t-xs">
							<li><a class="J_menuItem" href="form_avatar.html">修改头像</a></li>
							<li><a class="J_menuItem" href="profile.html">个人资料</a></li>
							<li><a class="J_menuItem" href="contacts.html">联系我们</a></li>
							<li><a class="J_menuItem" href="mailbox.html">信箱</a></li>
							<li class="divider"></li>
							<li><a href="${ctx}/page/jumpLogin">安全退出</a></li>
						</ul>
					</div>
					<div class="logo-element">H+</div>
				</li>
				<li><a class="J_iframe" href="javascript:;"> <i class="fa fa-user"></i> <span class="nav-label">用户管理</span><span class="fa arrow"></span></a>
					<ul class="nav nav-second-level">
						<li><a class="J_menuItem" href="${ctx}/page/userIframe">查看用户 </a></li>
					</ul></li>
				<li><a class="J_iframe" href="#"> <i class="fa fa-edit"></i> <span class="nav-label">商品管理</span> <span class="fa arrow"></span>
				</a>
					<ul class="nav nav-second-level">
						<li><a class="J_menuItem" href="${ctx}/page/goodsIframe" id="lookGoods">查看商品 </a></li>
						<li><a class="J_menuItem" href="${ctx}/backgoods/backJumpRelease" id="releaseGoods">发布商品</a></li>
						<li><a class="J_menuItem" href="${ctx}/page/go-echarts" id="sellShow">销售情况</a></li>
					</ul></li>
				<li><a class="J_iframe" href="#"> <i class="fa fa-edit"></i> <span class="nav-label">订单管理</span> <span class="fa arrow"></span>
				</a>
					<ul class="nav nav-second-level">
						<li><a class="J_menuItem" href="${ctx}/page/goListOrder" id="lookOrderList">订单列表 </a></li>
						<li><a class="J_menuItem" href="${ctx}/backgoods/backJumpRelease" id="releaseGoods">发布商品</a></li>
						<li><a class="J_menuItem" href="${ctx}/page/go-echarts" id="sellShow">销售情况</a></li>
					</ul></li>
				<li><a class="J_iframe" href="#"> <i class="fa fa-pencil"></i> <span class="nav-label">分类管理</span> <span class="fa arrow"></span>
				</a>
					<ul class="nav nav-second-level">
						<li><a class="J_menuItem" href="${ctx}/page/goodsIframe" id="lookGoods">查看分类 </a></li>
					</ul></li>


			</ul>
		</div>
		</nav>
		<!--左侧导航结束-->
		<!--右侧部分开始-->
		<div id="page-wrapper" class="gray-bg dashbard-1">
			<div class="row border-bottom">
				<nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
				<div class="navbar-header">
					<a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#"><i class="fa fa-bars"></i> </a>
					<form role="search" class="navbar-form-custom" method="post" action="http://www.zi-han.net/theme/hplus/search_results.html">
						<div class="form-group">
							<input type="text" placeholder="请输入您需要查找的内容 …" class="form-control" name="top-search" id="top-search">
						</div>
					</form>
				</div>
				<ul class="nav navbar-top-links navbar-right">
					<li class="dropdown"><a class="dropdown-toggle count-info" data-toggle="dropdown" href="#"> <i class="fa fa-envelope"></i> <span class="label label-warning">16</span>
					</a>
						<ul class="dropdown-menu dropdown-messages">
							<li class="m-t-xs">
								<div class="dropdown-messages-box">
									<a href="profile.html" class="pull-left"> <img alt="image" class="img-circle" src="img/a7.jpg">
									</a>
									<div class="media-body">
										<small class="pull-right">46小时前</small> <strong>小四</strong> 这个在日本投降书上签字的军官，建国后一定是个不小的干部吧？ <br> <small class="text-muted">3天前 2014.11.8</small>
									</div>
								</div>
							</li>
							<li class="divider"></li>
							<li>
								<div class="dropdown-messages-box">
									<a href="profile.html" class="pull-left"> <img alt="image" class="img-circle" src="img/a4.jpg">
									</a>
									<div class="media-body ">
										<small class="pull-right text-navy">25小时前</small> <strong>国民岳父</strong> 如何看待“男子不满自己爱犬被称为狗”？——这人比犬还凶 <br> <small class="text-muted">昨天</small>
									</div>
								</div>
							</li>
							<li class="divider"></li>
							<li>
								<div class="text-center link-block">
									<a class="J_menuItem" href="mailbox.html"> <i class="fa fa-envelope"></i> <strong> 查看所有消息</strong>
									</a>
								</div>
							</li>
						</ul></li>
					<li class="dropdown"><a class="dropdown-toggle count-info" data-toggle="dropdown" href="#"> <i class="fa fa-bell"></i> <span class="label label-primary">8</span>
					</a>
						<ul class="dropdown-menu dropdown-alerts">
							<li><a href="mailbox.html">
									<div>
										<i class="fa fa-envelope fa-fw"></i> 您有16条未读消息 <span class="pull-right text-muted small">4分钟前</span>
									</div>
							</a></li>
							<li class="divider"></li>
							<li><a href="profile.html">
									<div>
										<i class="fa fa-qq fa-fw"></i> 3条新回复 <span class="pull-right text-muted small">12分钟钱</span>
									</div>
							</a></li>
							<li class="divider"></li>
							<li>
								<div class="text-center link-block">
									<a class="J_menuItem" href="notifications.html"> <strong>查看所有 </strong> <i class="fa fa-angle-right"></i>
									</a>
								</div>
							</li>
						</ul></li>
					<li class="hidden-xs"><a href="index_v1.html" class="J_menuItem" data-index="0"><i class="fa fa-cart-arrow-down"></i> 购买</a></li>
					<li class="dropdown hidden-xs"><a class="right-sidebar-toggle" aria-expanded="false"> <i class="fa fa-tasks"></i> 主题
					</a></li>
				</ul>
				</nav>
			</div>
			<div class="row content-tabs">
				<button class="roll-nav roll-left J_tabLeft">
					<i class="fa fa-backward"></i>
				</button>
				<nav class="page-tabs J_menuTabs">
				<div class="page-tabs-content">
					<a href="javascript:;" class="active J_menuTab" data-id="index_v1.html">首页</a>
				</div>
				</nav>
				<button class="roll-nav roll-right J_tabRight">
					<i class="fa fa-forward"></i>
				</button>
				<div class="btn-group roll-nav roll-right">
					<button class="dropdown J_tabClose" data-toggle="dropdown">
						关闭操作<span class="caret"></span>

					</button>
					<ul role="menu" class="dropdown-menu dropdown-menu-right">
						<li class="J_tabShowActive"><a>定位当前选项卡</a></li>
						<li class="divider"></li>
						<li class="J_tabCloseAll"><a>关闭全部选项卡</a></li>
						<li class="J_tabCloseOther"><a>关闭其他选项卡</a></li>
					</ul>
				</div>
				<a href="login.html" class="roll-nav roll-right J_tabExit"><i class="fa fa fa-sign-out"></i> 退出</a>
			</div>
			<div class="row J_mainContent" id="content-main">
				<iframe class="J_iframe" name="iframe0" width="100%" height="100%" src="${ pageContext.request.contextPath }/page/userIframe" frameborder="0" data-id="" seamless></iframe>
			</div>
			<div class="footer">
				<div class="pull-right">
					&copy; 2014-2015 <a href="http://www.zi-han.net/" target="_blank"></a>
				</div>
			</div>
		</div>
		<!--右侧部分结束-->
		<!--右侧边栏开始-->
		<div id="right-sidebar">
			<div class="sidebar-container">

				<ul class="nav nav-tabs navs-3">

					<li class="active"><a data-toggle="tab" href="#tab-1"> <i class="fa fa-gear"></i> 主题
					</a></li>
					<li class=""><a data-toggle="tab" href="#tab-2"> 通知 </a></li>
					<li><a data-toggle="tab" href="#tab-3"> 项目进度 </a></li>
				</ul>

				<div class="tab-content">
					<div id="tab-1" class="tab-pane active">
						<div class="sidebar-title">
							<h3>
								<i class="fa fa-comments-o"></i> 主题设置
							</h3>
							<small><i class="fa fa-tim"></i> 你可以从这里选择和预览主题的布局和样式，这些设置会被保存在本地，下次打开的时候会直接应用这些设置。</small>
						</div>
						<div class="skin-setttings">
							<div class="title">主题设置</div>
							<div class="setings-item">
								<span>收起左侧菜单</span>
								<div class="switch">
									<div class="onoffswitch">
										<input type="checkbox" name="collapsemenu" class="onoffswitch-checkbox" id="collapsemenu"> <label class="onoffswitch-label" for="collapsemenu"> <span
											class="onoffswitch-inner"></span> <span class="onoffswitch-switch"></span>
										</label>
									</div>
								</div>
							</div>
							<div class="setings-item">
								<span>固定顶部</span>

								<div class="switch">
									<div class="onoffswitch">
										<input type="checkbox" name="fixednavbar" class="onoffswitch-checkbox" id="fixednavbar"> <label class="onoffswitch-label" for="fixednavbar"> <span class="onoffswitch-inner"></span>
											<span class="onoffswitch-switch"></span>
										</label>
									</div>
								</div>
							</div>
							<div class="setings-item">
								<span> 固定宽度 </span>

								<div class="switch">
									<div class="onoffswitch">
										<input type="checkbox" name="boxedlayout" class="onoffswitch-checkbox" id="boxedlayout"> <label class="onoffswitch-label" for="boxedlayout"> <span class="onoffswitch-inner"></span>
											<span class="onoffswitch-switch"></span>
										</label>
									</div>
								</div>
							</div>
							<div class="title">皮肤选择</div>
							<div class="setings-item default-skin nb">
								<span class="skin-name "> <a href="#" class="s-skin-0"> 默认皮肤 </a>
								</span>
							</div>
							<div class="setings-item blue-skin nb">
								<span class="skin-name "> <a href="#" class="s-skin-1"> 蓝色主题 </a>
								</span>
							</div>
							<div class="setings-item yellow-skin nb">
								<span class="skin-name "> <a href="#" class="s-skin-3"> 黄色/紫色主题 </a>
								</span>
							</div>
						</div>
					</div>
					<div id="tab-2" class="tab-pane">

						<div class="sidebar-title">
							<h3>
								<i class="fa fa-comments-o"></i> 最新通知
							</h3>
							<small><i class="fa fa-tim"></i> 您当前有10条未读信息</small>
						</div>

						<div>
							<div class="sidebar-message">
								<a href="#">
									<div class="pull-left text-center">
										<img alt="image" class="img-circle message-avatar" src="img/a3.jpg">

										<div class="m-t-xs">
											<i class="fa fa-star text-warning"></i> <i class="fa fa-star text-warning"></i> <i class="fa fa-star text-warning"></i>
										</div>
									</div>
									<div class="media-body">
										最近在补追此剧，特别喜欢这段表白。 <br> <small class="text-muted">昨天 1:10</small>
									</div>
								</a>
							</div>
						</div>

					</div>
					<div id="tab-3" class="tab-pane">

						<div class="sidebar-title">
							<h3>
								<i class="fa fa-cube"></i> 最新任务
							</h3>
							<small><i class="fa fa-tim"></i> 您当前有14个任务，10个已完成</small>
						</div>

						<ul class="sidebar-list">

							<li><a href="#">
									<div class="small pull-right m-t-xs">9小时以后</div>
									<h4>获证开盘</h4> 编写目的编写本项目进度报告的目的在于更好的控制软件开发的时间,对团队成员的 开发进度作出一个合理的比对

									<div class="small">已完成： 14%</div>
									<div class="progress progress-mini">
										<div style="width: 14%;" class="progress-bar progress-bar-info"></div>
									</div>
							</a></li>

						</ul>

					</div>
				</div>

			</div>
		</div>
		<!--右侧边栏结束-->
		<!--mini聊天窗口开始-->
		<div class="small-chat-box fadeInRight animated">

			<div class="heading" draggable="true">
				<small class="chat-date pull-right"> 2015.9.1 </small> 与 Beau-zihan 聊天中
			</div>

			<div class="content">

				<div class="left">
					<div class="author-name">
						Beau-zihan <small class="chat-date"> 10:02 </small>
					</div>
					<div class="chat-message active">你好</div>

				</div>
				<div class="right">
					<div class="author-name">
						游客 <small class="chat-date"> 11:24 </small>
					</div>
					<div class="chat-message">你好，请问H+有帮助文档吗？</div>
				</div>
				<div class="left">
					<div class="author-name">
						Beau-zihan <small class="chat-date"> 08:45 </small>
					</div>
					<div class="chat-message active">有，购买的H+源码包中有帮助文档，位于docs文件夹下</div>
				</div>
				<div class="right">
					<div class="author-name">
						游客 <small class="chat-date"> 11:24 </small>
					</div>
					<div class="chat-message">那除了帮助文档还提供什么样的服务？</div>
				</div>
				<div class="left">
					<div class="author-name">
						Beau-zihan <small class="chat-date"> 08:45 </small>
					</div>
					<div class="chat-message active">
						<br>
					</div>
				</div>

			</div>
			<div class="form-chat">
				<div class="input-group input-group-sm">
					<input type="text" class="form-control"> <span class="input-group-btn">
						<button class="btn btn-primary" type="button">发送</button>
					</span>
				</div>
			</div>

		</div>
		<div id="small-chat">
			<span class="badge badge-warning pull-right">5</span> <a class="open-small-chat"> <i class="fa fa-comments"></i>

			</a>
		</div>
	</div>
	<script src="${ctx}/js/backstage/jquery.min.js"></script>
	<script src="${ctx}/js/backstage/bootstrap.js"></script>
	<script src="${ctx}/js/backstage/jquery.metisMenu.js"></script>
	<script src="${ctx}/js/backstage/jquery.slimscroll.min.js"></script>
	<script src="${ctx}/js/backstage/layer.min.js"></script>
	<script src="${ctx}/js/backstage/hplus.min.js?v=4.1.0"></script>
	<script type="text/javascript" src="${ctx}/js/backstage/contabs.min.js"></script>
	<script src="${ctx}/js/backstage/pace.min.js"></script>
	<%-- <script src="${ctx}/js/backstage/iframe_goods.js"></script> --%>

</body>
</html>