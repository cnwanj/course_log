package org.gxuwz.course_log.dao;

import org.gxuwz.course_log.model.entity.Student;
import org.gxuwz.course_log.model.vo.Pager;

import java.util.List;

public interface StudentDao {
    boolean saveStudent(Student stu);

    Student getOneStudent(String stuId);

    Pager findStudent(int pageCount, int pageSize);

    void deleteStudent(String stuId);

    void editStudent(Student stu);

    List<Student> searchStudent(String stuName);

    void deleteManyStudent(String sum);

    List<Student> findByClaIdStudent(String claId);

    List<Student> searchByClaIdStudent(String claId);

    Student loginWeiXin(Student stu);
}
