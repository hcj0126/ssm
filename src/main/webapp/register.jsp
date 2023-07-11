<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>注册 | Register</title>
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
            <p class="login-box-msg">新用户注册</p>

            <form id="registerForm" action="${pageContext.request.contextPath}/user/register" method="post">
                <div class="form-group has-feedback">
                    <input type="text" id="username" class="form-control" name="username" placeholder="全名">
                    <span class="glyphicon glyphicon-user form-control-feedback"></span>
                </div>
                <div class="form-group has-feedback">
                    <input id="register-phone" name="phone" type="text" class="form-control" placeholder="手机号">
                    <span id="register-phone-span" class="glyphicon glyphicon-phone form-control-feedback"></span>
                </div>
                <div class="form-group has-feedback">
                    <input type="password" name="password" id="register-password" class="form-control" placeholder="密码">
                    <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                </div>
                <div class="form-group has-feedback">
                    <input type="password" id="register-repassword" class="form-control" placeholder="确认密码">
                    <span class="glyphicon glyphicon-log-in form-control-feedback"></span>
                </div>
                <div class="row">
                    <div class="col-xs-8">
                        <div class="checkbox icheck">
                            <label>
                                <input type="checkbox" value="" checked=""> 我同意 <a href="#">协议</a>
                            </label>
                        </div>
                    </div>
                    <!-- /.col -->
                    <div class="col-xs-4">
                        <button type="submit" class="btn btn-primary btn-block btn-flat">注册</button>
                    </div>
                    <!-- /.col -->
                </div>
            </form>

            <a href="login.jsp" class="text-center">我有账号，现在就去登录</a>

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
                    padding: 6px;
                    font-size: 16px;
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
        $(function () {
            $('input').iCheck({
                checkboxClass: 'icheckbox_square-blue',
                radioClass: 'iradio_square-blue',
                increaseArea: '20%' // optional
            });

            // 给登录按钮绑定点击事件
            $("#registerForm").on("submit",function(){
                // 让错误提示信息显示
                $(".alert").show();
                // 获取全名文本框的值
                var $username = $("#username").val();
                if($username.length==0){
                    $(".alert").html("全名不能为空!");
                    return false;
                }

                // 验证手机号码
                // 获取手机号码框的值
                var $phone = $("#register-phone").val();
                if($phone.length==0){
                    $(".alert").html("手机号码不能为空!");
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
                var $password = $("#register-password").val();
                if($password.length==0){
                    $(".alert").text("密码不能为空!");
                    return false;
                }
                // 获取确认密码框的值
                var $repassword = $("#register-repassword").val();
                if($repassword.length==0){
                    $(".alert").text("确认密码不能为空!");
                    return false;
                }
                // 定义手机号正则
                var regexPassword = /^[0-9]{6}$/;
                if(!regexPassword.test($password)){
                    $(".alert").text("密码必须为6位数字!");
                    return false;
                }
                if($password!=$repassword){
                    $(".alert").text("两次密码输入不一致!");
                    return false;
                }
                // 获取协议的勾
                // alert((".icheckbox_square-blue").classList);
                /*if($(".checked")==undefined){
                    $(".alert").text("请先同意协议！");
                }*/
                $(".alert").hide();
                // 如果上面if都不执行 说明手机号和密码都对  跳转到首页
                // window.location.href="register?phone="+$phone+"&password="+$password;
            })
        });
    </script>
</body>

</html>