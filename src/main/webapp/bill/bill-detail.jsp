<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Sona Template">
    <meta name="keywords" content="Sona, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Sona | Template</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Lora:400,700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Cabin:400,500,600,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <!-- Css Styles -->
    <link rel="stylesheet" href="../hotel/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="../hotel/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="../hotel/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="../hotel/css/flaticon.css" type="text/css">
    <link rel="stylesheet" href="../hotel/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="../hotel/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="../hotel/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="../hotel/css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="../hotel/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="../hotel/css/style.css" type="text/css">
    <link rel="stylesheet" href="../bill/snippet.css" type="text/css">
    <link rel="stylesheet" href="../owlcarousel/assets/owl.carousel.min.css">
    <link rel="stylesheet" href="../owlcarousel/assets/owl.theme.default.min.css">
</head>

<body>
<!-- Page Preloder -->
<div id="preloder">
    <div class="loader"></div>
</div>

<!-- Offcanvas Menu Section Begin -->
<div class="offcanvas-menu-overlay"></div>
<div class="canvas-open">
    <i class="icon_menu"></i>
</div>
<div class="offcanvas-menu-wrapper">
    <div class="canvas-close">
        <i class="icon_close"></i>
    </div>
    <div class="search-icon search-switch">
        <i class="icon_search"></i>
    </div>
    <div class="header-configure-area">

        <div class="language-option">
            <img src="../hotel/img/room/avatar/${auth.img}" alt="" style="width: 40px; height: 40px;" alt="">
            <span>${auth.name} <i class="fa fa-angle-down"></i></span>
            <div class="flag-dropdown">
                <ul>
                    <li><a href="#" class="dropdown-item" data-bs-toggle="modal" data-bs-target="#exampleModal"
                           id="${auth.id}">Information</a></li>
                    <li><a href="/auth" class="dropdown-item">Log Out</a></li>
                </ul>
            </div>
        </div>

        <a href="#" class="bk-btn">Booking Now</a>
    </div>
    <nav class="mainmenu mobile-menu">
        <ul>
            <li class="active"><a href="../hotel/index.jsp">Home</a></li>
            <li><a href="../hotel/rooms.jsp">Rooms</a></li>
            <li><a href="../hotel/about-us.jsp">About Us</a></li>
            <li><a href="../hotel/room-details.jsp">Pages</a>
                <ul class="dropdown">
                    <li><a href="../hotel/room-details.jsp">Room Details</a></li>
                    <li><a href="../hotel/blog-details.jsp">Blog Details</a></li>
                    <li><a href="#">Family Room</a></li>
                    <li><a href="#">Premium Room</a></li>
                </ul>
            </li>
            <li><a href="../hotel/blog.jsp">News</a></li>
            <li><a href="../hotel/contact.jsp">Contact</a></li>
        </ul>
    </nav>
    <div id="mobile-menu-wrap"></div>
    <div class="top-social">
        <a href="#"><i class="fa fa-facebook"></i></a>
        <a href="#"><i class="fa fa-twitter"></i></a>
        <a href="#"><i class="fa fa-tripadvisor"></i></a>
        <a href="#"><i class="fa fa-instagram"></i></a>
    </div>
    <ul class="top-widget">
        <li><i class="fa fa-phone"></i> (12) 345 67890</li>
        <li><i class="fa fa-envelope"></i> info.colorlib@gmail.com</li>
    </ul>
</div>
<!-- Offcanvas Menu Section End -->

<!-- Header Section Begin -->
<header class="header-section header-normal">
    <div class="top-nav">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <ul class="tn-left">
                        <li><i class="fa fa-phone"></i> (12) 345 67890</li>
                        <li><i class="fa fa-envelope"></i> info.colorlib@gmail.com</li>
                    </ul>
                </div>
                <div class="col-lg-6">
                    <div class="tn-right">
                        <div class="top-social">
                            <a href="#"><i class="fa fa-facebook"></i></a>
                            <a href="#"><i class="fa fa-twitter"></i></a>
                            <a href="#"><i class="fa fa-tripadvisor"></i></a>
                            <a href="#"><i class="fa fa-instagram"></i></a>
                        </div>
                        <a href="#" class="bk-btn">Booking Now</a>

                        <div class="language-option ">
                            <img src="../hotel/img/room/avatar/${auth.img}" alt="" style="width: 40px; height: 40px;"
                                 alt="">
                            <span>${auth.name} <i class="fa fa-angle-down"></i></span>
                            <div class="flag-dropdown">
                                <ul>
                                    <li><a href="#" class="dropdown-item" data-bs-toggle="modal"
                                           data-bs-target="#exampleModal" id="${auth.id}">Information</a></li>
                                    <li><a href="/auth" class="dropdown-item">Log Out</a></li>
                                </ul>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <%--   hiển thị thông tin     --%>
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">

                </div>
                <div class="modal-body">
                    <form action="/auth?action=edit&id=${auth.id}" method="POST" id="editForm" enctype="multipart/form-data">
                        <div class="mb-3">
                            <label for="img" class="form-label" style="padding-right: 10px;">Ảnh bìa</label>
                            <input type="file" name="img" id="img" accept="image/*" value="${auth.img}">
                        </div>
                        <div class="mb-3">
                            <label for="name" class="col-form-label">Name</label>
                            <input class="d-flex justify-content-between select-room-detail" id="name" name="name" value="${auth.name}" >
                        </div>
                        <div class="mb-3">
                            <label for="email" class="col-form-label">Email</label>
                            <input class="d-flex justify-content-between select-room-detail" id="email" name="email" value="${auth.email}" >
                        </div>
                        <div class="mb-3">
                            <label for="phone" class="col-form-label">Phone</label>
                            <input class="d-flex justify-content-between select-room-detail" id="phone" name="phone" value="${auth.phone}">
                        </div>
                        <div class="mb-3">
                            <label for="address" class="col-form-label">Address</label>
                            <input class="d-flex justify-content-between select-room-detail" id="address" name="address" value="${auth.address}" >
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary" form="editForm">Edit</button>
                </div>
            </div>
        </div>
    </div>
    <%--        --%>
    <div class="menu-item">
        <div class="container">
            <div class="row">
                <div class="col-lg-2">
                    <div class="logo">
                        <a href="../hotel/index.jsp">
                            <img src="../hotel/img/logo.png" alt="">
                        </a>
                    </div>
                </div>
                <div class="col-lg-10">
                    <div class="nav-menu">
                        <nav class="mainmenu">
                            <ul>
                                <li><a href="../hotel/index.jsp">Home</a></li>
                                <li class="active"><a href="../hotel/rooms.jsp">Rooms</a></li>
                                <li><a href="../hotel/about-us.jsp">About Us</a></li>
                                <li><a href="../hotel/room-details.jsp">Pages</a>
                                    <ul class="dropdown">
                                        <li><a href="../hotel/room-details.jsp">Room Details</a></li>
                                        <li><a href="../hotel/blog-details.jsp">Blog Details</a></li>
                                        <li><a href="#">Family Room</a></li>
                                        <li><a href="#">Premium Room</a></li>
                                    </ul>
                                </li>
                                <li><a href="../hotel/blog.jsp">News</a></li>
                                <li><a href="../hotel/contact.jsp">Contact</a></li>
                            </ul>
                        </nav>
                        <div class="nav-right search-switch">
                            <i class="icon_search"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>
<!-- Header End -->

<!-- Breadcrumb Section Begin -->
<div class="breadcrumb-section">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb-text">
                    <h2>YOUR ORDER</h2>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Breadcrumb Section End -->

<!-- Room Details Section Begin -->
<section class="room-details-section spad">
    <div class="containers d-lg-flex">
        <form id="myForm" action="/hotel-page?action=pay&id=${auth.id}&room=${room.id}&idbook=${book.id}" style="width: 100%; display: flex" method="post">
            <div class="box-1 bg-light user">

                <div>
                    <p class="fw-bold">Payment Details</p>
                    <p class="dis mb-3">Complete your purchase by providing your payment details</p>
                </div>
                <div class="box-inner-1 pb-3 mb-3 ">
                    <div class="d-flex justify-content-between mb-3 user details">
                        <p class="fw-bold">${room.name}</p>
                        <p class="fw-lighter"><span class="fas fa-dollar-sign"></span>${room.price * book.numberRoom}$ /
                            night </p>
                    </div>
                    <div class="owl-carousel owl-theme">
                        <c:forEach var="img" items="${room.images}">
                            <img class="owl-lazy" data-src="/image${img.url}" alt=""
                                 style="width: 100%; height: 100%;">
                        </c:forEach>
                    </div>


                    <p class="dis info my-2">DATE IN ${book.checkInDate} , DATE OUT ${book.checkOutDate}
                        , ${book.getDate()} NIGHT
                    </p>
                    <p class="dis info my-2">
                        ${book.numberGuests} GUEST , ${book.numberRoom} ROOM
                    </p>
                    <div class="radiobtn">
                        <c:forEach var="product" items="${products}">
                        <c:if test="${product.id == 1}">
                        <input type="radio" name="box" id="one" data-price="0" data-id="1" onclick="changeProductFee(this)" >
                        <label for="one" class="box py-2 first">
                            </c:if>
                            <c:if test="${product.id == 2}">
                            <input type="radio" name="box" id="two" data-price="${20*book.numberRoom}" data-id="2" onclick="changeProductFee(this)">
                            <label for="two" class="box py-2 second">
                                </c:if>
                                <c:if test="${product.id == 3}">
                                <input type="radio" name="box" id="three" data-price="${100*book.numberRoom}" data-id="3" onclick="changeProductFee(this)">
                                <label for="three" class="box py-2 third">
                                    </c:if>
                                    <div class="d-flex align-items-start">
                                        <span class="circle"></span>
                                        <div class="course">
                                            <div class="d-flex align-items-center justify-content-between mb-2">
                                    <span class="fw-bold">
                                            ${product.name}
                                    </span>
                                                <span class="fas fa-dollar-sign">${product.price} $</span>
                                            </div>
                                            <span>${product.description}</span>
                                        </div>
                                    </div>
                                </label>
                                </c:forEach>
                    </div>
                </div>
            </div>
            <div class="box-2">
                <div class="box-inner-2" style="width: 380px;">
                    <div class="d-flex justify-content-center mb-3 user details">
                        <img src="../hotel/img/room/avatar/${book.auth.img}"
                             class="pic rounded-circle" alt="">
                    </div>
                    <%--                <form action="" style="width: 100%;">--%>
                    <div class="mb-3">
                        <p class="dis fw-bold mb-2">Full Name</p>
                        <p class="form-control">${book.auth.name}</p>
                    </div>
                    <div class="mb-3">
                        <p class="dis fw-bold mb-2">Email address</p>
                        <p class="form-control">${book.auth.email}</p>
                    </div>
                    <div class="mb-3">
                        <p class="dis fw-bold mb-2">Phone number</p>
                        <p class="form-control">${book.auth.phone}</p>
                    </div>
                    <div class="mb-3">
                        <p class="dis fw-bold mb-2">Address</p>
                        <p class="form-control">${book.auth.address}</p>
                    </div>
                    <div>
                        <div class="d-flex flex-column dis">
                            <div class="d-flex align-items-center justify-content-between mb-2">
                                <p>Subtotal</p>
                                <p id="roomfee" data-price="${room.price * book.numberRoom*book.getDate()}"><span
                                        class="fas fa-dollar-sign"></span>${room.price * book.numberRoom*book.getDate()} $</p>
                            </div>
                            <div class="d-flex align-items-center justify-content-between mb-2">
                                <p>Product</p>
                                <p id="productPrice"><span class="fas fa-dollar-sign"></span>0 $</p>
                            </div>
                            <div class="d-flex align-items-center justify-content-between mb-2">
                                <p>VAT<span>(20%)</span></p>
                                <p id="vat"><span class="fas fa-dollar-sign"></span>0 $</p>
                            </div>
                            <div class="d-flex align-items-center justify-content-between mb-2">
                                <p class="fw-bold">Total</p>
                                <p class="fw-bold" id="totalPrice" ><span class="fas fa-dollar-sign"></span>0 $</p>
                            </div>
                            <input type="hidden" name="productPrice" id="productPriceInput">
                            <input type="hidden" name="productID" id="productPriceID">
                            <input type="hidden" name="totalAmount" id="totalInput">
                            <button class="btn btn-primary mt-2" type="submit" id="pay">
                                <span class="fas fa-dollar-sign px-1"></span>0 $
                            </button>
                        </div>
                    </div>
                </div>

            </div>
        </form>
    </div>

</section>
<!-- Room Details Section End -->

<!-- Footer Section Begin -->
<footer class="footer-section">
    <div class="container">
        <div class="footer-text">
            <div class="row">
                <div class="col-lg-4">
                    <div class="ft-about">
                        <div class="logo">
                            <a href="#">
                                <img src="../hotel/img/footer-logo.png" alt="">
                            </a>
                        </div>
                        <p>We inspire and reach millions of travelers<br/> across 90 local websites</p>
                        <div class="fa-social">
                            <a href="#"><i class="fa fa-facebook"></i></a>
                            <a href="#"><i class="fa fa-twitter"></i></a>
                            <a href="#"><i class="fa fa-tripadvisor"></i></a>
                            <a href="#"><i class="fa fa-instagram"></i></a>
                            <a href="#"><i class="fa fa-youtube-play"></i></a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 offset-lg-1">
                    <div class="ft-contact">
                        <h6>Contact Us</h6>
                        <ul>
                            <li>(12) 345 67890</li>
                            <li>info.colorlib@gmail.com</li>
                            <li>856 Cordia Extension Apt. 356, Lake, United State</li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-3 offset-lg-1">
                    <div class="ft-newslatter">
                        <h6>New latest</h6>
                        <p>Get the latest updates and offers.</p>
                        <form action="#" class="fn-form">
                            <input type="text" placeholder="Email">
                            <button type="submit"><i class="fa fa-send"></i></button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="copyright-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-7">
                    <ul>
                        <li><a href="#">Contact</a></li>
                        <li><a href="#">Terms of use</a></li>
                        <li><a href="#">Privacy</a></li>
                        <li><a href="#">Environmental Policy</a></li>
                    </ul>
                </div>
                <div class="col-lg-5">
                    <div class="co-text">
                        <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                            Copyright &copy;<script>document.write(new Date().getFullYear());</script>
                            All rights reserved | This template is made with <i class="fa fa-heart"
                                                                                aria-hidden="true"></i> by <a
                                    href="https://colorlib.com" target="_blank">Colorlib</a>
                            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>
<!-- Footer Section End -->

<!-- Search model Begin -->
<div class="search-model">
    <div class="h-100 d-flex align-items-center justify-content-center">
        <div class="search-close-switch"><i class="icon_close"></i></div>
        <form class="search-model-form">
            <input type="text" id="search-input" placeholder="Search here.....">
        </form>
    </div>
</div>
<!-- Search model end -->

<!-- Js Plugins -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="../hotel/js/jquery-3.3.1.min.js"></script>
<script src="../hotel/js/bootstrap.min.js"></script>
<script src="../hotel/js/jquery.magnific-popup.min.js"></script>
<script src="../hotel/js/jquery.nice-select.min.js"></script>
<script src="../hotel/js/jquery-ui.min.js"></script>
<script src="../hotel/js/jquery.slicknav.js"></script>
<script src="../hotel/js/owl.carousel.min.js"></script>
<script src="../hotel/js/main.js"></script>
<script src="../owlcarousel/jquery.min.js"></script>
<script src="../owlcarousel/owl.carousel.min.js"></script>
<script>
    $('.owl-carousel').owlCarousel({
        items: 1,
        lazyLoad: true,
        loop: true,
        margin: 10
    });

    function changeProductFee(selectedRadio) {
        var newPrice = parseFloat(selectedRadio.getAttribute("data-price"));
        var newID = parseFloat(selectedRadio.getAttribute("data-id"));
        var productPriceElement = document.getElementById("productPrice");
        if (productPriceElement) {
            productPriceElement.innerText = newPrice + " $";
        }
        var roomPrice = parseFloat(document.getElementById("roomfee").getAttribute("data-price")) || 0;
        var vatRate = 0.2; // 20% VAT rate
        var vatPrice = roomPrice * vatRate;
        var total = roomPrice + vatPrice + newPrice;

        // Update the prices in the HTML
        document.getElementById("roomfee").innerText = roomPrice.toFixed(2) + " $";
        document.getElementById("vat").innerText = vatPrice.toFixed(2) + " $";
        document.getElementById("totalPrice").innerText = total.toFixed(2) + " $";
        document.getElementById("pay").innerText =" Pay "+ total.toFixed(2) + " $";


        document.getElementById("productPriceInput").value = newPrice;
        document.getElementById("productPriceID").value = newID;
        document.getElementById("totalInput").value = total;
    }

    window.onload = function () {
        var firstRadioButton = document.getElementById("one");
        firstRadioButton.onclick = function () {
            changeProductFee(this);
        };
        if (!firstRadioButton.checked) {
            firstRadioButton.checked = true;
            changeProductFee(firstRadioButton);
        }
    };


</script>
<script>
    var myModal = new bootstrap.Modal(document.getElementById('exampleModal'), {
        keyboard: false
    });
    $(document).ready(function () {
        // Khi người dùng nhấp vào liên kết "Information"
        $(".edit-link").click(function () {
            // Lấy giá trị id từ thuộc tính data-id của liên kết
            var productId = $(this).data("id");
            // Hiển thị modal tương ứng với id đã lấy được
            $("#exampleModal").modal("show");

            // Truyền giá trị id vào modal
            // Đặt giá trị id vào một phần tử trong modal (ví dụ: một thẻ <span> có id "modalProductId")
            $("#modalProductId").text(productId);
        });
    });
</script>
</body>

</html>