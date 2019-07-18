<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
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
                                    <button id="btnAdd" type="button" class="btn btn-danger">Add New Brand</button>
                                    <!-- form start -->
                                    <form:form id="form" modelAttribute="newBrand" action="${pageContext.request.contextPath}/manager/brand/add" method="POST" enctype="multipart/form-data" style="display:none">
                                        <div class="box-body">
                                            <div class="form-group">
                                                <label >Brand Name</label>
                                                <form:input type="text" path="brandName" required="true" class="form-control" placeholder="Enter brand name"/>
                                            </div>
                                            <div class="form-group">
                                                <label>Brand Image</label>
                                                <input name="urlImg"  type="file" required="true" class="file" data-show-upload="false" accept="image/*"/>
                                            </div>
                                        </div>
                                        <!-- /.box-body -->
                                        <div class="box-footer">
                                            <form:button id="saveProduct" type="submit" class="btn btn-primary">Submit</form:button>
                                            </div>
                                    </form:form>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>Brand Management</h1>
                </section>
                <c:if test="${not empty msg}">
                    <strong style="color: red;font-size: 18px;float: right;margin-right: 20px">${msg}</strong>
                </c:if>
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
                                                <th>Brand Image</th>
                                                <th>Brand Name</th>
                                                <th>Number of Product</th>
                                                <th>Delete</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${listBrand}" var="a" varStatus="Counter" >
                                                <tr>
                                                    <td>${Counter.count}</td>
                                                    <td hidden="true">${a.brandID}</td>
                                                    <td>
                                                        <c:if test = "${fn:contains(a.imageURL, 'res.cloudinary.com') == false}">
                                                            <img src="${pageContext.request.contextPath}/resources/image/img_brand/${a.imageURL}" style="width: 150px ; height:80px;vertical-align: middle;"/>
                                                        </c:if>
                                                        <c:if test = "${fn:contains(a.imageURL, 'res.cloudinary.com') == true}">
                                                            <img class="product-thumb" src="${a.imageURL}" style="width: 150px ; height:80px;vertical-align: middle;"/>
                                                        </c:if>
                                                    </td>
                                                    <td>${a.brandName}</td>
                                                    <c:forEach var="item"  items="${count}">
                                                        <c:if test="${item.brandID == a.brandID}">
                                                            <td>
                                                                ${item.count}
                                                            </td>
                                                            <c:if test="${item.count == 0}">
                                                                <td>
                                                                    <a href="${pageContext.request.contextPath}/manager/brand/delete/${a.brandID}" class="btn btn-danger">Delete</a>
                                                                </td>
                                                            </c:if>
                                                            <c:if test="${item.count != 0}">
                                                                <td></td>
                                                            </c:if>
                                                        </c:if>
                                                    </c:forEach>
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

