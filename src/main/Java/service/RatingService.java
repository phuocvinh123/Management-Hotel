package service;

import dao.RatingDAO;
import model.Auth;
import model.Rating;
import model.Room;

import java.sql.Date;
import java.util.List;


public class RatingService {
    private RatingDAO ratingDAO;

    public RatingService() {
        ratingDAO = new RatingDAO();

    }
    public List<Rating> findAll(int id) {
        return ratingDAO.selectAll(id);
    }

    public void saveRating(Rating rating ,int id) {
        ratingDAO.saveRating(rating,id);
    }

    public double findStar(int idRoom) {
        return ratingDAO.findStar(idRoom);
    }
}
