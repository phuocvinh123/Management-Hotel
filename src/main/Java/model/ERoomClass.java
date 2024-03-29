package model;

public enum ERoomClass {
    STANDARDROOM("Standard Room"), DELUXEROOM("Deluxe Room");
    final String value;
    ERoomClass(String value){
        this.value = value;
    }

    public String getValue() {
        return value;
    }
}
