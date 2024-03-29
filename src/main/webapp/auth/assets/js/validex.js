const message = document.getElementById('message');
if (message !== null && message.innerHTML) {
    toastr.success(message.innerHTML);
}
const signUpButton = document.getElementById('signUp');
const signInButton = document.getElementById('signIn');
const container = document.getElementById('container');

signUpButton.addEventListener('click', () => {
    container.classList.add('right-panel-active');
});

signInButton.addEventListener('click', () => {
    container.classList.remove('right-panel-active');
});

function checkPassword() {
    var password = document.getElementById('password').value;
    var rePassword = document.getElementById('re_password').value;
    var errorDiv = document.getElementById('passwordMatchError');

    if (rePassword !== password) {
        errorDiv.style.display = 'block';
    } else {
        errorDiv.style.display = 'none';
    }
}
// Kiểm tra tính hợp lệ của số điện thoại
function validatePhone() {
    var phoneInput = document.getElementById("phone");
    var phonePattern = /^(07|02|03|09|08)\d{8}$/;
    var phoneError = document.getElementById("phoneError");

    if (!phonePattern.test(phoneInput.value)) {
        phoneInput.classList.add("invalid");
        phoneError.innerText = "Invalid phone number. Please enter a valid 10-digit phone number starting with 07, 02, 03, 09, or 08.";
        phoneError.style.display = "block";
        return false;
    } else {
        phoneInput.classList.remove("invalid");
        phoneError.style.display = "none";
        return true;
    }
}

// Xử lý sự kiện khi người dùng rời khỏi trường số điện thoại
document.getElementById("phone").addEventListener("blur", validatePhone);

function validateName() {
    var nameInput = document.getElementById("name");
    var namePattern =/^[\p{L}\s.'-]{10,}$/u;
    var nameError = document.getElementById("nameError");

    if (!namePattern.test(nameInput.value)) {
        nameInput.classList.add("invalid");
        nameError.innerText = "Invalid name. Please enter a valid name containing only letters and spaces.";
        nameError.style.display = "block";
        return false;
    } else {
        nameInput.classList.remove("invalid");
        nameError.style.display = "none";
        return true;
    }
}

// Xử lý sự kiện khi người dùng rời khỏi trường tên
document.getElementById("name").addEventListener("blur", validateName);
function validateEmail() {
    var emailInput = document.getElementById("email");
    var emailPattern = /^\w+([.-]?\w+)*@\w+([.-]?\w+)*(\.\w{2,3})+$/;
    var emailError = document.getElementById("emailError");

    if (!emailPattern.test(emailInput.value)) {
        emailInput.classList.add("invalid");
        emailError.innerText = "Invalid email address. Please enter a valid email.";
        emailError.style.display = "block";
        return false;
    } else {
        emailInput.classList.remove("invalid");
        emailError.style.display = "none";
        return true;
    }
}

// Xử lý sự kiện khi người dùng rời khỏi trường email
document.getElementById("email").addEventListener("blur", validateEmail);
// Kiểm tra tính hợp lệ của địa chỉ
function validateAddress() {
    var addressInput = document.getElementById("address");
    var addressError = document.getElementById("addressError");

    if (addressInput.value.length < 12) {
        addressInput.classList.add("invalid");
        addressError.innerText = "Address must be at least 12 characters long.";
        addressError.style.display = "block";
        return false;
    } else {
        addressInput.classList.remove("invalid");
        addressError.style.display = "none";
        return true;
    }
}

// Xử lý sự kiện khi người dùng rời khỏi trường địa chỉ
document.getElementById("address").addEventListener("blur", validateAddress);
// Kiểm tra tính hợp lệ của mật khẩu
function validatePassword() {
    var passwordInput = document.getElementById("re_password");
    var passwordError = document.getElementById("passwordError");
    var passwordPattern = /^\d{6,}$/;

    if (!passwordPattern.test(passwordInput.value)) {
        passwordInput.classList.add("invalid");
        passwordError.innerText = "Password must contain at least 6 digits.";
        passwordError.style.display = "block";
        return false;
    } else {
        passwordInput.classList.remove("invalid");
        passwordError.style.display = "none";
        return true;
    }
}

// Xử lý sự kiện khi người dùng rời khỏi trường mật khẩu
document.getElementById("re_password").addEventListener("blur", validatePassword);

function validateForm() {
    var nameError = document.getElementById('nameError');
    var emailError = document.getElementById('emailError');
    var phoneError = document.getElementById('phoneError');
    var addressError = document.getElementById('addressError');
    var passwordMatchError = document.getElementById('passwordMatchError');

    if (
        nameError.style.display !== 'none' ||
        emailError.style.display !== 'none' ||
        phoneError.style.display !== 'none' ||
        addressError.style.display !== 'none' ||
        passwordMatchError.style.display !== 'none'
    ) {
        return false;
    }

    return true;
}