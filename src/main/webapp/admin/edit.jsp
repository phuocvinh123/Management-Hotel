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
        .img-container {
            display: inline-block;
            position: relative;
            margin: 10px;
        }

        .delete-icon {
            position: absolute;
            top: 0;
            right: 0;
            background-color: #ffffff;
            color: #ff0000;
            padding: 0px 5px;
            cursor: pointer;
            font-size: 16px;
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
                                <img class="rounded-circle" src="../hotel/img/room/avatar/${auth.img}"alt="" style="width: 40px; height: 40px;">
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
                                <label for="imgBackground" class="form-label" style="padding-right: 10px;">Ảnh bìa</label>
                                <input type="file" name="img" id="imgBackground" accept="image/*" >
                            </div>
                            <div class="mb-3">
                                <label for="name" class="col-form-label">Name</label>
                                <input class="d-flex justify-content-between select-room-detail"  name="name" value="${auth.name}" >
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
        <div class="container">
            <h3 class="text-center" style="margin: 1.5rem">EDIT ROOM</h3>
            <form action="admin?action=edit&id=${room.id}" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">
                <div class="mb-3">
                    <label for="name" class="form-label">Name</label>
                    <input type="text" class="form-control" id="name" name="name" value="${room.name}" required>
                    <div id="name-error" class="text-danger" style="margin: 5px"></div>
                </div>
                <div class="mb-3">
                    <label for="roomClass" class="form-label">RoomClass</label>
                    <select class="form-control" id="roomClass" name="roomClass" required>
                        <c:forEach var="roomClassItem" items="${roomClass}">
                            <option value="${roomClassItem}" ${room.roomClass == roomClassItem ? 'selected' : ''}>${roomClassItem}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="type" class="form-label">Type</label>
                    <select class="form-control" id="type" name="type" required>
                        <c:forEach var="typeItem" items="${types}">
                            <option value="${typeItem}" ${room.type == typeItem ? 'selected' : ''}>${typeItem}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="price" class="form-label">Price</label>
                    <input type="number" class="form-control" id="price" name="price" value="${room.price}" required min="0">
                </div>
                <div class="mb-3">
                    <label for="description" class="form-label">Description</label>
                    <textarea class="form-control" id="description" name="description" required>${room.description}</textarea>
                </div>
                <div class="mb-3">
                    <label for="img" class="form-label">Image</label>
                    <input type="file" class="form-control" id="img" name="img" accept="image/*" multiple required>
                    <div id="image-preview"></div>
                </div>
                <div class="mb-3">
                    <%--@declare id="amenities"--%><label for="amenities" class="form-label">Amenities</label> <br>
                    <c:forEach var="amenity" items="${amenities}">
                        <input type="checkbox" style="transform: scale(1.3); margin-left: 21px;" name="selectedAmenities" value="${amenity}" id="${amenity}" ${room.amenities.contains(amenity) ? 'checked' : ''}>
                        <label style="margin-left: 5px" for="${amenity}">${amenity}</label>
                    </c:forEach>
                        <div id="error-message" class="text-danger" style="margin: 5px"></div>
                </div>
                <div class="mb-3">
                    <label for="status" class="form-label">Status</label>
                    <select class="form-control" id="status" name="status" required>
                        <c:forEach var="statusItem" items="${status}">
                            <option value="${statusItem}" ${room.status == statusItem ? 'selected' : ''}>${statusItem}</option>
                        </c:forEach>
                    </select>
                </div>
                <button type="submit" class="btn btn-primary">UPDATE</button>
                <a href="/admin" class="btn btn-danger">Cancel</a>
            </form>
        </div>

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
    let existingFiles = [];
    let currentFiles = [];
    const inputElement = document.getElementById("img");
    const previewContainer = document.getElementById("image-preview");

    // Lấy danh sách đường dẫn file từ dữ liệu ban đầu
    <c:forEach items="${room.images}" var="image">
    existingFiles.push("/image${image.url}");
    </c:forEach>

    // Gọi hàm để tải và gán tệp vào ô input
    loadFiles(existingFiles);

    function loadFiles(fileUrls) {
        // Lặp qua danh sách đường dẫn file và tải tệp từ mỗi URL
        fileUrls.forEach(function (fileUrl) {
            fetch(fileUrl)
                .then(response => response.blob())
                .then(blob => {
                    // Tạo một đối tượng File từ Blob và đặt tên tệp
                    const fileName = fileUrl.substring(fileUrl.lastIndexOf("/") + 1);
                    const file = new File([blob], fileName);

                    // Kiểm tra xem tệp đã tồn tại trong danh sách hiện tại chưa
                    if (!currentFiles.some(existingFile => existingFile.name === file.name)) {
                        currentFiles.push(file);
                    }

                    // Cập nhật danh sách tệp trong ô input
                    const newFileList = new DataTransfer();
                    currentFiles.forEach(function (file) {
                        newFileList.items.add(file);
                    });
                    inputElement.files = newFileList.files;

                    // Sau khi thêm tệp vào ô input, cần cập nhật lại giao diện người dùng
                    renderUploadedFiles(currentFiles);
                });
        });
    }

    function renderUploadedFiles(files) {
        previewContainer.innerHTML = ""; // Xóa nội dung hiện tại

        files.forEach(function (file) {
            const imgContainer = document.createElement("div");
            imgContainer.classList.add("img-container");

            const img = document.createElement("img");
            img.src = URL.createObjectURL(file); // Sử dụng URL.createObjectURL để hiển thị tệp đã thêm

            img.style.width = "200px"; // Kích thước hình ảnh xem trước
            img.style.height = "auto";
            img.style.marginTop = "5px";

            const deleteIcon = document.createElement("span");
            deleteIcon.classList.add("delete-icon");
            deleteIcon.innerHTML = "&times;";

            // Gắn sự kiện click vào biểu tượng "x" để xóa hình ảnh và tệp tin
            deleteIcon.addEventListener("click", function () {
                imgContainer.remove();

                // Xóa tệp tương ứng từ danh sách
                const index = currentFiles.findIndex(existingFile => existingFile.name === file.name);
                if (index !== -1) {
                    currentFiles.splice(index, 1);

                    // Cập nhật lại danh sách tệp trong ô input
                    const newFileList = new DataTransfer();
                    currentFiles.forEach(function (file) {
                        newFileList.items.add(file);
                    });
                    inputElement.files = newFileList.files;
                }
            });

            imgContainer.appendChild(img);
            imgContainer.appendChild(deleteIcon);
            previewContainer.appendChild(imgContainer);
        });
    }

    inputElement.addEventListener("change", function (event) {
        const newFiles = event.target.files;
        addNewFiles(newFiles);
    });

    function addNewFiles(newFiles) {
        // Kiểm tra và lọc ra các đối tượng File từ newFiles
        const validNewFiles = Array.from(newFiles).filter(function (file) {
            return file instanceof File;
        });

        validNewFiles.forEach(function (file) {
            if (!currentFiles.some(existingFile => existingFile.name === file.name)) {
                currentFiles.push(file);
            }
        });

        // Cập nhật lại danh sách tệp trong ô input
        const newFileList = new DataTransfer();
        currentFiles.forEach(function (file) {
            newFileList.items.add(file);
        });
        inputElement.files = newFileList.files;

        // Sau khi thêm tệp vào ô input, cần cập nhật lại giao diện người dùng
        renderUploadedFiles(currentFiles);
    }
</script>
<script>
    const nameInput = document.getElementById("name");
    const nameError = document.getElementById("name-error");

    // Sử dụng sự kiện input để kiểm tra sau mỗi lần nhập
    nameInput.addEventListener("input", function () {
        validateName();
    });
    function validateName() {
        const nameValue = nameInput.value.trim(); // Lấy giá trị và loại bỏ khoảng trắng đầu và cuối
        // Sử dụng biểu thức chính quy để kiểm tra xem có ký tự không phải chữ cái không
        const regex = /^[a-zA-Z\s]+$/
        if (!regex.test(nameValue)) {
            nameError.textContent = "Please enter letters only.";
        } else {
            nameError.textContent = ""; // Xóa thông báo lỗi nếu hợp lệ
        }
    }

    const priceInput = document.getElementById("price");
    const priceError = document.getElementById("price-error");

    // Sử dụng sự kiện input để kiểm tra sau mỗi lần nhập
    priceInput.addEventListener("input", function () {
        validatePrice();
    });

    function validatePrice() {
        const priceValue = priceInput.value.trim(); // Lấy giá trị và loại bỏ khoảng trắng đầu và cuối
        // Sử dụng biểu thức chính quy để kiểm tra xem giá tiền là một số hợp lệ (không chứa ký tự đặc biệt)
        const regex = /^[0-9]+(\.[0-9]{1,2})?$/;
        if (!regex.test(priceValue) || parseFloat(priceValue) <= 0) {
            priceError.textContent = "Price is not valid or cannot be negative.";
        } else {
            priceError.textContent = ""; // Xóa thông báo lỗi nếu hợp lệ
        }
    }

    function validateForm() {
        // Lấy danh sách các checkbox có name="selectedAmenities"
        const checkboxes = document.querySelectorAll('input[name="selectedAmenities"]');

        // Kiểm tra nếu không có checkbox nào được chọn
        let isAtLeastOneChecked = false;
        checkboxes.forEach((checkbox) => {
            if (checkbox.checked) {
                isAtLeastOneChecked = true;
            }
        });

        if (!isAtLeastOneChecked) {
            // Hiển thị thông báo trong phần tử HTML với id="error-message"
            const errorMessage = document.getElementById('error-message');
            errorMessage.textContent = "Please select at least one option.";
            return false;
        }
        return true; // Cho phép gửi biểu mẫu nếu ít nhất một checkbox được chọn
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