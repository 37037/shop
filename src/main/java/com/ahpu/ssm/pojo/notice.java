package com.ahpu.ssm.pojo;

import java.util.Date;

public class notice {
    private String notice;
    private Date time;
    private int nid;

    public notice(String notice, Date time, int nid) {
        this.notice = notice;
        this.time = time;
        this.nid = nid;
    }

    public String getNotice() {
        return notice;
    }

    public void setNotice(String notice) {
        this.notice = notice;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public int getNid() {
        return nid;
    }

    public void setNid(int nid) {
        this.nid = nid;
    }

    public notice() {
    }
}
