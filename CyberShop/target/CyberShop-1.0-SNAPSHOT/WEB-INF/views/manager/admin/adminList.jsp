<%-- 
    Document   : admin
    Created on : Apr 15, 2019, 1:39:28 PM
    Author     : ngthe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
    <body class="hold-transition skin-blue sidebar-mini" onload="notifi()">
        <c:if test="${msg != null}">
            <script>
                function notifi() {
                    window.alert(${msg});
                }
            </script>
        </c:if>
        <div class="wrapper">

            <header class="main-header">
                <!-- Logo -->
                <a href="../../index2.html" class="logo">
                    <!-- mini logo for sidebar mini 50x50 pixels -->
                    <span class="logo-mini"><b>A</b>LT</span>
                    <!-- logo for regular state and mobile devices -->
                    <span class="logo-lg"><b>Admin</b>CyberShop</span>
                </a>
                <!-- Header Navbar: style can be found in header.less -->
                <nav class="navbar navbar-static-top">
                    <!-- Sidebar toggle button-->
                    <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </a>
                    <div class="navbar-custom-menu">
                        <ul class="nav navbar-nav">
                            <!-- Messages: style can be found in dropdown.less-->

                            <!-- User Account: style can be found in dropdown.less -->
                            <li class="dropdown user user-menu">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <img src="<c:url value="/resources/adminsource/support_template/dist/img/user2-160x160.jpg"/>" class="user-image" alt="User Image">
                                    <span class="hidden-xs">${sessionScope.USER.username}</span>
                                </a>
                                <ul class="dropdown-menu">
                                    <!-- User image -->
                                    <li class="user-header">
                                        <img src="<c:url value="/resources/adminsource/support_template/dist/img/user2-160x160.jpg"/>" class="img-circle" alt="User Image">

                                        <p>
                                            Alexander Pierce - Web Developer
                                            <small>Member since Nov. 2012</small>
                                        </p>
                                    </li>
                                    <!-- Menu Body -->
                                    <li class="user-body">
                                        <div class="row">
                                            <div class="col-xs-4 text-center">
                                                <a href="#">Followers</a>
                                            </div>
                                            <div class="col-xs-4 text-center">
                                                <a href="#">Sales</a>
                                            </div>
                                            <div class="col-xs-4 text-center">
                                                <a href="#">Friends</a>
                                            </div>
                                        </div>
                                        <!-- /.row -->
                                    </li>
                                    <!-- Menu Footer-->
                                    <li class="user-footer">
                                        <div class="pull-left">
                                            <a href="#" class="btn btn-default btn-flat">Profile</a>
                                        </div>
                                        <div class="pull-right">
                                            <a href="#" class="btn btn-default btn-flat">Sign out</a>
                                        </div>
                                    </li>
                                    <!-- Menu Footer-->
                                </ul>
                            </li>
                            <li>
                                <a></a>
                            </li>
                        </ul>
                    </div>

                </nav>
            </header>
            <!-- Left side column. contains the logo and sidebar -->
            <aside class="main-sidebar">
                <!-- sidebar: style can be found in sidebar.less -->
                <section class="sidebar">
                    <!-- Sidebar user panel -->
                    <div class="user-panel">
                        <div class="pull-left image">
                            <img src="<c:url value="/resources/adminsource/support_template/dist/img/user2-160x160.jpg"/>" class="img-circle" alt="User Image">
                        </div>
                        <div class="pull-left info">
                            <p>${sessionScope.USER.username}</p>
                            <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
                        </div>
                    </div>

                    <!-- sidebar menu: : style can be found in sidebar.less -->
                    <ul class="sidebar-menu" data-widget="tree">
                        <li class="header">MAIN NAVIGATION</li>
                        <li class="treeview">
                            <a href="#">
                                <i class="fa fa-user-o"></i> <span>Admin</span>
                                <span class="pull-right-container">
                                    <i class="fa fa-angle-left pull-right"></i>
                                </span>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="../../index.html"><i class="fa fa-circle-o"></i> Dashboard v1</a></li>
                                <li><a href="../../index2.html"><i class="fa fa-circle-o"></i> Dashboard v2</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="#">
                                <i class="fa fa-television"></i> <span>Product</span>
                            </a>
                        </li>

                        <li>
                            <a href="#">
                                <i class="fa fa-book"></i> <span>Order</span>
                                <small class="label pull-right bg-red">3</small>
                                <small class="label pull-right bg-yellow">2</small>
                                <small class="label pull-right bg-green">1</small>

                            </a>
                        </li>
                        <li>
                            <a href="../widgets.html">
                                <i class="fa fa-info-circle"></i> <span>Store Information</span>
                                <span class="pull-right-container">
                                    <!-- <small class="label pull-right bg-green">new</small> -->
                                </span>
                            </a>
                        </li>
                        <li>
                            <a href="../widgets.html">
                                <i class="fa fa-bullhorn"></i> <span>Promotion</span>
                            </a>
                        </li>
                        <li>
                            <a href="../widgets.html">
                                <i class="fa fa-sliders"></i> <span>Banner</span>
                            </a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/logout">
                                <i></i> <span>Logout</span>
                            </a>
                        </li>
                    </ul>
                </section>
                <!-- /.sidebar -->
            </aside>

            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">


                <!-- Add Product -->
                <section class="content-header">
                    <div class="row">
                        <div class="col-xs-8">
                            <div class="box">
                                <div class="box-body">
                                    <button id="btnAdd" type="button" class="btn btn-danger">+ Add Admin </button>
                                    <!-- form start -->
                                    <sf:form id="form" method="POST" action="${pageContext.request.contextPath}/manager/admin/save" role="form" style="display: none" modelAttribute="adminForm">
                                        <div class="box-body">
                                           
                                            <div class="form-group">
                                                <label for="exampleInputEmail1">username: </label>
                                                <input type="text" class="form-control" name="username" required placeholder="Enter Username" >
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleInputPassword1">password: </label>
                                                <input type="password" class="form-control" required name="password" placeholder="Password">
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleInputPassword1">fullname:  </label>
                                                <input type="text" class="form-control" required name="fullname" id="exampleInputPassword1" placeholder="fullname">
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleInputPassword1">phone:  </label>
                                                <input type="number" class="form-control" required name="phone" placeholder="phone">
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleInputPassword1">email:  </label>
                                                <input type="email" class="form-control" name="email" required placeholder="a@gmail.com">
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleInputPassword1">address:  </label>
                                                <input type="text" class="form-control" required name="address" placeholder="address">
                                            </div>
                                            <div class="form-group">
                                                <label>Day of birth:   </label>

                                                <!--                                                <input type="date" name="dob"/>-->
                                            </div>
                                            <div class="radio">
                                                <label><input type="radio" name="sex" checked value="true">Nam</label>
                                            </div>
                                            <div class="radio">
                                                <label><input type="radio" name="sex" checked value="false">Nữ</label>
                                            </div>
                                            <br/>
                                            <s:bind path="role">
                                                <label>role </label>
                                                <sf:select path="role">
                                                    <sf:options items="${listRole}"/>
                                                </sf:select>
                                                <sf:errors path="role"/>
                                            </s:bind>


                                        </div>
                                        <!-- /.box-body -->

                                        <div class="box-footer">
                                            <button type="submit" class="btn btn-primary">Submit</button>
                                        </div>
                                    </sf:form>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- Add Product -->
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>Admin Tables</h1>

                </section>
                <!-- Main content -->
                <section class="content">
                    <div class="row">
                        <div class="col-xs-12">
                            <!-- /.box -->
                            <div class="box">
                                <!-- /.box-header -->
                                <div class="box-body">
                                    <table id="example1" class="table table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th>No</th>
                                                <th>Username</th>
                                                <th>Role</th>
                                                <th>Full name</th>
                                                <th>Phone</th>
                                                <th>Email</th>
                                                <th>Address</th>
                                                <th>Sex</th>
                                                <th>Status</th>
                                                <th>Day of birth</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>

                                        <tbody>
                                            <c:forEach items="${listAdmin}" var="a" varStatus="Counter" >
                                                <tr>
                                                    <td>${Counter.count}</td>
                                                    <td>${a.username}</td>
                                                    <td>${a.role}</td>
                                                    <td>${a.fullname}</td>
                                                    <td>${a.phone}</td>
                                                    <td>${a.email}</td>
                                                    <td>${a.address}</td>
                                                    <td><c:if test="${a.sex == true}">
                                                            Male
                                                        </c:if>
                                                        <c:if test="${a.sex == false}">
                                                            Female
                                                        </c:if>
                                                    </td>
                                                    <td><c:if test="${a.status == true}">
                                                            Enable
                                                        </c:if>
                                                        <c:if test="${a.status == false}">
                                                            Disable
                                                        </c:if>                                                       
                                                    </td>
                                                    <td>${a.dob}</td>
                                                    <c:if test="${a.status == false}">
                                                        <td>

                                                        </td>
                                                    </c:if>
                                                    <c:if test="${a.status == true}">
                                                        <td>
                                                            <a class="btn btn-warning"  href="${pageContext.request.contextPath}/manager/admin/edit/${a.adminID}">Edit</a> 
                                                            <a class="btn btn-danger"  href="${pageContext.request.contextPath}/manager/admin/delete/${a.adminID}">Delete</a>

                                                        </td>
                                                    </c:if>

                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- /.box-body -->
                            </div>
                            <!-- /.box -->
                        </div>
                        <!-- /.col -->
                    </div>
                    <!-- /.row -->
                </section>
                <!-- /.content -->


            </div>
            <!-- /.content-wrapper -->
            <footer class="main-footer">
                <div class="pull-right hidden-xs">
                    <b>Version</b> 0.0.1
                </div>
                <strong>Copyright &copy; 2014-2016 <a href="https://google.com.vn">Cyber Company</a>.</strong> All rights
                reserved.
            </footer>


        </div>
        <!-- ./wrapper -->

        <!-- Update modal -->
<!--        <div class="modal fade" id="update" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="vertical-alignment-helper">
                <div class="modal-dialog vertical-align-center">

                    <div class="modal-content">
                        <form id="form" role="form" action="simple.html">

                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span>

                                </button>
                                <h4 class="modal-title" id="myModalLabel">Update product</h4>

                            </div>
                            <div class="modal-body">

                                <div class="box-body">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Email address</label>
                                        <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Password</label>
                                        <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputFile">File input</label>
                                        <input type="file" id="exampleInputFile">

                                        <p class="help-block">Example block-level help text here.</p>
                                    </div>
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox"> Check me out
                                        </label>
                                    </div>
                                </div>
                                 /.box-body 
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                <button type="submit" class="btn btn-primary">Save changes</button>
                            </div>
                        </form>

                    </div>

                </div>
            </div>
        </div>-->

        <!--/Update modal -->

        <!-- Delete modal -->
        <div class="modal fade" id="delete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="vertical-alignment-helper">
                <div class="modal-dialog vertical-align-center">

                    <div class="modal-content">
                        <form id="form" role="form" action="simple.html">

                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span>

                                </button>
                                <h4 class="modal-title" id="myModalLabel">Delete product</h4>

                            </div>
                            <div class="modal-body">
                                Are you sure delete this product ?
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                <button type="submit" class="btn btn-primary">Delete</button>
                            </div>
                        </form>

                    </div>

                </div>
            </div>
        </div>

        <!--/Delete modal -->
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
        <script>
                $(function () {
                    $('#example1').DataTable()
                    $('#example2').DataTable({
                        'paging': true,
                        'lengthChange': false,
                        'searching': false,
                        'ordering': true,
                        'info': true,
                        'autoWidth': false
                    })
                })


                $(document).ready(function () {
                    $("#btnAdd").click(function () {
                        $("#form").toggle();
                    });
                });

        </script>
    </body>
</html>
