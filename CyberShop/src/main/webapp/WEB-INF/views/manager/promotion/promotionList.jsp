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
                                                <input type="text" name="promoCode" class="form-control" required="true" placeholder="Enter promotion code"/>
                                            </div>

                                            <div class="form-group">
                                                <label >Discount</label><p style="color: red" id="errorDiscount"></p>
                                                <input type="number" name="discount" class="form-control" id="discountValue" placeholder="Discount < 100"/>
                                            </div>
                                            <div class="form-group">
                                                <label>Start Time</label>
                                                <input type="date" name="startTime" class="form-control" id="" required="true" placeholder="Start Time"/>
                                            </div>

                                            <div class="form-group">
                                                <label>End Time</label>
                                                <input type="date" name="endTime" class="form-control" required="true" id="" placeholder="End Time"/>
                                            </div>

                                            <div class="form-group">
                                                <label>Used Turn</label>
                                                <input type="text" name="usedTurn" class="form-control" required="true" id="" placeholder="Used Turn"/>
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
                                                <th>Update</th>
                                                <!--<th>Delete</th>-->
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
                                                    </td>
                                                    <!--                                                    <td>
                                                                                                            <a href="${pageContext.request.contextPath}/manager/promotion/delete/${a.promoID}" class="btn btn-danger">Delete</a>
                                                                                                        </td>-->
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

        <!-- Update modal -->
        <div class="modal fade" id="editPromoForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="vertical-alignment-helper">
                <div class="vertical-alignment-helper">
                    <div class="modal-dialog vertical-align-center">

                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span>

                                </button>
                                <h4 class="modal-title" id="myModalLabel">Update Promotion</h4>

                            </div>
                            <form id="updatePromotionForm" method="GET">
                                <div class="modal-body">
                                    <input type="hidden" name="promoIDUpdate" id="promoID"/>
                                    <label>Promotion Code</label>
                                    <input class="form-control" type="text" name="promoCodeUpdate" placeholder="Promotion Code" id="promoCode" required="true"/>
                                    <label>Discount</label><br/>
                                    <input class="form-control" type="number" name="discountUpdate" placeholder="Discount < 100" id="discount" required="true"/>
                                    <label>Start Date</label><br/>
                                    <input class="form-control" type="date" name="startTimeUpdate" id="startTime" required="true"/>
                                    <label>End Date</label><br/>
                                    <input class="form-control" type="date" name="endTimeUpdate" id="endTime" required="true"/>
                                    <label>Used Turn</label><br/>
                                    <input class="form-control" type="number" name="usedTurnUpdate" placeholder="Used Turn" id="usedTurn" required="true"/>
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

            $('#discountValue').on('keydown keyup', function (e) {
                $('#errorDiscount').text('');
                if ($(this).val() > 100) {
                    e.preventDefault();
                    $(this).val('');
                    $('#errorDiscount').text('Please input discount again!!!');
                }
            });
        </script>
    </body>
</html>

