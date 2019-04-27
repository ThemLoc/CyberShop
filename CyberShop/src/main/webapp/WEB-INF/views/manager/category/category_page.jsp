<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

                <!--<section class="content-header">-->
                <section class="content-header">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="box">
                                <div class="box-body">
                                    <div class="panel-body">
                                        <form action="action.php" >
                                            <div class="input-group control-group after-add-more">
                                                <input type="text" name="addmore[]" class="form-control" placeholder="Enter Name Here">
                                                <div class="input-group-btn"> 
                                                    <button class="btn btn-success add-more" type="button"><i class="glyphicon glyphicon-plus"></i> Add</button>
                                                </div>
                                            </div>
                                        </form>


                                        <!-- Copy Fields -->
                                        <div class="copy hide">
                                            <div class="control-group input-group" style="margin-top:10px">
                                                <input type="text" name="addmore[]" class="form-control" placeholder="Enter Name Here">
                                                <div class="input-group-btn"> 
                                                    <button class="btn btn-danger remove" type="button"><i class="glyphicon glyphicon-remove"></i> Remove</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                </section>

                <section class="content">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="box">
                                <div class="box-body">
                                    <table id="tableCategory" class="table table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th>Category ID</th>
                                                <th>Category Name</th>
                                                <th>Category Type</th>
                                                <th>Specification Title</th>
                                                <th>Number of product</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${categoryWithSpec}" var="cate">
                                                <tr>
                                                    <td>${cate.cateID} </td>
                                                    <td>${cate.cateName}</td>
                                                    <td>
                                                        <c:if test="${cate.type == true}">
                                                            Linh kiện
                                                        </c:if>
                                                        <c:if test="${cate.type == false}">
                                                            Phụ kiện
                                                        </c:if>
                                                    </td>
                                                    <td>
                                                        <c:forEach items="${cate.specificationTitleCollection}" var="spec">
                                                            ${spec.specName} -
                                                        </c:forEach>
                                                    </td>
                                                    <td></td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>


                                </div>
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
        <!-- ./wrapper -->

        <%@include file="/WEB-INF/views/fragment/footer.jsp" %>

        <script type="text/javascript">

            $(document).ready(function () {


                $(".add-more").click(function () {
                    var html = $(".copy").html();
                    $(".after-add-more").after(html);
                });


                $("body").on("click", ".remove", function () {
                    $(this).parents(".control-group").remove();
                });


            });
            
             $(function () {
                $('#tableCategory').DataTable({
                    'paging': true,
                    'lengthChange': true,
                    'searching': true,
                    'ordering': true,
                    'info': true,
                    'autoWidth': false
                });
            });

        </script>

    </body>

</html>



