<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

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
</div> <!-- End footer bottom area -->

<!-- Latest jQuery form server -->
<script src="https://code.jquery.com/jquery.min.js"></script>
<!-- Bootstrap JS form CDN -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<!-- jQuery sticky menu -->
<script src="<c:url value="/resources/websource/js/owl.carousel.min.js" />" ></script>
<script src="<c:url value="/resources/websource/js/jquery.sticky.js" />" ></script>

<!-- jQuery easing -->
<!--<script src="<c:url value="/resources/websource/js/jquery.easing.1.3.min.js"/>"></script>-->

<!-- Main Script -->
<script src="<c:url value="/resources/websource/js/main.js" />"></script>




<script>
    $('#login').click(function () {
        var user = $('#userLogin').val();
        var pass = $('#passwordLogin').val();
        console.log(user + pass);
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/api/userLogin",
            dataType: 'text',
            data: {
                user: user,
                pass: pass
            },
            timeout: 100000,
            success: function (result) {
                if (result == "success") {
                    window.location.reload();
                } else {
                    $('#loginFail').text('Username or Password Not Correct!!!')
                }
            }
            , error: function (e) {
                console.log("ERROR: ", e);
            }
        }
        );
    });

    $('#forgotPass').click(function () {
        $('#loginModal').modal('hide');
        $('#forgotModal').modal('show');
    });

    $('#renewPass').click(function () {
        var user = $('#forgotUser').val();
        console.log(user);
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/api/forgotPass",
            dataType: 'text',
            data: {
                userForgot: user
            },
            timeout: 100000,
            success: function (result) {
                if (result == "success") {
                    $('#forgotModal').modal('hide');
                    $('#loginModal').modal('show');
                } else {
                    $('#userFail').text('Username Is Not EXIST!!!')
                }
            }
            , error: function (e) {
                console.log("ERROR: ", e);
            }
        }
        );
    });

    $('#passwordcreate, #confirmpassword').on('keyup', function () {
        if ($('#passwordcreate').val() == $('#confirmpassword').val()) {
            $('#message').html('Matching').css('color', 'green');
        } else
            $('#message').html('Not Matching').css('color', 'red');
    });

    $('#confirmsignup').click(function (event) {
        event.preventDefault();
//        var form = $('#myCreateForm')[0];
//        var data = new FormData(form);
//        console.log(data);
        var username = $('#usernamecreate').val();
        var password = $('#passwordcreate').val();
        var email = $('#emailcreate').val();
        var fullname = $('#fullnamecreate').val();
        var address = $('#addresscreate').val();
        var phone = $('#phonecreate').val();
        var dob = $('#dobcreate').val();
        var sex = $('#sexCheck').val();
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/api/createCus",
            dataType: 'text',
            data: {
                usernamecreate: username,
                passwordcreate: password,
                emailcreate: email,
                fullnamecreate: fullname,
                addresscreate: address,
                phonecreate: phone,
                dobcreate: dob,
                sexCheck: sex
            },
            timeout: 100000,
            success: function (result) {
                alert(result);
            }
            , error: function (e) {
                console.log("ERROR: ", e);
            }
        }
        );
    });
</script>