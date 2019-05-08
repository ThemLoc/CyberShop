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
                 <h4 style="color: red">${err}</h4>

                <!-- Add Product -->
                <section class="content-header">
                    <div class="row">
                        <div class="col-xs-8">
                            <div class="box">
                                <div class="box-body">
                                    <a href="${pageContext.request.contextPath}/manager/admin"><button id="btnAdd" type="button" class="btn btn-danger">Back </button></a>
                                    <!-- form start -->
                                    <sf:form id="form" method="POST" action="${pageContext.request.contextPath}/manager/admin/save" role="form" modelAttribute="adminForm">
                                        <div class="box-body">

                                            <sf:hidden path="adminID"/>

                                            <div class="form-group">
                                                <label for="exampleInputEmail1">username: </label>
                                                <s:bind path="username">
                                                    <sf:input type="text" readonly="true" class="form-control" required="true" path="username" placeholder="Enter Username"/>
                                                </s:bind>

                                            </div>
                                            <div class="form-group">
                                                <label for="exampleInputPassword1">password: </label>
                                                <s:bind path="password">
                                                    <sf:input type="password"  class="form-control" path="password"   placeholder="password"/>
                                                </s:bind>
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleInputPassword1">fullname:  </label>
                                                <s:bind path="fullname">
                                                    <sf:input type="text" class="form-control" path="fullname" required="true"  placeholder="fullname"/>
                                                </s:bind>
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleInputPassword1">phone:  </label>
                                                <s:bind path="phone">
                                                    <sf:input type="text" pattern="\d*" maxlength="10" required="true" minlength="10" class="form-control" path="phone" placeholder="phone"/>
                                                </s:bind>
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleInputPassword1">email:  </label>
                                                <s:bind path="email">
                                                    <sf:input type="email" class="form-control" required="true" path="email" placeholder="email"/>
                                                </s:bind>
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleInputPassword1">address:  </label>
                                                <s:bind path="address">
                                                    <sf:input type="text" class="form-control" required="true" path="address" placeholder="address"/>
                                                </s:bind>
                                            </div>
                                            <div class="form-group">
                                                <label >Day of birth:   </label>
                                                <s:bind path="dobString">
                                                    <sf:input type="text" class="form-control" required="true" path="dobString" placeholder="DOB"/>
                                                </s:bind>
                                            </div>
                                            <s:bind path="sex">
                                                <sf:radiobutton path="sex" value="true"/>Male 
                                                <sf:radiobutton path="sex" value="false"/>Female 
                                            </s:bind>
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
                                            <button type="submit" class="btn btn-primary">Submit</button>
                                        </div>
                                    </sf:form>
                                </div >



                            </div>
                        </div>
                    </div>
                </section>


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
