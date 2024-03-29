package model;

import java.sql.Date;
import java.util.List;

public class Rating {
    private int id;
    private Auth auth;
    private Room room;
    private Date date;
    private String comment;
    private double scores;

    public Rating() {
    }
    public Rating(Room room, Auth auth, double scores, String comment, Date date) {
        this.auth = auth;
        this.room = room;
        this.date = date;
        this.comment = comment;
        this.scores = scores;
    }

    public Rating(int id, Auth auth, Room room, Date date, String comment, double scores) {
        this.id = id;
        this.auth = auth;
        this.room = room;
        this.date = date;
        this.comment = comment;
        this.scores = scores;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Auth getAuth() {
        return auth;
    }

    public void setAuth(Auth auth) {
        this.auth = auth;
    }

    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public double getScores() {
        return scores;
    }

    public void setScores(double scores) {
        this.scores = scores;
    }
}
