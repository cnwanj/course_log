package org.gxuwz.course_log.model.entity;

import org.springframework.stereotype.Component;

@Component("teacher")
public class Teacher {
    private String teaId;
    private String teaName;
    private String teaPwd;
    private String depId;
    private String teaPhone;
    private String teaTags;


    public String getTeaId() {
        return teaId;
    }

    public void setTeaId(String teaId) {
        this.teaId = teaId;
    }

    public String getTeaName() {
        return teaName;
    }

    public void setTeaName(String teaName) {
        this.teaName = teaName;
    }

    public String getTeaPwd() {
        return teaPwd;
    }

    public void setTeaPwd(String teaPwd) {
        this.teaPwd = teaPwd;
    }

    public String getDepId() {
        return depId;
    }

    public void setDepId(String depId) {
        this.depId = depId;
    }

    public String getTeaPhone() {
        return teaPhone;
    }

    public void setTeaPhone(String teaPhone) {
        this.teaPhone = teaPhone;
    }

    public String getTeaTags() {
        return teaTags;
    }

    public void setTeaTags(String teaTags) {
        this.teaTags = teaTags;
    }

    @Override
    public String toString() {
        return "Teacher{" +
                "teaId='" + teaId + '\'' +
                ", teaName='" + teaName + '\'' +
                ", teaPwd='" + teaPwd + '\'' +
                ", depId='" + depId + '\'' +
                ", teaPhone='" + teaPhone + '\'' +
                ", teaTags='" + teaTags + '\'' +
                '}';
    }
}
