package org.gxuwz.course_log.model.entity;

import org.springframework.stereotype.Component;

@Component
public class Student {
    private String stuId;
    private String stuPwd;
    private String stuName;
    private Integer stuSex;
    private String stuAddress;
    private String stuPhone;
    private String claId;
    private Integer logStatus;  //考勤状态   1 2 3 4
    private Integer logArrive;  //已到 1
    private Integer logLeave;   //请假 2
    private Integer logLate;    //迟到 3
    private Integer logAbsent;  //旷课 4
    private String logDate;     //日期

    public String getStuId() {
        return stuId;
    }

    public void setStuId(String stuId) {
        this.stuId = stuId;
    }

    public String getStuPwd() {
        return stuPwd;
    }

    public void setStuPwd(String stuPwd) {
        this.stuPwd = stuPwd;
    }

    public String getStuName() {
        return stuName;
    }

    public void setStuName(String stuName) {
        this.stuName = stuName;
    }

    public Integer getStuSex() {
        return stuSex;
    }

    public void setStuSex(Integer stuSex) {
        this.stuSex = stuSex;
    }

    public String getStuAddress() {
        return stuAddress;
    }

    public void setStuAddress(String stuAddress) {
        this.stuAddress = stuAddress;
    }

    public String getStuPhone() {
        return stuPhone;
    }

    public void setStuPhone(String stuPhone) {
        this.stuPhone = stuPhone;
    }

    public String getClaId() {
        return claId;
    }

    public void setClaId(String claId) {
        this.claId = claId;
    }

    public Integer getLogStatus() {
        return logStatus;
    }

    public void setLogStatus(Integer logStatus) {
        this.logStatus = logStatus;
    }

    public Integer getLogArrive() {
        return logArrive;
    }

    public void setLogArrive(Integer logArrive) {
        this.logArrive = logArrive;
    }

    public Integer getLogLeave() {
        return logLeave;
    }

    public void setLogLeave(Integer logLeave) {
        this.logLeave = logLeave;
    }

    public Integer getLogLate() {
        return logLate;
    }

    public void setLogLate(Integer logLate) {
        this.logLate = logLate;
    }

    public Integer getLogAbsent() {
        return logAbsent;
    }

    public void setLogAbsent(Integer logAbsent) {
        this.logAbsent = logAbsent;
    }

    public String getLogDate() {
        return logDate;
    }

    public void setLogDate(String logDate) {
        this.logDate = logDate;
    }

    @Override
    public String toString() {
        return "Student{" +
                "stuId='" + stuId + '\'' +
                ", stuPwd='" + stuPwd + '\'' +
                ", stuName='" + stuName + '\'' +
                ", stuSex=" + stuSex +
                ", stuAddress='" + stuAddress + '\'' +
                ", stuPhone='" + stuPhone + '\'' +
                ", claId='" + claId + '\'' +
                ", logStatus=" + logStatus +
                ", logArrive=" + logArrive +
                ", logLeave=" + logLeave +
                ", logLate=" + logLate +
                ", logAbsent=" + logAbsent +
                ", logDate=" + logDate +
                '}';
    }
}
