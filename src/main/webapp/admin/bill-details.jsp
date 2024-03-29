<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<div class="card" style="max-width: 730px; margin: 50px auto;">
    <div class="card-body mx-4">
        <div class="container">
            <p class="my-3" style="font-size: 27px; text-align: center;">BILL-DETAIL</p>
            <form action="admin?action=bill-details&id=${bill.id}">
                <div class="row">
                    <ul class="list-unstyled">
                        <li class="text-black"><span class="text-black" style="padding-right: 10px">Client: </span>${bill.auth.name}</li>
                        <li class="text-muted mt-1"><span class="text-black" style="padding-right: 10px">Code Bill: </span>${bill.code}</li>
                        <li class="text-black mt-1"><span class="text-black" style="padding-right: 10px">Issue Date: </span>${bill.dateOfInvoice}</li>
                    </ul>
                </div>
                <hr>
                <div class="row">
                    <div class="col-xl-10">
                        <p>Check-In</p>
                    </div>
                    <div class="col-xl-2">
                        <p class="float-end">${bill.booking.checkInDate}</p>
                    </div>
                    <div class="col-xl-10">
                        <p>Check-Out</p>
                    </div>
                    <div class="col-xl-2">
                        <p class="float-end">${bill.booking.checkOutDate}</p>
                    </div>
                </div>
                <hr>
                <div class="row">
                    <div class="col-xl-10">
                        <p>${bill.room.name}</p>
                    </div>
                    <div class="col-xl-2">
                        <p class="float-end">$${bill.room.price}</p>
                    </div>
                    <div class="col-xl-10">
                        <p>${bill.room.type}</p>
                    </div>
                    <div class="col-xl-10">
                        <p>Quantity: ${bill.booking.numberRoom}</p>
                    </div>
                </div>
                <hr>
                <div class="row">
                    <div class="col-xl-10">
                        <p>${bill.product.name}</p>
                    </div>
                    <div class="col-xl-2">
                        <p class="float-end">$${bill.product.price}</p>
                    </div>
                </div>
                <hr style="border: 2px solid black;">
                <div class="row text-black">
                    <div class="col-xl-12">
                        <p class="float-end fw-bold">Total: $${bill.totalAmount}</p>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>