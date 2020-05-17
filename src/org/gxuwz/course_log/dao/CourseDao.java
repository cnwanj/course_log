package org.gxuwz.course_log.dao;

import org.gxuwz.course_log.model.entity.Course;
import org.gxuwz.course_log.model.vo.Pager;

import java.util.List;

public interface CourseDao {
    boolean saveCourse(Course cou);

    Course getOneCourse(String couId);

    Pager findCourse(int pageCount, int pageSize);

    void deleteCourse(String couId);

    void editCourse(Course cou);

    List<Course> searchCourse(String couName);
}
