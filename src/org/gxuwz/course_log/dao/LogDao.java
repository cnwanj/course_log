package org.gxuwz.course_log.dao;

import org.gxuwz.course_log.model.entity.Log;
import org.gxuwz.course_log.model.vo.Pager;

import java.util.List;

public interface LogDao {

    void saveLog(Log log);

    Pager findAllListLog(int page, int limit);
}
