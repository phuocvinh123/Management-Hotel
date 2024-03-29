package dao;

import model.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO extends DatabaseConnection {
    public List<Product> selectAll() {
        String SELECT_ALL_SQL = "SELECT * FROM products;";
        try {
            Connection connection = getConnection();
            PreparedStatement pre = connection.prepareStatement(SELECT_ALL_SQL);
            var rs = pre.executeQuery();
            List<Product> list = new ArrayList<>();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("id"));
                product.setName(rs.getString("name"));
                product.setPrice(rs.getBigDecimal("price"));
                product.setDescription(rs.getString("description"));
                list.add(product);
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public Product findById(int id) {
        String SELECT_ID_SQL = "SELECT * FROM products where id = ?;";
        try {
            Connection connection = getConnection();
            PreparedStatement pre = connection.prepareStatement(SELECT_ID_SQL);
            pre.setInt(1, id);
            var rs = pre.executeQuery();
            if (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("id"));
                product.setName(rs.getString("name"));
                product.setPrice(rs.getBigDecimal("price"));
                product.setDescription(rs.getString("description"));
                return product;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }
}
