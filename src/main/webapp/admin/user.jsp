<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>DASHMIN - Admin</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href=/img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="/admin/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="/admin/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="/admin/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="/admin/css/style.css" rel="stylesheet">
    <link href="/admin/css/app.css" rel="stylesheet">
    <style>
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
<div class="container-fluid position-relative bg-white d-flex p-0">
    <!-- Spinner Start -->
    <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
            <span class="sr-only">Loading...</span>
        </div>
    </div>
    <!-- Spinner End -->


    <!-- Sidebar Start -->
    <div class="sidebar pe-4 pb-3">
        <nav class="navbar bg-light navbar-light">
            <a href="index.html" class="navbar-brand mx-4 mb-3">
                <h3 class="text-primary"><i class="fa fa-hashtag me-2"></i>ADMIN</h3>
            </a>
            <div class="d-flex align-items-center ms-4 mb-4">
                <div class="position-relative">
                    <img class="rounded-circle" src="../hotel/img/room/avatar/${auth.img}" alt="" style="width: 40px; height: 40px;">
                    <div class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1"></div>
                </div>
                <div class="ms-3">
                    <h6 class="mb-0">${auth.name}</h6>
                    <span>Admin</span>
                </div>
            </div>
            <div class="navbar-nav w-100">
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fa fa-laptop me-2"></i>Elements</a>
                    <div class="dropdown-menu bg-transparent border-0">
                        <a href="/admin" class="dropdown-item">Room</a>
                        <a href="/admin?action=create" class="dropdown-item">Create</a>
                    </div>
                </div>
                <a href="/admin?action=bill" class="nav-item nav-link"><i class="fa fa-th me-2"></i>Bill</a>
                <a href="/admin?action=user" class="nav-item nav-link"><i class="fa fa-keyboard me-2"></i>User</a>
            </div>
        </nav>
    </div>
    <!-- Sidebar End -->


    <!-- Content Start -->
    <div class="content">
        <!-- Navbar Start -->
        <nav class="navbar navbar-expand bg-light navbar-light sticky-top px-4 py-0">
            <a href="index.html" class="navbar-brand d-flex d-lg-none me-4">
                <h2 class="text-primary mb-0"><i class="fa fa-hashtag"></i></h2>
            </a>
            <a href="#" class="sidebar-toggler flex-shrink-0">
                <i class="fa fa-bars"></i>
            </a>
            <form class="d-none d-md-flex ms-4" action="/admin?action=user&page=${page.currentPage}" method="post">
                <div class="input-group">
                    <input class="form-control border-0" type="text" value="${search}" name="search" style="width: 300px" placeholder="Search">
                    <button id="searchButton" class="btn btn-primary">
                        <i class="fas fa-search"></i>
                    </button>
                </div>
            </form>
            <div class="navbar-nav align-items-center ms-auto">
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                        <i class="fa fa-envelope me-lg-2"></i>
                        <span class="d-none d-lg-inline-flex">Message</span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                        <a href="#" class="dropdown-item">
                            <div class="d-flex align-items-center">
                                <img class="rounded-circle" src="../hotel/img/room/avatar/${auth.img}" alt="" style="width: 40px; height: 40px;">
                                <div class="ms-2">
                                    <h6 class="fw-normal mb-0">${auth.name} send you a message</h6>
                                    <small>15 minutes ago</small>
                                </div>
                            </div>
                        </a>
                        <hr class="dropdown-divider">
                        <a href="#" class="dropdown-item">
                            <div class="d-flex align-items-center">
                                <img class="rounded-circle" src="../hotel/img/room/avatar/${auth.img}" alt="" style="width: 40px; height: 40px;">
                                <div class="ms-2">
                                    <h6 class="fw-normal mb-0">${auth.name} send you a message</h6>
                                    <small>15 minutes ago</small>
                                </div>
                            </div>
                        </a>
                        <hr class="dropdown-divider">
                        <a href="#" class="dropdown-item">
                            <div class="d-flex align-items-center">
                                <img class="rounded-circle" src="../hotel/img/room/avatar/${auth.img}" alt="" style="width: 40px; height: 40px;">
                                <div class="ms-2">
                                    <h6 class="fw-normal mb-0">${auth.name} send you a message</h6>
                                    <small>15 minutes ago</small>
                                </div>
                            </div>
                        </a>
                        <hr class="dropdown-divider">
                        <a href="#" class="dropdown-item text-center">See all message</a>
                    </div>
                </div>
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                        <i class="fa fa-bell me-lg-2"></i>
                        <span class="d-none d-lg-inline-flex">Notificatin</span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                        <a href="#" class="dropdown-item">
                            <h6 class="fw-normal mb-0">Profile updated</h6>
                            <small>15 minutes ago</small>
                        </a>
                        <hr class="dropdown-divider">
                        <a href="#" class="dropdown-item">
                            <h6 class="fw-normal mb-0">New user added</h6>
                            <small>15 minutes ago</small>
                        </a>
                        <hr class="dropdown-divider">
                        <a href="#" class="dropdown-item">
                            <h6 class="fw-normal mb-0">Password changed</h6>
                            <small>15 minutes ago</small>
                        </a>
                        <hr class="dropdown-divider">
                        <a href="#" class="dropdown-item text-center">See all notifications</a>
                    </div>
                </div>
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                        <img class="rounded-circle me-lg-2" src="../hotel/img/room/avatar/${auth.img}" alt="" style="width: 40px; height: 40px;">
                        <span class="d-none d-lg-inline-flex">${auth.name}</span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                        <a href="#" class="dropdown-item"  data-bs-toggle="modal" data-bs-target="#exampleModal" id="${auth.id}"  >Information</a>
                        <a href="/auth?action=register_admin" class="dropdown-item"  >create Account</a>
                        <a href="/auth" class="dropdown-item">Log Out</a>
                    </div>
                </div>
            </div>
        </nav>
        <!-- Navbar End -->
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
        <!-- Table Start -->
        <div class="container-fluid" >
            <div id="main-container" class="card container px-6" style="height: 87vh">
                <h3 class="text-center" style="margin: 1.5rem">MANAGEMENT USER</h3>
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th style="padding-left: 30px;">IMAGE</th>
                        <th style="padding-left: 35px;">NAME</th>
                        <th style="padding-left: 55px;">EMAIL</th>
                        <th style="padding-left: 40px;">PHONE</th>
                        <th style="padding-left: 34px;">ACTION</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="auth" items="${page.content}">
                        <tr style="vertical-align: middle;">
                            <td>${auth.id}</td>
                            <td><img src="/hotel/img/room/avatar/${auth.img}" style="width: 100px; height: 100px"></td>
                            <td>${auth.name}</td>
                            <td>${auth.email}</td>
                            <td>${auth.phone}</td>
                            <td>
                                <div class="text-right">
                                    <a href="#" class="icon-link">
                                        <i class="fas fa-edit" style="font-size: 24px; margin-left: 20px"></i>
                                    </a>
                                    <a href="#" class="icon-link" onclick="return confirmDelete()">
                                        <i class="fas fa-trash-alt"  style="font-size: 24px; margin-left: 20px; color: red;"></i>
                                    </a>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <nav aria-label="...">
            <c:set var="url" value="/admin?action=user&page="/>
            <ul class="pagination" style="padding: 12px">
                <li class="page-item <c:if test="${page.currentPage == 1}">disabled</c:if>">
                    <a class="page-link" href="${url}${(page.currentPage - 1)}" tabindex="-1"
                       aria-disabled="true"><</a>
                </li>
                <c:forEach var="number" begin="1" end="${page.totalPage}">
                    <c:if test="${number == page.currentPage}">
                        <li class="page-item active" aria-current="page">
                            <a class="page-link" href="${url}${number}">${number}</a>
                        </li>
                    </c:if>
                    <c:if test="${number != page.currentPage}">
                        <li class="page-item">
                            <a class="page-link" href="${url}${number}">${number}</a>
                        </li>
                    </c:if>
                </c:forEach>
                <li class="page-item <c:if test="${page.currentPage == page.totalPage}">disabled</c:if>">
                    <a class="page-link" href="${url}${(page.currentPage + 1)}">></a>
                </li>
            </ul>
        </nav>
        <!-- Table End -->

        <!-- Footer Start -->
        <div class="container-fluid pt-4 px-4">
            <div class="bg-light rounded-top p-4">
                <div class="row">
                    <div class="col-12 col-sm-6 text-center text-sm-start">
                        &copy; <a href="#">Your Site Name</a>, All Right Reserved.
                    </div>
                    <div class="col-12 col-sm-6 text-center text-sm-end">
                        <!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you'd like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
                        Designed By <a href="https://htmlcodex.com">HTML Codex</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer End -->
    </div>
    <!-- Content End -->


    <!-- Back to Top -->
</div>

<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="/admin/lib/chart/chart.min.js"></script>
<script src="/admin/lib/easing/easing.min.js"></script>
<script src="/admin/lib/waypoints/waypoints.min.js"></script>
<script src="/admin/lib/owlcarousel/owl.carousel.min.js"></script>
<script src="/admin/lib/tempusdominus/js/moment.min.js"></script>
<script src="/admin/lib/tempusdominus/js/moment-timezone.min.js"></script>
<script src="/admin/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

<!-- Template Javascript -->
<script src="/admin/js/main.js"></script>
<script>
    function confirmDelete() {
        return confirm("Bạn có chắc chắn muốn xóa?");
    }
</script>
<script>
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