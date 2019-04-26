<%-- 
    Document   : admin
    Created on : Apr 15, 2019, 1:39:28 PM
    Author     : ngthe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
    </head>
    <body class="hold-transition skin-blue sidebar-mini">
        <div class="wrapper">
            <%@include file="../home/header.jsp" %>
            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>Store Information</h1>
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
                                                <th>Store Name</th>
                                                <th>Address</th>
                                                <th>Phone 1</th>
                                                <th>Phone 2</th>
                                                <th>Location_X</th>
                                                <th>Location_Y</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${listStore}" var="a" varStatus="Counter" >
                                                <tr>
                                                    <td>${Counter.count}</td>
                                                    <td>${a.storeName}</td>
                                                    <td>${a.address}</td>
                                                    <td>${a.phone1}</td>
                                                    <td>${a.phone2}</td>
                                                    <td>${a.locationX}</td>
                                                    <td>${a.locationY}</td>
                                                    <td>
                                                        <a onclick="openStore('${a.storeID}', '${a.storeName}', '${a.address}', '${a.phone1}', '${a.phone2}', '${a.locationX}', '${a.locationY}')" class="btn btn-warning">Update</a>
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
            <%@include file="../home/footer.jsp" %>


        </div>
        <!-- ./wrapper -->

        <!-- Update modal -->
        <div class="modal fade" id="openStore" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="vertical-alignment-helper">
                <div class="vertical-alignment-helper">
                    <div class="modal-dialog vertical-align-center">

                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span>

                                </button>
                                <h4 class="modal-title" id="myModalLabel">Update Store Information</h4>

                            </div>
                            <form:form action="${pageContext.request.contextPath}/manager/storeinfo/update" modelAttribute="StoreInfo" method="GET">
                                <div class="modal-body">
                                    <input type="hidden" name="storeID" id="storeID"/>
                                    <label>Store Name</label>
                                    <input class="form-control" type="text" name="storeName" id="storeName" required/>
                                    <label>Address</label><br/>
                                    <input class="form-control" type="text" name="address" id="address" required/>
                                    <label>Phone 1</label><br/>
                                    <input class="form-control" type="text" name="phone1" pattern="\d*" maxlength="10" minlength="10" id="phone1" required/>
                                    <label>Phone 2</label><br/>
                                    <input class="form-control" type="number" name="phone2" pattern="\d*" maxlength="10" minlength="10" id="phone2" required/>
                                    <label>Location X</label><br/>
                                    <input class="form-control" type="number" name="locationX" id="locationX" required/>
                                    <label>Location Y</label><br/>
                                    <input class="form-control" type="number" name="locationY" id="locationY" required/>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                    <input type="submit" value="Update" class="btn btn-primary"/>
                                </div>
                            </form:form>

                        </div>

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
                                                                });
                                                            });


                                                            $(document).ready(function () {
                                                                $("#btnAdd").click(function () {
                                                                    $("#form").toggle();
                                                                });
                                                            });

                                                            function openStore(id, name, addr, phone1, phone2, locX, locY) {
                                                                $("#openStore").modal('show');
                                                                $("#storeID").val(id);
                                                                $("#storeName").val(name);
                                                                $("#address").val(addr);
                                                                $("#phone1").val(phone1);
                                                                $("#phone2").val(phone2);
                                                                $("#locationX").val(locX);
                                                                $("#locationY").val(locY);
                                                            };
        </script>
    </body>
</html>

