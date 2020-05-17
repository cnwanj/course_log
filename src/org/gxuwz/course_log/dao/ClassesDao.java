package org.gxuwz.course_log.dao;

import org.gxuwz.course_log.model.entity.Classes;
import org.gxuwz.course_log.model.vo.Pager;

import java.util.List;

public interface ClassesDao {

    boolean saveClasses(Classes cla);

    Classes getOneClasses(String claId);

    Pager findAllClasses(int pageCount, int pageSize);

    void deleteClasses(String claId);

    void editClasses(Classes cla);

    List<Classes> searchClasses(String claName);

    List<Classes> findClasses();

}
