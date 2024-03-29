package model;

public enum EType {
    SINGLEROOM("Single Room"), DOUBLEROOM("Double Room");
    final String value;
    EType(String value){
        this.value = value;
    }

    public String getValue() {
        return value;
    }
}
