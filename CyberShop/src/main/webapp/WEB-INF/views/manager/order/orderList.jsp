<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>Order List</h1><br/>
                    <c:if test="${not empty errorUpdate}">
                        <span style="color: red">${errorUpdate}</span>
                    </c:if>
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
                                                <th>Change Status</th>
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
                                                    <td onclick="rowClick(${a.orderID})"><fmt:formatNumber type="number" pattern="###,###" value="${a.total}" /> ₫</td>
                                                    <td onclick="rowClick(${a.orderID})">${a.status}</td>
                                                    <td>
                                                        <c:if test="${a.status == 'Create'}">
                                                            <a href="${pageContext.request.contextPath}/manager/order/update/Confirm&${a.orderID}" class="btn btn-warning">Confirm</a>
                                                            <a onclick="statusChange(${a.orderID})" class="btn btn-danger">Denied</a>
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
            <footer class="main-footer">
                <div class="pull-right hidden-xs">
                    <b>Version</b> 0.0.1
                </div>
                <strong>Copyright &copy; 2014-2016 <a href="https://google.com.vn">Cyber Company</a>.</strong> All rights
                reserved.
            </footer>
        </div>
        <%@include file="/WEB-INF/views/fragment/footer.jsp" %>
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
