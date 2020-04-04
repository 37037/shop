package com.ahpu.ssm.pojo;



public class Cart {
    private String product;
    private Integer count;
    private String uid;
    private String cid;
    private double price;

    public Cart(String product, Integer count, String uid, String cid, double price) {
        this.product = product;
        this.count = count;
        this.uid = uid;
        this.cid = cid;
        this.price = price;
    }

    public Cart() {
    }

    public String getProduct() {
        return product;
    }

    public void setProduct(String product) {
        this.product = product;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getCid() {
        return cid;
    }

    public void setCid(String cid) {
        this.cid = cid;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
}