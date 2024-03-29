<%--
  Created by IntelliJ IDEA.
  User: MSI GAMING
  Date: 02/10/2023
  Time: 10:25 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/toastr@2.1.4/build/toastr.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/toastr@2.1.4/build/toastr.min.css" rel="stylesheet">
    <style>

        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
        }

        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .form-container {
            background-color: #fff;
            padding: 40px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 400px;
        }

        h1 {
            font-size: 24px;
            margin-bottom: 20px;
            text-align: center;
        }

        span {
            font-size: 14px;
            margin-bottom: 10px;
            display: block;
            text-align: center;
        }

        input,
        select {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        .error-message {
            color: red;
            margin-top: 5px;
            display: none;
            font-style: italic;
            font-size: 14px;
        }

        button {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
        }

        .social-container {
            display: flex;
            justify-content: center;
            margin-bottom: 20px;
        }

        .social {
            margin: 0 5px;
            color: #fff;
            background-color: #3b5998;
            width: 30px;
            height: 30px;
            border-radius: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
            text-decoration: none;
        }

        .fab {
            font-size: 16px;
        }
    </style>
</head>
<body>
<c:if test="${message != null}">
    <h6 class="d-none" id="message">${message}</h6>
</c:if>
<div class="container" id="container">
    <a href="/admin" > Back</a>
    <div class="form-container sign-up-container">
        <form action="/auth?action=register_admin" method="POST">
            <h1>Create Account Admin</h1>
            <div class="social-container">
                <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
                <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
                <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
            </div>
            <span>or use your email for registration</span>
            <input type="text" placeholder="Name"  name="name" id="name" required/>
            <div id="nameError" class="error-message" style="display: none;"></div>
            <input type="email" placeholder="Email" name="email" id="email"  required/>
            <div id="emailError" class="error-message" style="display: none;"></div>
            <input type="text" placeholder="Phone number" name="phone" id="phone" required/>
            <div id="phoneError" class="error-message" style="display: none;"></div>
            <input type="text" placeholder="Address" name="address" id="address" required/>
            <div id="addressError" class="error-message" style="display: none;"></div>
            <input type="password" placeholder="Password" id="re_password" name="re_password"  required>
            <div id="passwordError" class="error-message" style="display: none;"></div>
            <input type="password" placeholder="Re_Password" id="password" name="password" onblur="checkPassword()" required />
            <div id="passwordMatchError" class="error-message">Mật khẩu không trùng khớp</div>
            <div>
                <select class="form-select" aria-label="Default select example" id="role" name="role">
                    <c:forEach var="role" items="${roles}">
                        <option value="${role.id}">${role.name}</option>
                    </c:forEach>
                </select>
            </div>
            <button>Sign Up</button>
        </form>
    </div>
</div>
    <script src="/auth/assets/js/validex.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
<script>
    const message = document.getElementById('message');
    if (message !== null && message.innerHTML) {
        toastr.success(message.innerHTML);
    }
</script>
</body>
</html>
