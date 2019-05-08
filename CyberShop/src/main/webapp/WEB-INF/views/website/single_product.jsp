<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>

<html lang="en">
    <head>
        <%@include file="/WEB-INF/views/website/fragment/css.jsp" %>
    </head>
    <body>
        <%@include file="/WEB-INF/views/website/fragment/webHeader.jsp" %>
        <div class="single-product-area">
            <div class="zigzag-bottom"></div>
            <div class="container">
                <div class="row">

                    <div class="col-md-12">
                        <div class="product-content-right">
                            </br>
                            <div class="row">
                                <div class="col-sm-6" style="padding-right: 40px">

                                    <c:forEach var="lImg" items="${product.imagesCollection}">
                                        <c:if test="${lImg.mainImage == true}" >
                                            <img class="mySlides" src="<c:url value="/resources/image/img_product/${lImg.urlImage}"/>" style="width:100%;height: 450px">
                                        </c:if>
                                        <c:if test="${lImg.mainImage == false}" >  
                                            <img class="mySlides" src="<c:url value="/resources/image/img_product/${lImg.urlImage}"/>" style="width:100% ;height: 450px;display:none">
                                        </c:if>

                                    </c:forEach>

                                    <div class="w3-row-padding w3-section">
                                        <c:forEach var="lImg" items="${product.imagesCollection}" varStatus="counter">
                                            <div class="w3-col s2">
                                                <img class="demo w3-opacity w3-hover-opacity-off" src="<c:url value="/resources/image/img_product/${lImg.urlImage}"/>" style="width:100%;height: 50px;cursor:pointer" onclick="currentDiv(${counter.count})">
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="product-inner">
                                        <h2 class="product-name">${product.productName}</h2>
                                        <div class="product-inner-price">
                                            <c:if test="${not empty product.downPrice}">
                                                <del>
                                                    <fmt:formatNumber type="number" pattern="###,###" value="${product.price}" />₫
                                                </del>
                                                <ins>
                                                    <fmt:formatNumber type="number" pattern="###,###" value="${product.downPrice}" />₫
                                                </ins>

                                            </c:if>
                                            <c:if test="${empty product.downPrice}">
                                                <ins>
                                                    <fmt:formatNumber type="number" pattern="###,###" value="${product.price}" />₫
                                                </ins>
                                            </c:if>
                                        </div>    
                                        <br/>
                                        <div class="quantity">
                                            <input id="inputQuantity" size="10" type="number"  class="input-text qty text" title="Qty" value="1" name="quantity" min="1" step="1" max="${product.quantity}">
                                        </div>
                                        <button onclick="addToCart(${product.productID},${product.quantity})" class="add_to_cart_button" type="button" >Thêm vào giỏ hàng</button>
                                        <br/><br/>
                                        <p style="color: #999;font-size: 12px">  Còn ${product.quantity} sản phẩm</p>
                                        <div style="height: 100px;"></div>
                                        <div class="desc" role="tabpanel">
                                            <ul class="product-tab" role="tablist">
                                                <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">Thông số kĩ thuật</a></li>
                                                <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">Đánh giá</a></li>
                                            </ul>
                                            <div class="tab-content">
                                                <div role="tabpanel" class="tab-pane fade in active" id="home">
                                                    <table border="1" class="table table-bordered table-hover">
                                                        <thead>
                                                            <tr>
                                                                <th>Specification Title</th>
                                                                <th>Value</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <c:forEach items="${listSpec}" var="spec">
                                                                <tr>
                                                                    <td>${spec.title}</td>
                                                                    <td>${spec.value}</td>
                                                                </tr>
                                                            </c:forEach>
                                                        </tbody>
                                                    </table>


                                                </div>
                                                <div role="tabpanel" class="tab-pane fade" id="profile">
                                                    <!--<h2>Đánh gi</h2>-->
                                                    <div class="fb-comments" data-href="http://localhost:8084/CyberShop/singleproduct/${product.productID}" data-width="" data-numposts="5"></div>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>


                            <div class="related-products-wrapper">
                                <h2 class="related-products-title">Sản phẩm liên quan</h2>
                                <div class="related-products-carousel">
                                    <c:forEach items="${listSame}" var="item">
                                        <div class="single-product">
                                            <div class="product-f-image">
                                                <c:forEach items="${item.imagesCollection}" var="img">
                                                    <c:if test="${img.mainImage == true}">
                                                        <img src="<c:url value="/resources/image/img_product/${img.urlImage}"/>" alt="" class="img-thumbnail">
                                                    </c:if>
                                                </c:forEach>
                                                <div class="product-hover">
                                                    <a onclick="addToCart(${item.productID})" class="add-to-cart-link"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</a>
                                                    <a href="${pageContext.request.contextPath}/website/singleproduct/${item.productID}" class="view-details-link"><i class="fa fa-link"></i> Xem chi tiết</a>
                                                </div>
                                            </div>

                                            <h2><a href="${pageContext.request.contextPath}/website/singleproduct/${item.productID}">${item.productName}</a></h2>

                                            <div class="product-carousel-price">
                                                <c:if test="${not empty item.downPrice}">
                                                    <del>
                                                        <fmt:formatNumber type="number" pattern="###,###" value="${item.price}" />₫
                                                    </del>
                                                    <ins>
                                                        <fmt:formatNumber type="number" pattern="###,###" value="${item.downPrice}" />₫
                                                    </ins>

                                                </c:if>
                                                <c:if test="${empty item.downPrice}">
                                                    <ins>
                                                        <fmt:formatNumber type="number" pattern="###,###" value="${item.price}" />₫
                                                    </ins>
                                                </c:if>
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

        <!--Alert Result-->
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
        <script>


            function currentDiv(n) {
                showDivs(slideIndex = n);
            }

            function showDivs(n) {
                var i;
                var x = document.getElementsByClassName("mySlides");
                var dots = document.getElementsByClassName("demo");
                if (n > x.length) {
                    slideIndex = 1
                }
                if (n < 1) {
                    slideIndex = x.length
                }
                for (i = 0; i < x.length; i++) {
                    x[i].style.display = "none";
                }
                for (i = 0; i < dots.length; i++) {
                    dots[i].className = dots[i].className.replace(" w3-opacity-off", "");
                }
                x[slideIndex - 1].style.display = "block";
                dots[slideIndex - 1].className += " w3-opacity-off";
            }

            function addToCart(productID, maxQuantity) {

                var quantity = $("#inputQuantity").val();
                if (quantity < 0 || quantity > maxQuantity) {
                    console.log(maxQuantity);
                    $("#alertContent").text("Lỗi ! Thêm thất bại. Sản phẩm đã hết hàng!");
                    $("#alertModal").fadeTo(2000, 500).slideUp(500, function () {
                        $("#alertModal").slideUp(500);
                    });
                } else {
                    $.ajax({
                        type: "POST",
                        url: "${pageContext.request.contextPath}/api/cart/add",
                        dataType: 'text',
                        data: {
                            productId: productID,
                            qty: quantity},
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
            }


        </script>
    </body>
    <div id="fb-root"></div>
    <script async defer crossorigin="anonymous" src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v3.2"></script>
</html>
