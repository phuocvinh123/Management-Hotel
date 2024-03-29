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
    <link rel="stylesheet" href="../owlcarousel/assets/owl.carousel.min.css">
    <link rel="stylesheet" href="../owlcarousel/assets/owl.theme.default.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/toastr@2.1.4/build/toastr.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/toastr@2.1.4/build/toastr.min.css" rel="stylesheet">
    <style>
        .icon_star_alt {
            /* Màu mặc định là xám */
            font-size: 24px;
            color: rgb(128, 128, 128);
            cursor: pointer;
        }
        .icon_star {
            /* Màu vàng cho ngôi sao được đánh giá hoặc đã được nhấp vào */
            color: yellow;
        }
        .select-room-detail {
            width: 100%;
            height: 50px;
            border: 1px solid #EBEBEB;
            border-radius: 2px;
            font-size: 16px;
            color: #19191A;
            text-transform: uppercase;
            font-weight: 500;
            padding-left: 20px;
        }


         .select-room-detail{
             width: 100%;
             height: 50px;
             border: 1px solid #EBEBEB;
             border-radius: 2px;
             font-size: 16px;
             color: #19191A;
             text-transform: uppercase;
             font-weight: 500;
             padding-left: 20px;
         }

        .modal-content {
            background-color: #f8f9fa;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .modal-header {
            background-color: #6c757d;
            color: white;
            border-bottom: none;
            border-radius: 10px 10px 0 0;
        }

        .modal-body {
            padding: 20px;
        }

        .modal-footer {
            background-color: #f8f9fa;
            border-top: none;
            border-radius: 0 0 10px 10px;
        }

        .btn-secondary {
            background-color: #6c757d;
            color: white;
        }

        .btn-primary {
            background-color: #007bff;
            color: white;
        }

        /* Adjust input field styles */
        .form-label {
            font-weight: bold;
        }

        .form-control {
            border: 1px solid #ced4da;
            border-radius: 5px;
            transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
        }

        .form-control:focus {
            border-color: #80bdff;
            outline: 0;
            box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
        }

        /* Center align input fields */
        .d-flex.justify-content-between {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

    </style>
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
            <li><a href="../hotel-page">Home</a></li>
            <li><a href="../hotel-page?action=room">Rooms</a></li>
            <li><a href="../hotel-page?action=about-us">About Us</a></li>
            <li class="active"><a href="#">Pages</a>
                <ul class="dropdown">
                    <li><a href="../hotel-page?action=room-details">Room Details</a></li>
                    <li><a href="#">Deluxe Room</a></li>
                    <li><a href="#">Family Room</a></li>
                    <li><a href="#">Premium Room</a></li>
                </ul>
            </li>
            <li><a href="../hotel-page?action=blog">News</a></li>
            <li><a href="../hotel-page?action=contact">Contact</a></li>
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
    <c:if test="${message != null}">
        <h6 class="d-none" id="message">${message}</h6>
    </c:if>
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
                            <input type="file" name="img" id="img" accept="image/*">
                        </div>
                        <div class="mb-3">
                            <label for="name" class="col-form-label">Name</label>
                            <input class="d-flex justify-content-between select-room-detail" id="name" name="name"
                                   value="${auth.name}">
                        </div>
                        <div class="mb-3">
                            <label for="email" class="col-form-label">Email</label>
                            <input class="d-flex justify-content-between select-room-detail" id="email" name="email"
                                   value="${auth.email}">
                        </div>
                        <div class="mb-3">
                            <label for="phone" class="col-form-label">Phone</label>
                            <input class="d-flex justify-content-between select-room-detail" id="phone" name="phone"
                                   value="${auth.phone}">
                        </div>
                        <div class="mb-3">
                            <label for="address" class="col-form-label">Address</label>
                            <input class="d-flex justify-content-between select-room-detail" id="address" name="address"
                                   value="${auth.address}">
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
                            <img src="img/logo.png" alt="">
                        </a>
                    </div>
                </div>
                <div class="col-lg-10">
                    <div class="nav-menu">
                        <nav class="mainmenu">
                            <ul>
                                <li><a href="../hotel/index.jsp">Home</a></li>
                                <li  class="active"><a href="../hotel-page?action=room&id=${auth.id}">Rooms</a></li>
                                <li><a href="../hotel-page?action=about-us">About Us</a></li>
                                <li><a href="#">Page</a>
                                    <ul class="dropdown">
                                        <li><a href="../hotel-page?action=blog-details">Blog Details</a></li>
                                        <li><a href="../hotel-page?action=show-bill-detail&id=${auth.id}">Bill</a></li>
                                    </ul>
                                </li>
                                <li><a href="../hotel-page?action=blog">News</a></li>
                                <li><a href="../hotel-page?action=contact">Contact</a></li>
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
                    <h2>Our Rooms</h2>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Breadcrumb Section End -->

<!-- Room Details Section Begin -->
<section class="room-details-section spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-8">
                <div class="room-details-item">
                    <div class="owl-carousel owl-theme">
                        <c:forEach var="img" items="${room.images}">
                            <img class="owl-lazy" data-src="/image${img.url}" alt="" style="width: 100%;height: 100%;">
                        </c:forEach>

                    </div>
                    <div class="rd-text">
                        <div class="rd-title">
                            <h3>${room.name}</h3>
                            <div class="rdt-right">
                                <div class="rating" id="starRating" data-score="${star}">
                                </div>
                                <c:if test="${book != null}"><a href="/hotel-page?action=bill-detail&idroom=${room.id}&id=${auth.id}">Booking Now</a></c:if>
                            </div>
                        </div>
                        <h2>${room.price}$<span>/Pernight</span></h2>
                        <table>
                            <tbody>
                            <tr>
                                <td class="r-o">Size:</td>
                                <td>30 ft</td>
                            </tr>
                            <tr>
                                <td class="r-o">Capacity:</td>
                                <td>${room.roomClass.value}</td>
                            </tr>
                            <tr>
                                <td class="r-o">Bed:</td>
                                <td>${room.type.value}</td>
                            </tr>
                            <tr>
                                <td class="r-o">Services:</td>
                                <td>${room.getStringList()}</td>
                            </tr>
                            </tbody>
                        </table>
                        <p class="f-para">Motorhome or Trailer that is the question for you. Here are some of the
                            advantages and disadvantages of both, so you will be confident when purchasing an RV.
                            When comparing Rvs, a motorhome or a travel trailer, should you buy a motorhome or fifth
                            wheeler? The advantages and disadvantages of both are studied so that you can make your
                            choice wisely when purchasing an RV. Possessing a motorhome or fifth wheel is an
                            achievement of a lifetime. It can be similar to sojourning with your residence as you
                            search the various sites of our great land, America.</p>
                        <p>The two commonly known recreational vehicle classes are the motorized and towable.
                            Towable rvs are the travel trailers and the fifth wheel. The rv travel trailer or fifth
                            wheel has the attraction of getting towed by a pickup or a car, thus giving the
                            adaptability of possessing transportation for you when you are parked at your campsite.
                        </p>
                    </div>
                </div>
                <div class="rd-reviews">
                    <h4>Reviews</h4>
                    <div class="review-item">
                        <c:forEach var="rating" items="${ratings}">
                            <div class="review-item">
                                <div class="ri-pic">
                                    <img src="../hotel/img/room/avatar/${rating.auth.img}" alt="">
                                </div>
                                <div class="ri-text">
                                    <span>${rating.date}</span>
                                    <div class="rating">
                                        <c:choose>
                                            <c:when test="${rating.scores == 1}">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star-empty"></i>
                                                <i class="fa fa-star-empty"></i>
                                                <i class="fa fa-star-empty"></i>
                                                <i class="fa fa-star-empty"></i>
                                            </c:when>
                                            <c:when test="${rating.scores == 2}">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star-empty"></i>
                                                <i class="fa fa-star-empty"></i>
                                                <i class="fa fa-star-empty"></i>
                                            </c:when>
                                            <c:when test="${rating.scores == 3}">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star-empty"></i>
                                                <i class="fa fa-star-empty"></i>
                                            </c:when>
                                            <c:when test="${rating.scores == 4}">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star-empty"></i>
                                            </c:when>
                                            <c:when test="${rating.scores == 5}">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                            </c:when>
                                            <c:otherwise>
                                                <i class="fa fa-star-empty"></i>
                                                <i class="fa fa-star-empty"></i>
                                                <i class="fa fa-star-empty"></i>
                                                <i class="fa fa-star-empty"></i>
                                                <i class="fa fa-star-empty"></i>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    <h5>${rating.auth.name}</h5>
                                    <p>${rating.comment}</p>
                                </div>
                            </div>
                        </c:forEach>
                    </div>

                </div>
                <div class="review-add">
                    <h4>Add Review</h4>
                    <form id="comment-form" action="/hotel-page?action=comment" class="ra-form" method="post">
                        <div class="row">
                            <input type="hidden" name="room_id" value="${room.id}">
                            <div class="col-lg-6">
                                <input type="text" placeholder="Name*" name="usernhap" value="${auth.name}">
                            </div>
                            <div class="col-lg-6">
                                <input type="text" placeholder="Email*" name="emailnhap" value="${auth.email}">
                            </div>
                            <div class="col-lg-12">
                                <div>
                                    <div class="rating" id="ratingStars">
                                        <i class="icon_star_alt" onclick="rateStar(1)"></i>
                                        <i class="icon_star_alt" onclick="rateStar(2)"></i>
                                        <i class="icon_star_alt" onclick="rateStar(3)"></i>
                                        <i class="icon_star_alt" onclick="rateStar(4)"></i>
                                        <i class="icon_star_alt" onclick="rateStar(5)"></i>
                                    </div>
                                    <input type="hidden" id="ratingValue" name="rating" value="">
                                </div>
                                <textarea placeholder="Your Review" name="comment"></textarea>
                                <button type="submit" disabled>Submit Now</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="room-booking">
                    <h3>Your Reservation</h3>
                    <c:if test="${book == null}">
                        <form action="/hotel-page?action=booking-room-detail&id=${auth.id}&idroom=${room.id}" method="post">
                            <div class="check-date">
                                <label for="date-in">Check In:</label>
                                <input type="text" class="date-input" id="date-in" name="checkin" onchange="validateDates()" required>
                                <i class="icon_calendar"></i>
                            </div>
                            <div class="check-date">
                                <label for="date-out">Check Out:</label>
                                <input type="text" class="date-input" id="date-out" name="checkout" onchange="validateDates()" required>
                                <i class="icon_calendar"></i>
                            </div>
                            <div class="check-date">
                                <label for="roomChoose">Room:</label>
                                <select id="roomChoose" name="roomChoose" class="select-room-detail">
                                    <option value="1">1 Room</option>
                                    <option value="2">2 Room</option>
                                    <option value="3">3 Room</option>
                                    <option value="4">4 Room</option>
                                    <option value="5">5 Room</option>
                                    <option value="6">6 Room</option>
                                </select>
                            </div>
                            <div class="room-options" id="roomOptions">
                                <!-- Các ô chứa số người trong từng phòng -->
                            </div>
                            <button type="submit">Booking</button>
                        </form>

                    </c:if>
                    <c:if test="${book != null}">
                        <form action="/hotel-page?action=delete&id=${auth.id}&idRoom=${room.id}" method="post">
                            <div class="mb-3">
                                <p class="dis fw-bold mb-2">Check In:</p>
                                <p class="form-control">${book.checkInDate}</p>
                            </div>
                            <div class="mb-3">
                                <p class="dis fw-bold mb-2">Check Out:</p>
                                <p class="form-control">${book.checkOutDate}</p>
                            </div>
                            <div class="mb-3">
                                <p class="dis fw-bold mb-2">Guests: </p>
                                <p class="form-control">${book.numberGuests}</p>
                            </div>
                            <div class="mb-3">
                                <p class="dis fw-bold mb-2">Room: </p>
                                <p class="form-control">${book.numberRoom}</p>
                            </div>
                            <button type="submit" class="btn btn-warning">Change Reservation</button>
                        </form>
                    </c:if>
                </div>
            </div>
        </div>
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
<script src="../hotel/js/update-book.js"></script>
<script src="../owlcarousel/jquery.min.js"></script>
<script src="../owlcarousel/owl.carousel.min.js"></script>

<script>
    const message = document.getElementById('message');
    if (message !== null && message.innerHTML) {
        toastr.success(message.innerHTML);
    }
</script>
<script>
    $('.owl-carousel').owlCarousel({
        items: 1,
        lazyLoad: true,
        loop: true,
        margin: 10
    });

    function rateStar(starIndex) {
        const stars = document.querySelectorAll('#ratingStars i');
        const ratingValueField = document.getElementById('ratingValue');
        const submitButton = document.querySelector('#comment-form button[type="submit"]');

        for (let i = 0; i < stars.length; i++) {
            if (i < starIndex) {
                stars[i].classList.remove('icon_star_alt');
                stars[i].classList.add('icon_star');
            } else {
                stars[i].classList.remove('icon_star');
                stars[i].classList.add('icon_star_alt');
            }
        }

        ratingValueField.value = starIndex;

        if (starIndex > 0) {
            submitButton.removeAttribute('disabled');
        } else {
            submitButton.setAttribute('disabled', 'disabled');
        }
    }
    function convertToStars(score){
        var stars ="";
        var fullStars = Math.floor(score);
        for (var i = 0; i < fullStars ; i++){
            stars += '<i class="fa fa-star"></i> ';
        }
        if (score % 1 !== 0){
            stars += '<i class="fa fa-star-half"></i> ';
        }
        return stars;
    }
    var starRatingElement = document.getElementById("starRating");
    var score = parseFloat(starRatingElement.getAttribute("data-score"));
    starRatingElement.innerHTML = convertToStars(score);
</script>
<script>

    var myModal = new bootstrap.Modal(document.getElementById('exampleModal'), {
        keyboard: false
    });

    $(document).ready(function () {
        $(".edit-link").click(function () {
            var productId = $(this).data("id");
            $("#exampleModal").modal("show");
            $("#modalProductId").text(productId);
        });
    });
</script>
<script>
    function validateDates() {
        var checkInDate = new Date(document.getElementById('date-in').value);
        var checkOutDate = new Date(document.getElementById('date-out').value);
        var checkInDayMonth = checkInDate.getDate() + '-' + (checkInDate.getMonth() + 1);
        var checkOutDayMonth = checkOutDate.getDate() + '-' + (checkOutDate.getMonth() + 1);

        if (checkOutDate <= checkInDate || checkOutDate.getDate() - checkInDate.getDate() <= 0) {
            alert('Ngày "Check Out" không hợp lệ. Vui lòng chọn ngày khác.');
            document.getElementById('date-out').value = '';
            return false;
        }

        return true;
    }
</script>
</body>

</html>