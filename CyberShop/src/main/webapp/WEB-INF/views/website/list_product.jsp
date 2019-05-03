<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html lang="en">
    <head>
        <%@include file="/WEB-INF/views/website/fragment/css.jsp" %>
    </head>
    <body>
        <a id="topDiv"></a>
        <%@include file="/WEB-INF/views/website/fragment/webHeader.jsp" %>

        <!--
                <div class="product-big-title-area">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="product-bit-title text-center">
                                    <h2>Shop</h2>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>-->


        <div class="single-product-area">
            <div class="container">

                <div class="row">
                    <div class="col-sm-12 wrap-sort-by">

                        <div class="browse-tags pull-right">
                            <span>Sắp xếp theo:</span>
                            <span class="custom-dropdown custom-dropdown--white">
                                <select id="sortSelect" class="sort-by custom-dropdown__select custom-dropdown__select--white">
                                    <!--<option value="manual">Sản phẩm nổi bật</option>-->
                                    <option value="price-ascending">Giá: Tăng dần</option>
                                    <option value="price-descending">Giá: Giảm dần</option>
                                    <option value="title-ascending">Tên: A-Z</option>
                                    <option value="title-descending">Tên: Z-A</option>
                                    <option value="created-ascending">Cũ nhất</option>
                                    <option value="created-descending" selected="">Mới nhất</option>
                                    <option value="best-selling">Bán chạy nhất</option>
                                </select>
                            </span>
                        </div>
                        <br/>
                        <hr>
                    </div>
                </div>
                <div class="row">
                    <div class="row">
                    <div class="col-md-2">
                        <div class="col-md-12"  style="border-right: 1px solid #eee;height:1000px">

        
                            
                        </div>
                    </div>
                    <div class="col-md-10"  id="divList">
                    </div>
                    </div>
                    <div class="row" style="background-color: red">
                     <div class="col-sm-12">
                        <div class="product-pagination text-center">
                            <div class="container">
                                <nav aria-label="Page navigation">
                                    <ul class="pagination" id="pagination"></ul>
                                </nav>
                            </div>
                            <ul id="selector"></ul>
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
                            <img src="<c:url value="/resources/image/icon/checked.png"/>"/> <a style="color: #02acea"> Thêm vào giỏ hàng thành công!</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="/WEB-INF/views/website/fragment/footer_listProduct_page.jsp" %>   
        <%--<%@include file="/WEB-INF/views/website/fragment/webFooter.jsp" %>--%>   

        <script>
            function addToCart(productID) {
                $("#alertModal").fadeTo(2000, 500).slideUp(500, function () {
                    $("#alertModal").slideUp(500);
                });
                var count = $('#product-count').text();
                count++;
                $('#product-count').text(count);
            }
            var createCookie = function (name, value, days) {
                var expires;
                if (days) {
                    var date = new Date();
                    date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
                    expires = "; expires=" + date.toGMTString();
                } else {
                    expires = "";
                }
                document.cookie = name + "=" + value + expires + "; path=/";
            }

            function getCookie(c_name) {
                if (document.cookie.length > 0) {
                    c_start = document.cookie.indexOf(c_name + "=");
                    if (c_start !== -1) {
                        c_start = c_start + c_name.length + 1;
                        c_end = document.cookie.indexOf(";", c_start);
                        if (c_end === -1) {
                            c_end = document.cookie.length;
                        }
                        return unescape(document.cookie.substring(c_start, c_end));
                    }
                }
                return "";
            }
            var data = eval('(' + '${listProductJson}' + ')');
            var totalPage = eval('(' + '${totalPage}' + ')');
            $(document).ready(function () {
                pageList();
            });
            function pageList() {
                $('#pagination').twbsPagination({
                    totalPages: totalPage,
                    visiblePages: 5,
                    next: 'Next',
                    prev: 'Prev',
                    onPageClick: function (event, page) {
                        $('html, body').animate({scrollTop: $('#topDiv').offset().top}, 'slow');
                        var html = '';
                        var start = 0;
                        if (page > 1) {
                            start = (page - 1) * 12;
                        }
                        for (var i = start; i < page * 12; i++) {
                            html += ' <div class="col-md-3 col-sm-6">';
                            html += '<div class="single-shop-product">';
                            html += '<div class="product-upper">';
                            var listImage = data[i]['imagesCollection'];
                            if (listImage !== null) {
                                for (var j = 0; j < listImage.length; j++) {
                                    if (listImage[j]['mainImage'] === true) {
                                        html += '<a href="${pageContext.request.contextPath}/website/singleproduct/' + data[i]['productID'] + '">';
                                        html += '<img src="${pageContext.request.contextPath}/resources/image/img_product/' + listImage[j]['urlImage'] + '" style="width: 100%;height: 250px" class="img-thumbnail img-list-product"/>';
                                        html += ' </a>';
                                    }
                                }
                            }
                            html += '</div>';
                            html += '<h2><a href="${pageContext.request.contextPath}/website/singleproduct/' + data[i]['productID'] + '">' + data[i]['productName'] + '</a></h2>';
                            html += '<div class="product-carousel-price">';
                            if (data[i]['downPrice'] !== null) {
                                html += '<ins>' + data[i]['downPrice'] + 'đ</ins> <del>' + data[i]['price'] + 'đ</del>';
                            } else {
                                html += ' <ins>' + data[i]['price'] + 'đ</ins>';
                            }
                            html += '</div> ';
                            html += '<div class="product-option-shop">';
                            html += '<a onclick="addToCart(' + data[i]['productID'] + ')" class="add_to_cart_button" data-quantity="1" data-product_sku="" data-product_id="70" rel="nofollow" >Add to cart</a>';
                            html += '</div>';
                            html += '</div>';
                            html += '</div>';
                        }
                        $('#divList').html('');
                        $('#divList').html(html);
                        jQuery('html,body').animate({scrollTop: jQuery(this.hash).offset()}, 500);
                    }
                });
            }
            function compareASC(a, b) {
                if (a.productName < b.productName) {
                    return -1;
                }
                if (a.productName > b.productName) {
                    return 1;
                }
                return 0;
            }
            function compareDESC(a, b) {
                if (a.productName > b.productName) {
                    return -1;
                }
                if (a.productName < b.productName) {
                    return 1;
                }
                return 0;
            }
            function compareDESCSold(a, b) {
                if (a.sell > b.sell) {
                    return -1;
                }
                if (a.sell < b.sell) {
                    return 1;
                }
                return 0;
            }
            function compareASCreate(a, b) {
                if (a.productID < b.productID) {
                    return -1;
                }
                if (a.productID > b.productID) {
                    return 1;
                }
                return 0;
            }
            function compareDESCreate(a, b) {
                if (a.productID > b.productID) {
                    return -1;
                }
                if (a.productID < b.productID) {
                    return 1;
                }
                return 0;
            }
            function compareASCPrice(a, b) {
                var aPrice;
                var bPrice;
                if (a.downPrice !== null) {
                    aPrice = a.downPrice;
                } else {
                    aPrice = a.price;
                }
                if (b.downPrice !== null) {
                    bPrice = b.downPrice;
                } else {
                    bPrice = b.price;
                }
                if (aPrice < bPrice) {
                    return -1;
                }
                if (aPrice > bPrice) {
                    return 1;
                }
                return 0;
            }
            function compareDESCPrice(a, b) {
                var aPrice;
                var bPrice;
                if (a.downPrice !== null) {
                    aPrice = a.downPrice;
                } else {
                    aPrice = a.price;
                }
                if (b.downPrice !== null) {
                    bPrice = b.downPrice;
                } else {
                    bPrice = b.price;
                }
                if (aPrice > bPrice) {
                    return -1;
                }
                if (aPrice < bPrice) {
                    return 1;
                }
                return 0;
            }
            $('#sortSelect').on('change', function () {
                var valueSelected = $(this).val();
                switch (valueSelected) {

                    case 'title-ascending':
                    {
                        data.sort(compareASC);
                        console.log(data);
                        $('#pagination').twbsPagination('destroy')
                        pageList();
                        break;
                    }
                    case 'title-descending':
                    {
                        data.sort(compareDESC);
                        console.log(data);
                        $('#pagination').twbsPagination('destroy')
                        pageList();
                        break;
                    }
                    case 'best-selling':
                    {
                        data.sort(compareDESCSold);
                        console.log(data);
                        $('#pagination').twbsPagination('destroy')
                        pageList();
                        break;
                    }
                    case 'created-ascending':
                    {
                        data.sort(compareASCreate);
                        console.log(data);
                        $('#pagination').twbsPagination('destroy')
                        pageList();
                        break;
                    }
                    case 'created-descending':
                    {
                        data.sort(compareDESCreate);
                        console.log(data);
                        $('#pagination').twbsPagination('destroy')
                        pageList();
                        break;
                    }
                    case 'price-ascending':
                    {
                        data.sort(compareASCPrice);
                        console.log(data);
                        $('#pagination').twbsPagination('destroy')
                        pageList();
                        break;
                    }
                    case 'price-descending':
                    {
                        data.sort(compareDESCPrice);
                        console.log(data);
                        $('#pagination').twbsPagination('destroy')
                        pageList();
                        break;
                    }
                    default:

                        break;
                }
            }
            )
        </script>
    </body>
</html>
