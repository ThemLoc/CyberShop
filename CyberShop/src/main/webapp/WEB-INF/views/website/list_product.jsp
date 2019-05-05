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
        <div class="single-product-area" >
            <div class="container" >

                <div class="row">
                    <div class="col-sm-2 wrap-sort-by"></div>
                    <div class="col-sm-3 wrap-sort-by">
                        <strong><h3 style="color: #005983;"> ${cateName}</h3></strong>
                    </div>
                    <div class="col-sm-7 wrap-sort-by">
                        <div class="browse-tags pull-right">
                            <span>Sắp xếp theo:</span>
                            <span class="custom-dropdown custom-dropdown--white">
                                <select id="sortSelect" class="sort-by custom-dropdown__select custom-dropdown__select--white">
                                    <!--<option value="manual">Sản phẩm nổi bật</option>-->
                                    <option value="created-descending" >Mới nhất</option>
                                    <option value="created-ascending" selected>Cũ nhất</option>
                                    <option value="price-ascending">Giá: Tăng dần</option>
                                    <option value="price-descending">Giá: Giảm dần</option>
                                    <option value="title-ascending">Tên: A-Z</option>
                                    <option value="title-descending">Tên: Z-A</option>
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
                            <div class="col-md-12"  style="border-right: 2px solid #eee;color: #666666;border-left: 1px solid #eee;color: #666666">
                                <strong style="font-size: 17px">Bộ lọc</strong>
                                <hr>
                                <strong style="font-size: 14px">Hãng sản xuất</strong>
                                <ul id="ul_listBrand" class="checkbox-inline" style="height: 200px;width: 100%;overflow-y: scroll;font-size: 12px">


                                </ul>
                                <hr>
                                <strong style="font-size: 14px">Mức giá</strong>
                                <ul class="checkbox-inline" style="font-size: 12px">
                                    <li class="checkbox">
                                        <label><input class="checkbox_filter" type="checkbox" name="fooby2" value="plevel1">Dưới 1 triệu</label>
                                    </li>
                                    <li class="checkbox">
                                        <label><input class="checkbox_filter" type="checkbox" name="fooby2" value="plevel2">Từ 1 - 3 triệu</label>
                                    </li>
                                    <li class="checkbox">
                                        <label><input class="checkbox_filter" type="checkbox" name="fooby2" value="plevel3">Từ 3 - 6 triệu</label>
                                    </li>
                                    <li class="checkbox">
                                        <label><input class="checkbox_filter" type="checkbox" name="fooby2" value="plevel4">Từ 6 - 10 triệu</label>
                                    </li>
                                    <li class="checkbox">
                                        <label><input class="checkbox_filter" type="checkbox" name="fooby2" value="plevel5">Từ 10 - 15 triệu</label>
                                    </li>
                                    <li class="checkbox">
                                        <label><input class="checkbox_filter" type="checkbox" name="fooby2" value="plevel6">Trên 15 triệu</label>
                                    </li>
                                </ul>
                                <br/><br/>
                                <button id="btnFilter" class="btn btn-default btn-block" >Lọc</button>
                            </div>
                        </div>
                        <div class="col-md-10" >
                            <div  class="row" id="divList">
                                <!--List Show In here-->
                            </div>
                            <div class="row"  >
                                <div class="product-pagination" >
                                    <div class="" style="text-align:right">
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
        </div>
        <!--Alert Result-->
        <div class="modal fade" id="alertModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
            <div class="vertical-alignment-helper">
                <div class="modal-dialog vertical-align-center modal-sm"  >
                    <div class="modal-content">
                        <div class="modal-body">
                            <img src="<c:url value="/resources/image/icon/checked.png"/>"/> <a id="alertContent" style="color: #02acea"> Thêm vào giỏ hàng thành công!</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="/WEB-INF/views/website/fragment/footer_listProduct_page.jsp" %>   
        <%--<%@include file="/WEB-INF/views/website/fragment/webFooter.jsp" %>--%>   

        <script>
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

            //gobal 
            var result = eval('(' + '${listProductJson}' + ')');
            var data = result;
            var resultPage = eval('(' + '${totalPage}' + ')');
            var totalPage = resultPage;
            var listBrand = [];

            //when window loaded
            $(document).ready(function () {
                for (var i = 0; i < result.length; i++) {
                    listBrand.push(result[i]['brandID']);
                }
                var html = '';
                var x = Array.from(new Set(listBrand.map(JSON.stringify))).map(JSON.parse);
                for (var i = 0; i < x.length; i++) {

                    html += '<li class="checkbox">';
                    html += '<label><input class="checkbox_filter" type="checkbox" name="fooby1" value="' + x[i]['brandID'] + '">' + x[i]['brandName'] + '</label>';
                    html += '</li>';
                }
                //Checkbox set only 1 selected
                $('#ul_listBrand').html(html);
                $("input:checkbox").on('click', function () {
                    var $box = $(this);
                    if ($box.is(":checked")) {
                        var group = "input:checkbox[name='" + $box.attr("name") + "']";
                        $(group).prop("checked", false);
                        $box.prop("checked", true);
                    } else {
                        $box.prop("checked", false);
                    }
                });
                pageList();
                window.scrollTo(0, 0);
            });

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

            //show page list
            function pageList() {
                $('#pagination').twbsPagination({
                    totalPages: totalPage,
                    visiblePages: 5,
                    next: 'Next',
                    prev: 'Prev',
                    onPageClick: function (event, page) {
                        var html = '';
                        var start = 0;
                        var end = data.length;
                        if (totalPage > 1) {
                            if (page >= 1) {
                                if (page < totalPage) {
                                    start = (page - 1) * 12;
                                    end = page * 12;
                                } else {
                                    start = (page - 1) * 12;
                                }
                            }
                        }
                        for (var i = start; i < end; i++) {
                            html += ' <div class="col-md-3" >';
                            html += '<div class="single-shop-product">';
                            html += '<div class="product-upper">';
                            var listImage = data[i]['imagesCollection'];
                            if (listImage !== null) {
                                for (var j = 0; j < listImage.length; j++) {
                                    if (listImage[j]['mainImage'] === true) {
                                        html += '<a href="${pageContext.request.contextPath}/website/singleproduct/' + data[i]['productID'] + '">';
                                        html += '<img src="${pageContext.request.contextPath}/resources/image/img_product/' + listImage[j]['urlImage'] + '" style="width: 100%;height: 200px" class="img-thumbnail img-list-product"/>';
                                        html += ' </a>';
                                    }
                                }
                            }
                            html += '</div>';
                            html += '<div style="height:40px">';
                            if (data[i]['productName'].length < 45) {
                                html += '<h6><a href="${pageContext.request.contextPath}/website/singleproduct/' + data[i]['productID'] + '">' + data[i]['productName'] + '</a></h6>';
                            } else {
                                var name = data[i]['productName'].slice(0, 30) + "...";
                                html += '<h6><a href="${pageContext.request.contextPath}/website/singleproduct/' + data[i]['productID'] + '">' + name + '</a></h6>';
                            }
                            html += '</div>';
                            html += '<div class="product-carousel-price">';
                            if (data[i]['downPrice'] !== null) {
                                html += '<ins>' + formatNumber(data[i]['downPrice'], '.', ',', ) + 'đ</ins> <del>' + formatNumber(data[i]['price'], '.', ',', ) + 'đ</del>';
                            } else {
                                html += ' <ins>' + formatNumber(data[i]['price'], '.', ',', ) + 'đ</ins>';
                            }
                            html += '</div> ';
                            html += '<div class="product-option-shop">';
                            html += '<a onclick="addToCart(' + data[i]['productID'] +')" class="add_to_cart_button" data-quantity="1" data-product_sku="" data-product_id="70" rel="nofollow" >Add to cart</a>';
                            html += '</div>';
                            html += '</div>';
                            html += '</div>';
                        }
                        $('#divList').html('');
                        $('#divList').html(html);
                        jQuery('html, body').animate({
                            scrollTop: $("#scrollPoint").offset().top
                        }, 100);
                    }
                });
            }

            //sort by something selected
            $('#sortSelect').on('change', function () {
                var valueSelected = $(this).val();
                switch (valueSelected) {

                    case 'title-ascending':
                    {
                        data.sort(compareASC);
                        $('#pagination').twbsPagination('destroy')
                        pageList();
                        break;
                    }
                    case 'title-descending':
                    {
                        data.sort(compareDESC);
                        $('#pagination').twbsPagination('destroy')
                        pageList();
                        break;
                    }
                    case 'best-selling':
                    {
                        data.sort(compareDESCSold);
                        $('#pagination').twbsPagination('destroy')
                        pageList();
                        break;
                    }
                    case 'created-ascending':
                    {
                        data.sort(compareASCreate);
                        $('#pagination').twbsPagination('destroy')
                        pageList();
                        break;
                    }
                    case 'created-descending':
                    {
                        data.sort(compareDESCreate);
                        $('#pagination').twbsPagination('destroy')
                        pageList();
                        break;
                    }
                    case 'price-ascending':
                    {
                        data.sort(compareASCPrice);
                        $('#pagination').twbsPagination('destroy')
                        pageList();
                        break;
                    }
                    case 'price-descending':
                    {
                        data.sort(compareDESCPrice);
                        $('#pagination').twbsPagination('destroy')
                        pageList();
                        break;
                    }
                    default:

                        break;
                }
            }
            );

            // process filter
            $('#btnFilter').click(function () {
                var brand;
                $.each($("input[name='fooby1']:checked"), function () {
                    brand = $(this).val();
                });
                var priceLevel;
                $.each($("input[name='fooby2']:checked"), function () {
                    priceLevel = $(this).val();
                });
                if (brand != null || priceLevel != null) {
                    if (brand != null) {
                        var arr = [];
                        for (var i = 0; i < result.length; i++) {
                            var getBrand = result[i]['brandID']['brandID'];
                            if (getBrand == brand) {
                                arr.push(result[i]);
                            }
                        }
                        data = arr;
                    } else {
                        data = result;
                        totalPage = resultPage;
                    }
                    if (priceLevel != null) {
                        var arr2 = [];
                        switch (priceLevel) {
                            case priceLevel = 'plevel1' :
                            {
                                var price;
                                for (var i = 0; i < data.length; i++) {
                                    if (data[i]['downPrice'] != null) {
                                        price = data[i]['downPrice'];
                                    } else {
                                        price = data[i]['price'];
                                    }
                                    if (price < 1000000) {
                                        arr2.push(data[i]);
                                    }
                                }
                                data = arr2;
                                break;
                            }
                            case priceLevel = 'plevel2' :
                            {
                                var price;
                                for (var i = 0; i < data.length; i++) {
                                    if (data[i]['downPrice'] != null) {
                                        price = data[i]['downPrice'];
                                    } else {
                                        price = data[i]['price'];
                                    }
                                    if (price > 1000000 && price < 3000000) {
                                        arr2.push(data[i]);
                                    }
                                }
                                data = arr2;
                                break;
                            }
                            case priceLevel = 'plevel3' :
                            {
                                var price;
                                for (var i = 0; i < data.length; i++) {
                                    if (data[i]['downPrice'] !== null) {
                                        price = data[i]['downPrice'];
                                    } else {
                                        price = data[i]['price'];
                                    }
                                    if (price > 3000000 && price < 6000000) {
                                        arr2.push(data[i]);
                                    }
                                }
                                data = arr2;

                                break;
                            }
                            case priceLevel = 'plevel4' :
                            {
                                var price;
                                for (var i = 0; i < data.length; i++) {
                                    if (data[i]['downPrice'] !== null) {
                                        price = data[i]['downPrice'];
                                    } else {
                                        price = data[i]['price'];
                                    }
                                    if (price < 10000000 && price > 6000000) {
                                        arr2.push(data[i]);
                                    }
                                }
                                data = arr2;
                                break;
                            }
                            case priceLevel = 'plevel5' :
                            {
                                var price;
                                for (var i = 0; i < data.length; i++) {
                                    if (data[i]['downPrice'] !== null) {
                                        price = data[i]['downPrice'];
                                    } else {
                                        price = data[i]['price'];
                                    }
                                    if (price > 10000000 && price < 15000000) {
                                        arr2.push(data[i]);
                                    }
                                }
                                data = arr2;
                                break;
                            }
                            case priceLevel = 'plevel6' :
                            {
                                var price;
                                for (var i = 0; i < data.length; i++) {
                                    if (data[i]['downPrice'] !== null) {
                                        price = data[i]['downPrice'];
                                    } else {
                                        price = data[i]['price'];
                                    }
                                    if (price > 15000000) {
                                        arr2.push(data[i]);
                                    }
                                }
                                data = arr2;
                                break;
                            }
                            default:
                                break;
                        }
                    }
                    totalPage = 1;
                    if (data.length > 12) {
                        var page = data.length / 12;
                        totalPage = Math.ceil(page);
                    }
                } else {
                    data = result;
                    totalPage = resultPage;
                }

                $('#pagination').twbsPagination('destroy')
                pageList();
            });

            //add to cart
            function addToCart(productID) {
                    $.ajax({
                        type: "POST",
                        url: "${pageContext.request.contextPath}/api/cart/add",
                        dataType: 'text',
                        data: {
                            productId: productID,
                            qty: 1},
                        timeout: 100000,
                        success: function (result) {
                            if (result == "addSuccess") {
                                var count = $('#product-count').text();
                                count++;
                                $('#product-count').text(count);
                                $("#alertContent").text("Thêm vào giỏ hàng thành công!");
                                $("#alertModal").fadeTo(2000, 500).slideUp(500, function () {
                                    $("#alertModal").slideUp(500);
                                });
                            } else if (result == "duplicate") {
                                $("#alertContent").text("Thêm vào giỏ hàng thành công!");
                                $("#alertModal").fadeTo(2000, 500).slideUp(500, function () {
                                    $("#alertModal").slideUp(500);
                                });
                            } else {
                                $("#alertContent").text("Lỗi ! Thêm thất bại.");
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
        </script>
    </body>
</html>
