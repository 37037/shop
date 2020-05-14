package com.ahpu.ssm.pojo;

import java.util.Date;

public class Comments {
    private String comment;
    private String username;
    private Date time;
    private String pid;

    public Comments() {
    }

    @Override
    public String toString() {
        return "Comments{" +
                "comments='" + comment + '\'' +
                ", username='" + username + '\'' +
                ", time=" + time +
                ", pid='" + pid + '\'' +
                '}';
    }

    public Comments(String comment, String username, Date time, String pid) {
        this.comment = comment;
        this.username = username;
        this.time = time;
        this.pid = pid;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }
}
