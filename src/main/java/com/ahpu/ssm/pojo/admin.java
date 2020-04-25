package com.ahpu.ssm.pojo;

public class admin {
    private String acount;
    private String pwd;

    public String getAcount() {
        return acount;
    }

    @Override
    public String toString() {
        return "admin{" +
                "acount='" + acount + '\'' +
                ", pwd='" + pwd + '\'' +
                '}';
    }

    public void setAcount(String acount) {
        this.acount = acount;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public admin(String acount, String pwd) {
        this.acount = acount;
        this.pwd = pwd;
    }

    public admin() {
    }
}
