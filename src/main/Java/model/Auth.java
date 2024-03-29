package model;

public class Auth {
    private int id;
    private String img;
    private String name;
    private String email;
    private String phone;
    private String address;
    private String password;
    private Role role;

    public Auth() {
    }


    public Auth(int id) {
        this.id = id;
    }

    public Auth(String img, String name) {
        this.img = img;
        this.name = name;
    }
    public Auth( String name, String email, String phone, String address) {
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.address = address;
    }
    public Auth(String img, String name, String email, String phone, String address) {
        this.img = img;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.address = address;
    }
    public Auth(String img, String name, String email, String phone, String address, String password) {
        this.img = img;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.password = password;
    }
    public Auth( String img, String name, String email, String phone, String address,  Role role) {
        this.img = img;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.role = role;
    }
    public Auth( String img, String name, String email, String phone, String address, String password, Role role) {
        this.img = img;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.password = password;
        this.role = role;
    }
    public Auth(int id,String img, String name, String phone, String address,String email) {
        this.id = id;
        this.img = img;
        this.name = name;
        this.phone = phone;
        this.address = address;
        this.email = email;
    }

    public Auth(int id, String img, String name, String email, String phone, String address, String password, Role role) {
        this.id = id;
        this.img = img;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.password = password;
        this.role = role;
    }



    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
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

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }


}
