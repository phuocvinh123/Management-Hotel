package dao;

import model.*;
import service.dto.Page;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

public class BillDAO extends DatabaseConnection{

    public void create(Bill bill) {
        String CREATE_BILL_SQL = "INSERT INTO bill (`code`, `user_id`, `booking_id`, `room_id`, `product_id`, `total_amount`, `date_invoice`,`status`) VALUES (?, ?, ?, ?, ?, ?, ?,?);";
        try{
            Connection connection = getConnection();
            PreparedStatement pre = connection.prepareStatement(CREATE_BILL_SQL);
            pre.setString(1,bill.getCode());
            pre.setInt(2,bill.getAuth().getId());
            pre.setInt(3,bill.getBooking().getId());
            pre.setInt(4,bill.getRoom().getId());
            pre.setInt(5,bill.getProduct().getId());
            pre.setBigDecimal(6,bill.getTotalAmount());
            pre.setDate(7,bill.getDateOfInvoice());
            pre.setString(8,bill.getStatusBill().name());
            pre.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<Bill> getAllBill() {
        String SELECT_ALL_BILL = "SELECT b.id, b.code, b.date_invoice date_invoice, r.price price, p.price price_product, r.name AS room_name, " +
                "r.type, bk.check_in check_in, bk.check_out check_out,bk.number_guests, p.name AS service, u.name AS user_name, u.phone, bk.number_room, b.total_amount AS total, b.status " +
                "FROM bill b JOIN user u ON b.user_id = u.id " +
                "JOIN bookings bk ON b.booking_id = bk.id " +
                "JOIN rooms r ON b.room_id = r.id " +
                "JOIN products p ON b.product_id = p.id";
        List<Bill> bills = new ArrayList<>();

        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_BILL)) {
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                bills.add(getById(rs));
            }
        } catch (SQLException ex) {
            throw new RuntimeException(ex);
        }
        return bills;
    }

    public Bill findById(int id){
        String SELECT_BILL_BY_ID = "SELECT b.id, b.code, b.date_invoice, r.price price, p.price price_product, r.name AS room_name, r.type, bk.check_in check_in, bk.check_out check_out,bk.number_guests, " +
                "p.name AS service, u.name AS user_name, u.phone, bk.number_room, b.total_amount AS total, b.status " +
                "FROM bill b " +
                "JOIN user u ON b.user_id = u.id " +
                "JOIN bookings bk ON b.booking_id = bk.id " +
                "JOIN rooms r ON b.room_id = r.id " +
                "JOIN products p ON b.product_id = p.id " +
                "WHERE b.id = ?";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BILL_BY_ID)) {
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                return getById(rs);
            }
        } catch (SQLException ex) {
            throw new RuntimeException(ex);
        }

        return null;
    }
    public List<Bill> findByIdUser(int idUser){
        String SELECT_BILL_BY_ID = "SELECT b.id, b.code, b.date_invoice, r.price price, p.price price_product, r.name AS room_name, r.type, bk.check_in check_in, bk.check_out check_out,bk.number_guests, " +
                "p.name AS service, u.name AS user_name, u.phone, bk.number_room, b.total_amount AS total, b.status " +
                "FROM bill b " +
                "JOIN user u ON b.user_id = u.id " +
                "JOIN bookings bk ON b.booking_id = bk.id " +
                "JOIN rooms r ON b.room_id = r.id " +
                "JOIN products p ON b.product_id = p.id " +
                "WHERE u.id = ?";
        List<Bill> bills = new ArrayList<>();

        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BILL_BY_ID)) {
            preparedStatement.setInt(1,idUser);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                bills.add(getById(rs));
            }
        } catch (SQLException ex) {
            throw new RuntimeException(ex);
        }
        return bills;
    }

    public Bill getById(ResultSet rs) throws SQLException {
        Bill bill = new Bill();
        bill.setId(rs.getInt("id"));
        bill.setCode(rs.getString("code"));
        bill.setTotalAmount(rs.getBigDecimal("total"));
        bill.setDateOfInvoice(rs.getDate("date_invoice"));

        Room room = new Room();
        room.setName(rs.getString("room_name"));
        room.setType(EType.valueOf(rs.getString("type")));
        room.setPrice(rs.getBigDecimal("price"));

        Product product = new Product();
        product.setName(rs.getString("service"));
        product.setPrice(rs.getBigDecimal("price_product"));

        Booking booking = new Booking();
        booking.setNumberRoom(rs.getInt("number_room"));
        booking.setNumberGuests(rs.getInt("number_guests"));
        booking.setCheckInDate(rs.getDate("check_in"));
        booking.setCheckOutDate(rs.getDate("check_out"));

        Auth auth = new Auth();
        auth.setName(rs.getString("user_name"));
        auth.setPhone(rs.getString("phone"));

        bill.setRoom(room);
        bill.setBooking(booking);
        bill.setProduct(product);
        bill.setAuth(auth);

        // Lấy giá trị trạng thái và gán vào Enum EStatusBill
        String statusStr = rs.getString("status");
        if (statusStr != null) {
            EStatusBill statusBill = EStatusBill.valueOf(statusStr);
            bill.setStatusBill(statusBill);
        }
        return bill;
    }
    public int checkRatingBill(int idUser,int idRoom){
        String SELECT_BILL_BY_ID = "SELECT COUNT(*) AS bill_count \n" +
                "FROM bill\n" +
                "WHERE user_id = ? AND room_id = ? \n" +
                "GROUP BY user_id;";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BILL_BY_ID)) {
            preparedStatement.setInt(1, idUser);
            preparedStatement.setInt(2, idRoom);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                return rs.getInt("bill_count");
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return 0;
    }

    public Page<Bill> findAllBill(int page, String search){
        Page<Bill> result = new Page<Bill>();
        final int TOTAL_ELEMENT = 6;
        result.setCurrentPage(page);
        var content = new ArrayList<Bill>();
        if(search == null){
            search = "";
        }
        search = "%" + search.toLowerCase() + "%";
        var SELECT_ALL = "SELECT b.id, b.code, b.date_invoice date_invoice, r.price price, p.price price_product, r.name AS room_name, " +
                "r.type, bk.check_in check_in, bk.check_out check_out,bk.number_guests, p.name AS service, u.name AS user_name, u.phone, bk.number_room, b.total_amount AS total, b.status " +
                "FROM bill b JOIN user u ON b.user_id = u.id " +
                "JOIN bookings bk ON b.booking_id = bk.id " +
                "JOIN rooms r ON b.room_id = r.id " +
                "JOIN products p ON b.product_id = p.id " +
                "WHERE (LOWER(b.code) LIKE ?) " +
                "LIMIT ? OFFSET ?";

        var SELECT_COUNT = "SELECT COUNT(1) cnt FROM bill b " +
                "WHERE (LOWER(b.code) LIKE ?)";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL)) {
            preparedStatement.setString(1, search);
            preparedStatement.setInt(2,TOTAL_ELEMENT);
            preparedStatement.setInt(3, (page - 1) * TOTAL_ELEMENT);
            System.out.println(preparedStatement);
            var rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Bill bill = new Bill();
                bill.setId(rs.getInt("id"));
                bill.setCode(rs.getString("code"));
                bill.setTotalAmount(rs.getBigDecimal("total"));
                bill.setDateOfInvoice(rs.getDate("date_invoice"));

                Room room = new Room();
                room.setName(rs.getString("room_name"));
                room.setType(EType.valueOf(rs.getString("type")));
                room.setPrice(rs.getBigDecimal("price"));

                Booking booking = new Booking();
                booking.setNumberRoom(rs.getInt("number_room"));
                booking.setNumberGuests(rs.getInt("number_guests"));
                booking.setCheckInDate(rs.getDate("check_in"));
                booking.setCheckOutDate(rs.getDate("check_out"));

                Auth auth = new Auth();
                auth.setName(rs.getString("user_name"));
                auth.setPhone(rs.getString("phone"));

                Product product= new Product();
                product.setName(rs.getString("service"));
                product.setPrice(rs.getBigDecimal("price_product"));

                bill.setRoom(room);
                bill.setBooking(booking);
                bill.setAuth(auth);
                bill.setProduct(product);

                // Lấy giá trị trạng thái và gán vào Enum EStatusBill
                String statusStr = rs.getString("status");
                if (statusStr != null) {
                    EStatusBill statusBill = EStatusBill.valueOf(statusStr);
                    bill.setStatusBill(statusBill);
                }

                content.add(bill);
            }
            result.setContent(content);
            var preparedStatementCount = connection.prepareStatement(SELECT_COUNT);
            preparedStatementCount.setString(1, search);
            var rsCount = preparedStatementCount.executeQuery();
            if(rsCount.next()){
                result.setTotalPage((int) Math.ceil((double) rsCount.getInt("cnt") /TOTAL_ELEMENT));
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());;
        }
        return result;
    }

    public void updateBill(int id, EStatusBill statusBill){
        String UPDATE_STATUS_BILL = "UPDATE bill SET `status` = ? WHERE (`id` = ?)";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_STATUS_BILL)) {
            preparedStatement.setString(1, String.valueOf(statusBill));
            preparedStatement.setInt(2, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
}
