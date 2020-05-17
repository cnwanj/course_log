package org.gxuwz.course_log.service.impl;

import org.gxuwz.course_log.dao.CourseDao;
import org.gxuwz.course_log.model.entity.Course;
import org.gxuwz.course_log.model.vo.Pager;
import org.gxuwz.course_log.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
@Service("couService")
public class CourseServiceImpl implements CourseService {
    @Autowired
    private CourseDao couDao;

    public boolean saveCourse(Course cou) {
        if (getOneCourse(cou.getCouId()) == null)
            return couDao.saveCourse(cou);
        else
            return false;
    }

    public Course getOneCourse(String couId) {
        return couDao.getOneCourse(couId);
    }

    public Pager findCourse(int pageCount, int pageSize) {
        return couDao.findCourse(pageCount, pageSize);
    }

    public void deleteCourse(String couId) {
        couDao.deleteCourse(couId);
    }

    public void editCourse(Course cou) {
        couDao.editCourse(cou);
    }

    public List<Course> searchCourse(String couName) {
        return couDao.searchCourse(couName);
    }
}
