package org.gxuwz.course_log.model.entity;

import org.springframework.stereotype.Component;

@Component
public class Course {
    private String couId;
    private String couName;
    private String teaName;
    private String couYear;
    private String couTerm;

    public String getCouId() {
        return couId;
    }

    public void setCouId(String couId) {
        this.couId = couId;
    }

    public String getCouName() {
        return couName;
    }

    public void setCouName(String couName) {
        this.couName = couName;
    }

    public String getTeaName() {
        return teaName;
    }

    public void setTeaName(String teaName) {
        this.teaName = teaName;
    }

    public String getCouYear() {
        return couYear;
    }

    public void setCouYear(String couYear) {
        this.couYear = couYear;
    }

    public String getCouTerm() {
        return couTerm;
    }

    public void setCouTerm(String couTerm) {
        this.couTerm = couTerm;
    }

    @Override
    public String toString() {
        return "Course{" +
                "couId='" + couId + '\'' +
                ", couName='" + couName + '\'' +
                ", teaName='" + teaName + '\'' +
                ", couYear='" + couYear + '\'' +
                ", couTerm='" + couTerm + '\'' +
                '}';
    }
}
