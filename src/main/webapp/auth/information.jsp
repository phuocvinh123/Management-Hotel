<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 9/18/2023
  Time: 9:38 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/toastr@2.1.4/build/toastr.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/toastr@2.1.4/build/toastr.min.css" rel="stylesheet">

</head>
<body>
<%--<div class="container">--%>
<%--    <div class="card container px-6" style="height: 100vh">--%>
<%--        <h3 class="text-center">INFORMATION</h3>--%>
<%--        <c:if test="${message != null}">--%>
<%--            <h6 class="d-none" id="message">${message}</h6>--%>
<%--        </c:if>--%>
<%--        <div class="d-flex justify-content-between">--%>
<%--        <div class="form-group">--%>
<%--            <label for="name">Name</label>--%>
<%--            <div class="d-flex justify-content-between" id="name" > ${auths.name}</div>--%>
<%--        </div>--%>
<%--        <div class="form-group">--%>
<%--            <label for="email">Email</label>--%>
<%--            <div class="d-flex justify-content-between" id="email" > ${auths.email}</div>--%>
<%--        </div>--%>
<%--        <div class="form-group">--%>
<%--            <label for="phone">Phone</label>--%>
<%--            <div class="d-flex justify-content-between" id="phone" > ${auths.phone}</div>--%>
<%--        </div>--%>
<%--        <div class="form-group">--%>
<%--            <label for="address">Address</label>--%>
<%--            <div class="d-flex justify-content-between" id="address" > ${auths.address}</div>--%>
<%--        </div>--%>
<%--        </div>--%>

<%--    </div>--%>
<%--</div>--%>

<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo">Open modal for @mdo</button>
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@fat">Open modal for @fat</button>
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@getbootstrap">Open modal for @getbootstrap</button>

<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">INFORMATION</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="mb-3">
                        <label for="name" class="col-form-label">Name</label>
                        <div class="d-flex justify-content-between" id="name" > ${auths.name}</div>
                    </div>
                    <div class="mb-3">
                        <label for="email" class="col-form-label">Email</label>
                        <div class="d-flex justify-content-between" id="email" > ${auths.email}</div>
                    </div>
                    <div class="mb-3">
                        <label for="phone" class="col-form-label">Phone</label>
                        <div class="d-flex justify-content-between" id="phone" > ${auths.phone}</div>
                    </div>
                    <div class="mb-3">
                        <label for="address" class="col-form-label">Address</label>
                        <div class="d-flex justify-content-between" id="address" > ${auths.address}</div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Send message</button>
            </div>
        </div>
    </div>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
<script>
    const message = document.getElementById('message');
    if (message !== null && message.innerHTML) {
        toastr.success(message.innerHTML);
    }

    var exampleModal = document.getElementById('exampleModal')
    exampleModal.addEventListener('show.bs.modal', function (event) {
        // Button that triggered the modal
        var button = event.relatedTarget
        // Extract info from data-bs-* attributes
        var recipient = button.getAttribute('data-bs-whatever')
        // If necessary, you could initiate an AJAX request here
        // and then do the updating in a callback.
        //
        // Update the modal's content.
        var modalTitle = exampleModal.querySelector('.modal-title')
        var modalBodyInput = exampleModal.querySelector('.modal-body input')

        modalTitle.textContent = 'New message to ' + recipient
        modalBodyInput.value = recipient
    })
</script>
</body>
</html>