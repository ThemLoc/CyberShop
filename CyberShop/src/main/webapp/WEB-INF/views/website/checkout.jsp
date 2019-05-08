<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
                    <div class="col-md-1">

                    </div>

                    <div class="col-md-10">
                        <c:set var="cus" value="${sessionScope.CUSTOMER_INFO}"/>
                        <sf:form method="post" action="${pageContext.request.contextPath}/website/checkout/add" modelAttribute="CusomerInfor">
                            <c:if test="${ not empty cus}">
                                <div class="product-content-right">
                                    <h3 id="order_review_heading">Thông tin vận chuyển</h3>
                                    <div class="woocommerce">
                                        <div id="customer_details" class="col2-set">
                                            <div class="col-12">
                                                <div class="woocommerce-billing-fields">
                                                    <div class="col-md-6">

                                                        <p id="billing_first_name_field" class="form-row form-row-first validate-required">
                                                            <label class="" for="billing_first_name">Họ và tên <abbr title="required" class="required">*</abbr>
                                                            </label>
                                                            <input type="text" disabled="true" value="${cus.fullname}" placeholder="" id="billing_first_name" class="input-text ">
                                                        </p>

                                                        <!--                                            <div class="clear"></div>-->
                                                        <p id="billing_address_1_field" class="form-row form-row-wide address-field validate-required">
                                                            <label class="" for="billing_address_1">Địa chỉ <abbr title="required" class="required">*</abbr>
                                                            </label>
                                                            <input type="text"  value="${cus.address}" placeholder="" id="billing_address_1"  class="input-text ">
                                                        </p>
                                                        <!--                                                    <p id="billing_company_field" class="form-row form-row-wide">
                                                        
                                                                                                                <label class="" for="billing_address_1">Mã KHuyến mãi:
                                                                                                                </label>
                                                                                                                <input type="text" value="" placeholder="" id="billing_address_1" name="promotion" class="input-text" style="width: 75%"/>
                                                                                                                <a href="#" class="btn btn-danger">Áp Dụng</a>
                                                                                                            </p>-->
                                                    </div>
                                                    <div class="col-md-6">

                                                        <p id="billing_first_name_field" class="form-row form-row-first validate-required">
                                                            <label class=""  for="billing_first_name">Email: 
                                                            </label>
                                                            <input type="text" disabled="true" value="${cus.email}" placeholder="" id="billing_first_name"  class="input-text ">

                                                        </p>

                                                        <!--                                            <div class="clear"></div>-->
                                                        <p id="billing_address_1_field" class="form-row form-row-wide address-field validate-required">
                                                            <label class="" for="billing_address_1">Số điện thoại:  <abbr title="required" class="required">*</abbr>
                                                            </label>
                                                            <input type="text" disabled="true" value="${cus.phone}" placeholder="" id="billing_address_1"  class="input-text ">
                                                        </p>

                                                    </div>
                                                </div>
                                            </div>


                                        </div>

                                    </div>

                                </div>
                            </c:if>
                            <c:if test="${empty cus}">



                                <div class="product-content-right">
                                    <h3 id="order_review_heading">Thông tin vận chuyển</h3>
                                    <div class="woocommerce">
                                        <div id="customer_details" class="col2-set">
                                            <div class="col-12">
                                                <div class="woocommerce-billing-fields">
                                                    <div class="col-md-6">

                                                        <p id="billing_first_name_field" class="form-row form-row-first validate-required">
                                                            <label class="" for="billing_first_name">Họ và tên <abbr title="required" class="required">*</abbr>
                                                            </label>
                                                            <input type="text" value="" placeholder="" id="billing_first_name" name="fullname" class="input-text ">
                                                        </p>

                                                        <!--                                            <div class="clear"></div>-->
                                                        <p id="billing_address_1_field" class="form-row form-row-wide address-field validate-required">
                                                            <label class="" for="billing_address_1">Địa chỉ <abbr title="required" class="required">*</abbr>
                                                            </label>
                                                            <input type="text" value="" placeholder="" id="billing_address_1" name="address" class="input-text ">
                                                        </p>
                                                        <!--                                                        <p id="billing_company_field" class="form-row form-row-wide">
                                                        
                                                                                                                    <label class="" for="billing_address_1">Mã KHuyến mãi:
                                                                                                                    </label>
                                                                                                                    <input type="text" value="" placeholder="" id="billing_address_1" name="promotion" class="input-text" style="width: 75%"/>
                                                                                                                    <a href="#" class="btn btn-danger">Áp Dụng</a>
                                                                                                                </p>-->
                                                    </div>
                                                    <div class="col-md-6">

                                                        <p id="billing_first_name_field" class="form-row form-row-first validate-required">
                                                            <label class="" for="billing_first_name">Email: 
                                                            </label>
                                                            <input type="text" value="" required="true" placeholder="" id="billing_first_name" name="email" class="input-text ">

                                                        </p>

                                                        <!--                                            <div class="clear"></div>-->
                                                        <p id="billing_address_1_field" class="form-row form-row-wide address-field validate-required">
                                                            <label class="" for="billing_address_1">Số điện thoại:  <abbr title="required" class="required">*</abbr>
                                                            </label>
                                                            <input type="text" pattern="\d*" maxlength="10" minlength="10" class="form-control" required name="phone" placeholder="phone">
                                                        </p>

                                                    </div>
                                                </div>
                                            </div>


                                        </div>

                                    </div>

                                </div>

                            </c:if>



                            <h3 id="order_review_heading">Hóa đơn</h3>

                            <div id="order_review" style="position: relative;">
                                <table class="shop_table">
                                    <thead>
                                        <tr>
                                            <th class="product-thumbnail">Hình sản phẩm</th>
                                            <th class="product-name">Sản phẩm</th>
                                            <th class="product-price">Giá</th>
                                            <th class="product-quantity">Số lượng</th>
                                            <th class="product-subtotal">Tổng tiền</th>

                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="pd" items="${sessionScope.cart.detail}">
                                            <tr class="cart_item">
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
                                                        <span class="amount">
                                                            <fmt:formatNumber type="number" pattern="###,###" value="${pd.value.item.price}" />₫
                                                        </span> 
                                                      
                                                    </span> 
                                                </td>

                                                <td class="product-quantity">
                                                    <div class="quantity buttons_added">
                                                        ${pd.value.qty}
                                                    </div>
                                                </td>

                                                <td class="product-subtotal">
                                                    <span class="amount">
                                                        <fmt:formatNumber type="number" pattern="###,###" value=" ${pd.value.total}" />₫
                                       
                                                    </span> 
                                                </td>
                                            </tr>
                                        </c:forEach>

                                    </tbody>
                                    <tfoot>

                                        <!--                                    <tr class="cart-subtotal">
                                                                                <th>Tổng tiền sản phẩm</th> 
                                                                                <td><span class="amount">26,400,000₫</span>
                                                                                </td>
                                                                            </tr>-->

                                        <tr class="shipping">
                                            <th colspan="4">Phí vận chuyển</th>
                                            
                                            <td>
                                                Miễn phí
                                                <input type="hidden" class="shipping_method" value="free_shipping" id="shipping_method_0" data-index="0" name="shipping_method[0]">
                                            </td>
                                        </tr>
                                         <tr class="order-total">
                                             <th colspan="4">Tổng tiền Sản Phẩm</th>
                                            
                                            <td><strong><span class="amount"> <fmt:formatNumber type="number" pattern="###,###" value=" ${sessionScope.cart.totalOrder}" />₫</span></td>
                                        </tr>
                                         <tr class="order-total">
                                             <th colspan="4">Mã Giảm Giá (<strong> ${sessionScope.cart.promotion.promoCode}</strong>)</th>
                                           
                                            <td>${sessionScope.cart.promotion.discount}%</td>
                                        </tr>


                                        <tr class="order-total">
                                            <th colspan="4">Tổng hóa đơn</th>
                                            
                                            <td><strong><span class="amount"> <fmt:formatNumber type="number" pattern="###,###" value=" ${sessionScope.cart.totalAfterDiscount}" />₫</span></strong> </td>
                                        </tr>

                                    </tfoot>
                                </table>


                                <div id="payment">
                                    <ul class="payment_methods methods">
                                        <li class="payment_method_bacs">
                                            <input type="radio" data-order_button_text="" checked="checked" value="bacs" name="payment_method" class="input-radio" id="payment_method_bacs">
                                            <label for="payment_method_bacs">Thanh toán khi nhận hàng </label>

                                        </li>
<!--                                        <li class="payment_method_cheque">
                                            <input type="radio" data-order_button_text="" value="cheque" name="payment_method" class="input-radio" id="payment_method_cheque">
                                            <label for="payment_method_cheque">Thẻ ATM nội địa (Miễn phí thanh toán)</label>
                                            <div style="display:none;" class="payment_box payment_method_cheque">
                                            </div>
                                        </li>
                                        <li class="payment_method_paypal">
                                            <input type="radio" data-order_button_text="Proceed to PayPal" value="paypal" name="payment_method" class="input-radio" id="payment_method_paypal">
                                            <label for="payment_method_paypal">
                                                Thanh toán bằng thẻ quốc tế <img alt="PayPal Acceptance Mark" src="https://www.paypalobjects.com/webstatic/mktg/Logo/AM_mc_vs_ms_ae_UK.png">
                                            </label>
                                            <div style="display:none;" class="payment_box payment_method_paypal">
                                                <p>Pay via PayPal; you can pay with your credit card if you don’t have a PayPal account.</p>
                                            </div>
                                        </li>-->
                                    </ul>

                                    <div class="form-row place-order">

                                        <input type="submit" data-value="Đặt hàng" value="Đặt hàng" id="place_order" name="woocommerce_checkout_place_order" class="button alt">
                                        
                                    </div>

                                    <div class="clear"></div>

                                </div>
                            </div>

                        </sf:form>
                    </div>                       
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
