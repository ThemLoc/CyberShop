<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
                <h4 style="color: red">${msg}</h4>
                <h4 style="color: red">${userExist}</h4>
                <!-- Add Product -->
                <section class="content-header">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="box">
                                <div class="box-body">
                                    <div class="col-xs-8">
                                        <button id="btnAdd" type="button" class="btn btn-danger">+ Add Admin </button>


                                        <sf:form id="form" method="POST" action="${pageContext.request.contextPath}/manager/admin/save" role="form" style="display: none" modelAttribute="adminForm">
                                            <div class="box-body">

                                                <div class="form-group">
                                                    <label for="exampleInputEmail1">username: </label>
                                                    <input type="text" class="form-control" name="username" required placeholder="Enter Username" >
                                                </div>
                                                <div class="form-group">
                                                    <label for="exampleInputPassword1">password: </label>
                                                    <input type="password" class="form-control" required name="password" placeholder="Password">
                                                </div>
                                                <div class="form-group">
                                                    <label for="exampleInputPassword1">fullname:  </label>
                                                    <input type="text" class="form-control" required name="fullname" id="exampleInputPassword1" placeholder="fullname">
                                                </div>
                                                <div class="form-group">
                                                    <label for="exampleInputPassword1">phone:  </label>
                                                    <input type="text" pattern="\d*" maxlength="10" minlength="10" class="form-control" required name="phone" placeholder="phone">
                                                </div>
                                                <div class="form-group">
                                                    <label for="exampleInputPassword1">email:  </label>
                                                    <input type="email" class="form-control" name="email" required placeholder="a@gmail.com">
                                                </div>
                                                <div class="form-group">
                                                    <label for="exampleInputPassword1">address:  </label>
                                                    <input type="text" class="form-control" required name="address" placeholder="address">
                                                </div>
                                                <div class="form-group">
                                                    <label>Day of birth:   </label>
                                                    <input type="date" name="dayYob" required/>

                                                </div>
                                                <div class="radio">
                                                    <label><input type="radio" name="sex" checked value="true">Nam</label>
                                                </div>
                                                <div class="radio">
                                                    <label><input type="radio" name="sex" checked value="false">Nữ</label>
                                                </div>
                                                <br/>
                                                <s:bind path="role">
                                                    <label>role </label>
                                                    <sf:select path="role">
                                                        <sf:options items="${listRole}"/>
                                                    </sf:select>
                                                    <sf:errors path="role"/>
                                                </s:bind>


                                            </div>


                                            <div class="box-footer">
                                                <!--                                                <a onclick="ConfirmEmail()" style="cursor: pointer" class="btn btn-danger">Conform Email</a>-->
                                                <button type="submit" class="btn btn-primary">Submit</button>
                                            </div>
                                        </sf:form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <section class="content-header">
                    <h1>Admin Tables</h1>

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
                                                <th>Role</th>
                                                <th>Full name</th>
                                                <th>Phone</th>
                                                <th>Email</th>
                                                <th>Address</th>
                                                <th>Sex</th>
                                                <th>Status</th>
                                                <th>Day of birth</th>
                                                <th></th>
                                                <th></th>
                                            </tr>
                                        </thead>

                                        <tbody>
                                            <c:forEach items="${listAdmin}" var="a" varStatus="Counter" >
                                                <tr>
                                                    <td>${Counter.count}</td>
                                                    <td>${a.username}</td>
                                                    <td>${a.role}</td>
                                                    <td>${a.fullname}</td>
                                                    <td>${a.phone}</td>
                                                    <td>${a.email}</td>
                                                    <td>${a.address}</td>
                                                    <td><c:if test="${a.sex == true}">
                                                            Male
                                                        </c:if>
                                                        <c:if test="${a.sex == false}">
                                                            Female
                                                        </c:if>
                                                    </td>
                                                    <td><c:if test="${a.status == true}">
                                                            Enable
                                                        </c:if>
                                                        <c:if test="${a.status == false}">
                                                            Disable
                                                        </c:if>                                                       
                                                    </td>
                                                    <td>${a.dob}</td>

                                                    <c:if test="${a.adminID != sessionScope.USER.adminID}">

                                                        <td>
                                                            <a class="btn btn-danger"  href="${pageContext.request.contextPath}/manager/admin/delete/${a.adminID}/${a.status}" onclick="return confirm('Are you sure?');">change status</a>
                                                        </td>
                                                    </c:if>
                                                    <c:if test="${a.adminID == sessionScope.USER.adminID}">

                                                        <td>

                                                        </td>
                                                    </c:if>
                                                    <c:if test="${a.status == true}">
                                                        <td>
                                                            <a class="btn btn-warning"  href="${pageContext.request.contextPath}/manager/admin/edit/${a.adminID}">Edit</a> 
                                                        </td>
                                                    </c:if>

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
                                                                //                function ConfirmEmail(){
                                                                //                    $("#checkEmail").modal("show");
                                                                //                }
        </script>
    </body>
</html>
