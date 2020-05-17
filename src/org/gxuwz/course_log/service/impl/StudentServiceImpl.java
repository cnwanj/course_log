package org.gxuwz.course_log.service.impl;

import org.gxuwz.course_log.dao.LogDao;
import org.gxuwz.course_log.dao.StudentDao;
import org.gxuwz.course_log.model.entity.Student;
import org.gxuwz.course_log.model.vo.Pager;
import org.gxuwz.course_log.service.LogService;
import org.gxuwz.course_log.service.StudentService;
import org.gxuwz.course_log.utils.DateFormatUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
@Service("stuService")
public class StudentServiceImpl extends DateFormatUtil implements StudentService {
    @Autowired
    private StudentDao stuDao;
    @Autowired
    private LogService logService;

    public boolean saveStudent(Student stu) {
        if (stuDao.getOneStudent(stu.getStuId()) == null)
            return stuDao.saveStudent(stu);
        else
            return false;
    }

    public Student getOneStudent(String stuId) {
        return stuDao.getOneStudent(stuId);
    }

    public Pager findStudent(int pageCount, int pageSize) {
        return stuDao.findStudent(pageCount, pageSize);
    }

    public void deleteStudent(String stuId) {
        stuDao.deleteStudent(stuId);
    }

    public void editStudent(Student stu) {
        stuDao.editStudent(stu);
    }

    public List<Student> searchStudent(String stuName) {
        return stuDao.searchStudent(stuName);
    }

    public void deleteManyStudent(String sum) {
        stuDao.deleteManyStudent(sum);
    }

    public List<Student> findByClaIdStudent(String claId) {
        return stuDao.findByClaIdStudent(claId);
    }

    //接收考勤集合并将对应的考勤记录修改
    public boolean editLogAllStudent(List<Student> stuList) {
        if (stuList.size() <= 0) {
            return false;
        } else {
            logService.addLog(stuList);                 //统计记录考勤人数
            for (Student stu : stuList) {
                Student student = stuDao.getOneStudent(stu.getStuId());
                student.setLogDate(date());             //设置日期
                if (stu.getLogStatus() == 1) {            //判断前端传过来是否为已到
                    int status = 0;
                    //判断已到记录是否为空
                    if (student.getLogArrive() == null)  //判断数据库中的已到次数是否为空
                        status += 1;
                    else    //1.通过id查询logArrive为多少，并将logArrive+1
                        status = student.getLogArrive() + 1;
                    //2.修改logArrive的值
                    student.setLogArrive(status);
                    stuDao.editStudent(student);
                } else if (stu.getLogStatus() == 2) {      //请假
                    int status = 0;
                    if (student.getLogLeave() == null)
                        status += 1;
                    else
                        status = student.getLogLeave() + 1;
                    student.setLogLeave(status);
                    stuDao.editStudent(student);
                } else if (stu.getLogStatus() == 3) {      //迟到
                    int status = 0;
                    if (student.getLogLate() == null)
                        status += 1;
                    else
                        status = student.getLogLate() + 1;
                    student.setLogLate(status);
                    stuDao.editStudent(student);
                } else {      //旷课
                    int status = 0;
                    if (stu.getLogAbsent() == null)
                        status += 1;
                    else
                        status = student.getLogAbsent() + 1;
                    student.setLogAbsent(status);
                    stuDao.editStudent(student);
                }
            }
            return true;
        }
    }

    //  根据班级编号模糊搜索学生信息
    public List<Student> searchByClaIdStudent(String claId) {
        return stuDao.searchByClaIdStudent(claId);
    }

    //  登录微信小程序
    public Student loginWeiXin(Student stu) {
        return stuDao.loginWeiXin(stu);
    }
}
