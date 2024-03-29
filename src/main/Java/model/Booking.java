package model;

import java.sql.Date;
import java.util.concurrent.TimeUnit;

public class Booking {
    private int id;
    private Date checkInDate;
    private Date checkOutDate;
    private int numberGuests;
    private int numberRoom;
    private Auth auth;

    public Booking(){

    }

    public Booking(int id) {
        this.id = id;
    }

    public Booking(int id, Date checkInDate, Date checkOutDate, int numberGuests, int numberRoom, Auth auth) {
        this.id = id;
        this.checkInDate = checkInDate;
        this.checkOutDate = checkOutDate;
        this.numberGuests = numberGuests;
        this.numberRoom = numberRoom;
        this.auth = auth;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getCheckInDate() {
        return checkInDate;
    }

    public void setCheckInDate(Date checkInDate) {
        this.checkInDate = checkInDate;
    }

    public Date getCheckOutDate() {
        return checkOutDate;
    }

    public void setCheckOutDate(Date checkOutDate) {
        this.checkOutDate = checkOutDate;
    }

    public int getNumberGuests() {
        return numberGuests;
    }

    public void setNumberGuests(int numberGuests) {
        this.numberGuests = numberGuests;
    }

    public int getNumberRoom() {
        return numberRoom;
    }

    public void setNumberRoom(int numberRoom) {
        this.numberRoom = numberRoom;
    }

    public Auth getAuth() {
        return auth;
    }

    public void setAuth(Auth auth) {
        this.auth = auth;
    }

    public long getDate() {
        long diff = Math.abs(this.checkOutDate.getTime() - this.checkInDate.getTime());
        return TimeUnit.DAYS.convert(diff, TimeUnit.MILLISECONDS);
    }
}
