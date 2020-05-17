package org.gxuwz.course_log.service;

import org.gxuwz.course_log.model.entity.Student;
import org.gxuwz.course_log.model.vo.Pager;

import java.util.List;

public interface StudentService {
    boolean saveStudent(Student stu);

    Student getOneStudent(String stuId);

    Pager findStudent(int pageCount, int pageSize);

    void deleteStudent(String stuId);

    void editStudent(Student stu);

    List<Student> searchStudent(String stuName);

    void deleteManyStudent(String sum);

    List<Student> findByClaIdStudent(String claId);

    boolean editLogAllStudent(List<Student> stuList);

    List<Student> searchByClaIdStudent(String claId);

    Student loginWeiXin(Student stu);
}
