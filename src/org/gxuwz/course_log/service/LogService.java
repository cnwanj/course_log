package org.gxuwz.course_log.service;

import org.gxuwz.course_log.model.entity.Log;
import org.gxuwz.course_log.model.entity.Student;
import org.gxuwz.course_log.model.vo.Pager;

import java.util.List;

public interface LogService {

    void saveLog(Log log);

    void addLog(List<Student> stuList);

    Pager findAllListLog(int page, int limit);
}
