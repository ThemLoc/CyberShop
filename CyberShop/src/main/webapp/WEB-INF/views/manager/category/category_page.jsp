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

                                    <button id="showFormAddCategory" class="btn btn-danger">+ Add New Category</button>
                                    </br>
                                    </br>
                                    <div id="divAdd" class="panel-body" style="display: none" >

                                        <form  id="formAdd"  action="#">
                                            <div>
                                                <label>Category Name</label>
                                                <input type="text" id="cateNameInput" class="form-control" placeholder="Enter Category Name" required><br/>
                                            </div>
                                            <div>
                                                <label>Type</label>
                                                <select id="selectType" class="form-control">
                                                    <option value="1">Linh kiện</option>
                                                    <option value="0">Phụ kiện</option>
                                                </select>
                                                <br>
                                            </div>
                                            <label>Specification Title</label>
                                            <div class="input-group control-group after-add-more">
                                                <input type="text" name="addmore" class="form-control inputSpec" placeholder="Enter Specification" required>
                                                <div class="input-group-btn"> 
                                                    <button class="btn btn-success add-more " type="button"><i class="glyphicon glyphicon-plus"></i> Add</button>
                                                </div>
                                            </div>
                                            <br/>
                                            <button id="btnSubmitAdd" class="btn btn-primary">Add Category</button>
                                        </form>
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
                                                <th>Delete</th>
                                                <th>Update</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${categoryWithSpec}" var="cate">
                                                <tr id="row_${cate.cateID}">
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
                                                    <c:forEach var="item"  items="${count}">
                                                        <c:if test="${item.cateID == cate.cateID}">
                                                            <td>
                                                                ${item.count}
                                                            </td>
                                                            <c:if test="${item.count == 0}">
                                                                <td>
                                                                    <button onclick="showConfirm(${cate.cateID})" class="btn btn-primary" data-toggle="modal" data-target="#deleteModel">Delete</button>
                                                                </td>
                                                            </c:if>
                                                            <c:if test="${item.count != 0}">
                                                                <td></td>
                                                            </c:if>


                                                        </c:if>
                                                    </c:forEach>

                                                    <td>
                                                        <button onclick="getByCateID(${cate.cateID})" class="btn btn-warning" data-toggle="modal" data-target="#updateModel">Update</button>
                                                    </td>
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

        <!--Alert Add Result-->
        <div class="modal fade" id="alertADDModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
            <div class="vertical-alignment-helper">
                <div class="modal-dialog vertical-align-center" >
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
                            </button>
                            <h4 class="modal-title" id="myModalLabel">Alert</h4>
                        </div>
                        <div class="modal-body">
                            <div id="alertADDModalBody">

                            </div>

                        </div>
                        <div class="modal-footer">
                            <button id="btnCloseReload" type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Delete category modal -->
        <div class="modal fade" id="deleteModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
            <div class="vertical-alignment-helper">
                <div class="modal-dialog vertical-align-center" >
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
                            </button>
                            <h4 class="modal-title" id="myModalLabel">Delete Category</h4>
                        </div>
                        <div class="modal-body">
                            Are you sure delete this product ?
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <button id="btnDeleteCategory" onclick="" type="button" class="btn btn-primary">Delete</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--Alert Delete Result-->
        <div class="modal fade" id="alertDELETEmodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
            <div class="vertical-alignment-helper">
                <div class="modal-dialog vertical-align-center" >
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
                            </button>
                            <h4 class="modal-title" id="myModalLabel">Alert</h4>
                        </div>
                        <div class="modal-body">
                            <div id="alertDELETEmodalBody">

                            </div>
                        </div>
                        <div class="modal-footer">
                            <button id="" type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Update category modal -->
        <div class="modal fade" id="updateModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
            <div class="vertical-alignment-helper">
                <div class="modal-dialog vertical-align-center" >
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
                            </button>
                            <h4 class="modal-title" id="myModalLabel">Update Category</h4>
                        </div>
                        <div class="modal-body">
                            <div id="showCateNameAndType">

                            </div>
                            <div class="input-group-btn">
                                <button class="btn btn-success add-more-modal" type="button"><i class="glyphicon glyphicon-plus"></i> Add</button>
                            </div>
                            <div id="showSpecModal">

                            </div>

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <button id="btnSubmitUpdate" onclick="" type="button" class="btn btn-primary">Update</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="/WEB-INF/views/fragment/footer.jsp" %>

        <script type="text/javascript">

            //Add Remove input auto in Update category
            $(document).ready(function () {
                $(".add-more-modal").click(function () {
                    var html = "";
                    html += '<div class="control-group input-group" style="margin-top:10px">';
                    html += '<input type="text" name="addmore" class="form-control inputSpecModal" placeholder="Enter Specification"" required>';
                    html += '<div class="input-group-btn"> ';
                    html += '<button class="btn btn-danger remove-modal" type="button"><i class="glyphicon glyphicon-remove"></i> Remove</button>';
                    html += '</div>';
                    html += '</div>';
                    html += ' </div>';
                    $(".after-add-more-modal").after(html);
                });


                $("body").on("click", ".remove-modal", function () {
                    $(this).parents(".control-group").remove();
                });
            });

            //Add Remove input auto in Add category
            $(document).ready(function () {
                $(".add-more").click(function () {
                    var html = "";
                    html += '<div class="control-group input-group" style="margin-top:10px">';
                    html += '<input type="text" name="addmore" class="form-control inputSpec" placeholder="Enter Specification"" required>';
                    html += '<div class="input-group-btn"> ';
                    html += '<button class="btn btn-danger remove" type="button"><i class="glyphicon glyphicon-remove"></i> Remove</button>';
                    html += '</div>';
                    html += '</div>';
                    html += ' </div>';
                    $(".after-add-more").after(html);
                });


                $("body").on("click", ".remove", function () {
                    $(this).parents(".control-group").remove();
                });
            });

            //Table category
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

            //Tohhle Add button
            $(document).ready(function () {
                $("#showFormAddCategory").click(function () {
                    $("#divAdd").toggle();
                });
            });

            //Validate + Submit add
            $(document).ready(function () {
                $('#btnSubmitAdd').click(function (e) {
                    e.preventDefault();
                    var check = true;
                    var cateName = $('#cateNameInput').val();
                    if (cateName === "") {
                        $('#cateNameInput').css({"border": "1px solid red"});
                        check = false;
                    } else {
                        $('#cateNameInput').css({"border": ""});
                    }
                    var selectType = $('#selectType').val();
                    var listSpec = [];
                    $(".inputSpec").each(function () {
                        if ($(this).val() === "") {
                            check = false;
                            $(this).css({"border": "1px solid red"});
                        } else {
                            listSpec.push($(this).val());
                            $(this).css({"border": ""});
                        }
                    });
                    console.log(listSpec);
                    if (check) {
                        var html = "";
                        $.ajax({
                            url: "${pageContext.request.contextPath}/api/addCategory",
                            type: "POST",
                            data: {
                                cateName: cateName,
                                listSpec: listSpec,
                                selectType: selectType
                            },
                            dataType: 'text',
                            cache: false,
                            success: function (result) {
                                if (result === 'success') {
                                    html += "<h3 style='color:green'>Add Success!</h3";
                                } else {
                                    html += "<span style='color:red'>Add fail!</span";
                                }
                            }
                            ,
                            error: function (e) {
                                console.log("ERROR: ", e);
                            },
                            complete: function () {
                                $('#alertADDModalBody').html(html);
                                $('#alertADDModal').modal('show');
                            }
                        });
                    }


                });
            });

            //Reload page after add
            $('#btnCloseReload').click(function () {
                location.reload();
            });

            //show confirm before delete
            function showConfirm(cateID) {
                var func = 'deleteCategory(' + cateID + ')';
                $('#btnDeleteCategory').attr('onclick', func);
            }
            //Delete category
            function deleteCategory(cateID) {
                var html = "";
                $.ajax({
                    url: "${pageContext.request.contextPath}/api/deleteCategory/" + cateID,
                    type: "POST",
                    dataType: 'text',
                    cache: false,
                    success: function (result) {
                        if (result === 'success') {
                            $('table#tableCategory tr#row_' + cateID).remove();
                            html += "<h3 style='color:green'>Delete Success!</h3";
                        } else if (result === 'reload') {
                            html += "<span style='color:red'>Delete fail! Please reaload this page</span";
                        } else {
                            html += "<span style='color:red'>Delete fail!</span";
                        }
                    },
                    error: function (e) {
                        console.log("ERROR: ", e);
                    },
                    complete: function () {
                        $('#deleteModel').modal('hide');
                        $('#alertDELETEmodalBody').html(html);
                        $('#alertDELETEmodal').modal('show');
                    }
                });
            }

            //get Cate and Spec by ID to push in modal
            function getByCateID(cateID) {
                html = "";
                html2 = "";
                $.ajax({
                    type: "GET",
                    contentType: "application/json",
                    url: "${pageContext.request.contextPath}/api/getCategoryByIDWithSpec/" + cateID,
                    dataType: 'json',
                    timeout: 100000,
                    success: function (result) {
                        html2 += '<div>';
                        html2 += '<label>Type</label>';
                        html2 += '<select id="selectTypeModal" class="form-control">';
                        if (result['type'] === true) {
                            html2 += '<option value="1" selected>Linh kiện</option>';
                            html2 += '<option value="0">Phụ kiện</option>';
                        } else {
                            html2 += '<option value="1" Linh kiện</option>';
                            html2 += '<option value="0" selected>Phụ kiện</option>';
                        }
                        html2 += '<option value="0">Phụ kiện</option>';

                        html2 += '</select>';
                        html2 += '<br>';
                        html2 += '</div>';
                        html2 += '<input type="hidden" id="cateIDInputModal" value="' + result['cateID'] + '"><br/>';
                        html2 += '<label>Category Name</label>';
                        html2 += '<input type="text" id="cateNameInputModal" class="form-control" placeholder="Enter Category Name" value="' + result['cateName'] + '" required><br/>';
                        html2 += '<label>Specification Title</label>';


                        var listSpec = result['specificationTitleCollection'];

                        html += '<div class="input-group control-group after-add-more-modal">';
                        html += '</div>';


                        for (var i = 0; i < listSpec.length; i++) {

                            html += '<div class="control-group input-group" style="margin-top:10px">';
                            html += '<input type="text" name="addmoreModal" class="form-control inputSpecModal" placeholder="Enter Specification" required value="' + listSpec[i]['specName'] + '">';
                            html += '<div class="input-group-btn"> ';
                            html += '<button class="btn btn-danger remove" type="button"><i class="glyphicon glyphicon-remove"></i> Remove</button>';
                            html += '</div>';
                            html += '</div>';
                        }
                        $('#showCateNameAndType').html(html2);
                        $('#showSpecModal').html(html);
                    },
                    error: function (e) {
                        console.log("ERROR: ", e);
                    }
                });

            }

            //Validate + update category
            $(document).ready(function () {
                $('#btnSubmitUpdate').click(function (e) {
                    e.preventDefault();
                    var check = true;
                    var cateName = $('#cateNameInputModal').val();
                    var cateID = $('#cateIDInputModal').val();
                    if (cateName === "") {
                        $('#cateNameInputModal').css({"border": "1px solid red"});
                        check = false;
                    } else {
                        $('#cateNameInputModal').css({"border": ""});
                    }
                    var selectType = $('#selectTypeModal').val();
                    var listSpec = [];
                    $(".inputSpecModal").each(function () {
                        if ($(this).val() === "") {
                            check = false;
                            $(this).css({"border": "1px solid red"});
                        } else {
                            listSpec.push($(this).val());
                            $(this).css({"border": ""});
                        }
                    });
                    console.log(listSpec);
                    console.log(selectType);
                    console.log(cateName);
                    console.log(cateID);
                    if (check) {
                        var html = "";
                        $.ajax({
                            url: "${pageContext.request.contextPath}/api/updateCategory",
                            type: "POST",
                            data: {
                                cateID: cateID,
                                cateName: cateName,
                                listSpec: listSpec,
                                selectType: selectType
                            },
                            dataType: 'text',
                            cache: false,
                            success: function (result) {
                                if (result === 'success') {
                                    html += "<h3 style='color:green'>Update Success!</h3";
                                } else {
                                    html += "<span style='color:red'>Update fail!</span";
                                }
                            },
                            error: function (e) {
                                console.log("ERROR: ", e);
                            },
                            complete: function () {
                                $('#updateModel').modal('hide');
                                $('#alertADDModalBody').html(html);
                                $('#alertADDModal').modal('show');
                            }
                        });
                    }


                });
            });

        </script>

    </body>

</html>



