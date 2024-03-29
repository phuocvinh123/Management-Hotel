package dao;

import dao.DatabaseConnection;
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

import static java.sql.DriverManager.getConnection;

public class RoomDAO extends DatabaseConnection {

     public List<Room> findAllRoom() {
        String SELECT_ALL_ROOMS = "SELECT r.*, group_concat(i.url) as images FROM rooms r JOIN images i ON r.id = i.room_id WHERE r.deleted = '0' group by r.id;";
        List<Room> rooms = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_ROOMS)) {
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Room room = new Room();
                room.setId(rs.getInt("id"));
                room.setName(rs.getString("name"));
                room.setRoomClass(ERoomClass.valueOf(rs.getString("roomclass")));
                room.setType(EType.valueOf(rs.getString("type")));
                room.setPrice(rs.getBigDecimal("price"));
                room.setDescription(rs.getString("description"));
                String amenitiesString = rs.getString("amenities");
                String[] amnetArray = amenitiesString.split(",");
                List<EAmenities> amenitiesList = Arrays.stream(amnetArray).map(EAmenities::valueOf).collect(Collectors.toList());
                room.setAmenities(amenitiesList);
                String imageUrl = rs.getString("images");
                List<Image> imageList = new ArrayList<>();
                for (var item : imageUrl.split(",")) {
                    imageList.add(new Image(item));
                }
                room.setImages(imageList);
                room.setStatus(EStatus.valueOf(rs.getString("status")));
                rooms.add(room);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return rooms;
    }

    public Page<Room> findAll(int page, String search,int index){
        var result = new Page<Room>();
        final int TOTAL_ELEMENT = 6;
        result.setCurrentPage(page);
        var content = new ArrayList<Room>();
        if(search == null){
            search = "";
        }
        search = "%" + search.toLowerCase() + "%";
        var SELECT_ALL = " ";
        var SELECT_COUNT = " ";
        if (index == 0){
            SELECT_ALL += "SELECT r.*, group_concat(i.url) as images " +
                    "FROM rooms r JOIN images i ON r.id = i.room_id WHERE r.deleted = '0' " +
                    "AND (LOWER(r.name) LIKE ? OR LOWER(r.description) LIKE ?) group by r.id  " +
                    " LIMIT ? OFFSET ?";
            SELECT_COUNT += "SELECT COUNT(1) cnt FROM rooms r WHERE r.deleted = '0' " +
                    "AND (LOWER(r.name) LIKE ? OR LOWER(r.description) LIKE ?)";
        } else {
            SELECT_ALL += "SELECT r.*, group_concat(i.url) as images " +
                    "FROM rooms r JOIN images i ON r.id = i.room_id WHERE r.deleted = '0' and r.status = 'Available' " +
                    "AND (LOWER(r.name) LIKE ? OR LOWER(r.description) LIKE ?) group by r.id  " +
                    " LIMIT ? OFFSET ?";
            SELECT_COUNT += "SELECT COUNT(1) cnt FROM rooms r WHERE r.deleted = '0' and r.status = 'Available' " +
                    "AND (LOWER(r.name) LIKE ? OR LOWER(r.description) LIKE ?)";
        }


        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL)) {
            preparedStatement.setString(1, search);
            preparedStatement.setString(2, search);
            preparedStatement.setInt(3,TOTAL_ELEMENT);
            preparedStatement.setInt(4, (page - 1) * TOTAL_ELEMENT);
            System.out.println(preparedStatement);
            var rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Room room = new Room();
                room.setId(rs.getInt("id"));
                room.setName(rs.getString("name"));
                room.setRoomClass(ERoomClass.valueOf(rs.getString("roomclass")));
                room.setType(EType.valueOf(rs.getString("type")));
                room.setPrice(rs.getBigDecimal("price"));
                room.setDescription(rs.getString("description"));
                String amenitiesString = rs.getString("amenities");
                String[] amnetArray = amenitiesString.split(",");
                List<EAmenities> amenitiesList = Arrays.stream(amnetArray).map(EAmenities::valueOf).collect(Collectors.toList());
                room.setAmenities(amenitiesList);
                String imageUrl = rs.getString("images");
                List<Image> imageList = new ArrayList<>();
                for (var item : imageUrl.split(",")) {
                    imageList.add(new Image(item));
                }
                room.setImages(imageList);
                room.setStatus(EStatus.valueOf(rs.getString("status")));
                content.add(room);
            }
            result.setContent(content);
            var preparedStatementCount = connection.prepareStatement(SELECT_COUNT);
            preparedStatementCount.setString(1, search);
            preparedStatementCount.setString(2, search);
            var rsCount = preparedStatementCount.executeQuery();
            if(rsCount.next()){
                result.setTotalPage((int) Math.ceil((double) rsCount.getInt("cnt") /TOTAL_ELEMENT));
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());;
        }
        return result;
    }

    public int create(Room room){
        String CREATE = "INSERT INTO rooms (`name`, `roomclass`, `type`, `price`, `description`, `amenities`, `status`) VALUES (?, ?, ?, ?, ?, ?, ?);";
        String SELECT_MAX_ID = "SELECT MAX(id) as max_id FROM `rooms`";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(CREATE)) {
            preparedStatement.setString(1, room.getName());
            preparedStatement.setString(2, String.valueOf(room.getRoomClass()));
            preparedStatement.setString(3, String.valueOf(room.getType()));
            preparedStatement.setBigDecimal(4, room.getPrice());
            preparedStatement.setString(5, room.getDescription());
            preparedStatement.setString(6, getToString(room.getAmenities()));
            preparedStatement.setString(7, String.valueOf(room.getStatus()));
            preparedStatement.executeUpdate();
            PreparedStatement statementId = connection.prepareStatement(SELECT_MAX_ID);
            var rs = statementId.executeQuery();
            if(rs.next()){
                return rs.getInt("max_id");
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());;
        }
        return -1;
    }

    public Room findById(int id){
        String SELECT_ROOMS_BY_ID = "SELECT r.*, group_concat(i.url) as images FROM rooms r JOIN images i ON r.id = i.room_id where (r.id = ?) AND r.deleted = '0' group by r.id;";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ROOMS_BY_ID)) {
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()){
                Room room = new Room();
                room.setId(rs.getInt("id"));
                room.setName(rs.getString("name"));
                room.setRoomClass(ERoomClass.valueOf(rs.getString("roomclass")));
                room.setType(EType.valueOf(rs.getString("type")));
                room.setPrice(rs.getBigDecimal("price"));
                room.setDescription(rs.getString("description"));
                String amenitiesString = rs.getString("amenities");
                String[] amnetArray = amenitiesString.split(",");
                List<EAmenities> amenitiesList = Arrays.stream(amnetArray).map(EAmenities::valueOf).collect(Collectors.toList());
                room.setAmenities(amenitiesList);
                String imageUrl = rs.getString("images");
                List<Image> imageList = new ArrayList<>();
                for (var item : imageUrl.split(",")) {
                    imageList.add(new Image(item));
                }
                room.setImages(imageList);
                room.setStatus(EStatus.valueOf(rs.getString("status")));
                return room;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public String getToString(List<EAmenities> eAmenities) {
        return eAmenities.stream()
                .map(Enum::name)
                .collect(Collectors.joining(","));
    }

    public void update(Room room){
        String UPDATE_ROOM = "UPDATE rooms SET `name` = ?, `roomclass` = ?, `type` = ?, `price` = ?, `description` = ?, `amenities` = ?, `status` = ? WHERE (`id` = ?)";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_ROOM)) {
            preparedStatement.setString(1, room.getName());
            preparedStatement.setString(2, String.valueOf(room.getRoomClass()));
            preparedStatement.setString(3, String.valueOf(room.getType()));
            preparedStatement.setBigDecimal(4, room.getPrice());
            preparedStatement.setString(5, room.getDescription());
            preparedStatement.setString(6, getToString(room.getAmenities()));
            preparedStatement.setString(7, String.valueOf(room.getStatus()));
            preparedStatement.setInt(8, room.getId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());;
        }
    }

    public void delete(int id) {
        String UPDATE_DELETED = "UPDATE rooms SET `deleted` = '1' WHERE (`id` = ?)";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_DELETED)) {
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public void updateStatus(int id, EStatus status){
        String UPDATE_STATUS_ROOM = "UPDATE `rooms` SET `status` = ? WHERE (`id` = ?)";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_STATUS_ROOM)) {
            preparedStatement.setString(1, String.valueOf(status));
            preparedStatement.setInt(2, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
}
