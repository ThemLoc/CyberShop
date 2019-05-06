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
        <c:if test="${sessionScope.cart != null}">
            <c:if test="${sessionScope.cart.detail.size() != 0}">
                <div class="single-product-area">
                    <div class="zigzag-bottom"></div>
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="product-content-right">
                                    <div class="woocommerce">
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
                                                    <tr id="tr_item${pd.value.item.productID}" class="cart_item">
                                                        <td class="product-remove">
                                                            <a title="Remove this item" class="remove" onclick="removeItemInCart(${pd.value.item.productID})">×</a> 
                                                        </td>
                                                        <c:forEach var="image" items="${pd.value.item.imagesCollection}">
                                                            <c:if test="${image.mainImage == true}">
                                                                <td class="product-thumbnail">
                                                                    <a href="${pageContext.request.contextPath}/website/singleproduct/${pd.value.item.productID}">
                                                                        <img width="145" height="145" alt="poster_1_up" class="shop_thumbnail" 
                                                                             src="<c:url value="/resources/image/img_product/${image.urlImage}"/>">
                                                                    </a>
                                                                </td>
                                                            </c:if>
                                                        </c:forEach>

                                                        <td class="product-name" style="text-align:left">
                                                            <a href="${pageContext.request.contextPath}/website/singleproduct/${pd.value.item.productID}">${pd.value.item.productName}</a> 
                                                        </td>

                                                        <td class="product-price">
                                                            <span id="" class="amount">
                                                                <c:if test="${pd.value.item.downPrice == null}">
                                                                    <fmt:formatNumber type="number" pattern="###,###" value="${pd.value.item.price}" />
                                                                    <input id="pd_price${pd.value.item.productID}" type="hidden" value="${pd.value.item.price}"/>
                                                                </c:if>
                                                                <c:if test="${pd.value.item.downPrice != null}">
                                                                    <fmt:formatNumber type="number" pattern="###,###" value="${pd.value.item.downPrice}" />
                                                                    <input id="pd_price${pd.value.item.productID}" type="hidden" value="${pd.value.item.downPrice}"/>
                                                                </c:if>

                                                            </span> 
                                                            đ
                                                        </td>

                                                        <td class="product-quantity">
                                                            <div class="quantity buttons_added">
                                                                <input onclick="subQuantity(${pd.value.item.productID})" type="button" class="minus" value="-">
                                                                <input id="quantity${pd.value.item.productID}" type="number" size="4" class="input-text qty text quantity_pd"  title="Qty" value="${pd.value.qty}" min="0" step="1">
                                                                <input onclick="addQuantity(${pd.value.item.productID})" type="button" class="plus" value="+">
                                                            </div>
                                                        </td>

                                                        <td class="product-subtotal">
                                                            <span id="pd_total${pd.value.item.productID}" class="amount">
                                                                <fmt:formatNumber  type="number" pattern="###,###" value="${pd.value.total}" />
                                                            </span> 
                                                            ₫
                                                        </td>
                                                    </tr>
                                                </c:forEach>

                                                <tr>
                                                    <td class="actions" colspan="6">
                                                        <div class="coupon">
                                                            <label for="coupon_code">Mã giảm giá:</label>
                                                            <input id="promotionCode" type="text" placeholder="Mã giảm giá" value="" id="coupon_code" class="input-text" name="coupon_code">
                                                            <input onclick="checkPromotion()" type="submit" value="Áp dụng" name="apply_coupon" class="button">
                                                            <a id="alertAboutPromo" style="color: red;display: none">Mã giảm giá không hợp lệ hoặc đã hết hạn sử dụng</a>
                                                        </div>
                                                        <input onclick="updateCart()" class="updateCart" type="submit" value="Cập nhật giỏ hàng" name="update_cart" class="button">

                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>

                                        <div class="cart-collaterals">

                                            <div class="cart_totals ">
                                                <h2>Tổng tiền giỏ hàng</h2>

                                                <table cellspacing="0">
                                                    <tbody>
                                                        <tr class="cart-subtotal">
                                                            <th>Tổng tiền sản phẩm</th>
                                                            <td>
                                                                <input id="sum_total" type="hidden" value="${sessionScope.cart.totalOrder}"/>
                                                                <span id="span_sum_total" class="amount">
                                                                    <fmt:formatNumber type="number" pattern="###,###" value="${sessionScope.cart.totalOrder}" />
                                                                </span>
                                                                ₫
                                                            </td>
                                                        </tr>
                                                        <tr class="cart-subtotal">
                                                            <th>Giảm giá</th>
                                                            <td>
                                                                <span id="span_sale_price" class="amount">
                                                                    <c:if test="${not empty sessionScope.cart.promotion}">
                                                                        <strong> ${sessionScope.cart.promotion.promoCode}</strong>
                                                                        ${sessionScope.cart.promotion.discount}

                                                                    </c:if>
                                                                </span>
                                                                %
                                                            </td>
                                                        </tr>
                                                        <tr class="cart-subtotal">
                                                            <th>Tổng tiền</th>
                                                            <td>
                                                                <span id="span_final_total" class="amount"> 
                                                                    <fmt:formatNumber type="number" pattern="###,###" value="${sessionScope.cart.totalAfterDiscount}" />
                                                                </span>
                                                                ₫
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>

                                        </div>
                                        <div class="col-md-12 checkOut">
                                            <a href="${pageContext.request.contextPath}/website/checkout">
                                                <input id="checkout" type="submit" value="Thanh toán" name="proceed" class="checkout-button button alt">
                                            </a>
                                        </div>
                                    </div>                        
                                </div>                    
                            </div>
                        </div>
                    </div>
                </div>
            </c:if>
            <c:if test="${sessionScope.cart.detail.size() == 0}">
                <div class="row text-center" style="height: 150px;margin-top: 50px">
                    <img src="${pageContext.request.contextPath}/resources/image/icon/empty-cart.png"/>
                </div>
                <div class="text-center row" style="height: 300px">
                    <h3>Bạn chưa có sản phẩm nào trong giỏ hàng!</h3>
                    <br/>
                    <h4> <a style="color: #007bb6" href="${pageContext.request.contextPath}/website/home">Về trang chủ</a></h4>
                </div>
            </c:if>

        </c:if>
        <c:if test="${sessionScope.cart == null}">
            <div class="row text-center" style="height: 150px;margin-top: 50px">
                <img src="${pageContext.request.contextPath}/resources/image/icon/empty-cart.png"/>
            </div>
            <div class="text-center row" style="height: 300px">
                <h3>Bạn chưa có sản phẩm nào trong giỏ hàng!</h3>
                <br/>
                <h4> <a style="color: #007bb6" href="${pageContext.request.contextPath}/website/home">Về trang chủ</a></h4>
            </div>
        </c:if>
        <!--Alert Result-->
        <div class="modal fade" id="alertModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
            <div class="vertical-alignment-helper">
                <div class="modal-dialog vertical-align-center modal-sm"  >
                    <div class="modal-content">
                        <div class="modal-body">
                            <img src="<c:url value="/resources/image/icon/checked.png"/>"/> <a id="alertContent" style="color: #02acea"> </a>
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
                var price = $("#pd_price" + productID).val();
                var total = price * quantity;
                $("#pd_total" + productID).text(formatNumber(total, ',', '.'));
                $('#quantity' + productID).val(quantity);

                var sum_total = $("#sum_total").val();
                var new_sum_total = sum_total - price;
                $("#sum_total").val(new_sum_total);
                $("#span_sum_total").text(formatNumber(new_sum_total, ',', '.'));
            }
        }
        function addQuantity(productID) {
            var quantity = $('#quantity' + productID).val();
            quantity++;
            var price = $("#pd_price" + productID).val();
            var total = price * quantity;
            $("#pd_total" + productID).text(formatNumber(total, ',', '.'));
            $('#quantity' + productID).val(quantity);

            var sum_total = $("#sum_total").val();
            var new_sum_total = sum_total * 1 + price * 1;
            console.log(new_sum_total);
            $("#sum_total").val(new_sum_total);
            console.log(formatNumber(new_sum_total, ',', '.'));
            $("#span_sum_total").text(formatNumber(new_sum_total, ',', '.'));
        }

        //format price
        function formatNumber(nStr, decSeperate, groupSeperate) {
            nStr += '';
            x = nStr.split(decSeperate);
            x1 = x[0];
            x2 = x.length > 1 ? '.' + x[1] : '';
            var rgx = /(\d+)(\d{3})/;
            while (rgx.test(x1)) {
                x1 = x1.replace(rgx, '$1' + groupSeperate + '$2');
            }
            return x1 + x2;
        }

        function removeItemInCart(productID) {
            $("#tr_item" + productID).remove();
            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/api/cart/remove/" + productID,
                dataType: 'text',
                timeout: 100000,
                success: function (result) {
                    if (result == "success") {
//                        var count = $('#product-count').text();
//                        count--;
//                        $('#product-count').text(count);
//                        $("#alertContent").text("Remove thành công!");
//                        $("#alertModal").fadeTo(2000, 500).slideUp(500, function () {
//                            $("#alertModal").slideUp(500);
//                        });
                        window.location.reload();
                    } else if (result == "fail") {
                        $("#alertContent").text("Remove fail!");
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
        function updateCart() {
            var check = true;
            $(".quantity_pd").each(function () {
                var quantity = $(this).val();
                if (quantity < 1) {
                    check = false;
                }
            });
            if (check) {
                $(".quantity_pd").each(function () {
                    var id = $(this).attr('id');
                    var productId = id.replace("quantity", "");
                    var quantity = $(this).val();
                    $.ajax({
                        type: "POST",
                        url: "${pageContext.request.contextPath}/api/cart/update",
                        dataType: 'text',
                        data: {
                            productId: productId,
                            qty: quantity},
                        timeout: 100000,
                        success: function (result) {
                            if (result == "success") {
                                window.location.reload();
//                                $("#alertContent").text("Update giỏ hàng thành công!");
//                                $("#alertModal").fadeTo(2000, 500).slideUp(500, function () {
//                                    $("#alertModal").slideUp(500);
//                                });
                            } else {
                                $("#alertContent").text("Lỗi ! Update thất bại.");
                                $("#alertModal").fadeTo(2000, 500).slideUp(500, function () {
                                    $("#alertModal").slideUp(500);
                                });
                            }
                        },
                        error: function (e) {
                            console.log("ERROR: ", e);
                        }
                    });
                });
            } else {
                $("#alertContent").text("Lỗi! Quantity must > 1");
                $("#alertModal").fadeTo(2000, 500).slideUp(500, function () {
                    $("#alertModal").slideUp(500);
                });
            }
            ;

        }

        function checkPromotion() {
            var promotion = $("#promotionCode").val().trim();
            if (promotion == '') {
                alert("Mã giảm giá không hợp lệ hoặc đã hết hạn sử dụng");
                window.location.reload();
//                $("#span_sale_price").text("0");
//                $("#alertAboutPromo").text(" Mã giảm giá không hợp lệ hoặc đã hết hạn sử dụng");
//                $("#alertAboutPromo").show();
            } else {
                $("#alertAboutPromo").hide();
                $.ajax({
                    type: "GET",
                    url: "${pageContext.request.contextPath}/api/cart/checkPromotion/" + promotion,
                    dataType: 'text',
                    timeout: 100000,
                    success: function (result) {
                        if (result == "invalid") {
                            alert("Mã giảm giá không hợp lệ hoặc đã hết hạn sử dụng");
                            window.location.reload();
                            //                            $("#span_sale_price").text("0");
//                            $("#alertAboutPromo").text(" Mã giảm giá không hợp lệ hoặc đã hết hạn sử dụng");
//                            $("#alertAboutPromo").show();
                        } else {
                            window.location.reload();
//                            $("#alertAboutPromo").text(" Giảm giá : " + result + " %");
//                            $("#span_sale_price").text(result);
//                            $("#alertAboutPromo").show();
                        }
                    },
                    error: function (e) {
                        console.log("ERROR: ", e);
                    }
                });
            }
        }
    </script>
</html>
