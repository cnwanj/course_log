package org.gxuwz.course_log.model.entity;

import org.springframework.stereotype.Component;

@Component
public class Department {
    private String depId;
    private String depName;

    public Department() {
    }

    public Department(String depId, String depName) {
        this.depId = depId;
        this.depName = depName;
    }

    public String getDepId() {
        return depId;
    }

    public void setDepId(String depId) {
        this.depId = depId;
    }

    public String getDepName() {
        return depName;
    }

    public void setDepName(String depName) {
        this.depName = depName;
    }

    @Override
    public String toString() {
        return "Department{" +
                "depId='" + depId + '\'' +
                ", depName='" + depName + '\'' +
                '}';
    }
}
