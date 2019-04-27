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


                <!-- Add Product -->
                <section class="content-header">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="box">
                                <div class="box-body">
                                    <button id="btnAdd" type="button" class="btn btn-danger"> + Add New Promotion</button>
                                    <!-- form start -->
                                    <form id="form" action="${pageContext.request.contextPath}/manager/promotion/add" method="POST" enctype="multipart/form-data" style="display:none">
                                        <div class="box-body">

                                            <div class="form-group">
                                                <label >Product Code</label>
                                                <input type="text" name="promoCode" class="form-control" placeholder="Enter promotion code"/>
                                            </div>

                                            <div class="form-group">
                                                <label >Discount</label>
                                                <input type="number" name="discount" class="form-control" id="" placeholder="Discount"/>
                                            </div>
                                            <div class="form-group">
                                                <label>Start Time</label>
                                                <input type="date" name="startTime" class="form-control" id="" placeholder="Start Time"/>
                                            </div>

                                            <div class="form-group">
                                                <label>End Time</label>
                                                <input type="date" name="endTime" class="form-control" id="" placeholder="End Time"/>
                                            </div>

                                            <div class="form-group">
                                                <label>Used Turn</label>
                                                <input type="text" name="usedTurn" class="form-control" id="" placeholder="Used Turn"/>
                                            </div>

                                        </div>
                                        <!-- /.box-body -->
                                        <div class="box-footer">
                                            <input id="savePromotion" value="Submit" type="submit" class="btn btn-primary"/>
                                        </div>
                                    </form>
                                </div >
                            </div>
                        </div>
                    </div>
                </section>

                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>Promotion Managerment</h1>
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
                                                <th>Promotion Code</th>
                                                <th>Discount</th>
                                                <th>Start Date</th>
                                                <th>End Date</th>
                                                <th>Used Turn</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${listPromotion}" var="a" varStatus="Counter" >
                                                <tr>
                                                    <td>${Counter.count}</td>
                                                    <td>${a.promoCode}</td>
                                                    <td>${a.discount}</td>
                                                    <td>${a.startTime}</td>
                                                    <td>${a.endTime}</td>
                                                    <td>${a.usedTurn}</td>
                                                    <td>
                                                        <a onclick="editPromo('${pageContext.request.contextPath}/manager/promotion/update', '${a.promoID}', '${a.promoCode}', '${a.discount}', '${a.usedTurn}')" class="btn btn-warning">Update</a>
                                                        <a href="${pageContext.request.contextPath}/manager/promotion/delete/${a.promoID}" class="btn btn-danger">Delete</a>
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
        <div class="modal fade" id="editPromoForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="vertical-alignment-helper">
                <div class="vertical-alignment-helper">
                    <div class="modal-dialog vertical-align-center">

                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span>

                                </button>
                                <h4 class="modal-title" id="myModalLabel">Update Store Information</h4>

                            </div>
                            <form id="updatePromotionForm" method="GET">
                                <div class="modal-body">
                                    <input type="hidden" name="promoIDUpdate" id="promoID"/>
                                    <label>Promotion Code</label>
                                    <input class="form-control" type="text" name="promoCodeUpdate" id="promoCode" required/>
                                    <label>Discount</label><br/>
                                    <input class="form-control" type="number" name="discountUpdate" id="discount" required/>
                                    <label>Start Date</label><br/>
                                    <input class="form-control" type="date" name="startTimeUpdate" id="startTime" required/>
                                    <label>End Date</label><br/>
                                    <input class="form-control" type="date" name="endTimeUpdate" id="endTime" required/>
                                    <label>Used Turn</label><br/>
                                    <input class="form-control" type="number" name="usedTurnUpdate" id="usedTurn" required/>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                    <input type="submit" value="Update" class="btn btn-primary"/>
                                </div>
                            </form>

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

                                                            function editPromo(link, id, promoCode, discount, usedTurn) {
                                                                $("#editPromoForm").modal('show');
                                                                $("#promoID").val(id);
                                                                document.getElementById("updatePromotionForm").action = link + '/' + id;
                                                                $("#promoCode").val(promoCode);
                                                                $("#discount").val(discount.substring(0, discount.length - 1));
                                                                $("#usedTurn").val(usedTurn);
                                                            }
                                                            ;
        </script>
    </body>
</html>

