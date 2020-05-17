package org.gxuwz.course_log.dao;

import org.gxuwz.course_log.model.entity.Teacher;
import org.gxuwz.course_log.model.vo.Pager;

import java.util.List;

public interface TeacherDao {

    boolean saveTeacher(Teacher teacher);

    Teacher loginTeacher(String teaId, String teaPwd);

    Teacher getTeacher(String teaId);

    Pager findAllTeacher(int pageCount, int pageSize);

    int count();

    void deleteTeacher(String teaId);

    void editTeacher(Teacher teacher);

    List<Teacher> searchTeacher(String teaName);

}
