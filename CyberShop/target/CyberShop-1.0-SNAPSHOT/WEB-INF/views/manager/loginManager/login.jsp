<%-- 
    Document   : login
    Created on : Apr 22, 2019, 3:53:34 PM
    Author     : ngthe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>AdminLTE 2 | Data Tables</title>
        <!-- Tell the browser to be responsive to screen width -->
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <!-- Bootstrap 3.3.7 -->
        <link href="<c:url value="/resources/adminsource/support_template/bootstrap/dist/css/bootstrap.min.css" />" rel="stylesheet">
        <!-- Font Awesome -->
        <link href="<c:url value="/resources/adminsource/support_template/font-awesome/css/font-awesome.min.css" />" rel="stylesheet">
        <!-- Ionicons -->
        <link href="<c:url value="/resources/adminsource/support_template/Ionicons/css/ionicons.min.css" />" rel="stylesheet">
        <!-- DataTables -->
        <link href="<c:url value="/resources/adminsource/support_template/datatables.net-bs/css/dataTables.bootstrap.min.css" />" rel="stylesheet">
        <!-- Theme style -->
        <link href="<c:url value="/resources/adminsource/support_template/dist/css/AdminLTE.min.css" />" rel="stylesheet">
        <!-- AdminLTE Skins. Choose a skin from the css/skins
             folder instead of downloading all of them to reduce the load. -->
        <link href="<c:url value="/resources/adminsource/support_template/dist/css/skins/_all-skins.min.css" />" rel="stylesheet">
        <!-- Google Font -->
        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
        <!--modify css-->
        <link href="<c:url value="/resources/adminsource/support_template/stylemodify.css" />" rel="stylesheet">

    </head>
    <body class="hold-transition login-page">
        <div class="login-box">
            <div class="login-logo">
                <a href="../../index2.html"><b>Admin</b>CyberShop</a>
            </div>
            <!-- /.login-logo -->
            <div class="login-box-body">
                <h1>Login</h1>
                <sf:form action="${pageContext.request.contextPath}/login/check" method="post" modelAttribute="formLogin">
                    <div class="form-group has-feedback">
                        <input type="text" class="form-control" id="user" placeholder="Username" name="username" required>
                        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
                    </div>
                    <div class="form-group has-feedback">
                        <input type="password" class="form-control" placeholder="Password" name="password" required>
                        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                    </div>
                    <span style="color: red; font-size: 20px">${errLogin}</span>

                    <div class="row">
                        <div class="col-xs-12">
                            <div class="">
                                <button type="submit" class="btn btn-primary btn-block btn-flat">Sign In</button>
                            </div>

                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox" name="remember" value="1"> Remember Me
                                </label>
                            </div>
                        </div>
                        <!-- /.col -->

                        <!-- /.col -->
                    </div>


                </sf:form>
                    

                <!--                <div class="social-auth-links text-center">
                                    <p>- OR -</p>
                                    <a href="#" class="btn btn-block btn-social btn-facebook btn-flat"><i class="fa fa-facebook"></i> Sign in using
                                        Facebook</a>
                                    <a href="#" class="btn btn-block btn-social btn-google btn-flat"><i class="fa fa-google-plus"></i> Sign in using
                                        Google+</a>
                                </div>-->
                <!-- /.social-auth-links -->

<!--                <a id="forgot" href="">I forgot my password</a><br>-->
                <!--                <a href="register.html" class="text-center">Register a new membership</a>-->
               
<!--                 <span style="color: red; font-size: 20px">${msgForgot}</span>-->
            </div>
            <!-- /.login-box-body -->
        </div>
        <!-- /.login-box -->

        <!-- jQuery 3 -->
       <script src="<c:url value="/resources/adminsource/support_template/jquery/dist/jquery.min.js" />" type="text/javascript"></script>
            <!-- Bootstrap 3.3.7 -->
            <script src="<c:url value="/resources/adminsource/support_template/bootstrap/dist/js/bootstrap.min.js" />" type="text/javascript"></script>
            <!-- DataTables -->
            <script src="<c:url value="/resources/adminsource/support_template/datatables.net/js/jquery.dataTables.min.js" />" type="text/javascript"></script>
            <script src="<c:url value="/resources/adminsource/support_template/datatables.net-bs/js/dataTables.bootstrap.min.js" />" type="text/javascript"></script>
            <!-- SlimScroll -->
            <script src="<c:url value="/resources/adminsource/support_template/jquery-slimscroll/jquery.slimscroll.min.js" />" type="text/javascript"></script>
            <!-- FastClick -->
            <script src="<c:url value="/resources/adminsource/support_template/fastclick/lib/fastclick.js" />" type="text/javascript"></script>
            <!-- AdminLTE App -->
            <script src="<c:url value="/resources/adminsource/support_template/dist/js/adminlte.min.js" />" type="text/javascript"></script>
            <!-- AdminLTE for demo purposes -->
            <script src="<c:url value="/resources/adminsource/support_template/dist/js/demo.js" />" type="text/javascript"></script>
            <!-- page script -->


            <!--input-->

            <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/4.3.1/js/fileinput.js" type="text/javascript"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/4.3.1/js/fileinput.js" type="text/javascript"></script>

<!--        <script src="../../bower_components/jquery/dist/jquery.min.js"></script>
         Bootstrap 3.3.7 
        <script src="../../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
         iCheck 
        <script src="../../plugins/iCheck/icheck.min.js"></script>-->
        <script>
            $(function () {
                $('input').iCheck({
                    checkboxClass: 'icheckbox_square-blue',
                    radioClass: 'iradio_square-blue',
                    increaseArea: '20%' /* optional */
                });
            });
            $("#user").keyup(function (){
                $("#forgot").attr('href',"${pageContext.request.contextPath}/forgot/"+$(this).val());
            });
        </script>
    </body>
</html>

