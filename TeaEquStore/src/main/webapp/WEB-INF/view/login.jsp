<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/tool/tool.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>欢迎来到登录页面</title>

<meta name="keywords" content="" />
<meta name="description" content="" />
<link rel="stylesheet" href="${ctx}/css/style.css" />
<script src="${ctx}/jquery/jquery-1.11.1.min.js"></script>
<script src="${ctx}/js/common.js"></script>
<!--背景图片自动更换-->
<script src="${ctx}/js/supersized.3.2.7.min.js"></script>
<script src="${ctx}/js/supersized-init.js"></script>
<!--表单验证-->
<script src="${ctx}/js/jquery.validate.min.js?var1.14.0"></script>

</head>

<%-- <%
	/* 1.request.getSchema();可以返回当前页面所使用的协议，就是"http"
	2.request.getServerName();返回当前页面所在服务器的名字，就是上面例子中的"localhost"
	3.request.getServerPort();返回当前页面所在服务器的端口号，就是上面例子中的"8085"
	4.request.getContextPath();返回当前页面所在的应用的名字，就是上面例子中的"Info_System" */
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "view/";
%>
<base href="<%=basePath%>"> --%>
<body>
	<div class="login-container">
		<h1>教学器材专卖店登录模板</h1>

		<div class="connect">
			<p></p>
		</div>

		<form action="${ctx}/userProve" method="post" id="loginForm">
			<div>
				<input type="text" name="userName" class="username" placeholder="用户名" autocomplete="off" />
			</div>
			<div>
				<input type="password" name="userPassWord" class="password" placeholder="密码" oncontextmenu="return false" onpaste="return false" />
			</div>
			<button id="submit" type="submit">登 录</button>
		</form>

		<a href="${ctx}/page/jumpRegist">
			<button type="button" class="register-tis">还有没有账号？</button>
		</a>

	</div>
	
</body>


</html>