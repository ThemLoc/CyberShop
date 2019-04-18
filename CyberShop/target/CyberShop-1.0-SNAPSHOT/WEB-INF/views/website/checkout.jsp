<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Thanh toán</title>

        <!-- Google Fonts -->
        <link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,200,300,700,600' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:400,700,300' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Raleway:400,100' rel='stylesheet' type='text/css'>

        <!-- Bootstrap -->
        <link href="<c:url value="/resources/websource/css/bootstrap.min.css" />" rel="stylesheet">
        <!-- Font Awesome -->
        <link href="<c:url value="/resources/websource/css/font-awesome.min.css" />" rel="stylesheet">
        <!-- Custom CSS -->
        <link href="<c:url value="/resources/websource/css/owl.carousel.css" />" rel="stylesheet">
        <link href="<c:url value="/resources/websource/style.css" />" rel="stylesheet">
        <link href="<c:url value="/resources/websource/css/responsive.css" />" rel="stylesheet">
        <link href="<c:url value="/resources/websource/css/modify.css" />" rel="stylesheet">
        <link href="<c:url value="/resources/websource/img/c_icon.png" />" rel="icon">
    </head>
    <body>

        <div class="header-area">
            <div class="container">
                <div class="row">
                    <div class="col-md-7">
                        <div class="user-menu">
                            <ul>
                                <li><a href="#"><i class="fa fa-user"></i> Tài khoản</a></li>
                                <li><a href="#"><i class="fa fa-heart"></i> Danh sách yêu thích</a></li>
                                <li><a href="#"><i class="fa fa-user"></i> Đăng nhập</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-5">
                        <div class="user-menu">
                            <ul>
                                <li><a href="#"><i class="fa fa-phone"></i> 0964 303 637</a></li>
                                <li><a href="#"><i class="fa fa-location-arrow"></i> Innovation Building - Quang Trung Software City</a></li>
                            </ul>
                        </div>
                    </div>

                </div>
            </div>
        </div> <!-- End header area -->

        <div class="site-branding-area">
            <div class="container">
                <div class="row">
                    <div class="col-sm-3">
                        <div class="logo">
                            <h1><a href="index.html"><img src="<c:url value="/resources/websource/img/logo.jpg"/>"></a></h1>
                        </div>
                    </div>
                    <div class="col-sm-7" id="test">
                        <div class="btn-group" >
                            <button  type="button" class="btn btn-primary dropdown-toggle category" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Categories
                            </button>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="#">Thuơng hiệu</a>
                                <br/>
                                <a class="dropdown-item" href="#">Another action</a>
                                <a class="dropdown-item" href="#">Something else here</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#">Separated link</a>
                            </div>
                        </div>
                        <div class="test">
                            <form class="search">
                                <input class="inputSearch"  type="text" placeholder="Tìm kiếm.." name="search" />
                                <button type="submit"><i  class="fa fa-search"></i></button>
                            </form>
                        </div>
                    </div>
                    <div class="col-sm-2">
                        <div class="shopping-item">
                            <a href="cart.html">Giỏ hàng<span class="cart-amunt"></span> <i class="fa fa-shopping-cart"></i> <span class="product-count">5</span></a>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div> <!-- End site branding area -->

    <div class="mainmenu-area">
        <div class="container">
            <div class="row">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                </div> 
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li class="active" ><a href="index.html">TRANG CHỦ</a></li>
                        <li class="active">
                            <div class="dropdown">
                                <button  class="dropbtn">LINH KIỆN MÁY TÍNH</button>
                                <div class="dropdown-content">
                                    <a href="#">Bộ xử lí - CPU</a>
                                    <a href="#">Bo mạnh - Mainboard</a>
                                    <a href="#">RAM</a>
                                    <a href="#">Card màn hình - VGA</a>
                                    <a href="#">Vỏ - Case</a>
                                    <a href="#">Tản nhiệt</a>
                                    <a href="#">Tản nhiệt</a>
                                    <a href="#">Linh kiện khác</a>
                                </div>
                            </div>
                        </li>
                        <li class="active">
                            <div class="dropdown">
                                <button  class="dropbtn">THƯƠNG HIỆU</button>
                                <div class="dropdown-content">
                                    <a href="#">Intel</a>
                                    <a href="#">AMD</a>
                                    <a href="#">Asus</a>
                                    <a href="#">Gigabyte</a>
                                    <a href="#">MSI</a>
                                    <a href="#">EVGA</a>
                                    <a href="#">Palit</a>
                                </div>
                            </div>
                        </li>
                        <li class="active">
                            <div class="dropdown">
                                <button  class="dropbtn">Ổ CỨNG</button>
                                <div class="dropdown-content">
                                    <a href="#">Ổ cứng HĐ</a>
                                    <a href="#">Ổ cứng SSD</a>
                                    <a href="#">Ổ cứng laptop</a>
                                    <a href="#">Ổ cúng di động</a>
                                    <a href="#">Ổ ứng Intel Optance</a>
                                    <a href="#">Phụ kiện ở cứng</a>
                                    <a href="#">Xem tất cả </a>
                                </div>
                            </div>
                        </li>
                        <li class="active">
                            <div class="dropdown">
                                <button  class="dropbtn">PHỤ KIỆN MÁY TÍNH</button>
                                <div class="dropdown-content">
                                    <a href="#">Chuột gaming</a>
                                    <a href="#">Bàn phím gaming</a>
                                    <a href="#">Tay game</a>
                                    <a href="#">Tai nghe gaming</a>
                                    <a href="#">Tai nghe bluetooth</a>
                                    <a href="#">Tai nghe phiỉ tông</a>
                                    <a href="#">Chuột văn phòng</a>
                                    <a href="#">Bàn phím văn phòng</a>
                                    <a href="#">Phụ kiện ở cứng</a>
                                    <a href="#">Loa vi tính</a>
                                    <a href="#">Loa bluetooth</a>
                                    <a href="#">Xem tất cả </a>
                                </div>
                            </div>
                        </li>

                        <li><a href="#">HÀNG TRƯNG BÀY</a></li>
                        <li><a href="#">KHUYẾN MẠI</a></li>
                        <li><a href="#">LIÊN HỆ</a></li>
                    </ul>
                </div>  
            </div>
        </div>
    </div> <!-- End mainmenu area -->


    <div class="single-product-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-1">

                </div>

                <div class="col-md-10">
                    <sf:form method="post" action="${pageContext.request.contextPath}/order/member/save"
                 modelAttribute="cart">

                        <div class="product-content-right">
                            <h3 id="order_review_heading">Thông tin vận chuyển</h3>
                            <div class="woocommerce">
                                <div id="customer_details" class="col2-set">
                                    <div class="col-1">
                                        <div class="woocommerce-billing-fields">

                                            <p id="billing_first_name_field" class="form-row form-row-first validate-required">
                                                <label class="" for="billing_first_name">Họ và tên <abbr title="required" class="required">*</abbr>
                                                </label>
                                                <input disabled="true" type="text" value="" placeholder="" id="billing_first_name" name="billing_first_name" class="input-text ">
                                            </p>

                                            <div class="clear"></div>
                                            <p id="billing_address_1_field" class="form-row form-row-wide address-field validate-required">
                                                <label class="" for="billing_address_1">Địa chỉ <abbr title="required" class="required">*</abbr>
                                                </label>
                                                <input type="text" value="" placeholder="" id="billing_address_1" name="shipAddress" class="input-text ">
                                            </p>
                                            <p id="billing_company_field" class="form-row form-row-wide">
                                                <input type="hidden" value="" placeholder="" id="billing_company" name="promotionID" class="input-text ">
                                            </p>
                                        </div>
                                    </div>
                                    

                                </div>

                            </div>

                        </div>

                        <h3 id="order_review_heading">Hóa đơn</h3>

                        <div id="order_review" style="position: relative;">
                            <table class="shop_table">
                                <thead>
                                    <tr>
                                        <th class="product-name">Sản phẩm</th>
                                        <th class="product-total">Tổng</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="cart_item">
                                        <td class="product-name">
                                            MSI RTX 2080 GAMING X TRIO 8G <strong class="product-quantity">× 1</strong> </td>
                                        <td class="product-total">
                                            <span class="amount">26,400,000₫</span> </td>
                                    </tr>
                                </tbody>
                                <tfoot>

                                    <tr class="cart-subtotal">
                                        <th>Tổng tiền sản phẩm</th> 
                                        <td><span class="amount">26,400,000₫</span>
                                        </td>
                                    </tr>

                                    <tr class="shipping">
                                        <th>Phí vận chuyển</th>
                                        <td>
                                            Miễn phí
                                            <input type="hidden" class="shipping_method" value="free_shipping" id="shipping_method_0" data-index="0" name="shipping_method[0]">
                                        </td>
                                    </tr>


                                    <tr class="order-total">
                                        <th>Tổng hóa đơn</th>
                                        <td><strong><span class="amount">26,400,000₫</span></strong> </td>
                                    </tr>

                                </tfoot>
                            </table>


                            <div id="payment">
                                <ul class="payment_methods methods">
                                    <li class="payment_method_bacs">
                                        <input type="radio" data-order_button_text="" checked="checked" value="bacs" name="payment_method" class="input-radio" id="payment_method_bacs">
                                        <label for="payment_method_bacs">Thanh toán khi nhận hàng </label>

                                    </li>
                                    <li class="payment_method_cheque">
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
                                    </li>
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



<div class="footer-top-area">
    <div class="zigzag-bottom"></div>
    <div class="container">
        <div class="row">
            <div class="col-md-3 col-sm-6">
                <div class="footer-about-us">
                    <h2>Cyber<span>Shop</span></h2>
                    <p>Được thành lập vào 26 tháng 2 năm 1997, CeyberShop lúc đó là một cửa hàng buôn bán máy tính nhỏ. Qua nhiều năm CeyberShop đã từng bước lớn mạnh và phát triển trong lĩnh vực kinh doanh các sản phẩm, linh kiện máy tính và giải trí do các hãng điện tử hàng đầu trên thế giới. Và đến tháng 7 năm 2007, Phong Vũ chính thức thành lập Công ty Cô phần Thương mại - Dịch vụ CeyberShop.</p>
                    <div class="footer-social">
                        <a href="#" target="_blank"><i class="fa fa-facebook"></i></a>
                        <a href="#" target="_blank"><i class="fa fa-twitter"></i></a>
                        <a href="#" target="_blank"><i class="fa fa-youtube"></i></a>
                        <a href="#" target="_blank"><i class="fa fa-linkedin"></i></a>
                    </div>
                </div>
            </div>

            <div class="col-md-3 col-sm-6">
                <div class="footer-menu">
                    <h2 >Hỗ trợ Khách hàng </h2>
                    <ul>
                        <li><a href="#">Thẻ ưu đãi</a></li>
                        <li><a href="#">Phiếu mua bảo hành</a></li>
                        <li><a href="#">trung tâm bảo hành</a></li>
                        <li><a href="#">Thanh toán và giao hàng</a></li>
                        <li><a href="#">Dịch vụ sửa chữa và bảo hành</a></li>
                    </ul>                        
                </div>
            </div>

            <div class="col-md-3 col-sm-6">
                <div class="footer-menu">
                    <h2 >Chính sách hỗ trợ</h2>
                    <ul>
                        <li><a href="#">Chính sách điện máy</a></li>
                        <li><a href="#">Chính sách ổi hàng</a></li>
                        <li><a href="#">Chính sách bảo hành</a></li>
                        <li><a href="#">Chính sách thanh toán</a></li>
                        <li><a href="#">Chính sách trả góp</a></li>
                    </ul>                        
                </div>
            </div>

            <div class="col-md-3 col-sm-6">
                <div class="footer-newsletter">
                    <h2 >Đăng ký nhận tin</h2>
                    <p>Đăng ký nhận bản tin của chúng tôi và nhận các ưu đãi độc quyền mà bạn sẽ không tìm thấy ở bất kỳ nơi nào khác ngoài ngay trong hộp thư đến của mình!</p>
                    <div class="newsletter-form">
                        <form action="#">
                            <input type="email" placeholder="Nhập email của bạn">
                            <input type="submit" value="Đăng ký">
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div> <!-- End footer top area -->
<div class="footer-bottom-area">
    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <div class="copyright">
                    <p>&copy; 2018 E-Commerce SE62607. All Rights Reserved.</p>
                </div>
            </div>

            <div class="col-md-4">
                <div class="footer-card-icon">
                    <i class="fa fa-cc-discover"></i>
                    <i class="fa fa-cc-mastercard"></i>
                    <i class="fa fa-cc-paypal"></i>
                    <i class="fa fa-cc-visa"></i>
                </div>
            </div>
        </div>
    </div>
</div> 
<!-- End footer bottom area -->

<script src="<c:url value="/resources/websource/js/owl.carousel.min.js" />" ></script>
<script src="<c:url value="/resources/websource/js/jquery.sticky.js" />" ></script>
<!-- jQuery easing -->
<script src="<c:url value="/resources/websource/js/jquery.easing.1.3.min.js" />" ></script>
<!-- Main Script -->
<!--<script src="js/main.js"></script>-->
<script src="<c:url value="/resources/websource/js/main.js" />" ></script>
<!-- Slider -->
<script src="<c:url value="/resources/websource/js/bxslider.min.js" />" type="text/javascript"></script>
<script src="<c:url value="/resources/websource/js/script.slider.js" />" type="text/javascript"></script>
</body>
</html>
