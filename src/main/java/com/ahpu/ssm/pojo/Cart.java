package com.ahpu.ssm.pojo;



public class Cart {

    private Integer count;
    private String uid;
    private String cid;
    private Product product;
    private String pid;

    public Cart() {
    }

    public Integer getCount() {
        return count;
    }

    public Cart(String uid, String cid, Product product, String pid) {
        this.uid = uid;
        this.cid = cid;
        this.product = product;
        this.pid = pid;
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

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }
}