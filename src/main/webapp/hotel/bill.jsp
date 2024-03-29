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

    <!-- Css Styles -->
    <link rel="stylesheet" href="../hotel/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="../hotel/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="../hotel/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="../hotel/css/flaticon.css" type="text/css">
    <link rel="stylesheet" href="../hotel/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="../hotel/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="../hotel/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="../hotel/css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="../hotel/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="../hotel/css/style.css" type="text/css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/toastr@2.1.4/build/toastr.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/toastr@2.1.4/build/toastr.min.css" rel="stylesheet">
    <style>
        a:hover, a:focus {
            text-decoration: none;
            outline: none;
            color: #f15454;
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
            <li class="active"><a href="../hotel-page?action=about-us">About Us</a></li>
            <li><a href="#">Pages</a>
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
                            <input type="file" name="img" id="img" accept="image/*" >
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
                            <img src="../hotel/img/logo.png" alt="">
                        </a>
                    </div>
                </div>
                <div class="col-lg-10">
                    <div class="nav-menu">
                        <nav class="mainmenu">
                            <ul>
                                <li><a href="../hotel/index.jsp">Home</a></li>
                                <li><a href="../hotel-page?action=room&id=${auth.id}">Rooms</a></li>
                                <li><a href="../hotel-page?action=about-us">About Us</a></li>
                                <li  class="active"><a href="#">Page</a>
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
                    <h2>Order list</h2>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Breadcrumb Section End -->

<!-- About Us Page Section Begin -->
<section class="aboutus-page-section spad">
    <div class="container">
        <c:if test="${bills == null}">
            <img src="../hotel/img/room/avatar/page-not-found.png">
        </c:if>
        <c:if test="${bills != null}">
            <table class="table table-striped">
                <thead>
                <tr style="vertical-align: middle; text-align: center">
                    <th >CODE</th>
                    <th >CHECK IN</th>
                    <th >CHECK OUT</th>
                    <th >DATE INVOICE</th>
                    <th >STATUS</th>
                    <th >DETAIL</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="bill" items="${bills}">
                    <tr style="vertical-align: middle; text-align: center">
                        <td>${bill.code}</td>
                        <td>${bill.booking.checkInDate}</td>
                        <td>${bill.booking.checkOutDate}</td>
                        <td>${bill.dateOfInvoice}</td>
                        <td>${bill.statusBill}</td>
                        <td>
                            <div>
                                <a href="#" class="icon-link" data-bs-toggle="modal" data-bs-target="#exampleModal-${bill.id}">
                                   <i class="fas fa-edit" style="font-size: 24px; margin-left: 20px"></i>
                                </a>
                            </div>
                        </td>
                    </tr>
                    <div class="modal fade" id="exampleModal-${bill.id}" tabindex="-1"
                         aria-labelledby="exampleModalLabel-${bill.id}" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title">Table Detail</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                            aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <div class="container">
                                        <div class="card container px-6">
                                            <h3 class="text-center">DETAIL ORDER ${bill.code}</h3>
                                            <div class="mb-3">
                                                <p class="dis fw-bold mb-2">Room: </p>
                                                <p class="form-control">${bill.room.name}</p>
                                            </div>
                                            <div class="mb-3">
                                                <p class="dis fw-bold mb-2">Number Room: </p>
                                                <p class="form-control">${bill.booking.numberRoom}</p>
                                            </div>
                                            <div class="mb-3">
                                                <p class="dis fw-bold mb-2">Number Guest: </p>
                                                <p class="form-control">${bill.booking.numberGuests}</p>
                                            </div>
                                            <div class="mb-3">
                                                <p class="dis fw-bold mb-2">Service: </p>
                                                <p class="form-control">${bill.product.name}</p>
                                            </div>
                                            <div class="mb-3">
                                                <p class="dis fw-bold mb-2">Service fee: </p>
                                                <p class="form-control">${bill.product.price * bill.booking.numberRoom}</p>
                                            </div>
                                            <div class="mb-3">
                                                <p class="dis fw-bold mb-2">Total Amount (TAX):</p>
                                                <p class="form-control">${bill.totalAmount}</p>
                                            </div>
                                            <button type="button" class="btn btn-primary" data-bs-dismiss="modal"
                                                    aria-label="Close">Cancel</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                </tbody>
            </table>
        </c:if>
    </div>

</section>
<!-- About Us Page Section End -->


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
<script>
    $(document).ready(function () {
        $(".edit-link").click(function () {
            var productId = $(this).data("id");
            $("#exampleModal .modal-title").text("DETAIL ORDER " + productId);
            $("#exampleModal").modal("show");
        });
    });
</script>
<script>
    const message = document.getElementById('message');
    if (message !== null && message.innerHTML) {
        toastr.success(message.innerHTML);
    }
</script>
</body>

</html>