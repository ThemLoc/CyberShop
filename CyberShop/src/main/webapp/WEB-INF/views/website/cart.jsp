<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>

<html lang="en">
    <head>
        <%@include file="/WEB-INF/views/website/fragment/css.jsp" %>
    </head>
    <body>
        <%@include file="/WEB-INF/views/website/fragment/webHeader.jsp" %>
        <!-- End Page title area -->

        <div class="single-product-area">
            <div class="zigzag-bottom"></div>
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="product-content-right">
                            <div class="woocommerce">
                                <form method="post" action="#">
                                    <table cellspacing="0" class="shop_table cart">
                                        <thead>
                                            <tr>
                                                <th class="product-remove">&nbsp;</th>
                                                <th class="product-thumbnail">&nbsp;</th>
                                                <th class="product-name">Sản phẩm</th>
                                                <th class="product-price">Giá</th>
                                                <th class="product-quantity">Số lượng</th>
                                                <th class="product-subtotal">Tổng tiền</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="pd" items="${sessionScope.cart.detail}">
                                                <tr class="cart_item">
                                                    <td class="product-remove">
                                                        <a title="Remove this item" class="remove" href="#">×</a> 
                                                    </td>
                                                    <c:forEach var="image" items="${pd.value.item.imagesCollection}">
                                                        <c:if test="${image.mainImage == true}">
                                                            <td class="product-thumbnail">
                                                                <a href="single-product.html">
                                                                    <img width="145" height="145" alt="poster_1_up" class="shop_thumbnail" 
                                                                         src="<c:url value="/resources/image/img_product/${image.urlImage}"/>">
                                                                </a>
                                                            </td>
                                                        </c:if>
                                                    </c:forEach>

                                                    <td class="product-name" style="text-align: left">
                                                        <a href="single-product.html">${pd.value.item.productName}</a> 
                                                    </td>

                                                    <td class="product-price">
                                                        <span class="amount">
                                                            <fmt:formatNumber type="number" pattern="###,###" value="${pd.value.item.price}" />₫
                                                        </span> 
                                                    </td>

                                                    <td class="product-quantity">
                                                        <div class="quantity buttons_added">
                                                            <input onclick="subQuantity(${pd.value.item.productID})" type="button" class="minus" value="-">
                                                            <input id="quantity${pd.value.item.productID}" type="number" size="4" class="input-text qty text" title="Qty" value="${pd.value.qty}" min="0" step="1">
                                                            <input onclick="addQuantity(${pd.value.item.productID})" type="button" class="plus" value="+">
                                                        </div>
                                                    </td>

                                                    <td class="product-subtotal">
                                                        <span class="amount">
                                                            <fmt:formatNumber type="number" pattern="###,###" value="${pd.value.total}" />₫
                                                        </span> 
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            <tr>
                                                <td class="actions" colspan="6">
                                                    <div class="coupon">
                                                        <label for="coupon_code">Mã giảm giá:</label>
                                                        <input type="text" placeholder="Mã giảm giá" value="" id="coupon_code" class="input-text" name="coupon_code">
                                                        <input type="submit" value="Áp dụng" name="apply_coupon" class="button">
                                                    </div>
                                                    <input class="updateCart" type="submit" value="Cập nhật giỏ hàng" name="update_cart" class="button">

                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </form>

                                <div class="cart-collaterals">



                                    <div class="cart_totals ">
                                        <h2>Tổng tiền giỏ hàng</h2>

                                        <table cellspacing="0">
                                            <tbody>
                                                <tr class="cart-subtotal">
                                                    <th>Tổng tiền sản phẩm</th>
                                                    <td>
                                                        <span class="amount">
                                                            <fmt:formatNumber type="number" pattern="###,###" value="${sessionScope.cart.totalOrder}" />₫
                                                        </span>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>

                                </div>
                                <div class="col-md-12 checkOut">
                                    <input id="checkout" type="submit" value="Thanh toán" name="proceed" class="checkout-button button alt">
                                </div>
                            </div>                        
                        </div>                    
                    </div>
                </div>
            </div>
        </div>
        <%@include file="/WEB-INF/views/website/fragment/webFooter.jsp" %>
    </body>
    <script>
        function subQuantity(productID) {
            var quantity = $('#quantity' + productID).val();
            if (quantity > 1) {
                quantity--;
            }
            $('#quantity' + productID).val(quantity);
        }
        function addQuantity(productID) {
            var quantity = $('#quantity' + productID).val();
//            if (quantity > 1) {
                quantity++;
//            }
            $('#quantity' + productID).val(quantity);
        }
    </script>
</html>
