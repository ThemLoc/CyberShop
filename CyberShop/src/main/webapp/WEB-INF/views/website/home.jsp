<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <%@include file="/WEB-INF/views/website/fragment/css.jsp" %>
        <style>
            .mytag:hover {
                color: yellow;
            }
        </style>
    </head>
    <body onload="testSuccess()">
        <%@include file="/WEB-INF/views/website/fragment/webHeader.jsp" %>
        <script>
            function testSuccess() {
                if (${not empty successOrder}) {
                    window.alert('Đặt hàng thành công.');
                }
            }
        </script>
        <div class="slider-area">
            <!-- Slider -->
            <div class="block-slider block-slider4">
                <ul class="" id="bxslider-home4">
                    <c:forEach items="${listBanner}" var="a" varStatus="Counter" >
                        <li style="float: left; list-style: none; position: relative; width: 692px;">
                            <div class="col-md-12">
                                <div class="col-md-7">
                                    <c:forEach items="${a.productID.imagesCollection}" var="b">
                                        <c:if test="${b.mainImage == true}">
                                            <a href="${pageContext.request.contextPath}/website/singleproduct/${a.productID.productID}">
                                                <c:if test="${fn:contains(b.urlImage, 'res.cloudinary.com') == false}">
                                                    <img class="km" src="${pageContext.request.contextPath}/resources/image/img_product/${b.urlImage}" alt="slide">
                                                </c:if>
                                                <c:if test="${fn:contains(b.urlImage, 'res.cloudinary.com') == true}">
                                                    <img class="km" src="${b.urlImage}" alt="slide">
                                                </c:if>
                                            </a>
                                        </c:if>
                                    </c:forEach>
                                </div>
                                <div class="col-md-5">
                                    <div class="caption-group" style="margin-top: 150px; margin-left: 20px">
                                        <h2 class="caption title">
                                            <a href="${pageContext.request.contextPath}/website/singleproduct/${a.productID.productID}" class="caption title animated fadeInRight" style="display: block;text-decoration: none">
                                                <span class="primary"><strong>${a.productID.productName}</strong></span><br/>
                                            </a>
                                        </h2>
                                        <a class="caption button-radius" href="${pageContext.request.contextPath}/website/singleproduct/${a.productID.productID}"><span class="icon"></span>Shop now</a>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </c:forEach>

                </ul>
            </div>
            <!-- ./Slider -->
        </div> <!-- End slider area -->

        <div class="maincontent-area">
            <div class="zigzag-bottom"></div>
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="latest-product">
                            <div class="v3-new-arrival-title"><a href="${pageContext.request.contextPath}/website/listproduct/hot" class="mytag" style="text-decoration: none">Khuyến mãi hot - Giá sốc tận óc</a></div>
                            <div class="product-carousel">
                                <c:forEach items="${hotProduct}" var="hotPro">
                                    <div class="single-product">
                                        <div class="product-f-image">
                                            <c:forEach items="${hotPro.imagesCollection}" var="list">
                                                <c:if test="${list.mainImage == true}">
                                                    <c:if test="${fn:contains(list.urlImage, 'res.cloudinary.com') == false}">
                                                        <img class="p1" src="${pageContext.request.contextPath}/resources/image/img_product/${list.urlImage}" alt="">
                                                    </c:if>
                                                    <c:if test="${fn:contains(list.urlImage, 'res.cloudinary.com') == true}">
                                                        <img class="p1" src="${list.urlImage}" alt="">
                                                    </c:if>
                                                </c:if>
                                            </c:forEach>
                                            <div class="product-hover">
                                                <a onclick="addToCart('${hotPro.productID}')" class="add-to-cart-link"><i class="fa fa-shopping-cart"></i>Thêm vào giỏ</a>
                                                <a href="${pageContext.request.contextPath}/website/singleproduct/${hotPro.productID}" class="view-details-link"><i class="fa fa-link"></i>Xem chi tiết</a>
                                            </div>
                                        </div>

                                        <h2><a href="${pageContext.request.contextPath}/website/singleproduct/${hotPro.productID}">${hotPro.productName}</a></h2>

                                        <div class="product-carousel-price">
                                            <c:if test="${hotPro.downPrice != null}">
                                                <ins><fmt:formatNumber type="number" pattern="###,###" value="${hotPro.downPrice}" /> ₫</ins> <del><fmt:formatNumber type="number" pattern="###,###" value="${hotPro.price}" /> ₫</del>
                                            </c:if>
                                            <c:if test="${hotPro.downPrice == null}">
                                                <ins><fmt:formatNumber type="number" pattern="###,###" value="${hotPro.price}" /> ₫</ins>
                                            </c:if>
                                        </div> 
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div> <!-- End main content area -->

        <div class="maincontent-area">
            <div class="zigzag-bottom"></div>
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="latest-product">
                            <div class="title">
                                <div class="v3-new-arrival-title2"><a class="mytag" href="${pageContext.request.contextPath}/website/listproduct/new" style="text-decoration: none">Hàng mới về - Đừng bỏ lỡ</a></div>
                                <div>
                                    <div class="product-carousel">
                                        <c:forEach items="${newProduct}" var="newPro">
                                            <div class="single-product">
                                                <div class="product-f-image">
                                                    <c:forEach items="${newPro.imagesCollection}" var="list">
                                                        <c:if test="${list.mainImage == true}">
                                                            <c:if test="${fn:contains(list.urlImage, 'res.cloudinary.com') == false}">
                                                                <img class="p1" src="${pageContext.request.contextPath}/resources/image/img_product/${list.urlImage}" alt="">
                                                            </c:if>
                                                            <c:if test="${fn:contains(list.urlImage, 'res.cloudinary.com') == true}">
                                                                <img class="p1" src="${list.urlImage}" alt="">
                                                            </c:if>
                                                        </c:if>
                                                    </c:forEach>
                                                    <div class="product-hover">
                                                        <a onclick="addToCart('${newPro.productID}')" class="add-to-cart-link"><i class="fa fa-shopping-cart"></i>Thêm vào giỏ</a>
                                                        <a href="${pageContext.request.contextPath}/website/singleproduct/${newPro.productID}" class="view-details-link"><i class="fa fa-link"></i>Xem chi tiết</a>
                                                    </div>
                                                </div>

                                                <h2><a href="${pageContext.request.contextPath}/website/singleproduct/${newPro.productID}">${newPro.productName}</a></h2>

                                                <div class="product-carousel-price">
                                                    <ins><fmt:formatNumber type="number" pattern="###,###" value="${newPro.price}" /> ₫</ins>
                                                </div> 
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End main content area -->
    <div class="brands-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="brand-wrapper">
                        <div class="brand-list">
                            <c:forEach items="${listBrand}" var="brandList">
                                <a href="${pageContext.request.contextPath}/website/listproduct/brand/${brandList.brandID}">
                                    <c:if test="${fn:contains(brandList.imageURL, 'res.cloudinary.com') == false}">
                                        <img style="width: 250px;height: 140px" src="${pageContext.request.contextPath}/resources/image/img_brand/${brandList.imageURL}" alt="">
                                    </c:if>
                                    <c:if test="${fn:contains(brandList.imageURL, 'res.cloudinary.com') == true}">
                                        <img style="width: 250px;height: 140px" src="${brandList.imageURL}" alt="">
                                    </c:if>
                                </c:forEach>
                                </div>
                                </div>
                                </div>
                                </div>
                                </div>
                                </div> 

                                <div class="product-widget-area">
                                    <div class="zigzag-bottom"></div>
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="single-product-widget">
                                                    <h2 >Bán chạy</h2>
                                                    <a href="${pageContext.request.contextPath}/website/listproduct/sell" class="wid-view-more">Xem tất cả</a>
                                                    <c:forEach var="sellProduct" items="${sellProduct}">
                                                        <div class="single-wid-product">
                                                            <a href="${pageContext.request.contextPath}/website/singleproduct/${sellProduct.productID}">
                                                                <c:forEach items="${sellProduct.imagesCollection}" var="list">
                                                                    <c:if test="${list.mainImage == true}">
                                                                        <img class="product-thumb" src="${pageContext.request.contextPath}/resources/image/img_product/${list.urlImage}" alt="">
                                                                    </c:if>
                                                                </c:forEach>
                                                            </a>
                                                            <h2><a href="${pageContext.request.contextPath}/website/singleproduct/${sellProduct.productID}">${sellProduct.productName}</a></h2>
                                                            <div class="product-wid-rating">
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                            </div>
                                                            <div class="product-wid-price">
                                                                <c:if test="${sellProduct.downPrice != null}">
                                                                    <ins><fmt:formatNumber type="number" pattern="###,###" value="${sellProduct.downPrice}" /> ₫</ins> <del><fmt:formatNumber type="number" pattern="###,###" value="${sellProduct.price}" /> ₫</del>
                                                                </c:if>
                                                                <c:if test="${sellProduct.downPrice == null}">
                                                                    <ins><fmt:formatNumber type="number" pattern="###,###" value="${sellProduct.price}" /> ₫</ins>
                                                                </c:if>
                                                            </div>                            
                                                        </div>
                                                    </c:forEach>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="single-product-widget">
                                                    <h2 >Sản phẩm hot</h2>
                                                    <a href="${pageContext.request.contextPath}/website/listproduct/hot" class="wid-view-more">Xem tất cả</a>
                                                    <c:forEach var="listHotPro" items="${hot3Product}">
                                                        <div class="single-wid-product">
                                                            <a href="${pageContext.request.contextPath}/website/singleproduct/${listHotPro.productID}">
                                                                <c:forEach items="${listHotPro.imagesCollection}" var="list">
                                                                    <c:if test="${list.mainImage == true}">
                                                                        <img class="product-thumb" src="${pageContext.request.contextPath}/resources/image/img_product/${list.urlImage}" alt="">
                                                                    </c:if>
                                                                </c:forEach>
                                                            </a>
                                                            <h2><a href="${pageContext.request.contextPath}/website/singleproduct/${listHotPro.productID}">${listHotPro.productName}</a></h2>
                                                            <div class="product-wid-rating">
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                            </div>
                                                            <div class="product-wid-price">
                                                                <c:if test="${listHotPro.downPrice != null}">
                                                                    <ins><fmt:formatNumber type="number" pattern="###,###" value="${listHotPro.downPrice}" /> ₫</ins> <del><fmt:formatNumber type="number" pattern="###,###" value="${listHotPro.price}" /> ₫</del>
                                                                </c:if>
                                                                <c:if test="${listHotPro.downPrice == null}">
                                                                    <ins><fmt:formatNumber type="number" pattern="###,###" value="${listHotPro.price}" /> ₫</ins>
                                                                </c:if>
                                                            </div>                            
                                                        </div>
                                                    </c:forEach>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="single-product-widget">
                                                    <h2 >Vừa xem</h2>
                                                    <a href="${pageContext.request.contextPath}/website/listproduct/viewed" class="wid-view-more">Xem tất cả</a>

                                                    <c:forEach var="viewedPro" items="${viewedProduct}">
                                                        <div class="single-wid-product">
                                                            <a href="${pageContext.request.contextPath}/website/singleproduct/${viewedPro.productID}">
                                                                <c:forEach items="${viewedPro.imagesCollection}" var="list">
                                                                    <c:if test="${list.mainImage == true}">
                                                                        <c:if test = "${fn:contains(list.urlImage, 'res.cloudinary.com') == false}">
                                                                            <img class="product-thumb" src="${pageContext.request.contextPath}/resources/image/img_product/${list.urlImage}" alt="">
                                                                        </c:if>
                                                                        <c:if test = "${fn:contains(list.urlImage, 'res.cloudinary.com') == true}">
                                                                            <img class="product-thumb" src="${list.urlImage}" alt="">
                                                                        </c:if>
                                                                    </c:if>
                                                                </c:forEach>
                                                            </a>
                                                            <h2><a href="${pageContext.request.contextPath}/website/singleproduct/${viewedPro.productID}">${viewedPro.productName}</a></h2>
                                                            <div class="product-wid-rating">
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                            </div>
                                                            <div class="product-wid-price">
                                                                <c:if test="${viewedPro.downPrice != null}">
                                                                    <ins><fmt:formatNumber type="number" pattern="###,###" value="${viewedPro.downPrice}" /> ₫</ins> <del><fmt:formatNumber type="number" pattern="###,###" value="${viewedPro.price}" /> ₫</del>
                                                                </c:if>
                                                                <c:if test="${viewedPro.downPrice == null}">
                                                                    <ins><fmt:formatNumber type="number" pattern="###,###" value="${viewedPro.price}" /> ₫</ins>
                                                                </c:if>
                                                            </div>                            
                                                        </div>
                                                    </c:forEach>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div> <!-- End product widget area -->

                                <div class="promo-area">
                                    <div class="zigzag-bottom"></div>
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-md-3 col-sm-6">
                                                <div class="single-promo promo1">
                                                    <i class="fa fa-refresh"></i>
                                                    <p>30 Đổi trả</p>
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-sm-6">
                                                <div class="single-promo promo2">
                                                    <i class="fa fa-truck"></i>
                                                    <p>Miễn phí vẫn chuyển</p>
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-sm-6">
                                                <div class="single-promo promo3">
                                                    <i class="fa fa-lock"></i>
                                                    <p>Thanh toán bảo mật</p>
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-sm-6">
                                                <div class="single-promo promo4">
                                                    <i class="fa fa-phone"></i>
                                                    <p>Hỗ trợ 24/7</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div> 
                                <div class="modal fade" id="alertModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
                                    <div class="vertical-alignment-helper">
                                        <div class="modal-dialog vertical-align-center modal-sm"  >
                                            <div class="modal-content">
                                                <div class="modal-body">
                                                    <img src="<c:url value="/resources/image/icon/checked.png"/>"/> <a id="alertContent" style="color: #02acea"> Thêm vào giỏ hàng thành công!</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <%@include file="/WEB-INF/views/website/fragment/webFooter.jsp" %>
                                <!-- Slider -->
                                <script src="<c:url value="/resources/websource/js/bxslider.min.js" />" type="text/javascript"></script>
                                <script src="<c:url value="/resources/websource/js/script.slider.js" />" type="text/javascript"></script>
                                <script>
                                                            //add to cart
                                                            function addToCart(productID) {
                                                                $.ajax({
                                                                    type: "POST",
                                                                    url: "${pageContext.request.contextPath}/api/cart/add",
                                                                    dataType: 'text',
                                                                    data: {
                                                                        productId: productID,
                                                                        qty: 1},
                                                                    timeout: 100000,
                                                                    success: function (result) {
                                                                        if (result == "addSuccess") {
                                                                            var count = $('#product-count').text();
                                                                            count++;
                                                                            $('#product-count').text(count);
                                                                            $("#alertContent").text("Thêm vào giỏ hàng thành công!");
                                                                            $("#alertModal").fadeTo(2000, 500).slideUp(500, function () {
                                                                                $("#alertModal").slideUp(500);
                                                                            });
                                                                        } else if (result == "duplicate") {
                                                                            $("#alertContent").text("Thêm vào giỏ hàng thành công!");
                                                                            $("#alertModal").fadeTo(2000, 500).slideUp(500, function () {
                                                                                $("#alertModal").slideUp(500);
                                                                            });
                                                                        } else {
                                                                            $("#alertContent").text("Lỗi ! Thêm thất bại.");
                                                                            $("#alertModal").fadeTo(2000, 500).slideUp(500, function () {
                                                                                $("#alertModal").slideUp(500);
                                                                            });
                                                                        }
                                                                    },
                                                                    error: function (e) {
                                                                        console.log("ERROR: ", e);
                                                                    }
                                                                });
                                                            }
                                </script>
                                </body>
                                </html>
