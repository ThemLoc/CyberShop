<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
    <body>
        <%@include file="/WEB-INF/views/website/fragment/webHeader.jsp" %>
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
                                            <img class="km" src="${pageContext.request.contextPath}/resources/image/img_product/${b.urlImage}" alt="slide"/>
                                        </c:if>
                                    </c:forEach>
                                </div>
                                <div class="col-md-5">
                                    <div class="caption-group" style="margin-top: 150px; margin-left: 20px">
                                        <h2 class="caption title">
                                            <p class="caption title animated fadeInRight" style="display: block;">
                                                <span class="primary"><strong>${a.productID.productName}</strong></span><br/>
                                            </p>
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
                                                    <img class="p1" src="${pageContext.request.contextPath}/resources/image/img_product/${list.urlImage}" alt="">
                                                </c:if>
                                            </c:forEach>
                                            <div class="product-hover">
                                                <a href="#" class="add-to-cart-link"><i class="fa fa-shopping-cart"></i>Thêm vào giỏ</a>
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
                                                            <img class="p1" src="${pageContext.request.contextPath}/resources/image/img_product/${list.urlImage}" alt="">
                                                        </c:if>
                                                    </c:forEach>
                                                    <div class="product-hover">
                                                        <a href="#" class="add-to-cart-link"><i class="fa fa-shopping-cart"></i>Thêm vào giỏ</a>
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
                                <a href="${pageContext.request.contextPath}/website/listproduct/brand/${brandList.brandID}"><img style="width: 250px;height: 140px" src="${pageContext.request.contextPath}/resources/image/img_brand/${brandList.imageURL}"/></a>
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
                                    <ins><fmt:formatNumber type="number" pattern="###,###" value="${sellProduct.price}" /> ₫</ins>
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
                                    <ins><fmt:formatNumber type="number" pattern="###,###" value="${listHotPro.price}" /> ₫</ins>
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
                                            <img class="product-thumb" src="${pageContext.request.contextPath}/resources/image/img_product/${list.urlImage}" alt="">
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
                                    <ins><fmt:formatNumber type="number" pattern="###,###" value="${viewedPro.price}" /> ₫</ins>
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
    <%@include file="/WEB-INF/views/website/fragment/webFooter.jsp" %>
    <!-- Slider -->
    <script src="<c:url value="/resources/websource/js/bxslider.min.js" />" type="text/javascript"></script>
    <script src="<c:url value="/resources/websource/js/script.slider.js" />" type="text/javascript"></script>
</body>
</html>
