package dao;





import model.*;
import service.dto.Page;

import javax.servlet.http.Part;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

public class AuthDao extends DatabaseConnection {

    public List<Auth> getAllAuth(){
        List<Auth> results = new ArrayList<>();
        final String query = "SELECT * FROM `user`";
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Auth auth=new Auth();
                auth.setId(rs.getInt("id"));
                auth.setImg(rs.getString("img"));
                auth.setName(rs.getString("name"));
                auth.setEmail(rs.getString("email"));
                auth.setPhone(rs.getString("phone"));
                auth.setAddress(rs.getString("address"));
                auth.setPassword(rs.getString("password"));
                auth.setRole(new Role(rs.getInt("id"),rs.getString("name")));
                results.add(auth);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return results;
    }

    public void register(Auth auth){
        final String REGISTER_USER = "INSERT INTO user (`img`,`name`, `email`,`phone`,`address`, `password` ) VALUES (?,?,?,?,?,?)";
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(REGISTER_USER);
            preparedStatement.setString(1, auth.getImg());
            preparedStatement.setString(2, auth.getName());
            preparedStatement.setString(3, auth.getEmail());
            preparedStatement.setString(4, auth.getPhone());
            preparedStatement.setString(5, auth.getAddress());
            preparedStatement.setString(6, auth.getPassword());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
    public void registerAdmin(Auth auth){
        final String REGISTER_USER = "INSERT INTO user (`img`,`name`, `email`,`phone`,`address`, `password`,`role_id` ) VALUES (?,?,?,?,?,?,?)";
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(REGISTER_USER);
            preparedStatement.setString(1, auth.getImg());
            preparedStatement.setString(2, auth.getName());
            preparedStatement.setString(3, auth.getEmail());
            preparedStatement.setString(4, auth.getPhone());
            preparedStatement.setString(5, auth.getAddress());
            preparedStatement.setString(6, auth.getPassword());
            preparedStatement.setInt(7, auth.getRole().getId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
    public Auth findByUsernameOrEmail(String usernameOrEmail){
        String SELECT_BY_ID = "SELECT u.*, r.name role_name " +
                " FROM user u JOIN roles r on " +
                " u.role_id = r.id " +
                " WHERE  u.email = ? ";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BY_ID)) {
            preparedStatement.setString(1, usernameOrEmail);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                Auth auth = new Auth();
                auth.setId(rs.getInt("id"));
                auth.setImg(rs.getString("img"));
                auth.setName(rs.getString("name"));
                auth.setEmail(rs.getString("email"));
                auth.setPhone(rs.getString("phone"));
                auth.setAddress(rs.getString("address"));
                auth.setPassword(rs.getString("password"));
                auth.setRole(new Role(rs.getInt("id"), rs.getString("role_name")));
                return auth;
            }
        }catch (Exception e){
            System.out.println(e.getMessage());
        }
        return null;
    }
    public boolean checkEmailExists(String email) {
        String query = "SELECT COUNT(*) FROM user WHERE email = ?";
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, email);
            ResultSet resultSet= preparedStatement.executeQuery();
            if (resultSet.next()) {
                int count = resultSet.getInt(1);
                return count > 0;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return false;
    }
    public void updatePassword(String email, String password) {
        if (checkEmailExists(email)) {
            String query = "UPDATE user SET password = ? WHERE email = ?";
            try {
                Connection connection = getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(query);
                preparedStatement.setString(1, password);
                preparedStatement.setString(2, email);
                preparedStatement.executeUpdate();
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
        } else {
            System.out.println("Email does not exist in the database");
        }
    }
    public Auth findByID(int id){
        String SELECT_BY_ID = "SELECT * FROM user  WHERE id= ? ";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BY_ID)) {
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                Auth auth = new Auth();
                auth.setId(rs.getInt("id"));
                auth.setImg(rs.getString("img"));
                auth.setName(rs.getString("name"));
                auth.setEmail(rs.getString("email"));
                auth.setPhone(rs.getString("phone"));
                auth.setAddress(rs.getString("address"));
                return auth;
            }
        }catch (Exception e){
            System.out.println(e.getMessage());
        }
        return null;
    }
    public Auth findAll(){
        String SELECT_BY_ID = "SELECT name,email,phone,address FROM user ";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BY_ID)) {

            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                Auth auth = new Auth();
                auth.setId(rs.getInt("id"));
                auth.setImg(rs.getString("img"));
                auth.setName(rs.getString("name"));
                auth.setEmail(rs.getString("email"));
                auth.setPhone(rs.getString("phone"));
                auth.setAddress(rs.getString("address"));
                return auth;
            }
        }catch (Exception e){
            System.out.println(e.getMessage());
        }
        return null;
    }
    public Auth findByUsernameAndEmail(String name,String Email){
        String SELECT_BY_ID = "SELECT * FROM user " +
                " WHERE name= ? AND email = ? ";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BY_ID)) {
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, Email);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                Auth auth = new Auth();
                auth.setId(rs.getInt("id"));
                auth.setImg(rs.getString("img"));
                auth.setName(rs.getString("name"));
                auth.setEmail(rs.getString("email"));
                auth.setPhone(rs.getString("phone"));
                auth.setAddress(rs.getString("address"));
                auth.setPassword(rs.getString("password"));
                auth.setRole(new Role(rs.getInt("id"), rs.getString("name")));
                return auth;
            }
        }catch (Exception e){
            System.out.println(e.getMessage());
        }
        return null;
    }
    public void update(Auth auth){
        String UPDATE = "UPDATE user SET `img`=?, `name` = ?, `email` = ?, `phone` = ?, `address` = ? WHERE (`id` = ?)";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE)) {
            preparedStatement.setString(1,auth.getImg());
            preparedStatement.setString(2,auth.getName());
            preparedStatement.setString(3, auth.getEmail());
            preparedStatement.setString(4, auth.getPhone());
            preparedStatement.setString(5, auth.getAddress());
            preparedStatement.setInt(6, auth.getId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());;
        }
    }

    public void saveImageToDatabase(Part part, String fileName, int id) {
        String UPDATE = "UPDATE user SET `img` = ? WHERE (`id` = ?)";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE)) {
            preparedStatement.setBinaryStream(1, part.getInputStream());
            preparedStatement.setInt(2, id);
            preparedStatement.executeUpdate();
        } catch (SQLException | IOException e) {
            e.printStackTrace();
        }
    }

    public Page<Auth> findAllPage(int page, String search){
        Page<Auth> result = new Page<Auth>();
        final int TOTAL_ELEMENT = 5;
        result.setCurrentPage(page);
        ArrayList<Auth> content = new ArrayList<Auth>();
        if(search == null){
            search = "";
        }
        search = "%" + search.toLowerCase() + "%";
        String SELECT_ALL = "SELECT u.id, img, u.name, email, phone, address, r.name role " +
                "FROM user u JOIN roles r ON u.role_id = r.id WHERE (LOWER(u.name) LIKE ? OR LOWER(u.email) LIKE ?) GROUP BY u.id, img, u.name, email, phone, address, r.name   LIMIT ? OFFSET ?";

        String SELECT_COUNT = "SELECT COUNT(1) cnt FROM user u " +
                "WHERE (LOWER(u.name) LIKE ? OR LOWER(u.email) LIKE ?)";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL)) {
            preparedStatement.setString(1, search);
            preparedStatement.setString(2, search);
            preparedStatement.setInt(3,TOTAL_ELEMENT);
            preparedStatement.setInt(4, (page - 1) * TOTAL_ELEMENT);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Auth auth = new Auth();
                auth.setId(rs.getInt("id"));
                auth.setImg(rs.getString("img"));
                auth.setName(rs.getString("name"));
                auth.setEmail(rs.getString("email"));
                auth.setPhone(rs.getString("phone"));
                auth.setAddress(rs.getString("address"));
                auth.setRole(new Role(rs.getInt("id"), rs.getString("name")));
                content.add(auth);
            }
            result.setContent(content);
            PreparedStatement preparedStatementCount = connection.prepareStatement(SELECT_COUNT);
            preparedStatementCount.setString(1, search);
            preparedStatementCount.setString(2, search);
            ResultSet rsCount = preparedStatementCount.executeQuery();
            if(rsCount.next()){
                result.setTotalPage((int) Math.ceil((double) rsCount.getInt("cnt") /TOTAL_ELEMENT));
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());;
        }
        return result;
    }
}
