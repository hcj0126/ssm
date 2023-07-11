<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>登录 | Login</title>
    <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/adminLTE/css/AdminLTE.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/iCheck/square/blue.css">
</head>

<body class="hold-transition login-page">
    <div class="login-box">
        <div class="login-logo">
            <a href="all-admin-index.html"><b>SSM</b>后台权限管理系统</a>
        </div>
        <!-- /.login-logo -->
		
        <div class="login-box-body">
            <p class="login-box-msg">登录系统</p>

            <div class="form-group has-feedback">
                <input id="phoneId" name="phone" type="text" class="form-control" placeholder="手机号">
                <span  class="glyphicon glyphicon-phone form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input id="passwordId" name="password" type="password" class="form-control" placeholder="密码">
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>
            <div class="row">
                <div class="col-xs-8">
                    <div class="checkbox icheck">
                        <label><input type="checkbox"> 记住 下次自动登录</label>
                    </div>
                </div>
                <!-- /.col -->
                <div class="col-xs-4">
                    <button id="submitId" type="submit"  class="btn btn-primary btn-block btn-flat">登录</button>
                </div>
                <!-- /.col -->
            </div>

            <!-- /.social-auth-links -->
            <a href="#">忘记密码</a> | 
            <a href="all-admin-register.html" class="text-center">新用户注册</a>

            <!--错误提示信息-->
            <div class="alert">

            </div>
        </div>
        <!-- /.login-box-body -->
    </div>
    <!-- /.login-box -->
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
    <!-- jQuery 2.2.3 -->
    <!-- Bootstrap 3.3.6 -->
    <!-- iCheck -->
    <script src="${pageContext.request.contextPath}/plugins/jQuery/jquery-2.2.3.min.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/iCheck/icheck.min.js"></script>
    <script>
        // 页面加载函数
        $(function(){
            // 给登录按钮绑定点击事件
            $("#submitId").on("click",function(){
                // 让错误提示信息显示
                $(".alert").show();
                // 先验证手机号码
                // 获取手机号码框的值
                var $phone = $("#phoneId").val();
                if($phone.length==0){
                    $(".alert").text("手机号码不能为空!");
                    return false;
                }
                // 定义手机号正则
                var regexPhone = /^1[3578][0-9]{9}$/;
                if(!regexPhone.test($phone)){
                    $(".alert").text("手机号码格式不正确");
                    return false;
                }
                // 再验证密码
                // 获取密码框的值
                var $password = $("#passwordId").val();
                if($password.length==0){
                    $(".alert").text("密码不能为空!");
                    return false;
                }
                // 定义密码正则
                var regexPassword = /^[0-9]{6}$/;
                if(!regexPassword.test($password)){
                    $(".alert").text("密码必须为6位数字!");
                    return false;
                }
                // 如果上面if都不执行 让错误提示信息隐藏
                $(".alert").hide();
                // 如果上面if都不执行 说明手机号和密码都对  跳转到后台UserController
                location.href="${pageContext.request.contextPath}/user/findUserByPhone?phone="+$phone+"&password="+$password;
            })
        })
    </script>
</body>

</html>