package org.gxuwz.course_log.service.impl;

import org.gxuwz.course_log.dao.TeacherDao;
import org.gxuwz.course_log.dao.impl.TeacherDaoImpl;
import org.gxuwz.course_log.model.entity.Teacher;
import org.gxuwz.course_log.model.vo.Pager;
import org.gxuwz.course_log.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional()
@Service("teaService")
public class TeacherServiceImpl implements TeacherService {
    @Autowired
    private TeacherDao teaDao;

    public boolean saveTeacher(Teacher teacher) {
//        teaDao.findAllTeacher(1,3);
//        System.out.println(teaDao.getTeacher(teacher.getTeaId()));
        if (teaDao.getTeacher(teacher.getTeaId()) == null) {
            return teaDao.saveTeacher(teacher);
        } else {
            return false;
        }
    }

    public Teacher loginTeacher(String teaId, String teaPwd) {
        return teaDao.loginTeacher(teaId, teaPwd);
    }

    public Teacher getTeacher(String teaId) {
        return teaDao.getTeacher(teaId);
    }

    public Pager findAllTeacher(int pageCount, int pageSize) {
        return teaDao.findAllTeacher(pageCount, pageSize);
    }

    public void deleteTeacher(String teaId) {
        teaDao.deleteTeacher(teaId);
    }

    public void editTeacher(Teacher teacher) {
        teaDao.editTeacher(teacher);
    }

    public List<Teacher> searchTeacher(String teaName) {
        return teaDao.searchTeacher(teaName);
    }

}
