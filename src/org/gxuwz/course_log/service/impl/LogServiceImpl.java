package org.gxuwz.course_log.service.impl;

import org.gxuwz.course_log.dao.LogDao;
import org.gxuwz.course_log.dao.StudentDao;
import org.gxuwz.course_log.model.entity.Log;
import org.gxuwz.course_log.model.entity.Student;
import org.gxuwz.course_log.model.vo.Pager;
import org.gxuwz.course_log.service.LogService;
import org.gxuwz.course_log.utils.DateFormatUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
@Service("logService")
public class LogServiceImpl extends DateFormatUtil implements LogService {
    @Autowired
    private LogDao logDao;
    @Autowired
    private Log log;
    @Autowired
    private StudentDao stuDao;

    /**
     * 保存每次考勤记录
     *
     * @param log
     */
    public void saveLog(Log log) {
        logDao.saveLog(log);
    }

    /**
     * 统计每次考勤人数
     *
     * @param stuList
     */
    public void addLog(List<Student> stuList) {
        log.setLogId(ran());    //设置考勤编号
        log.setClaId(stuDao.getOneStudent(stuList.get(0).getStuId()).getClaId());//设置考勤班级编号
        log.setLogDate(time());
        log.setLogCount(stuList.size());
        int[] arr = new int[4]; //arr[0]:已到人数，arr[1]:迟到人数，arr[2]:请假人数，arr[3]:缺席人数
        for (Student stu : stuList) {
            if (stu.getLogStatus() == 1) {
                arr[0] = arr[0] + 1;
            } else if (stu.getLogStatus() == 2) {
                arr[1] = arr[1] + 1;
            } else if (stu.getLogStatus() == 3) {
                arr[2] = arr[2] + 1;
            } else {
                arr[3] = arr[3] + 1;
            }
        }
        log.setLogArrive(arr[0]);
        log.setLogLeave(arr[1]);
        log.setLogLate(arr[2]);
        log.setLogAbsent(arr[3]);
        saveLog(log);
    }

    /**
     * 查询考勤记录数
     *
     * @return
     */
    public Pager findAllListLog(int page, int limit) {
        return logDao.findAllListLog(page, limit);
    }
}
