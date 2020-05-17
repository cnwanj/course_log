package org.gxuwz.course_log.model.entity;

import org.springframework.stereotype.Component;

@Component
public class Classes {
    private String claId;
    private String claName;
    private String depId;
    private String claMajor;
    private String claGrade;

    public String getClaId() {
        return claId;
    }

    public void setClaId(String claId) {
        this.claId = claId;
    }

    public String getClaName() {
        return claName;
    }

    public void setClaName(String claName) {
        this.claName = claName;
    }

    public String getDepId() {
        return depId;
    }

    public void setDepId(String depId) {
        this.depId = depId;
    }

    public String getClaMajor() {
        return claMajor;
    }

    public void setClaMajor(String claMajor) {
        this.claMajor = claMajor;
    }

    public String getClaGrade() {
        return claGrade;
    }

    public void setClaGrade(String claGrade) {
        this.claGrade = claGrade;
    }

    @Override
    public String toString() {
        return "Classes{" +
                "claId='" + claId + '\'' +
                ", claName='" + claName + '\'' +
                ", depId='" + depId + '\'' +
                ", claMajor='" + claMajor + '\'' +
                ", claGrade='" + claGrade + '\'' +
                '}';
    }
}
