package org.gxuwz.course_log.service.impl;

import org.gxuwz.course_log.dao.ClassesDao;
import org.gxuwz.course_log.model.entity.Classes;
import org.gxuwz.course_log.model.vo.Pager;
import org.gxuwz.course_log.service.ClassesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
@Service("claService")
public class ClassesServiceImpl implements ClassesService {
    @Autowired
    private ClassesDao claDao;
    public boolean saveClasses(Classes cla) {
        if(getOneClasses(cla.getClaId()) == null)
            return claDao.saveClasses(cla);
        else
            return false;
    }

    public Classes getOneClasses(String claId) {
        return claDao.getOneClasses(claId);
    }

    public Pager findAllClasses(int pageCount, int pageSize) {
        return claDao.findAllClasses(pageCount, pageSize);
    }

    public void deleteClasses(String claId) {
        claDao.deleteClasses(claId);
    }

    public void editClasses(Classes cla) {
        claDao.editClasses(cla);
    }

    public List<Classes> searchClasses(String claName) {
        return claDao.searchClasses(claName);
    }

    public List<Classes> findClasses(){
        return claDao.findClasses();
    }
}
