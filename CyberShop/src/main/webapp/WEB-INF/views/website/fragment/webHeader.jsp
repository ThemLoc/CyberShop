<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="header-area">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <div class="user-menu">
                    <ul>
                        <c:set var="customerInfo" value="${sessionScope.CUSTOMER_INFO}"/>
                        <c:if test="${not empty customerInfo}">
                            <li><a href="#" style="text-decoration: none"><i class="fa fa-user"></i> ${customerInfo.fullname}</a></li>
                            <li><a href="${pageContext.request.contextPath}/website/logout" style="text-decoration: none">Logout</a></li>
                            </c:if>
                            <c:if test="${empty customerInfo}">
                            <li>
                                <a href="" class="btn" data-toggle="modal" data-target=".bs-modal-sm"><i class="fa fa-user"></i> Đăng nhập</a>
                            </li>
                        </c:if>
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
                                <c:forEach items="${listLKCate}" var="cateList">
                                    <a href="#">${cateList.cateName}</a>
                                </c:forEach>
                            </div>
                        </div>
                    </li>
                    <li class="active">
                        <div class="dropdown">
                            <button class="dropbtn">THƯƠNG HIỆU</button>
                            <div class="dropdown-content">
                                <c:forEach items="${listBrand}" var="brandList">
                                    <a href="#">${brandList.brandName}</a>
                                </c:forEach>
                            </div>
                        </div>
                    </li>
                    <li class="active">
                        <div class="dropdown">
                            <button  class="dropbtn">PHỤ KIỆN MÁY TÍNH</button>
                            <div class="dropdown-content">
                                <c:forEach items="${listPKCate}" var="cateList">
                                    <a href="#">${cateList.cateName}</a>
                                </c:forEach>
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

<!--Form Login-->
<div class="modal fade bs-modal-sm" id="loginModal" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <br>
            <div class="bs-example bs-example-tabs">
                <button style="float: right; margin-top: -37px;margin-right: -20px; border-radius: 50%" type="button" class="btn btn-danger" data-dismiss="modal">X</button>
                <ul id="myTab" class="nav nav-tabs">
                    <li class="active"><a href="#signin" data-toggle="tab">Đăng nhập</a></li>
                    <li class=""><a href="#signup" data-toggle="tab">Đăng ký</a></li>
                </ul>
            </div>
            <div class="modal-body">
                <div id="myTabContent" class="tab-content">
                    <div class="tab-pane fade active in" id="signin">
                        <!--<fieldset>-->
                        <!-- Sign In Form -->
                        <!-- Text input-->
                        <div class="control-group">
                            <label class="control-label" for="userid">Tài khoản</label>
                            <div class="controls">
                                <input required="" id="userLogin" type="text" class="form-control" placeholder="Tên tài khoản" class="input-medium" required="">
                            </div>
                        </div>

                        <!-- Password input-->
                        <div class="control-group">
                            <label class="control-label" for="passwordinput">Mật khẩu</label>
                            <div class="controls">
                                <input required="" id="passwordLogin" class="form-control" type="password" placeholder="********" class="input-medium">
                            </div>
                        </div>
                        <strong id="loginFail" style="color: red"></strong>

                        <!-- Multiple Checkboxes (inline) -->
                        <div class="control-group">
                            <br/>
                            <a id="forgotPass" style="color: blue; cursor: pointer">Quên mật khẩu?</a>
                        </div>

                        <!-- Button -->
                        <div class="control-group" style="text-align: center">
                            <label class="control-label" for="signin"></label>
                            <div class="controls">
                                <button id="login" name="signin" class="btn btn-success">Đăng nhập</button>
                            </div>
                        </div>
                        <!--</fieldset>-->
                    </div>

                    <div class="tab-pane fade" id="signup">
                        <form id="myCreateForm" class="form-horizontal" method="POST">
                            <!-- Sign Up Form -->
                            <!-- Text input-->
                            <div class="control-group">
                                <label class="control-label">Tài khoản</label>
                                <div class="controls">
                                    <input id="usernamecreate" name="username" class="form-control" type="text" placeholder="Tên tài khoản" class="input-large" required="">
                                </div>
                            </div>

                            <!-- Password input-->
                            <div class="control-group">
                                <label class="control-label">Mật khẩu</label>
                                <div class="controls">
                                    <input id="passwordcreate" class="form-control" type="password" placeholder="********" class="input-large" required="">
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="control-group">
                                <label class="control-label">Xác nhận mật khẩu</label>
                                <div class="controls">
                                    <input id="confirmpassword" class="form-control" type="password" placeholder="********" class="input-large" required="">
                                </div>
                            </div>
                            <p id="message"></p>

                            <div class="control-group">
                                <label class="control-label">Email</label>
                                <div class="controls">
                                    <input id="emailcreate" class="form-control" type="text" placeholder="Email của bạn" class="input-large" required="">
                                </div>
                            </div>

                            <div class="control-group">
                                <label class="control-label">Họ & Tên</label>
                                <div class="controls">
                                    <input id="fullnamecreate" class="form-control" type="text" placeholder="Họ & tên của bạn" class="input-large" required="">
                                </div>
                            </div>

                            <div class="control-group">
                                <label class="control-label">Giới tính</label>
                                <div class="controls">
                                    <select id="sexCheck">
                                        <option value="1">Nam</option>
                                        <option value="2">Nữ</option>
                                    </select>
                                </div>
                            </div>

                            <div class="control-group">
                                <label class="control-label">Địa chỉ</label>
                                <div class="controls">
                                    <input id="addresscreate" class="form-control" type="text" placeholder="Địa chỉ của bạn" class="input-large" required="">
                                </div>
                            </div>

                            <div class="control-group">
                                <label class="control-label">Số điện thoại</label>
                                <div class="controls">
                                    <input id="phonecreate" class="form-control" type="text" placeholder="Số điện thoại" class="input-large" required="">
                                </div>
                            </div>

                            <div class="control-group">
                                <label class="control-label">Ngày sinh</label>
                                <div class="controls">
                                    <input id="dobcreate" class="form-control" type="date" placeholder="Ngày sinh" class="input-large" required="">
                                </div>
                            </div>

                            <br>

                            <!-- Button -->
                            <div class="control-group">
                                <label class="control-label" for="confirmsignup"></label>
                                <div class="controls">
                                    <button id="confirmsignup" name="confirmsignup" class="btn btn-success">Đăng ký</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!--forgot modal-->
<div class="modal fade" id="forgotModal" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="bs-example bs-example-tabs">
                <button style="float: right; margin-top: -20px;margin-right: -18px; border-radius: 50%" type="button" class="btn btn-danger" data-dismiss="modal">X</button>
            </div>
            <br>
            <h2 style="margin-left: 20px;">Đặt Lại Mật Khẩu</h2>
            <div class="modal-body">
                <div id="myTabContent" class="tab-content">
                    <div class="tab-pane fade active in" id="signin">
                        <!-- Text input-->
                        <div class="control-group">
                            <label class="control-label" for="userid">Tài khoản</label>
                            <div class="controls">
                                <input required="" id="forgotUser" type="text" class="form-control" placeholder="Tên tài khoản" class="input-medium" required="">
                            </div>
                            <strong id="userFail" style="color: red"></strong>
                        </div>
                        <div class="control-group" style="text-align: center">
                            <label class="control-label" for="signin"></label>
                            <div class="controls">
                                <button id="renewPass" class="btn btn-success">Cấp lại mật khẩu</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
