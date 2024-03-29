package dao;

import model.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

public class BookingDAO extends DatabaseConnection{

    public Booking findById(int id){
        String SELECT_BOOKING_BY_ID = "SELECT b.*, u.img AS img, u.`name` AS name, u.phone AS phone, u.address AS address, u.email AS email\n" +
                "FROM bookings b\n" +
                "JOIN `user` u ON b.user_id = u.id\n" +
                "WHERE u.id = ? AND b.deleted = 0 \n" +
                "AND b.id = (SELECT MAX(bk.id)\n" +
                "            FROM  bookings bk \n" +
                "            WHERE bk.user_id = ?);";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BOOKING_BY_ID)) {
            preparedStatement.setInt(1, id);
            preparedStatement.setInt(2, id);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()){
                Booking booking = new Booking();
                booking.setId(rs.getInt("id"));
                booking.setCheckInDate(rs.getDate("check_in"));
                booking.setCheckOutDate(rs.getDate("check_out"));
                booking.setNumberGuests(rs.getInt("number_guests"));
                booking.setNumberRoom(rs.getInt("number_room"));
                booking.setAuth(new Auth(rs.getInt("id"),rs.getString("img"), rs.getString("name"), rs.getString("phone"), rs.getString("address"), rs.getString("email")));
                return booking;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }


    public void create(Booking booking){
        String CREATE_BOOKING = "INSERT INTO bookings (`check_in`, `check_out`, `number_guests`, `number_room`, `user_id`) VALUES (?, ?, ?, ?, ?);";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(CREATE_BOOKING)) {
            preparedStatement.setDate(1, booking.getCheckInDate());
            preparedStatement.setDate(2, booking.getCheckOutDate());
            preparedStatement.setInt(3, booking.getNumberGuests());
            preparedStatement.setInt(4, booking.getNumberRoom());
            preparedStatement.setInt(5, booking.getAuth().getId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());;
        }
    }
    public void delete(int id){
        String DELETE_BOOKING = "UPDATE `bookings` SET `deleted` = 1 WHERE (`user_id` = ?);";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(DELETE_BOOKING)) {
            preparedStatement.setInt(1,id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
}
