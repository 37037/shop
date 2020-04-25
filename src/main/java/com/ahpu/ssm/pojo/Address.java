package com.ahpu.ssm.pojo;

public class Address {
    private String address;
    private String aid;
    private String phone;
    private String username;
    private String person;

    public Address() {
    }

    public Address(String address, String aid, String phone, String username, String person) {
        this.address = address;
        this.aid = aid;
        this.phone = phone;
        this.username = username;
        this.person = person;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getAid() {
        return aid;
    }

    public void setAid(String aid) {
        this.aid = aid;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPerson() {
        return person;
    }

    public void setPerson(String person) {
        this.person = person;
    }
}