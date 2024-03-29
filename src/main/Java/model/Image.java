package model;

public class Image {
    private int id;
    private String url;
    private Room room;

    public Image(){}

    public Image(int id, String url, Room room) {
        this.id = id;
        this.url = url;
        this.room = room;
    }

    public Image(String url) {
        this.url = url;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }
}
