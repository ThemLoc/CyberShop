<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="/WEB-INF/views/website/fragment/css.jsp" %>
        <%@include file="/WEB-INF/views/fragment/header.jsp" %>
        <style>
            #outer {
                width: 100%;
            }
            #inner {
                display: table;
                margin: 0 auto;
            }
        </style>
    </head>
    <body>
        <%@include file="/WEB-INF/views/website/fragment/webHeader.jsp" %>
        <h2 style="text-align: center">Lịch sử mua hàng</h2>
        <div id="outer">
            <!-- Main content -->
            <section class="content">
                <div class="row">
                    <div class="col-xs-12">
                        <!-- /.box -->
                        <div class="box">
                            <!-- /.box-header -->
                            <div class="box-body">
                                <c:set var="listorder" value="${listOrder}"/>
                                <c:if test="${not empty listorder}">
                                    <table id="tableOrder" class="table table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th>STT</th>
                                                <th hidden="true">ID</th>
                                                <th>Giảm giá</th>
                                                <th>Ngày đặt hàng</th>
                                                <th>Địa chỉ giao hàng</th>
                                                <th>Phí vận chuyển</th>
                                                <th>Tổng cộng</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${listOrder}" var="a" varStatus="Counter" >
                                                <tr>
                                                    <td onclick="rowClick(${a.orderID})">${Counter.count}</td>
                                                    <td hidden="true">${a.orderID}</td>
                                                    <td onclick="rowClick(${a.orderID})">${a.promotionID.discount}</td>
                                                    <td onclick="rowClick(${a.orderID})">${a.orderDate}</td>
                                                    <td onclick="rowClick(${a.orderID})">${a.shipAddress}</td>
                                                    <td onclick="rowClick(${a.orderID})"><fmt:formatNumber type="number" pattern="###,###" value="${a.deliveryFee}" /> ₫</td>
                                                    <td onclick="rowClick(${a.orderID})"><fmt:formatNumber type="number" pattern="###,###" value="${a.total}" /> ₫</td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </c:if>
                                <c:if test="${empty listorder}">
                                    <table id="tableOrder" class="table table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th>STT</th>
                                                <th hidden="true">ID</th>
                                                <th>Giảm giá</th>
                                                <th>Ngày đặt hàng</th>
                                                <th>Địa chỉ giao hàng</th>
                                                <th>Phí vận chuyển</th>
                                                <th>Tổng cộng</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr class="odd" style="text-align: center">
                                                    <td valign="top" colspan="9" class="dataTables_empty">Hiện tại bạn chưa có đơn đặt hàng nào.</td>
                                                </tr>
                                        </tbody>
                                    </table>
                                </c:if>
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
        <%@include file="/WEB-INF/views/website/fragment/webFooter.jsp" %>
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
    </body>
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
                                    html += "<img src='${pageContext.request.contextPath}/resources/image/img_product/" + listImg[j]['urlImage'] + "' style='width: 100px ; height:100px;vertical-align: middle;'/>";
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
</html>
