package org.gxuwz.course_log.model.entity;

import org.springframework.stereotype.Component;

import java.util.Date;

/**
 * 用于记录统计每次考勤每个班的一条记录
 */
@Component
public class Log {
    private String logId;
    private String claId;
    private Integer logCount;   //考勤人数
    private Integer logArrive;  //已到人数
    private Integer logLeave;   //请假人数
    private Integer logLate;    //迟到人数
    private Integer logAbsent;  //缺席人数
    private String logDate;

    public Log() {
    }

    public Log(String logId, String claId, Integer logCount, Integer logArrive, Integer logLeave, Integer logLate, Integer logAbsent, String logDate) {
        this.logId = logId;
        this.claId = claId;
        this.logCount = logCount;
        this.logArrive = logArrive;
        this.logLeave = logLeave;
        this.logLate = logLate;
        this.logAbsent = logAbsent;
        this.logDate = logDate;
    }

    public String getLogId() {
        return logId;
    }

    public void setLogId(String logId) {
        this.logId = logId;
    }

    public String getClaId() {
        return claId;
    }

    public void setClaId(String claId) {
        this.claId = claId;
    }

    public Integer getLogCount() {
        return logCount;
    }

    public void setLogCount(Integer logCount) {
        this.logCount = logCount;
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
        return "Log{" +
                "logId='" + logId + '\'' +
                ", claId='" + claId + '\'' +
                ", logCount=" + logCount +
                ", logArrive=" + logArrive +
                ", logLeave=" + logLeave +
                ", logLate=" + logLate +
                ", logAbsent=" + logAbsent +
                ", logDate=" + logDate +
                '}';
    }
}
