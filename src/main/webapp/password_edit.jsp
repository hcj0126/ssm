<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>修改密码 | Password</title>
	<meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/ionicons/css/ionicons.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/adminLTE/css/AdminLTE.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/iCheck/square/blue.css">
</head>

<body class="hold-transition register-page">
<div class="register-box">

	<div class="register-box-body">
		<p class="login-box-msg">修改密码</p>

		<form id="updatePasswordId" action="${pageContext.request.contextPath}/user/updatePassword" method="post">

			<div class="form-group has-feedback">
				<input id="phoneId" value="${user.phone}" readonly name="phone" type="text" class="form-control" placeholder="手机号">
				<span id="phone-span" class="glyphicon glyphicon-phone form-control-feedback"></span>
			</div>
			<div class="form-group has-feedback">
				<input type="password" name="oldpassword"  id="oldPasswordId" class="form-control" placeholder="旧密码">
				<span class="glyphicon glyphicon-lock form-control-feedback"></span>
			</div>
			<div class="form-group has-feedback">
				<input type="password" name="password" id="newPasswordId" class="form-control" placeholder="新密码">
				<span class="glyphicon glyphicon-lock form-control-feedback"></span>
			</div>
			<div class="form-group has-feedback">
				<input type="password" id="reNewPasswordId" class="form-control" placeholder="确认新密码">
				<span class="glyphicon glyphicon-lock form-control-feedback"></span>
			</div>
			<div class="row">
				<div class="col-xs-4">
					<button type="submit" class="btn btn-primary btn-block btn-flat">确定</button>
				</div>
				<!-- /.col -->
			</div>
		</form>

		<!--错误提示信息-->
		<div class="alert">

		</div>
		<style>
			/*错误提示信息*/
			.alert{
				background: #ffebeb;
				color:#e4393c;
				border:1px solid #faccc6;
				height:40px;
				line-height: 24px;
				text-align: center;
				display: none;
				padding:5px;
				font-size:18px;
				margin-top: 2px;
			}
		</style>
	</div>
	<!-- /.form-box -->
</div>
<!-- /.register-box -->

<script src="${pageContext.request.contextPath}/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/iCheck/icheck.min.js"></script>

<script>
	// 页面加载函数
	$(function(){
		// 给登录按钮绑定点击事件
		$("#updatePasswordId").on("submit",function(){
			// 让错误提示信息显示
			$(".alert").show();
			// 验证密码
			// 获取旧密码框的值
			var $oldPassword = $("#oldPasswordId").val();
			if($oldPassword.length==0){
				$(".alert").text("旧密码不能为空!");
				return false;
			}
			// 获取新密码框的值
			var $newPassword = $("#newPasswordId").val();
			if($newPassword.length==0){
				$(".alert").text("新密码不能为空!");
				return false;
			}

			// 定义密码正则
			var regexPassword = /^[0-9]{6}$/;
			if(!regexPassword.test($oldPassword) || !regexPassword.test($newPassword) ){
				$(".alert").text("密码必须为6位数字!");
				return false;
			}
			// 获取新密码框的值
			var $reNewPasswordId = $("#reNewPasswordId").val();
			if($reNewPasswordId!=$newPassword){
				$(".alert").text("确认密码和新密码不一致!");
				return false;
			}
			// 如果上面if都不执行 让错误提示信息隐藏
			$(".alert").hide();
			// 走这里 正常提交事件，提交到后台Controller层
		})
	})
</script>
</body>

</html>