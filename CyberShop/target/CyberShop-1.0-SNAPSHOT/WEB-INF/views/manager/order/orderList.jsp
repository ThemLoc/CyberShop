<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
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

                <!-- Add Product -->



                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>Order List</h1>
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
                                                        <!--                                                        <button type="submit" class="btn btn-warning" data-toggle="modal" data-target="#update">Update</button>
                                                                                                                <button type="submit" class="btn btn-danger" data-toggle="modal" data-target="#delete">Delete</button>-->

                                                        <c:if test="${a.status == 'Create'}">
                                                            <a href="${pageContext.request.contextPath}/manager/order/update/Confirm&${a.orderID}" class="btn btn-warning">Confirm</a>
                                                            <a  onclick="statusChange(${a.orderID})" class="btn btn-danger">Denied</a>
                                                        </c:if>
                                                        <c:if test="${a.status == 'Confirm'}">
                                                            <a href="${pageContext.request.contextPath}/manager/order/update/Ready To Delivery&${a.orderID}" class="btn btn-warning">Ready To Delivery</a>
                                                        </c:if>
                                                        <c:if test="${a.status == 'Ready To Delivery'}">
                                                            <a href="${pageContext.request.contextPath}/manager/order/update/Delivery&${a.orderID}" class="btn btn-warning">Delivery</a>
                                                        </c:if>
                                                        <c:if test="${a.status == 'Delivery'}">
                                                            <a href="${pageContext.request.contextPath}/manager/order/update/Completed&${a.orderID}" class="btn btn-warning">Completed</a>
                                                        </c:if>
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
                                    <
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
        <div class="modal fade" id="deniedOrder" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="vertical-alignment-helper">
                <div class="modal-dialog vertical-align-center">

                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span>

                            </button>
                            <h4 class="modal-title" id="myModalLabel">Denied Product</h4>

                        </div>
                        <form:form action="${pageContext.request.contextPath}/manager/order/deniedform" modelAttribute="deniedForm" method="GET">
                            <div class="modal-body">
                                <input type="hidden" name="id" id="OrderID"/>
                                <label>Lý do hủy đơn hàng</label><br/>
                                <input type="text" name="reason"/>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                <input type="submit" value="Done" class="btn btn-primary"/>
                            </div>
                        </form:form>

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
                                                                    });
                                                                });


                                                                $(document).ready(function () {
                                                                    $("#btnAdd").click(function () {
                                                                        $("#form").toggle();
                                                                    });
                                                                });

                                                                function statusChange(id) {
                                                                    $("#deniedOrder").modal('show');
                                                                    $("#OrderID").val(id);
                                                                }
                                                                ;

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
                                                                        url: "${pageContext.request.contextPath}/api/findOrderDetail/" + id,
                                                                        dataType: 'json',
                                                                        timeout: 100000,
                                                                        success: function (result) {
                                                                            html += "<div col-md-12>";
                                                                            html += "<table class='table table-bordered table-hover' style='text-align: center'>";
                                                                            html += "<thead>";
                                                                            html += "<tr>";
                                                                            html += "<th style='text-align: center'>Product Name</th>";
                                                                            html += "<th style='text-align: center'>Product Image</th>";
                                                                            html += "<th style='text-align: center'>Quantity</th>";
                                                                            html += "<th style='text-align: center'>Price</th>";
                                                                            html += "</tr>";
                                                                            html += "</thead>";
                                                                            html += "<tbody>";
                                                                            for (var i = 0; i < result.length; i++) {
                                                                                html += "<tr>";
                                                                                html += "<td>";
                                                                                html += result[i]['productID']['productName'];
                                                                                html += "</td><td>";
                                                                                var listImg = result[i]['productID']['imagesCollection'];
                                                                                for (var j = 0; j < listImg.length; j++) {
                                                                                    var check = listImg[j]['mainImage'];
                                                                                    if (check) {
                                                                                        html += "<img src='${pageContext.request.contextPath}/resources/image/img_product/" + listImg[j]['urlImage'] + "' style='width: 150px ; height:80px;vertical-align: middle;'/>";
                                                                                    }
                                                                                }
                                                                                html += "</td>";
                                                                                html += "<td>" + result[i]['quantity'] + "</td>";
                                                                                html += "<td>" + result[i]['productID']['price'] + " VNĐ" + "</td>";
                                                                                html += "</tr>";
                                                                            }
                                                                            html += "</tbody>"
                                                                            html += "</table>"
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
