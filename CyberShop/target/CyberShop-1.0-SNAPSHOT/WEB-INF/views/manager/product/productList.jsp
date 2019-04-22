<%-- 
    Document   : productList
    Created on : Apr 16, 2019, 9:20:56 AM
    Author     : chungnguyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>AdminCyberShop |Manager Page</title>
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

        <!--input-->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/4.3.1/css/fileinput.css" rel="stylesheet">



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
                                    <img src="${pageContext.request.contextPath}/resources/adminsource/support_template/dist/img/user2-160x160.jpg" class="user-image" >
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
                                    <form:form id="form" action="${pageContext.request.contextPath}/manager/product/add" method="POST" enctype="multipart/form-data" style="display:none" modelAttribute="product" >
                                        <div class="box-body">

                                            <div class="form-group">
                                                <label >Product Name</label>
                                                <form:input type="text" path="productName" class="form-control" placeholder="Enter product name"/>
                                            </div>

                                            <div class="form-group">
                                                <label>Category</label>
                                                <form:select path="categoryID" id="categorySelection" class="form-control">
                                                    <form:option value="-1" selected="true">Select Category</form:option>

                                                    <c:forEach items="${categoryWithSpec}" var="cate">
                                                        <form:option  value="${cate.cateID}">${cate.cateName}</form:option>
                                                    </c:forEach>
                                                </form:select>
                                            </div>
                                            <!--Specification-->
                                            <div id="showSpec" class="form-group" >
                                            </div>
                                            <!--/Specification-->
                                            <form:input path="detail"  id="detail" type="hidden"  class="form-control" />

                                            <div class="form-group">
                                                <label>Brand</label>
                                                <form:select path="brandID" id="categorySelection" class="form-control">
                                                    <c:forEach items="${listBrand}" var="brand">
                                                        <form:option  value="${brand.brandID}">${brand.brandName}</form:option>
                                                    </c:forEach>
                                                </form:select>
                                            </div>

                                            <div class="form-group">
                                                <label >Price</label>
                                                <form:input type="text" path="price" class="form-control" id="" placeholder="Price"/>
                                            </div>
                                            <div class="form-group">
                                                <label>Quanlity</label>
                                                <form:input type="text" path="quantity" class="form-control" id="" placeholder="Quanlity"/>
                                            </div>

                                            <div class="form-group">
                                                <label>Main Image</label>
                                                <input name="mainImg"  type="file" class="file" data-show-upload="false" accept="image/*"/>
                                            </div>
                                            <div class="form-group">
                                                <label>Sub Image</label>
                                                <input  name="subImg"  type="file" class="file" multiple  data-show-upload="false" accept="image/*"/>
                                            </div>
                                            <div class="form-group">
                                            </div>
                                            <div class="form-group">
                                                <label>Status</label>
                                                <form:select path="status" class="form-control">
                                                    <form:option value="1">Enable</form:option>
                                                    <form:option value="0">Disable</form:option>
                                                </form:select>
                                            </div>

                                        </div>
                                        <!-- /.box-body -->
                                        <div class="box-footer">
                                            <form:button id="saveProduct" type="submit" class="btn btn-primary">Submit</form:button>
                                            </div>
                                    </form:form>
                                </div >



                            </div>
                        </div>
                    </div>
                </section>
                <!-- Add Product -->



                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>Product Tables</h1>

                </section>
                <!-- Main content -->
                <section class="content">
                    <div class="row">
                        <div class="col-xs-12">

                            <!-- /.box -->

                            <div class="box">
                                <!-- /.box-header -->
                                <div class="box-body">
                                    <table id="tableProduct" class="table table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th>Product ID</th>
                                                <th>Product Name</th>
                                                <th>Quantity</th>
                                                <th>Sold</th>
                                                <th>Price</th>
                                                <th>DownPrice</th>
                                                <th>Status</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${listProduct}" var="pd">
                                                <tr>
                                                    <td onclick="rowClick(${pd.productID})">${pd.productID}</td>
                                                    <td onclick="rowClick(${pd.productID})">${pd.productName}</td>
                                                    <td onclick="rowClick(${pd.productID})">${pd.quantity}</td>
                                                    <td onclick="rowClick(${pd.productID})">${pd.sell}</td>
                                                    <td onclick="rowClick(${pd.productID})">${pd.price}</td>
                                                    <td onclick="rowClick(${pd.productID})">${pd.downPrice}</td>
                                                    <td onclick="rowClick(${pd.productID})"> 
                                                        <c:if test="${pd.status}">Enable</c:if>
                                                        <c:if test="${!pd.status}">Disable</c:if>
                                                        </td>
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
        <div class="modal fade" id="delete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
            <div class="vertical-alignment-helper">
                <div class="modal-dialog vertical-align-center" >

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
                                <h4 class="modal-title" id="myModalLabel">Product Detail product</h4>

                            </div>
                            <div id="detailModelBody" class="modal-body">
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



        <!--<div id="cpu" class="spec_div" style="display: none">-->
        <%--<jsp:include page="fragment/cpu.jsp"/>--%>
        <!--</div>-->

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


        <!--input-->

        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/4.3.1/js/fileinput.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/4.3.1/js/fileinput.js" type="text/javascript"></script>

        <script>


        </script>
        <script>

            $(document).ready(function () {
                $("#saveProduct").click(function () {
                    var detail = '';
                    var id = '';
                    $(".specInput").each(function () {
                        id = 'l' + $(this).attr('id');
                        detail += $('#' + id).text() + "*";
                        detail += $(this).val() + "#";
//                        console.log(detail);
                    });
                    $("#detail").val(detail);
                });
            });



            $(function () {
                $('#categorySelection').change(function () {
                    var cateID = $(this).val();
                    var html = '';
                    $('#showSpec').empty();
                    $.ajax({
                        type: "GET",
                        contentType: "application/json",
                        url: "${pageContext.request.contextPath}/api/findSpec/" + cateID,
                        dataType: 'json',
                        timeout: 100000,
                        success: function (result) {
                            html += "<div  class='form-horizontal spec_div' >";
                            html += '<div>';
                            html += '<label>Specifications</label>';
                            html += '</div>';
                            html += "<div class='box-body'>";
                            for (var i = 0; i < result.length; i++) {
                                var point = result.length / 2;
                                if (i < point) {
                                    html += "<div class='col-md-6'>";
                                    html += "<div class='form-group'>";
                                    html += "<div class='row'>";
                                    html += "<label for='spec_" + result[i]['specID'] + "'id='lspec_" + result[i]['specID'] + "' class='col-sm-6 control-label'>" + result[i]['specName'] + "</label>";
                                    html += "<div class='col-sm-3'>";
                                    html += "<input id='spec_" + result[i]['specID'] + "'  type='text' class='form-control specInput' >";
                                    html += "</div>";
                                    html += "</div>";
                                    html += "</div>";
                                    html += "</div>";
                                }
                                if (i > point) {
                                    html += "<div class='col-md-6'>";
                                    html += "<div class='form-group'>";
                                    html += "<div class='row'>";
                                    html += "<label for='spec_" + result[i]['specID'] + "'id='lspec_" + result[i]['specID'] + "' class='col-sm-6 control-label'>" + result[i]['specName'] + "</label>";
                                    html += "<div class='col-sm-3'>";
                                    html += "<input id='spec_" + result[i]['specID'] + "'  type='text' class='form-control specInput' >";
                                    html += "</div>";
                                    html += "</div>";
                                    html += "</div>";
                                    html += "</div>";
                                }
                            }
                            html += "</div>";
                            html += "</div>";
                            $('#showSpec').html(html);
                        },
                        error: function (e) {
                            console.log("ERROR: ", e);
                        }
                    });
                });
            });


            $(function () {

                $('#tableProduct').DataTable({
                    'paging': true,
                    'lengthChange': true,
                    'searching': true,
                    'ordering': true,
                    'info': true,
                    'autoWidth': false
                });
            });

            $(document).ready(function () {
                $("#btnAdd").click(function () {
                    $("#form").toggle();
                });
            });


            $(document).ready(function () {
                var table = document.getElementById("tableProduct");
                var rows = table.getElementsByTagName("tr");
                for (i = 0; i < rows.length; i++) {
                    var currentRow = table.rows[i];

                    var createClickHandler = function (row) {
                        return function () {
                            var cell = row.getElementsByTagName("td")[0];
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



