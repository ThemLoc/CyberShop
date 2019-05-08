<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
    <head>
        <title>AdminCyberShop |Manager Page</title>
        <%@include file="/WEB-INF/views/fragment/header.jsp" %>
    </head>
    <body class="hold-transition skin-blue sidebar-mini">
        <div class="wrapper">
            <%@include file="/WEB-INF/views/fragment/slideAndTop.jsp" %>
            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <!-- Add Product -->
                <section class="content-header">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="box">
                                <div class="box-body">
                                    <button id="btnAdd" type="button" class="btn btn-danger">Show List Product</button>
                                    <!-- form start -->
                                    <form id="form" action="#" method="POST" enctype="multipart/form-data" style="display:none">
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
                                                                        <th>No</th>
                                                                        <th>Product Image</th>
                                                                        <th>Product Name</th>
                                                                        <th>Add to Banner</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <c:forEach items="${listProduct}" var="a" varStatus="Counter" >
                                                                        <c:if test="${a.status == true}">
                                                                            <tr>
                                                                                <td>${Counter.count}</td>
                                                                                <td style="text-align: center">
                                                                                    <c:forEach items="${a.imagesCollection}" var="b">
                                                                                        <c:if test="${b.mainImage == true}">
                                                                                            <img src="${pageContext.request.contextPath}/resources/image/img_product/${b.urlImage}" style="width: 100px ; height:100px;"/>
                                                                                        </c:if>
                                                                                    </c:forEach>
                                                                                </td>
                                                                                <td>${a.productName}</td>
                                                                                <td>
                                                                                    <a href="${pageContext.request.contextPath}/manager/banner/add/${a.productID}" class="btn btn-warning">Add to Banner</a>
                                                                                </td>
                                                                            </tr>
                                                                        </c:if>
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
                                    </form>
                                </div >
                            </div>
                        </div>
                    </div>
                </section>
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>Banner Managerment</h1>
                </section>
                <!-- Main content -->
                <section class="content">
                    <div class="row">
                        <div class="col-xs-12">

                            <!-- /.box -->

                            <div class="box">
                                <!-- /.box-header -->
                                <div class="box-body">
                                    <table id="tableBanner" class="table table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th>No</th>
                                                <th hidden="true"></th>
                                                <th>Product Image</th>
                                                <th>Product Name</th>
                                                <th>Delete Banner</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${listBanner}" var="a" varStatus="Counter" >
                                                <tr>
                                                    <td>${Counter.count}</td>
                                                    <td hidden="true">${a.banerID}</td>
                                                    <td style="text-align: center">
                                                        <c:forEach items="${a.productID.imagesCollection}" var="b">
                                                            <c:if test="${b.mainImage == true}">
                                                                <img src="${pageContext.request.contextPath}/resources/image/img_product/${b.urlImage}" style="width: 100px ; height:100px;vertical-align: middle;"/>
                                                            </c:if>
                                                        </c:forEach>
                                                    </td>
                                                    <td>${a.productID.productName}</td>
                                                    <td>
                                                        <a href="${pageContext.request.contextPath}/manager/banner/delete/${a.banerID}" class="btn btn-danger">Delete from Banner</a>
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
            <footer class="main-footer">
                <div class="pull-right hidden-xs">
                    <b>Version</b> 0.0.1
                </div>
                <strong>Copyright &copy; 2014-2016 <a href="https://google.com.vn">Cyber Company</a>.</strong> All rights
                reserved.
            </footer>
        </div>
        <%@include file="/WEB-INF/views/fragment/footer.jsp" %>

        <script>
            $(function () {
                $('#tableProduct').DataTable()
                $('#tableBanner').DataTable()
                $('#example2').DataTable({
                    'paging': true,
                    'lengthChange': false,
                    'searching': false,
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
        </script>
    </body>
</html>

