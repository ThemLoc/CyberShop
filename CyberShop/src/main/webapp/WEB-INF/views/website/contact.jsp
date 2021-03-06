<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>

<html lang="en">
    <head>
        <%@include file="/WEB-INF/views/website/fragment/css.jsp" %>
    </head>
    <body class="skin-blue">
        <%@include file="/WEB-INF/views/website/fragment/webHeader.jsp" %>

        <div class="single-product-area">
            <div class="container">
                <div class="row" style="padding: 10px">
                    <div class="text-center">
                        <h2> Liên hệ với Cyber Shop</h2>
                        <hr/>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-4" >
                        <div class="div_contact_shadow" style="padding-left: 50px">
                            <h5><i class="fa fa-phone"><strong> <span style="color: red; ">  &nbsp; Tổng đài miễn phí</span></strong></i></h5>
                                <c:forEach items="${storeinfo}" var="storeInfo">
                                    <a class="content_contact">Tư vấn mua hàng: ${storeInfo.phone1}</a><br/>
                                    <a class="content_contact">Chăm sóc khách hàng: ${storeInfo.phone2}</a><br/>
                                    <a class="content_contact">Email: cskh@cybershop.vn</a>
                                    <h5><i class="fa fa-envelope"><strong> <span style="color: red; ">  &nbsp; Liên hệ báo giá</span></strong></i></h5>
                                    <a class="content_contact">Email: baogia@cybershop.vn</a>
                                    <h5><i class="fa fa-envelope"><strong> <span style="color: red; ">  &nbsp; Hợp tác phát triển</span></strong></i></h5>
                                    <a class="content_contact">Email: hoptac@cybershop.vn</a>
                            </div>
                        </div>
                        <div class="col-lg-8" >
                            <div class="div_contact_shadow" style="height: 260px;padding-left: 20px">
                                <h4><strong>CyberShop luôn cung cấp dịch vụ bán hàng và phục vụ hàng đầu:</strong></h4>
                                <br/>
                                <i class="fa fa-check check_icon" ></i> &nbsp; <span class="content_contact2"> <strong>Sản phẩm da dạng</strong> cho mọi khách hàng có nhu cầu về giá, hãng sản xuất</span><br/>
                                <i class="fa fa-check check_icon" ></i> &nbsp; <span class="content_contact2"> <strong>Miễn phí giao hàng tận nơi</strong> trên Toàn Quốc với mọi đơn hàng</span><br/>
                                <i class="fa fa-check check_icon" ></i> &nbsp; <span class="content_contact2"> <strong>Khách hàng thoải mái trải nghiệm</strong> sản phẩm yêu thích và hot nhất thị trường</span><br/>
                                <i class="fa fa-check check_icon" ></i> &nbsp; <span class="content_contact2"> <strong>Nhân viên tư vấn nhiệt tình</strong> giúp khách hàng lựa chọn được sản phẩm phù hợp nhất</span><br/>
                                <i class="fa fa-check check_icon" ></i> &nbsp; <span class="content_contact2"> <strong>Bảo hành chính hãng</strong> cho các sản phẩm mua tại CyberShop</span><br/>
                                <i class="fa fa-check check_icon" ></i> &nbsp; <span class="content_contact2"> <strong>Chính sách đổi trả ưu đãi</strong> dành cho khách hàng</span> <br/>
                            </div>
                        </div>

                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="div_contact_shadow text-center">
                                <h5><strong>Fanpage Cyber Shop</strong></h5>
                                <br/>
                                <ul class="social-icons">
                                    <li><a href="http://www.facebook.com"><img src="<c:url value="/resources/image/icon/Facebook.png"/>" /></a></li>
                                    <li><a href="http://www.twitter.com"><img src='<c:url value="/resources/image/icon/Twitter.png"/>' /></a></li>
                                    <li><a href="http://www.youtube.com"><img src='<c:url value="/resources/image/icon/YouTube.png"/>' /></a></li>
                                </ul>
                            </div>
                        </div>
                    </div> 
                    <div class="row" >
                        <div class="col-lg-12">
                            <div class="div_contact_shadow text-center">
                                <h5><strong>SHOWROOM</strong></h5>
                                <p>Địa chỉ: ${storeInfo.address}</p>
                            </c:forEach>
                            <div id="map"></div>
                        </div>
                    </div>
                </div> 
            </div>
        </div>

        <%@include file="/WEB-INF/views/website/fragment/webFooter.jsp" %>
        <script>
            // Initialize and add the map
            function initMap() {
                // The location of Uluru

                var store = eval('(' + ' ${storeJSON}' + ')');
                var lo_x = store['locationX'];
                var lo_y = store['locationY'];
                var uluru = {lat: lo_x*1, lng: lo_y*1};
                // The map, centered at Uluru
                var map = new google.maps.Map(
                        document.getElementById('map'), {zoom: 17, center: uluru});
                // The marker, positioned at Uluru
                var marker = new google.maps.Marker({position: uluru, map: map});
            }
        </script>
        <script async defer
                src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCKwjg-oMp4S_2s3bdJofyMfpYhwpdmJfE&callback=initMap">
        </script>
    </body>
</html>
