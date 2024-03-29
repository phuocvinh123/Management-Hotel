package model;

import java.math.BigDecimal;
import java.sql.Date;
import java.time.LocalDate;

public class Bill {
    private int id;
    private String code;
    private Auth auth;
    private Booking booking;
    private Room room;
    private Product product;
    private BigDecimal totalAmount;
    private EStatusBill statusBill;
    private Date dateOfInvoice = Date.valueOf(LocalDate.now());

    public Bill() {

    }

    public Bill(int id, Auth auth, String code, Booking booking,Room room, Product product, BigDecimal totalAmount, EStatusBill statusBill) {
        this.id = id;
        this.auth = auth;
        this.code = code;
        this.booking = booking;
        this.room = room;
        this.product = product;
        this.totalAmount = totalAmount;
        this.statusBill = statusBill;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public BigDecimal getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(BigDecimal totalAmount) {
        this.totalAmount = totalAmount;
    }

    public EStatusBill getStatusBill() {
        return statusBill;
    }

    public void setStatusBill(EStatusBill statusBill) {
        this.statusBill = statusBill;
    }

    public Auth getAuth() {
        return auth;
    }

    public void setAuth(Auth auth) {
        this.auth = auth;
    }

    public Date getDateOfInvoice() {
        return dateOfInvoice;
    }

    public void setDateOfInvoice(Date dateOfInvoice) {
        this.dateOfInvoice = dateOfInvoice;
    }

    public Booking getBooking() {
        return booking;
    }

    public void setBooking(Booking booking) {
        this.booking = booking;
    }
}
