<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

    <div class="header-area">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <div class="user-menu">
                        <ul>
                            <li><a href="#"><i class="fa fa-user"></i> Tài khoản</a></li>
                            <li><a href="#"><i class="fa fa-user"></i> Đăng nhập</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-6">
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
                <a href="cart.html">Giỏ hàng<span class="cart-amunt"></span> <i class="fa fa-shopping-cart"></i> <span id="product-count" class="product-count">0</span></a>
            </div>
        </div>
    </div>

</div>
</div>
 <!-- End site branding area -->

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