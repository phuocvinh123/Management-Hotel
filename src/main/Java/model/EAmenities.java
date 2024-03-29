package model;

public enum EAmenities {
    WIFI("WIFI"), TV("TV");
    final String value;
     EAmenities(String value){
        this.value = value;
    }

    public String getValue() {
        return value;
    }
}
