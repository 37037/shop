package com.ahpu.ssm.pojo;

import java.util.Date;

public class notice {
    private String notice;
    private Date time;

    public notice(String notice, Date time) {
        this.notice = notice;
        this.time = time;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getNotice() {
        return notice;
    }

    public void setNotice(String notice) {
        this.notice = notice;
    }



    public notice() {
    }
}
