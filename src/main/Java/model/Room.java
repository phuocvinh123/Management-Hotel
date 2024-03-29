package model;

import model.*;

import java.math.BigDecimal;
import java.util.List;
import java.util.stream.Collectors;

public class Room {
    private int id;
    private String name;
    private ERoomClass roomClass;
    private EType type;
    private BigDecimal price;
    private String description;
    private List<Image> images;
    private List<EAmenities> amenities;
    private EStatus status;

    public Room(){};

    public Room(int id) {
        this.id = id;
    }

    public Room(int id, String name, ERoomClass roomClass, EType type, BigDecimal price, String description, List<Image> images, List<EAmenities> amenities, EStatus status) {
        this.id = id;
        this.name = name;
        this.roomClass = roomClass;
        this.type = type;
        this.price = price;
        this.description = description;
        this.images = images;
        this.amenities = amenities;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public ERoomClass getRoomClass() {
        return roomClass;
    }

    public void setRoomClass(ERoomClass roomClass) {
        this.roomClass = roomClass;
    }

    public EType getType() {
        return type;
    }

    public void setType(EType type) {
        this.type = type;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public List<Image> getImages() {
        return images;
    }

    public void setImages(List<Image> images) {
        this.images = images;
    }

    public List<EAmenities> getAmenities() {
        return amenities;
    }

    public void setAmenities(List<EAmenities> amenities) {
        this.amenities = amenities;
    }

    public EStatus getStatus() {
        return status;
    }

    public void setStatus(EStatus status) {
        this.status = status;
    }

    public String getStringList(){
        return this.amenities.stream().map(EAmenities::name).collect(Collectors.joining(", "));
    }

}
