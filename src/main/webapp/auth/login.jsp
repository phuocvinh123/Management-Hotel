<%--
  Created by IntelliJ IDEA.
  User: MSI GAMING
  Date: 29/09/2023
  Time: 10:58 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
  <link rel="stylesheet" href="/auth/assets/css/style.css"></link>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g=="
          crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <script src="https://cdn.jsdelivr.net/npm/toastr@2.1.4/build/toastr.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/toastr@2.1.4/build/toastr.min.css" rel="stylesheet">
  <style>
    body {
      background-image:url(/auth/assets/R.jpg);
      display: flex;
      justify-content: center;
      align-items: center;
      flex-direction: column;
      font-family: 'Montserrat', sans-serif;
      height: 100vh;
      margin: -20px 0 50px;
    }
    .error-message {
      display: none;
      color: red;
      margin-top: 5px;
      font-style: italic;
      font-size: 14px;
    }
  </style>
</head>
<body>
<h2>Sign in</h2>
<c:if test="${message != null}">
  <h6 class="d-none" id="message">${message}</h6>
</c:if>
<div class="container" id="container">
  <div class="container sign-up-container">
    <form action="/auth?action=register" method="POST" onsubmit="return validateForm()">
      <h1>Create Account</h1>
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
      <button type="submit" > Sign Up </button>
    </form>
  </div>
  <div class="form-container sign-in-container">
    <form action="/auth" method="POST" >
      <h1>Sign in</h1>
      <div class="social-container">
        <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
        <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
        <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
      </div>
      <span>or use your account</span>
      <input type="email" placeholder="Email" name="username" required/>
      <input type="password" placeholder="Password" name="password" required/>
      <a href="/auth/ForgotPassword.jsp">Forgot your password?</a>
      <button>Sign In</button>
    </form>
  </div>
  <div class="overlay-container">
    <div class="overlay">
      <div class="overlay-panel overlay-left">
        <h1>Welcome Back!</h1>
        <p>To keep connected with us please login with your personal info</p>
        <button class="ghost" id="signIn">Sign In</button>
      </div>
      <div class="overlay-panel overlay-right">
        <h1>Hello, Friend!</h1>
        <p>Enter your personal details and start journey with us</p>
        <button class="ghost" id="signUp">Sign Up</button>
      </div>
    </div>
  </div>
</div>
<script src="/auth/assets/js/validex.js"></script>

</body>
</html>
