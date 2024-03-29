package dao;


import model.Auth;
import model.Rating;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RatingDAO extends DatabaseConnection {
    public List<Rating> selectAll(int id) {
        String SELECT_RATING_SQL = "select r.*, u.img as img ,u.name as name from rating r \n" +
                "left join rooms ro on ro.id = r.room_id \n" +
                "left join user u on r.user_id = u.id " +
                "where r.room_id =  ? ; ";
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_RATING_SQL);
            preparedStatement.setInt(1, id);
            var rs = preparedStatement.executeQuery();
            var ratingList = new ArrayList<Rating>();
            while (rs.next()) {
                Rating rating = new Rating();
                rating.setScores(rs.getDouble("scores"));
                rating.setDate(rs.getDate("date"));
                rating.setComment(rs.getString("comment"));
                rating.setAuth(new Auth(rs.getString("img"), rs.getString("name")));
                ratingList.add(rating);
            }
            return ratingList;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public void saveRating(Rating rating, int id) {
        String query = "INSERT INTO rating (room_id, user_id, scores, comment, date) VALUES (?, ?, ?, ?, ?)";
        try {
            Connection connection = getConnection();
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, id);
            statement.setInt(2, rating.getAuth().getId());
            statement.setDouble(3, rating.getScores());
            statement.setString(4, rating.getComment());
            statement.setDate(5, rating.getDate());
            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public double findStar(int id) {
        String FIND_STAR = "select avg(r.scores) as scores from rating r left join rooms ro on ro.id = r.room_id left join user u on r.user_id = u.id where r.room_id =  ? ;";
        try {
            Connection connection = getConnection();
            PreparedStatement statement = connection.prepareStatement(FIND_STAR);
            statement.setInt(1, id);
            var rs = statement.executeQuery();
            if (rs.next()) {
                return rs.getDouble("scores");
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return 0;
    }

}
