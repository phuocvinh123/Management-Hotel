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
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/toastr@2.1.4/build/toastr.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/toastr@2.1.4/build/toastr.min.css" rel="stylesheet">
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
                        <a href="admin?action=create" class="dropdown-item">Create</a>
                    </div>
                </div>
                <a href="admin?action=bill" class="nav-item nav-link"><i class="fa fa-th me-2"></i>Bill</a>
                <a href="admin?action=user" class="nav-item nav-link"><i class="fa fa-keyboard me-2"></i>User</a>
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
            <form class="d-none d-md-flex ms-4" action="/admin?page=${page.currentPage}">
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
            <div id="main-container" class="card container px-6" style="height: 75vh">
                <h3 class="text-center" style="margin: 1.5rem">MANAGEMENT ROOM</h3>
                <c:if test="${message != null}">
                    <h6 class="d-none" id="message">${message}</h6>
                </c:if>
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th style="padding-left: 50px;">NAME</th>
                        <th style="padding-left: 22px;">ROOMCLASS</th>
                        <th style="padding-left: 32px;">TYPE</th>
                        <th style="padding-left: 6px;">PRICE</th>
                        <th style="padding-left: 30px;">DESCRIPTION</th>
                        <th style="padding-left: 22px;">IMAGE</th>
                        <th >AMENITIES</th>
                        <th style="padding-left: 21px;">STATUS</th>
                        <th style="padding-left: 34px;">ACTION</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="room" items="${page.content}">
                        <tr style="vertical-align: middle;">
                            <td>${room.id}</td>
                            <td>${room.name}</td>
                            <td>${room.roomClass}</td>
                            <td>${room.type}</td>
                            <td>${room.price}</td>
                            <td>${room.description}</td>
                            <td><img src="/image${room.images[0].url}" style="width: 100px; height: auto"></td>
                            <td>${room.getStringList()}</td>
                            <td>
                                <select name="roomStatus" class="form-control room-status" style="width: 80%" onchange="updateRoomStatus(this)" data-room-id="${room.id}">
                                    <option value="Available" ${room.status == 'Available' ? 'selected' : ''}>Available</option>
                                    <option value="Reserved" ${room.status == 'Reserved' ? 'selected' : ''}>Reserved</option>
                                    <option value="Occupied" ${room.status == 'Occupied' ? 'selected' : ''}>Occupied</option>
                                </select>
                            </td>
                            <td>
                                <div class="text-right">
                                    <a href="/admin?action=edit&id=${room.id}" class="icon-link">
                                        <i class="fas fa-edit" style="font-size: 24px; margin-left: 20px"></i>
                                    </a>
                                    <a href="/admin?action=delete&id=${room.id}" class="icon-link" onclick="return confirmDelete()">
                                        <i class="fas fa-trash-alt" style="font-size: 24px; margin-left: 20px; color: red;"></i>
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
            <c:set var="url" value="/admin?page="/>
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
    const message = document.getElementById('message');
    if (message !== null && message.innerHTML) {
        toastr.success(message.innerHTML);
    }

    function confirmDelete() {
        return confirm("Bạn có chắc chắn muốn xóa?");
    }

    async function updateRoomStatus(select) {
        // Lấy id và status mới
        const roomId = select.dataset.roomId;
        const newStatus = select.value;

        // Disable select để tránh thay đổi nhiều lần
        select.disabled = true;

        try {
            // Gửi request lên server để cập nhật
            const response = await fetch('/admin?action=updateRoom&id=' + roomId + '&status=' + newStatus);

            // Kiểm tra response có ok không
            if (!response.ok) {
                throw new Error('Update failed');
            }

            // Cập nhật thành công, hiển thị thông báo sử dụng toastr
            toastr.success('Update successful');
        } catch (error) {
            // Hiển thị lỗi cho người dùng bằng toastr với type là 'error'
            toastr.error(error.message, 'Error');
        } finally {
            // Mở khóa select để cho phép thay đổi tiếp
            select.disabled = false;
        }
    }


    document.addEventListener('DOMContentLoaded', function() {
        // Lấy tất cả các select dropdown
        const selects = document.querySelectorAll('.room-status');

        // Hàm để xử lý sự kiện thay đổi select option
        function handleSelectChange(event) {
            const select = event.target;
            const value = select.value;

            // Xóa các lớp CSS và màu nền trước khi cập nhật
            select.classList.remove('status-available', 'status-reserved', 'status-occupied');

            if (value === 'Available') {
                select.classList.add('status-available');
                select.style.backgroundColor = '#7cfbb9';
            } else if (value === 'Reserved') {
                select.classList.add('status-reserved');
                select.style.backgroundColor = '#ffff86';
            } else if (value === 'Occupied') {
                select.classList.add('status-occupied');
                select.style.backgroundColor = '#f6a4b0';
            }
        }

        // Gắn sự kiện change cho mỗi select dropdown
        selects.forEach(select => {
            select.addEventListener('change', handleSelectChange);
        });

        // Gọi hàm handleSelectChange khi trang web được tải
        selects.forEach(select => {
            handleSelectChange({ target: select });
        });
    });

</script>
<script>
    $(document).ready(function () {
        $(".edit-link").click(function () {
            var productId = $(this).data("id");
            $("#exampleModal").modal("show");
            $("#modalProductId").text(productId);
        });
    });

</script>
</body>
</html>