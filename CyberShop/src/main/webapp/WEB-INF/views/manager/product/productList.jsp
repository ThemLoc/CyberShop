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

                <!-- Add Product -->
                <section class="content-header">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="box">
                                <div class="box-body">
                                    <button id="btnAdd" type="button" class="btn btn-danger"> + Add New Product</button>
                                    <!-- form start -->
                                    <form:form id="form" action="${pageContext.request.contextPath}/manager/product/add"  onsubmit="return validateForm()"
                                               method="POST" enctype="multipart/form-data" style="display:none" modelAttribute="product" >
                                        <div class="box-body">

                                            <div class="form-group">
                                                <label >Product Name</label>
                                                <form:input type="text" path="productName" name="productName" style="" class="form-control" placeholder="Enter product name (<100)"/>
                                            </div>

                                            <div class="form-group">
                                                <label >Category</label>
                                                <form:select path="categoryID" id="categorySelection" class="form-control">
                                                    <form:option value="-1" selected="true">Select Category</form:option>
                                                    <c:forEach items="${categoryWithSpec}" var="cate">
                                                        <form:option  value="${cate.cateID}">${cate.cateName}</form:option>
                                                    </c:forEach>
                                                </form:select>
                                            </div>
                                            <!--Specification-->
                                            <div id="showSpec" class="form-group" >
                                            </div>
                                            <!--/Specification-->
                                            <form:input path="detail"  id="detail" type="hidden"  class="form-control" />

                                            <div class="form-group">
                                                <label>Brand</label>
                                                <form:select path="brandID" class="form-control">
                                                    <c:forEach items="${listBrand}" var="brand">
                                                        <form:option  value="${brand.brandID}">${brand.brandName}</form:option>
                                                    </c:forEach>
                                                </form:select>
                                            </div>

                                            <div class="form-group">
                                                <label >Price</label>
                                                <form:input type="number" name="price" path="price" class="form-control" id="" placeholder="Price"/>
                                            </div>
                                            <div class="form-group">
                                                <label>Quanlity</label>
                                                <form:input type="number" name="quantity" path="quantity" class="form-control" id="" placeholder="Quanlity"/>
                                            </div>

                                            <div class="form-group">
                                                <label>Main Image</label>
                                                <input name="mainImg"  type="file" class="file" data-show-upload="false" accept="image/*"/>
                                            </div>
                                            <div class="form-group">
                                                <label>Sub Image</label>
                                                <input  name="subImg"  type="file" class="file" multiple  data-show-upload="false" accept="image/*"/>
                                            </div>
                                            <div class="form-group">
                                            </div>
                                            <div class="form-group">
                                                <label>Status</label>
                                                <form:select path="status" class="form-control">
                                                    <form:option value="1">Enable</form:option>
                                                    <form:option value="0">Disable</form:option>
                                                </form:select>
                                            </div>

                                        </div>
                                        <!-- /.box-body -->
                                        <div class="box-footer">
                                            <form:button id="saveProduct" type="submit" class="btn btn-primary">Submit</form:button>
                                            </div>
                                    </form:form>
                                </div >



                            </div>
                        </div>
                    </div>
                </section>
                <!-- Add Product -->

                <!-- Header table -->
                <section class="content-header">
                    <h1>Product Tables</h1>

                </section>
                <!-- Main content -->
                <section class="content">
                    <div class="row">
                        <div class="col-xs-12">

                            <!-- /.box -->

                            <div class="box">
                                <!-- /.box-header -->
                                <div class="box-body">
                                    <table id="tableProduct" class="table table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th>Product ID</th>
                                                <th>Product Name</th>
                                                <th>Category</th>
                                                <th>Quantity</th>
                                                <th>Sold</th>
                                                <th>Price</th>
                                                <th>DownPrice</th>
                                                <th>Status</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${listProduct}" var="pd">
                                                <tr>
                                                    <td onclick="rowClick(${pd.productID})">${pd.productID}</td>
                                                    <td id="tbRow_pname${pd.productID}" onclick="rowClick(${pd.productID})">${pd.productName}</td>
                                                    <td onclick="rowClick(${pd.productID})">${pd.categoryID.cateName}</td>
                                                    <td id="tbRow_pquantity${pd.productID}" onclick="rowClick(${pd.productID})">${pd.quantity}</td>
                                                    <td onclick="rowClick(${pd.productID})">${pd.sell}</td>
                                                    <td id="tbRow_pprice${pd.productID}" onclick="rowClick(${pd.productID})">${pd.price}</td>
                                                    <td id="tbRow_pdownPrice${pd.productID}" onclick="rowClick(${pd.productID})">${pd.downPrice}</td>
                                                    <td id="rowStatus${pd.productID}" onclick="rowClick(${pd.productID})"> 
                                                        <c:if test="${pd.status}">Enable</c:if>
                                                        <c:if test="${!pd.status}">Disable</c:if>
                                                        </td>
                                                        <td>
                                                        <c:if test="${pd.status}">
                                                            <button id="btnStatus${pd.productID}" type="submit" class="btn" onclick="transDisable(${pd.productID})" style="background-color: #aaa;color: white" data-toggle="modal" data-target="#disableProduct">Disable</button>
                                                        </c:if>
                                                        <c:if test="${!pd.status}">
                                                            <button id="btnStatus${pd.productID}" type="submit" onclick="transEnable(${pd.productID})" style="" class="btn btn-success" data-toggle="modal" data-target="#enableProduct">Enable</button>
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




        <!--MODAL-->

        <!-- Update modal -->
        <div class="modal fade" id="update" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="vertical-alignment-helper">
                <div class="modal-dialog vertical-align-center">
                    <div class="modal-content">
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
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary">Save changes</button>
                        </div>

                    </div>

                </div>
            </div>
        </div>

        <!--/Update modal -->

        <!-- Disable product modal -->
        <div class="modal fade" id="disableProduct" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
            <div class="vertical-alignment-helper">
                <div class="modal-dialog vertical-align-center" >
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
                            </button>
                            <h4 class="modal-title" id="myModalLabel">Disable product</h4>
                        </div>
                        <div class="modal-body">
                            Disable product will hide it from web site.
                            Are you sure disable this product ?
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <button id="btnDisableProduct" onclick="" type="button" class="btn btn-primary">Disable</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Enable product modal -->
        <div class="modal fade" id="enableProduct" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
            <div class="vertical-alignment-helper">
                <div class="modal-dialog vertical-align-center">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
                            </button>
                            <h4 class="modal-title" id="myModalLabel">Disable product</h4>
                        </div>
                        <div class="modal-body">
                            Enable product will show it to web site.
                            Are you sure enable this product ?
                        </div>
                        <div class="modal-footer">
                            <button  type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <button id="btnEnableProduct" onclick="" type="button" class="btn btn-primary">Enable</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--Alert Result-->
        <div class="modal fade" id="alertModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
            <div class="vertical-alignment-helper">
                <div class="modal-dialog vertical-align-center" >
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
                            </button>
                            <h4 class="modal-title" id="myModalLabel">Alert</h4>
                        </div>
                        <div class="modal-body">
                            <div id="alertModalBody">

                            </div>

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--Show Detail product Modal-->
        <div class="modal fade" id="showDetail" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="vertical-alignment-helper">
                <div class="modal-dialog vertical-align-center modal-lg">

                    <div class="modal-content" id="modalDetail">
                        <div class="modal-header">
                            <h4 class="modal-title" id="myModalLabel">Product Detail product</h4>
                        </div>
                        <div  class="modal-body" style="padding:0px; ">
                            <div id="productDetail" style="margin: 10px;" >

                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <button type="button" id="btnUpdateImage"  onlick=""  class="btn btn-primary" data-toggle="modal" data-target="#updateImage">Update Image</button>
                            <button type="button" id="btnUpdateSpecification" onlick="" class="btn btn-primary"  data-toggle="modal" data-target="#updateSpecification">Update Specification</button>
                            <button id="btnUpdateOtherInfo" onlick="" type="button" class="btn btn-primary"  data-toggle="modal" data-target="#updateOtherInfo">Update Other Information</button>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <!--Update Other Information-->
        <div class="modal fade" id="updateOtherInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
            <div class="vertical-alignment-helper">
                <div class="modal-dialog vertical-align-center" >
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
                            </button>
                            <h4 class="modal-title" id="myModalLabel">Update product</h4>
                        </div>
                        <div class="modal-body">
                            <input id="inputID" type="hidden" path="productID" class="form-control"/>

                            <div class="form-group">
                                <label >Product Name</label>
                                <input id="inputName" type="text" style="" path="productName" class="form-control" placeholder="Enter product name(<100)" />
                            </div>
                            <div class="form-group" id="brandSelection">


                            </div>
                            <div class="form-group">
                                <input id="inputBrand" path="brandID" type="hidden" class="form-control" />
                            </div> 
                            <div class="form-group">
                                <label >Price</label>
                                <input id="inputPrice" type="number" class="form-control" path="price" placeholder="Enter product price" />
                            </div> 

                            <div class="form-group">
                                <label >DownPrice</label>
                                <input id="inputDownPrice" type="number" path="downPrice" class="form-control"  placeholder="Enter product downprice (must < price)"/>
                            </div>
                            <div class="form-group">
                                <label>Quantity</label>
                                <input id="inputQuantity" type="number" path="quantity" class="form-control" placeholder="Quanlity" placeholder="Enter product quanity"/>
                            </div>

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <button id="btnUpdateOther" type="button" class="btn btn-primary" >Update</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!--Update Image product-->
        <div class="modal fade" id="updateImage" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
            <div class="vertical-alignment-helper">
                <div class="modal-dialog vertical-align-center" >
                    <div class="modal-content">
                        <form id="fileUploadForm"  method="POST">
                            <div class="modal-header">
                                <h4 class="modal-title" id="myModalLabel">Update Image product</h4>
                            </div>
                            <div class="modal-body">
                                <input id="updateImage_ID" name="productID" type="hidden"  class="form-control"/>
                                <div class="form-group">
                                    <label>Main Image</label>
                                    <input id="updateMainImg" name="mainImg" type="file" class="file" data-show-upload="false" accept="image/*"/>
                                </div>
                                <div class="form-group">
                                    <label>Sub Image</label>
                                    <input  id="updateSubImg" name="subImg" type="file" class="file" multiple  data-show-upload="false" accept="image/*"/>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                <button id="btnUpdateImageModal" type="button" class="btn btn-primary" >Update</button>
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>


        <!--Update Specification-->
        <div class="modal fade" id="updateSpecification" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
            <div class="vertical-alignment-helper">
                <div class="modal-dialog modal-dialog-scrollable vertical-align-center" role="document" >
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                            <h4 class="modal-title" id="myModalLabel">Update Specification</h4>
                        </div>
                        <div id="modal_body_Spec" class="modal-body">
                            <div class="form-group">
                                <button id="changeCategory" type="button" class="btn btn-primary" >Change Category</button>
                            </div>
                            <div class="form-group" id="div_cate" style="display: none">
                                <label>Category</label>
                                <select path="categoryID" id="categorySelectionModal" class="form-control">
                                    <option selected="true">Select Category</option>
                                    <c:forEach items="${categoryWithSpec}" var="cate">
                                        <option  value="${cate.cateID}">${cate.cateName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <input id="modal_cate_id" type="hidden"/>
                                <input id="modal_spec_detail" type="hidden"/>
                                <input id="modal_product_id" type="hidden"/>
                                <div id="specificationModal">
                                </div>
                            </div>

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <button id="btnUpdateSpecModal" type="button" class="btn btn-primary" >Update</button>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <!--/MODAL-->

        <%@include file="/WEB-INF/views/fragment/footer.jsp" %>
        <script>
            // get All specification to field detail when add
            $(document).ready(function () {
                $("#saveProduct").click(function () {
                    var detail = '';
                    var id = '';
                    $(".specInput").each(function () {
                        id = 'l' + $(this).attr('id');
                        detail += $('#' + id).text() + "*";
                        detail += $(this).val() + "#";
                        //                        console.log(detail);
                    });
                    $("#detail").val(detail);
                });
            });

            //Select category to show specification in Add product
            $(function () {
                $('#categorySelection').change(function () {
                    var cateID = $(this).val();
                    var html = '';
                    $('#showSpec').empty();
                    $.ajax({
                        type: "GET",
                        contentType: "application/json",
                        url: "${pageContext.request.contextPath}/api/findSpec/" + cateID,
                        dataType: 'json',
                        timeout: 100000,
                        success: function (result) {
                            html += "<div  class='form-horizontal spec_div' >";
                            html += '<div>';
                            html += '<label>Specifications</label>';
                            html += '</div>';
                            html += "<div class='box-body'>";
                            for (var i = 0; i < result.length; i++) {
                                var point = result.length / 2;
                                if (i < point) {
                                    html += "<div class='col-md-6'>";
                                    html += "<div class='form-group'>";
                                    html += "<div class='row'>";
                                    html += "<label for='spec_" + result[i]['specID'] + "'id='lspec_" + result[i]['specID'] + "' class='col-sm-6 control-label'>" + result[i]['specName'] + "</label>";
                                    html += "<div class='col-sm-3'>";
                                    html += "<input id='spec_" + result[i]['specID'] + "'  type='text' class='form-control specInput' >";
                                    html += "</div>";
                                    html += "</div>";
                                    html += "</div>";
                                    html += "</div>";
                                }
                                if (i > point) {
                                    html += "<div class='col-md-6'>";
                                    html += "<div class='form-group'>";
                                    html += "<div class='row'>";
                                    html += "<label for='spec_" + result[i]['specID'] + "'id='lspec_" + result[i]['specID'] + "' class='col-sm-6 control-label'>" + result[i]['specName'] + "</label>";
                                    html += "<div class='col-sm-3'>";
                                    html += "<input id='spec_" + result[i]['specID'] + "'  type='text' class='form-control specInput' >";
                                    html += "</div>";
                                    html += "</div>";
                                    html += "</div>";
                                    html += "</div>";
                                }
                            }
                            html += "</div>";
                            html += "</div>";
                            $('#showSpec').html(html);
                        },
                        error: function (e) {
                            console.log("ERROR: ", e);
                        }
                    });
                });
            });
            $(function () {
                $('#tableProduct').DataTable({
                    'paging': true,
                    'lengthChange': true,
                    'searching': true,
                    'ordering': true,
                    'info': true,
                    'autoWidth': false
                });
            });

            //show - hide form add product
            $(document).ready(function () {
                $("#btnAdd").click(function () {
                    $("#form").toggle();
                });
            });


            //Click row show detail product modal
            function rowClick(id) {
                $("#showDetail").modal('show');
                //                var cateID = $(this).val();
                var func2 = "updateOtherInfo(" + id + ")";
                var func3 = "updateImageInfo(" + id + ")";
                $('#btnUpdateOtherInfo').attr('onclick', func2);
                $('#btnUpdateImage').attr('onclick', func3);
                var html = '';
                var html2 = '';
                var cateID;
                var productID;
                $('#detailModelBody').empty();
                var list;
                $.ajax({
                    type: "GET",
                    contentType: "application/json",
                    url: "${pageContext.request.contextPath}/api/findProduct/" + id,
                    dataType: 'json',
                    timeout: 100000,
                    success: function (result) {

                        var detailStr = result['detail'];
                        list = detailStr.split("#");
                        html += "<div  class='form-horizontal col-md-12'>";

                        html += "<div class='col-md-7'>";
                        if (result['imagesCollection'] !== null) {

                            html += "<div class='col-md-12' style='height :300px;vertical-align:middle' >";
                            //                            html += "<h3>Main Image</h3>";
                            for (var i = 0; i < result['imagesCollection'].length; i++) {
                                var tmp = result['imagesCollection'][i]['mainImage'];
                                if (tmp === true) {
                                    html += "<img src='${pageContext.request.contextPath}/resources/image/img_product/" + result['imagesCollection'][i]['urlImage'] + "' style='width: 100% ; height:300px;vertical-align: middle;'>";
                                    result['imagesCollection'].splice(i, 1);
                                }
                            }
                            html += "</div>";
                            html += "<div class='col-md-12' style='height :10px;vertical-align:middle' >";
                            html += "</div>";
                            html += "<div class='col-md-12' style='height :300px;vertical-align:middle' >";
                            //                            html += "<h3>Sub Image</h3>";

                            html += "<div id='myCarousel' class='carousel slide' data-ride='carousel' style='width: 100%;height:300px'>";
                            html += "<ol class='carousel-indicators'>";
                            for (var i = 0; i < result['imagesCollection'].length; i++) {
                                if (i === 0) {
                                    html += "<li data-target='#myCarousel' data-slide-to='" + i + "' class='active slidePost'></li>";
                                }
                                if (i > 0) {
                                    html += "<li data-target='#myCarousel'  class='slidePost' data-slide-to='" + i + "'></li>";
                                }
                            }
                            html += "</ol>";
                            html += "<div class='carousel-inner'>";
                            for (var i = 0; i < result['imagesCollection'].length; i++) {
                                if (i === 0) {
                                    html += " <div class='item active'>";
                                }
                                ;
                                if (i > 0) {
                                    html += " <div class='item'>";
                                }
                                html += "<img src='${pageContext.request.contextPath}/resources/image/img_product/" + result['imagesCollection'][i]['urlImage'] + "' style='width: 100%;height:300px'>";
                                html += " </div>";
                            }

                            html += "</div>";
                            html += " <a class='eft carousel-control' href='#myCarousel' data-slide='prev' style='color:green'>";
                            html += "<span class='glyphicon glyphicon-chevron-left'></span>";
                            html += "<span class='sr-only'>Previous</span>";
                            html += " </a>";
                            html += "<a class='right carousel-control' href='#myCarousel' data-slide='next' style='color:green'>";
                            html += "<span class='glyphicon glyphicon-chevron-right'></span>";
                            html += "<span class='sr-only'>Next</span>";
                            html += " </a>";
                            html += "</div>";
                            html += "</div>";

                        }

                        html += "</div>";

                        html += "<div class='col-md-5'>";
                        html += "<table class='table table-bordered table-hover'>";
                        html += "<thead>";
                        html += "<tr>";
                        html += "<th>Specification</th>";
                        html += "<th>Value</th>";
                        html += "</tr>";
                        html += "</thead>";
                        html += "<tbody>";
                        for (var i = 0; i < list.length - 1; i++) {
                            var specObj = list[i].split("*");
                            //                            console.log(specObj);
                            html += "<tr>";
                            html += "<td>" + specObj[0] + "</td>";
                            html += "<td>" + specObj[1] + "</td>";
                            html += "</tr>";
                        }

                        html += "</tbody>";
                        html += "</table>";
                        html += "</div>";

                        html += "</div>";

                        html += "<div col-md-12>";
                        html += "<table class='table table-bordered table-hover'>";
                        html += "<thead>";
                        html += "<tr>";
                        html += "<th>ProductID</th>";
                        html += "<th>ProductName</th>";
                        html += "<th>Brand</th>";
                        html += "<th>Category</th>";
                        html += "<th>Price</th>";
                        html += "<th>DownPrice</th>";
                        html += "<th>Quantity</th>";
                        html += "<th>Sold</th>";
                        html += "<th>Status</th>";
                        html += "</tr>";
                        html += "</thead>";
                        html += "<tbody>";
                        html += "<tr>";
                        html += "<td>" + result['productID'] + "</td>"
                        html += "<td id='tdProductName'>" + result['productName'] + "</td>"
                        html += "<td id='tdbrandName' value='" + result['brandID']['brandID'] + "'>" + result['brandID']['brandName'] + "</td>"
                        html += "<td id='tdCateName'>" + result['categoryID']['cateName'] + "</td>"
                        html += "<td id='tdPrice'>" + result['price'] + "</td>"
                        if (result['downPrice'] === null) {
                            html += "<td id='tdDownPrice'></td>"
                        } else {
                            html += "<td id='tdDownPrice'>" + result['downPrice'] + "</td>"
                        }
                        html += "<td id='tdQuantity'>" + result['quantity'] + "</td>"
                        html += "<td >" + result['sell'] + "</td>"
                        html += "<td>" + result['status'] + "</td>"
                        html += "</tr>";
                        html += "</tbody>";
                        html += "</table>";
                        html += "</div>";

                        $('#productDetail').html(html);


                        cateID = result['categoryID']['cateID'];
                        productID = result['productID'];

                    },
                    error: function (e) {
                        console.log("ERROR: ", e);
                    }, complete: function (jqXHR, textStatus) {
                        var listValue = [];
                        for (var i = 0; i < list.length - 1; i++) {
                            var specObj = list[i].split("*");
                            listValue.push(specObj[1]);
                            $('#modal_cate_id').val(cateID);
                            $('#modal_product_id').val(productID);
                        }
                        $.ajax({
                            type: "GET",
                            contentType: "application/json",
                            url: "${pageContext.request.contextPath}/api/findSpec/" + cateID,
                            dataType: 'json',
                            timeout: 100000,
                            success: function (result) {
                                html2 += "<div  class='form-horizontal specsdiv' >";
                                html2 += "<div class='box-body'>";
                                if (result !== null) {
                                    for (var i = 0; i < result.length; i++) {
                                        html2 += "<div class='form-group'>";
                                        html2 += "<div class='row'>";
                                        html2 += "<label for='md_spec_" + result[i]['specID'] + "'id='lmd_spec_" + result[i]['specID'] + "' class='col-sm-3 control-label'>" + result[i]['specName'] + "</label>";
                                        html2 += "<div class='col-sm-8'>";
                                        html2 += "<input id='md_spec_" + result[i]['specID'] + "'  type='text' class='form-control md_specInput' value='" + listValue[i] + "' >";
                                        html2 += "</div>";
                                        html2 += "</div>";
                                        html2 += "</div>";
                                    }
                                }
                                html2 += "</div>";
                                html2 += "</div>";
//                                $('#specificationModal').html(html);
                                html2 += "</tbody>";
                                html2 += "</table>";
                                $('#specificationModal').html(html2);
                            },
                            error: function (e) {
                                console.log("ERROR: ", e);
                            }
                        });
                    }
                });
            }
            ;

            //transmission id to disbale modal
            function transDisable(id) {
                var func1 = "disableProduct(" + id + ")";
                $('#btnDisableProduct').attr('onclick', func1);

            }
            ;
            //disable product
            function disableProduct(id) {
                var html = '';
                $.ajax({
                    type: "POST",
                    contentType: "application/json",
                    url: "${pageContext.request.contextPath}/api/changeStatus/" + id + "/false",
                    dataType: 'text',
                    timeout: 100000,
                    success: function (result) {
                        $("#disableProduct").modal("hide");
                        if (result === "success") {
                            html += "Disable successfull!";
                            $('#alertModalBody').html(html);
                            var btnStatusProduct = 'btnStatus' + id;
                            var rowStatusProduct = 'rowStatus' + id;
                            var onlick = 'transEnable(' + id + ')';
                            $('#' + btnStatusProduct).attr('style', '');
                            $('#' + btnStatusProduct).attr('class', 'btn  btn-success');
                            $('#' + btnStatusProduct).text('Enable');
                            $('#' + rowStatusProduct).text('Disable');
                            $('#' + btnStatusProduct).attr('data-target', '#enableProduct');
                            $('#' + btnStatusProduct).attr('onclick', onlick);
                        } else {
                            html += "Disable fail!";
                        }
                        $('#alertModal').modal('show');
                    },
                    error: function (e) {
                        console.log("ERROR: ", e);
                    }
                });
            }
            ;

            //transmisssion enable product
            function transEnable(id) {
                var func = "enableProduct(" + id + ")";
                $('#btnEnableProduct').attr('onclick', func);
            }
            ;
            //enable product
            function enableProduct(id) {
                var html = '';
                $.ajax({
                    type: "POST",
                    contentType: "application/json",
                    url: "${pageContext.request.contextPath}/api/changeStatus/" + id + "/true",
                    dataType: 'text',
                    timeout: 100000,
                    success: function (result) {
                        $("#enableProduct").modal("hide");
                        if (result === "success") {
                            html += "Enable successfull!";

                            var btnStatusProduct = 'btnStatus' + id;
                            var rowStatusProduct = 'rowStatus' + id;
                            var style = 'background-color: #aaa;color: white';
                            var onlick = 'transDisable(' + id + ')';
                            $('#' + btnStatusProduct).attr('style', style);
                            $('#' + btnStatusProduct).attr('class', 'btn');
                            $('#' + btnStatusProduct).text('Disable');
                            $('#' + rowStatusProduct).text('Enable');
                            $('#' + btnStatusProduct).attr('data-target', '#disableProduct');
                            $('#' + btnStatusProduct).attr('onclick', onlick);
                        } else {
                            html += "Enable fail!";
                        }
                        $('#alertModalBody').html(html);
                        $('#alertModal').modal('show');

                    },
                    error: function (e) {
                        console.log("ERROR: ", e);
                    }
                });
            }
            ;

            //set Current Value - btnUpdateOtherInfo
            function updateOtherInfo(id) {
                var name = $('#tdProductName').text();
                var brandID = $('#tdbrandName').attr('value');
                var brandName = $('#tdbrandName').text();
                var price = $('#tdPrice').text();
                var downPrice = $('#tdDownPrice').text();
                var quantity = $('#tdQuantity').text();
                $('#inputID').val(id);
                $('#inputName').val(name);
                $('#inputPrice').val(price);
                $('#inputDownPrice').val(downPrice);
                $('#inputQuantity').val(quantity);
                $("#showDetail").modal("hide");
                $('#inputBrand').val(brandID);
                var html = '';
                $.ajax({
                    type: "GET",
                    contentType: "application/json",
                    url: "${pageContext.request.contextPath}/api/getBrand",
                    dataType: 'json',
                    timeout: 100000,
                    success: function (result) {
                        html += "<lable>Brand</lable>";
                        html += "<select id='selectionChange' onchange='selectClick()' class='form-control'>";
                        for (var i = 0; i < result.length; i++) {
                            if (result[i]['brandID'] == brandID) {
                                html += "<option selected value='" + result[i]['brandID'] + "'>" + result[i]['brandName'] + "</option>";
                            } else {
                                html += "<option onlick='selectClick(" + result[i]['brandID'] + ")' value='" + result[i]['brandID'] + "'>" + result[i]['brandName'] + "</option>";
                            }
                        }
                        html += " </select>";
                        $('#brandSelection').html(html);
                    },
                    error: function (e) {
                        console.log("ERROR: ", e);
                    }
                });
            }

            //set select brand update other to input hidden
            function selectClick() {
                $('#inputBrand').val($('#selectionChange').find(":selected").attr('value'));
            }
            //Update other by rest
            $('#btnUpdateOther').click(function () {
                var html = '';
                var id = $('#inputID').val();
                var name = $('#inputName');
                var price = $('#inputPrice');
                var downPrice = $('#inputDownPrice');
                var quantity = $('#inputQuantity');
                var check = true;

                if (name.val() === "" || name.val().length > 100) {
                    name.css({"border": "1px solid red"});
                    check = false;
                } else {
                    name.css({"border": ""});
                }
                if (price.val() === "" || price.val() < 0) {
                    price.css({"border": "1px solid red"});
                    check = false;
                } else {
                    price.css({"border": ""});
                }
                if (downPrice.val() !== "") {
                    if (downPrice.val() < 0 || ($('#inputDownPrice').val() - $('#inputPrice').val()) > 0) {
                        downPrice.css({"border": "1px solid red"});
                        check = false;
                    } else {
                        downPrice.css({"border": ""});
                    }
                } else {
                    downPrice.css({"border": ""});
                }
                if (quantity.val() === "" || quantity.val() < 0) {
                    quantity.css({"border": "1px solid red"});
                    check = false;
                } else {
                    quantity.css({"border": ""});
                }

                if (check) {
                    $.ajax({
                        type: "POST",
                        url: "${pageContext.request.contextPath}/api/updateOther",
                        dataType: 'text',
                        data: {
                            productID: id,
                            productName: name.val(),
                            price: price.val(),
                            downPrice: downPrice.val(),
                            quantity: quantity.val(),
                            brandID: $('#inputBrand').val()
                        },
                        timeout: 100000,
                        success: function (result) {
                            $('#updateOtherInfo').modal('hide');
                            if (result === "success") {
                                $('#tbRow_pname' + id).text(name.val());
                                $('#tbRow_pprice' + id).text(price.val());
                                $('#tbRow_pquantity' + id).text(quantity.val());
                                $('#tbRow_pdownPrice' + id).text(downPrice.val());
                                html += "<h3 style='color:green'>Update Success!</h3";
                            } else {
                                html += "<span style='color:red'>Update fail!</span";
                            }
                            $('#alertModalBody').html(html);
                            $('#alertModal').modal('show');
                        }
                        ,
                        error: function (e) {
                            console.log("ERROR: ", e);
                        }
                    }
                    );
                }
            }
            );
            //set id product to update image modal
            function  updateImageInfo(id) {
                $('#updateImage_ID').val(id);
                //                $('#showDetail').modal("hide");
            }

            $('#btnUpdateImageModal').click(function (event) {
                alert(event);
//                event.preventDefault();
                var form = $('#fileUploadForm')[0];
                var data = new FormData(form);
                $.ajax({
                    type: "POST",
                    url: "${pageContext.request.contextPath}/api/updateImageProduct",
                    dataType: 'text',
                    processData: false,
                    contentType: false,
                    data: data,
                    timeout: 100000,
                    success: function (result) {
                        //                        $('#updateOtherInfo').modal('hide');
                        //                        if (result === "success") {
                        //                            html += "<h3 style='color:green'>Update Success!</h3";
                        //                        } else {
                        //                           html += "<span style='color:red'>Update fail!</span";
                        //                        }
                        //                        $('#alertModalBody').html(html);
                        //                        $('#alertModal').modal('show');
                    }
                    ,
                    error: function (e) {
                        console.log("ERROR: ", e);
                        //                            $('#alertModal').modal('show');
                    }
                });
            });


            $("#btnUpdateSpecification").click(function () {
                $('#showDetail').modal("hide");
            });
            //Select category to show specification in Update modal
            $(function () {
                $('#categorySelectionModal').change(function () {
                    var cateID = $(this).val();
                    var html = '';
                    $('#specificationModal').empty();
                    $('#modal_cate_id').val(cateID);
                    $.ajax({
                        type: "GET",
                        contentType: "application/json",
                        url: "${pageContext.request.contextPath}/api/findSpec/" + cateID,
                        dataType: 'json',
                        timeout: 100000,
                        success: function (result) {
                            html += "<div  class='form-horizontal spec_div' >";
                            html += "<div class='box-body'>";
                            if (result !== null) {
                                for (var i = 0; i < result.length; i++) {
                                    html += "<div class='form-group'>";
                                    html += "<div class='row'>";
                                    html += "<label for='md_spec_" + result[i]['specID'] + "'id='lmd_spec_" + result[i]['specID'] + "' class='col-sm-3 control-label'>" + result[i]['specName'] + "</label>";
                                    html += "<div class='col-sm-8'>";
                                    html += "<input id='md_spec_" + result[i]['specID'] + "'  type='text' class='form-control md_specInput' >";
                                    html += "</div>";
                                    html += "</div>";
                                    html += "</div>";
                                }
                            }
                            html += "</div>";
                            html += "</div>";
                            $('#specificationModal').html(html);
                        },
                        error: function (e) {
                            console.log("ERROR: ", e);
                        }
                    });
                });
            });

            // get All specification to field detail when add
            $(document).ready(function () {
                $("#btnUpdateSpecModal").click(function () {
                    var detail = '';
                    var id = '';
                    var html = '';
                    $(".md_specInput").each(function () {
                        id = 'l' + $(this).attr('id');
                        detail += $('#' + id).text() + "*";
                        detail += $(this).val() + "#";
//                        console.log(detail);
                    });
                    $("#modal_spec_detail").val(detail);
                    var cateID = $('#modal_cate_id').val();
                    var productID = $('#modal_product_id').val();
                    var detail = $("#modal_spec_detail").val();
                    $.ajax({
                        type: "POST",
                        url: "${pageContext.request.contextPath}/api/updateSpec/",
                        dataType: 'text',
                        data: {
                            cateID: cateID,
                            productID: productID,
                            detail: detail},
                        timeout: 100000,
                        success: function (result) {
                            $('#updateSpecification').modal('hide');
                            if (result === "success") {
                                html += "<h3 style='color:green'>Update Success!</h3";
                            } else {
                                html += "<h3 style='color:red'>Update fail!</h3";
                            }
                            $('#alertModalBody').html(html);
                            $('#alertModal').modal('show');
                        },
                        error: function (e) {
                            console.log("ERROR: ", e);
                        }
                    });
                });
            });

            $('#changeCategory').click(function () {
                $(this).hide();
                $('#div_cate').show();

            });

            function validateForm() {
                var check = true;
                var productNameInput = document.forms["form"]["productName"];
                var priceInput = document.forms["form"]["price"];
                var quantityInput = document.forms["form"]["quantity"];
                var category = $('#categorySelection');
                if (productNameInput.value === "" || productNameInput.value.length > 100) {
                    productNameInput.style.borderColor = "red";
                    check = false;
                } else {
                    productNameInput.style.borderColor = "";
                }
                if (priceInput.value === "" || priceInput.value < 0) {
                    priceInput.style.borderColor = "red";
                    check = false;
                } else {
                    priceInput.style.borderColor = "";
                }
                if (quantityInput.value === "" || quantityInput.value < 0) {
                    quantityInput.style.borderColor = "red";
                    check = false;
                } else {
                    quantityInput.style.borderColor = "";
                }
                if (category.val() === '-1') {
                    category.css('border-color', 'red');
                    check = false;
                } else {
                    category.css('border-color', '');
                }
                if (check === false) {
                    return false;
                }
            }
        </script>
    </body>

</html>



