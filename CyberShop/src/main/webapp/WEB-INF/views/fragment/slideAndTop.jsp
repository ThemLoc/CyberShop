<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<header class="main-header">
    <!-- Logo -->
    <a href="../../index2.html" class="logo">
        <!-- mini logo for sidebar mini 50x50 pixels -->
        <span class="logo-mini"><b>A</b>LT</span>
        <!-- logo for regular state and mobile devices -->
        <span class="logo-lg"><b>Admin</b>CyberShop</span>
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
        <!-- Sidebar toggle button-->
        <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </a>
        <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
                <!-- Messages: style can be found in dropdown.less-->

                <!-- User Account: style can be found in dropdown.less -->
                <li class="dropdown user user-menu">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">

                        <img src="<c:url value="/resources/adminsource/support_template/dist/img/user2-160x160.jpg"/>" class="user-image" alt="User Image">
                        <span class="hidden-xs">${sessionScope.USER.fullname}</span>

                    </a>
                    <ul class="dropdown-menu">
                        <!-- User image -->
                        <li class="user-header">
                            <img src="<c:url value="/resources/adminsource/support_template/dist/img/user2-160x160.jpg"/>" class="img-circle" alt="User Image">

                            <p>
                                Alexander Pierce - Web Developer
                                <small>Member since Nov. 2012</small>
                            </p>
                        </li>
                        <!-- Menu Body -->
                        <li class="user-body">
                            <div class="row">
                                <div class="col-xs-4 text-center">
                                    <a href="#">Followers</a>
                                </div>
                                <div class="col-xs-4 text-center">
                                    <a href="#">Sales</a>
                                </div>
                                <div class="col-xs-4 text-center">
                                    <a href="#">Friends</a>
                                </div>
                            </div>
                            <!-- /.row -->
                        </li>
                        <!-- Menu Footer-->
                        <li class="user-footer">
                            <div class="pull-left">
                                <a href="#" class="btn btn-default btn-flat">Profile</a>
                            </div>
                            <div class="pull-right">
                                <a href="#" class="btn btn-default btn-flat">Sign out</a>
                            </div>
                        </li>
                        <!-- Menu Footer-->
                    </ul>
                </li>
                <li>
                    <a></a>
                </li>
            </ul>
        </div>

    </nav>
</header>


<!-- Left side column. contains the logo and sidebar -->
<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="<c:url value="/resources/adminsource/support_template/dist/img/user2-160x160.jpg"/>" class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info">

                <p>${sessionScope.USER.fullname}</p>

                <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
            </div>
        </div>

        <!-- sidebar menu: : style can be found in sidebar.less -->
        <ul class="sidebar-menu" data-widget="tree">
            <li class="header">MAIN NAVIGATION</li>

            <!--            <li class="treeview">
                            <a href="#">
                                <i class="fa fa-user-o"></i> <span>Admin</span>
                                <span class="pull-right-container">
                                    <i class="fa fa-angle-left pull-right"></i>
                                </span>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="../../index.html"><i class="fa fa-circle-o"></i> Dashboard v1</a></li>
                                <li><a href="../../index2.html"><i class="fa fa-circle-o"></i> Dashboard v2</a></li>
                            </ul>
                        </li>-->
            <li>
                <a href="${pageContext.request.contextPath}/manager/admin">
                    <i class="fa fa-user-o"></i> <span>Admin</span>
                </a>
            </li>

            <li>
                <a href="${pageContext.request.contextPath}/manager/customer">
                    <i class="fa fa-user-o"></i> <span>Customer</span>
                
                </a>
              

            </li>
            <li>
                <a href="${pageContext.request.contextPath}/manager/product">
                    <i class="fa fa-television"></i> <span>Product</span>
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/manager/category">
                    <i class="fa fa-circle-o"></i> <span>Category</span>
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/manager/order">
                    <i class="fa fa-book"></i> <span>Order</span>

                    <!--                    <small class="label pull-right bg-red">3</small>
                                        <small class="label pull-right bg-yellow">2</small>
                                        <small class="label pull-right bg-green">1</small>-->


                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/manager/storeinfo">
                    <i class="fa fa-info-circle"></i> <span>Store Information</span>
                    <span class="pull-right-container">
                        <!-- <small class="label pull-right bg-green">new</small> -->
                    </span>
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/manager/promotion">
                    <i class="fa fa-bullhorn"></i> <span>Promotion</span>
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/manager/banner">
                    <i class="fa fa-sliders"></i> <span>Banner</span>
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/manager/brand">
                    <i class="fa fa-edit"></i> <span>Brand</span>
                </a>
            </li>

            <li>

                <form style="margin-left: 20px" action="<c:url value="/j_spring_security_logout" />" method="post">              
                    <div class="form-group">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                    </div>
                    <input class="btn btn-primary" type="submit" value="Logout" />
                </form>
            </li>

        </ul>
    </section>
    <!-- /.sidebar -->
</aside>