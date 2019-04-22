<%-- 
    Document   : admin
    Created on : Apr 15, 2019, 1:39:28 PM
    Author     : ngthe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
    <body class="hold-transition skin-blue sidebar-mini">
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
                                    <span class="hidden-xs">Alexander Pierce</span>
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
                            <p>Alexander Pierce</p>
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
                    </ul>
                </section>
                <!-- /.sidebar -->
            </aside>

            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">


                <!-- Add Product -->
                <section class="content-header">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="box">
                                <div class="box-body">
                                    <button id="btnAdd" type="button" class="btn btn-danger"> + Add New Product</button>
                                    <!-- form start -->
                                    <form id="form" role="form" style="display: none">
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
                                        <!-- /.box-body -->

                                        <div class="box-footer">
                                            <button type="submit" class="btn btn-primary">Submit</button>
                                        </div>
                                    </form>
                                </div >



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
                                    <table id="tableOrder" class="table table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th>No</th>
                                                <th hidden="true">ID</th>
                                                <th>Customer Name</th>
                                                <th>Discount</th>
                                                <th>Order Date</th>
                                                <th>Ship Address</th>
                                                <th>Delivery Fee</th>
                                                <th>Total</th>
                                                <th>Status</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${listOrder}" var="a" varStatus="Counter" >
                                                <tr>
                                                    <td onclick="rowClick(${a.orderID})">${Counter.count}</td>
                                                    <td hidden="true">${a.orderID}</td>
                                                    <td onclick="rowClick(${a.orderID})">${a.customerID.fullname}</td>
                                                    <td onclick="rowClick(${a.orderID})">${a.promotionID.discount}</td>
                                                    <td onclick="rowClick(${a.orderID})">${a.orderDate}</td>
                                                    <td onclick="rowClick(${a.orderID})">${a.shipAddress}</td>
                                                    <td onclick="rowClick(${a.orderID})">${a.deliveryFee}</td>
                                                    <td onclick="rowClick(${a.orderID})">${a.total}</td>
                                                    <td onclick="rowClick(${a.orderID})">${a.status}</td>
                                                    <td>
                                                        <button type="submit" class="btn btn-warning" data-toggle="modal" data-target="#update">Update</button>
                                                        <button type="submit" class="btn btn-danger" data-toggle="modal" data-target="#delete">Delete</button>
                                                    </td>
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
        <div class="modal fade" id="update" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
                                <!-- /.box-body -->
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                <button type="submit" class="btn btn-primary">Save changes</button>
                            </div>
                        </form>

                    </div>

                </div>
            </div>
        </div>

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
        
        <div class="modal fade" id="showDetail" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="vertical-alignment-helper">
                <div class="modal-dialog vertical-align-center">

                    <div class="modal-content">
                        <form id="form" role="form" action="simple.html">

                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span>

                                </button>
                                <h4 class="modal-title" id="myModalLabel">Order Detail</h4>

                            </div>
                            <div id="detailModelBody" class="modal-body">
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
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
                $('#tableOrder').DataTable()
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

            $(document).ready(function () {
                var table = document.getElementById("tableOrder");
                var rows = table.getElementsByTagName("tr");
                for (i = 0; i < rows.length; i++) {
                    var currentRow = table.rows[i];

                    var createClickHandler = function (row) {
                        return function () {
                            var cell = row.getElementsByTagName("td")[1];
                            var id = cell.innerHTML;
                        };
                    };
                    currentRow.onclick = createClickHandler(currentRow);
                }
            });

            function rowClick(id) {
                $("#showDetail").modal('show');
//                var cateID = $(this).val();
                var html = '';
                $('#detailModelBody').empty();
                $.ajax({
                    type: "GET",
                    contentType: "application/json",
                    url: "${pageContext.request.contextPath}/api/findProduct/" + id,
                    dataType: 'json',
                    timeout: 100000,
                    success: function (result) {
                        html += "<div  class='form-horizontal' >";

                        html += "<div class='col-md-5'>";
//                        html += "<div class='form-group'>";
                        html += "<div class='row'>";
                        html += "<table class='table table-bordered table-hover'>";
                        html += "<thead>";
                        html += "<tr>";
                        ;
                        html += "<th>Title</th>";
                        html += "<th>Value</th>";
                        html += "</tr>";
                        html += "</thead>"
                        html += "<tbody>"
                        html += "<tr>";
                        html += "<td>ProductID</td>"
                        html += "<td>" + result['productID'] + "</td>"
                        html += "</tr>";
                        html += "<tr>";
                        html += "<td>ProductName</td>"
                        html += "<td>" + result['productName'] + "</td>"
                        html += "</tr>";
                        html += "<tr>";
                        html += "<td>Brand</td>"
                        html += "<td>" + result['brandID']['brandName'] + "</td>"
                        html += "</tr>";
                        html += "<tr>";
                        html += "<td>Category</td>"
                        html += "<td>" + result['categoryID']['cateName'] + "</td>"
                        html += "</tr>";
                        html += "<tr>";
                        html += "<td>Price</td>"
                        html += "<td>" + result['price'] + "</td>"
                        html += "</tr>";
                        html += "<tr>";
                        html += "<td>DownPrice</td>"
                        html += "<td>" + result['downPrice'] + "</td>"
                        html += "</tr>";
                        html += "<tr>";
                        html += "<td>Quantity</td>"
                        html += "<td>" + result['quantity'] + "</td>"
                        html += "</tr>";
                        html += "<tr>";
                        html += "<td>Sold</td>"
                        html += "<td>" + result['sell'] + "</td>"
                        html += "</tr>";
                        html += "<tr>";
                        html += "<td>Status</td>"
                        html += "<td>" + result['status'] + "</td>"
                        html += "</tr>";
                        html += "</tbody>";
                        html += "</table>";
                        html += "</div>";
                        html += "</div>";
                        html += "</div>";
//                        html += "</div>";

                        html += "<div class='col-md-1'>";
                        html += "</div>";

                        html += "<div class='col-md-6'>";
//                        html += "<div class='form-group'>";
                        html += "<div class='row'>";
                        html += "<table class='table table-bordered table-hover'>";
                        html += "<thead>";
                        html += "<tr>";
                        html += "<th>Title</th>";
                        html += "<th>Value</th>";
                        html += "</tr>";
                        html += "</thead>"
                        html += "<tbody>"
                        html += "<tr>";
                        html += "<td>ProductID</td>"
                        html += "<td>" + result['productID'] + "</td>"
                        html += "</tr>";
                        html += "<tr>";
                        html += "<td>ProductName</td>"
                        html += "<td>" + result['productName'] + "</td>"
                        html += "</tr>";
                        html += "<tr>";
                        html += "<td>Brand</td>"
                        html += "<td>" + result['brandID']['brandName'] + "</td>"
                        html += "</tr>";
                        html += "<tr>";
                        html += "<td>Category</td>"
                        html += "<td>" + result['categoryID']['cateName'] + "</td>"
                        html += "</tr>";
                        html += "<tr>";
                        html += "<td>Price</td>"
                        html += "<td>" + result['price'] + "</td>"
                        html += "</tr>";
                        html += "<tr>";
                        html += "<td>DownPrice</td>"
                        html += "<td>" + result['downPrice'] + "</td>"
                        html += "</tr>";
                        html += "<tr>";
                        html += "<td>Quantity</td>"
                        html += "<td>" + result['quantity'] + "</td>"
                        html += "</tr>";
                        html += "<tr>";
                        html += "<td>Sold</td>"
                        html += "<td>" + result['sell'] + "</td>"
                        html += "</tr>";
                        html += "<tr>";
                        html += "<td>Status</td>"
                        html += "<td>" + result['status'] + "</td>"
                        html += "</tr>";
                        html += "<tr>";
                        html += "<td>Status</td>"
                        html += "<td>" + result['status'] + "</td>"
                        html += "</tr>";
                        html += "<tr>";
                        html += "<td>Status</td>"
                        html += "<td>" + result['status'] + "</td>"
                        html += "</tr>";
                        html += "<tr>";
                        html += "<td>Status</td>"
                        html += "<td>" + result['status'] + "</td>"
                        html += "</tr>";
                        html += "</tbody>";
                        html += "</table>";
                        html += "</div>";
                        html += "</div>";
                        html += "</div>";
                        if (result['imagesCollection'].length != 0) {
                            html += "<div class='col-md-12' >";
                            html += "<h3>Main Image</h3>";
                            html += "<img src='${pageContext.request.contextPath}/resources/image/img_product/" + result['imagesCollection'][1]['urlImage'] + "' style='width: 100% ; height:400px;vertical-align: middle;'>";
                            html += "</div>";

                            html += "<div class='col-md-12' >";
                            html += "<h3>Sub Image</h3>";
                            for (var i = 2; i < result['imagesCollection'].length; i++) {
                                html += "<img src='${pageContext.request.contextPath}/resources/image/img_product/" + result['imagesCollection'][i]['urlImage'] + "' style='width: 100% ; height:400px;vertical-align: middle;'>";
                            }

                            html += "</div>";
                        }
                        html += "</div>";

                        $('#detailModelBody').html(html);
                    },
                    error: function (e) {
                        console.log("ERROR: ", e);
                    }
                });
            }
        </script>
    </body>
</html>
