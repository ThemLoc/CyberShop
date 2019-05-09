<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>AdminLTE 2 | Data Tables</title>
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

                            </div>
                        </div>
                    </div>
                </section>
                <!-- Add Product -->
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>Customer Tables</h1>

                </section>
                <!-- Main content -->
                <section class="content">
                    <div class="row">
                        <div class="col-xs-12">
                            <!-- /.box -->
                            <div class="box">
                                <!-- /.box-header -->
                                <div class="box-body">
                                    <table id="example1" class="table table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th>No</th>
                                                <th>Username</th>
                                                <th>Full name</th>
                                                <th>Phone</th>
                                                <th>Email</th>
                                                <th>Address</th>
                                                <th>Sex</th>

                                                <th>Guest</th>
                                                <th>Day of Birth</th>
                                                <th>Date Registration</th>
                                                <th>Status</th>
                                                <th></th>

                                            </tr>
                                        </thead>

                                        <tbody>
                                            <c:forEach items="${listCustomer}" var="a" varStatus="Counter" >
                                                <tr>
                                                    <td>${Counter.count}</td>
                                                    <td>${a.username}</td>

                                                    <td>${a.fullname}</td>
                                                    <td>${a.phone}</td>
                                                    <c:set var="mail" value="${a.email}"/>
                                                    <td><c:if test="${fn:length(mail) > 20}">
                                                               ${fn:substring(mail,0,10)}...
                                                        </c:if>
                                                        <c:if test="${fn:length(mail) < 20}">
                                                            ${mail}
                                                        </c:if>
                                                    </td>
                                                    <td>${a.address}</td>
                                                    <td><c:if test="${a.sex == true}">
                                                            Male
                                                        </c:if>
                                                        <c:if test="${a.sex == false}">
                                                            Female
                                                        </c:if>
                                                    </td>
                                                    <td><c:if test="${a.isGuest == true}">
                                                            <input disabled="true" type="checkbox" checked="checked" />
                                                        </c:if>
                                                        <c:if test="${a.isGuest == false}">
                                                            <input disabled="true" type="checkbox" />
                                                        </c:if>
                                                    </td>

                                                    <td>${a.dob}</td>
                                                    <td>${a.dateRegistration}</td>

                                                    <td><c:if test="${a.status == true}">
                                                            Enable
                                                        </c:if>
                                                        <c:if test="${a.status == false}">
                                                            Disable
                                                        </c:if>                                                       
                                                    </td>

                                                    <td>
                                                        <a class="btn btn-warning"  href="${pageContext.request.contextPath}/manager/customer/status/${a.customerID}/${a.status}" onclick="return confirm('Are you sure?');">Change status</a> 
                                                        <br/>
                                                        <br/>
                                                        <a class="btn btn-danger"  href="${pageContext.request.contextPath}/manager/order/getbyCus/${a.customerID}">view Order </a> 

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
        <script>
            function showOrder(idCustomer) {

            }
        </script>
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
        <div class="modal fade" id="delete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="vertical-alignment-helper">
                <div class="modal-dialog vertical-align-center">

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
                $('#example1').DataTable()
                $('#example2').DataTable({
                    'paging': true,
                    'lengthChange': false,
                    'searching': false,
                    'ordering': true,
                    'info': true,
                    'autoWidth': false
                })
            })


            $(document).ready(function () {
                $("#btnAdd").click(function () {
                    $("#form").toggle();
                });
            });


        </script>
    </body>
</html>
