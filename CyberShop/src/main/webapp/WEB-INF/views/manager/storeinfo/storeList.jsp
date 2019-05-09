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
                                                <th>Update</th>
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
                                    <input class="form-control" placeholder="Store Name" type="text" name="storeName" id="storeName" required/>
                                    <label>Address</label><br/>
                                    <input class="form-control" placeholder="Address" type="text" name="address" id="address" required/>
                                    <label>Phone 1</label><br/>
                                    <input class="form-control" placeholder="Phone 1" type="text" name="phone1" pattern="\d*" maxlength="10" minlength="10" id="phone1" required/>
                                    <label>Phone 2</label><br/>
                                    <input class="form-control" placeholder="Phone 2" type="number" name="phone2" pattern="\d*" maxlength="10" minlength="10" id="phone2" required/>
                                    <label>Location X</label><br/>
                                    <input class="form-control" placeholder="Location X" type="number" step="any" name="locationX" id="locationX" required/>
                                    <label>Location Y</label><br/>
                                    <input class="form-control" placeholder="Location Y" type="number" step="any" name="locationY" id="locationY" required/>
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
            }
            ;
        </script>
    </body>
</html>

