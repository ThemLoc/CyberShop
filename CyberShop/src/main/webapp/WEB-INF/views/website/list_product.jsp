<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html lang="en">
    <head>
        <%@include file="/WEB-INF/views/website/fragment/css.jsp" %>
    </head>
    <body>
        <%@include file="/WEB-INF/views/website/fragment/webHeader.jsp" %>

        <!--
                <div class="product-big-title-area">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="product-bit-title text-center">
                                    <h2>Shop</h2>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>-->


        <div class="single-product-area">
            
            <div class="zigzag-bottom"></div>
            <div class="container">
                <div class="row">
                    <c:forEach items="${listProduct}" var="pd">
                        <div class="col-md-3 col-sm-6">
                            <div class="single-shop-product">
                                <div class="product-upper">
                                    <c:forEach items="${pd.imagesCollection}" var="img">
                                        <c:if test="${img.mainImage == true}">
                                            <img src="<c:url value="/resources/image/img_product/${img.urlImage}"/>" style="width: 100%;height: 250px" class="img-thumbnail">
                                        </c:if>
                                    </c:forEach>
                                </div>
                                <h2><a href="${pageContext.request.contextPath}/website/singleproduct/${pd.productID}">${pd.productName}</a></h2>
                                <div class="product-carousel-price">
                                    <c:if test="${not empty pd.downPrice}">
                                        <ins>${pd.downPrice}đ</ins> <del>${pd.price}đ</del>
                                    </c:if>
                                    <c:if test="${empty pd.downPrice}">
                                        <ins>${pd.price}đ</ins>
                                    </c:if>
                                </div>  

                                <div class="product-option-shop">
                                    <a onclick="addToCart(${pd.productID})" class="add_to_cart_button" data-quantity="1" data-product_sku="" data-product_id="70" rel="nofollow" >Add to cart</a>
                                </div>                       
                            </div>
                        </div>
                    </c:forEach>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="product-pagination text-center">
                            <nav>
                                <ul class="pagination">
                                    <li>
                                        <a href="#" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>
                                    <li><a href="#">1</a></li>
                                    <li><a href="#">2</a></li>
                                    <li><a href="#">3</a></li>
                                    <li><a href="#">4</a></li>
                                    <li><a href="#">5</a></li>
                                    <li>
                                        <a href="#" aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                        </a>
                                    </li>
                                </ul>
                            </nav>                        
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--Alert Result-->
        <div class="modal fade" id="alertModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
            <div class="vertical-alignment-helper">
                <div class="modal-dialog vertical-align-center modal-sm"  >
                    <div class="modal-content">
                        <div class="modal-body">
                            <img src="<c:url value="/resources/image/icon/checked.png"/>"/> <a style="color: #02acea"> Thêm vào giỏ hàng thành công!</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="/WEB-INF/views/website/fragment/webFooter.jsp" %>   

        <script>
            function addToCart(productID) {
                $("#alertModal").fadeTo(2000, 500).slideUp(500, function () {
                    $("#alertModal").slideUp(500);
                });
                var count = $('#product-count').text();
                count++;
                $('#product-count').text(count);

            }
        </script>
    </body>
</html>
