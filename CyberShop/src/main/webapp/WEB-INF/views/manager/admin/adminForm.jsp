<%-- 
    Document   : admin
    Created on : Apr 15, 2019, 1:39:28 PM
    Author     : ngthe
--%>

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
        <link href="<c:url value="/resources/adminsource/support_template/stylemodify.css" />" rel="stylesheet">
    </head>
    <body class="hold-transition skin-blue sidebar-mini">
        <div class="wrapper">
             
            <%@include file="../home/header.jsp" %>

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
                                                    <sf:input type="text" class="form-control" required="true" path="username" placeholder="Enter Username"/>
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
                                                <c:set var = "now" value = "<%= new java.util.Date()%>" />
                                                <s:bind path="dob">
                                                    <fmt:formatDate value="${dob}" pattern="dd/MM/yyyy" var="myDate" />
                                                    <sf:input path="dob" type="text" value="${myDate}" />
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
            <%@include file="../home/footer.jsp" %>

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
