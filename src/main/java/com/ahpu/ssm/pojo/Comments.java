package com.ahpu.ssm.pojo;

import java.util.Date;

public class Comments {
    private String comment;
    private String username;
    private Date time;
    private String pid;
    private String anser;
    private int state;
    private String gid;

    public String getGid() {
        return gid;
    }

    public void setGid(String gid) {
        this.gid = gid;
    }

    @Override
    public String toString() {
        return "Comments{" +
                "comment='" + comment + '\'' +
                ", username='" + username + '\'' +
                ", time=" + time +
                ", pid='" + pid + '\'' +
                ", anser='" + anser + '\'' +
                ", state=" + state +
                ", gid='" + gid + '\'' +
                '}';
    }

    public String getAnser() {
        return anser;
    }

    public Comments(String comment, String username, Date time, String pid, String anser, int state, String gid) {
        this.comment = comment;
        this.username = username;
        this.time = time;
        this.pid = pid;
        this.anser = anser;
        this.state = state;
        this.gid = gid;
    }

    public void setAnser(String anser) {
        this.anser = anser;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }



    public Comments() {
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
