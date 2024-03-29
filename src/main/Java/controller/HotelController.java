package controller;

import model.Auth;
import model.Rating;
import model.Room;
import service.AuthService;
import service.RatingService;
import service.RoomService;
import model.*;
import service.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.math.BigDecimal;
import java.time.format.DateTimeFormatter;
import java.util.List;


@WebServlet(name = "hotelController", urlPatterns = "/hotel-page")
public class HotelController extends HttpServlet {
    private RoomService roomService;
    private RatingService ratingService;
    private AuthService authService;
    private BookingService bookingService;
    private ProductService productService;
    private BillService billService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "room" -> showRoom(req, resp);
            case "room-detail" -> showRoomDetail(req, resp);
            case "room-detail-booking-null" -> showRoomDetailBookingNull(req, resp);
            case "about-us" -> showAboutUS(req, resp);
            case "bill-detail" -> showBill(req, resp);
            case "blog-details" -> showBlogDetail(req, resp);
            case "blog" -> showBlog(req, resp);
            case "contact" -> showContact(req, resp);
            case "show-bill-detail" -> showBillDetail(req, resp);
            case "delete" -> delete(req, resp);
            default -> showIndex(req, resp);
        }
    }

    private void delete(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int idUser = Integer.parseInt(req.getParameter("id"));
        int idRoom = Integer.parseInt(req.getParameter("idRoom"));
        bookingService.delete(idUser);
        resp.sendRedirect("/hotel-page?action=room-detail-booking-null&message=Change Successful&idroom=" + idRoom + "&iduser=" + idUser);
    }

    private void showBillDetail(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int idUser = Integer.parseInt(req.getParameter("id"));
        req.setAttribute("auth", authService.findByID(idUser));
        req.setAttribute("bills", billService.findByIdUser(idUser));
        req.getRequestDispatcher("hotel/bill.jsp").forward(req, resp);
    }

    private void showRoomDetail(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int idRoom = Integer.parseInt(req.getParameter("idroom"));
        int idUser = Integer.parseInt(req.getParameter("iduser"));
        req.setAttribute("book", bookingService.findByIDAuth(idUser));
        getRoomDetail(idRoom,req,resp);
    }
    private void showRoomDetailBookingNull(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int idRoom = Integer.parseInt(req.getParameter("idroom"));
        int idUser = Integer.parseInt(req.getParameter("iduser"));
        getRoomDetail(idRoom,req,resp);
    }
    private void getRoomDetail(int idRoom,HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        req.setAttribute("room", roomService.findById(idRoom));
        req.setAttribute("star", ratingService.findStar(idRoom));
        req.setAttribute("ratings", ratingService.findAll(idRoom));
        req.setAttribute("message", req.getParameter("message"));
        req.getRequestDispatcher("hotel/room-details.jsp").forward(req, resp);
    }

    private void showContact(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("hotel/contact.jsp").forward(req, resp);
    }

    private void showBlog(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("hotel/blog.jsp").forward(req, resp);
    }

    private void showBlogDetail(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("hotel/blog-details.jsp").forward(req, resp);
    }

    private void showBill(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idRoom = req.getParameter("idroom");
        String id = req.getParameter("id");
        if (idRoom != null) {
            req.setAttribute("room", roomService.findById(Integer.parseInt(idRoom)));
            Booking booking = bookingService.findByIDAuth(Integer.parseInt(id));
            if (booking != null) {
                req.setAttribute("book",booking);
                req.setAttribute("auth", authService.findByID(Integer.parseInt(id)));
                req.setAttribute("products", productService.findAll());
                req.setAttribute("message", req.getParameter("message"));
                req.getRequestDispatcher("bill/bill-detail.jsp").forward(req, resp);
            }else {
                resp.sendRedirect("/hotel-page?action=room-detail&message=Booking invalid!&idroom=" + idRoom + "&iduser=" + id);
            }

        } else {
            req.getRequestDispatcher("bill/bill-detail.jsp").forward(req, resp);
        }

    }

    private void showAboutUS(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("hotel/about-us.jsp").forward(req, resp);
    }

    private void showRoom(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        String pageString = req.getParameter("page");
        if (pageString == null) {
            pageString = "1";
        }
        req.setAttribute("page", roomService.getRooms(Integer.parseInt(pageString), req.getParameter("search"),1));
        req.setAttribute("message", req.getParameter("message"));
        req.setAttribute("search", req.getParameter("search"));
        req.setAttribute("rooms", roomService.findAllRoom());
        req.getRequestDispatcher("hotel/rooms.jsp").forward(req, resp);
    }

    private void showIndex(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        String id = req.getParameter("id");
        if (id != null) {
            req.setAttribute("auth", authService.findByID(Integer.parseInt(req.getParameter("id"))));
            req.setAttribute("message", req.getParameter("message"));
            req.getRequestDispatcher("hotel/index.jsp").forward(req, resp);
        } else {
            req.setAttribute("message", req.getParameter("message"));
            req.getRequestDispatcher("hotel/index.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "comment" -> saveRating(req, resp);
            case "pay" -> pay(req, resp); //lam lai
            case "booking" -> booking(req, resp);
            case "delete" -> delete(req, resp);
            case "booking-room-detail" -> bookingRoom(req, resp);
        }
    }

    private void bookingRoom(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int idRoom = Integer.parseInt(req.getParameter("idroom"));
        getBooking("/hotel-page?action=room-detail&message=Booking Successful&idroom=" + idRoom + "&iduser=", "/hotel-page?action=delete&message=Check In/Check out is invalid&idRoom=" + idRoom + "&id=", req, resp);
    }

    private void getBooking(String sq, String sqr, HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int numberRoom = Integer.parseInt(req.getParameter("roomChoose"));
        int idUser = Integer.parseInt(req.getParameter("id"));
        int numberGuests = 0;
        int a = 1;
        String guest = req.getParameter("guests" + a);
        if (guest != null) {
            for (int i = 0; i < numberRoom; i++) {
                numberGuests += Integer.parseInt(guest);
                a++;
            }
        } else {
            numberGuests = 2;
        }
        Date checkin = getDateCheck("checkin", req);
        Date checkout = getDateCheck("checkout", req);
        if (checkout.after(checkin)) {
            Booking booking = new Booking();
            booking.setAuth(new Auth(idUser));
            booking.setCheckInDate(checkin);
            booking.setCheckOutDate(checkout);
            booking.setNumberRoom(numberRoom);
            booking.setNumberGuests(numberGuests);
            bookingService.create(booking);
            resp.sendRedirect(sq + idUser);
        } else {
            resp.sendRedirect(sqr + idUser);
        }
    }

    private void booking(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        getBooking("/hotel-page?action=room&message=Booking Successful&id=", "/hotel-page?message=Check In/Check out is invalid&id=", req, resp);
    }

    public Date getDateCheck(String str, HttpServletRequest req) {
        String dateCheckin = req.getParameter(str);
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd MMMM, yyyy");
        LocalDate localDate = LocalDate.parse(dateCheckin,formatter);
        return Date.valueOf(localDate);
    }


    private void pay(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int idUser = Integer.parseInt(req.getParameter("id"));
        int idRoom = Integer.parseInt(req.getParameter("room"));
        int idBook = Integer.parseInt(req.getParameter("idbook"));
        Auth auth = new Auth(idUser);

        String productPriceInput = req.getParameter("productPrice");
        BigDecimal productFee;
        if (productPriceInput != null && !productPriceInput.isEmpty()) {
            productFee = new BigDecimal(productPriceInput);
        } else {

            productFee = BigDecimal.ZERO;
        }
        int idProduct = Integer.parseInt(req.getParameter("productID"));
        Product product = new Product(idProduct, productFee);
        Room room = new Room(idRoom);

        String totalFee = req.getParameter("totalAmount");
        BigDecimal total;
        if (totalFee != null && !totalFee.isEmpty()) {
            total = new BigDecimal(totalFee);
        } else {
            total = BigDecimal.ZERO;
        }

        Bill bill = new Bill();
        bill.setCode(String.valueOf(Math.floor(Math.random() * 9000) + 1000));
        bill.setProduct(product);
        bill.setBooking(new Booking(idBook));
        bill.setRoom(room);
        bill.setTotalAmount(total);
        bill.setStatusBill(EStatusBill.Pending);
        bill.setAuth(auth);
        billService.create(bill);
        resp.sendRedirect("/hotel-page?action=show-bill-detail&message=Payment Success&id=" + idUser);

    }

    public void saveRating(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String name = req.getParameter("usernhap");
        String email = req.getParameter("emailnhap");
        req.setAttribute("message", req.getParameter("message"));
        int idRoom = Integer.parseInt(req.getParameter("room_id"));
        Auth auth = authService.findByNameAndEmail(name, email);
        if (auth != null) {
            int authId = auth.getId();
            if (billService.checkBillRating(auth.getId(), idRoom)) {
                ratingService.saveRating(getRating(req, authId), idRoom);
                resp.sendRedirect("hotel-page?action=room-detail&idroom=" + idRoom + "&iduser=" + authId + "&message=rating_success");
            } else {
                resp.sendRedirect("hotel-page?action=room-detail&idroom=" + idRoom + "&iduser=" + authId + "&message=rating_failure");
            }
        }
    }

    public Rating getRating(HttpServletRequest req, int authId) {
        Room room = new Room(Integer.parseInt(req.getParameter("room_id")));
        Auth auth = new Auth(authId);
        String scores = req.getParameter("rating");
        String comment = req.getParameter("comment");
        LocalDate date = LocalDate.now();
        return new Rating(room, auth, Double.parseDouble(scores), comment, Date.valueOf(date));
    }

    @Override
    public void init() throws ServletException {
        roomService = new RoomService();
        ratingService = new RatingService();
        authService = new AuthService();
        bookingService = new BookingService();
        productService = new ProductService();
        billService = new BillService();
    }
}
