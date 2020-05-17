package org.gxuwz.course_log.dao.impl;

import org.gxuwz.course_log.dao.ClassesDao;
import org.gxuwz.course_log.model.entity.Classes;
import org.gxuwz.course_log.model.vo.Pager;
import org.hibernate.Query;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("claDao")
public class ClassesDaoImpl extends BaseDao implements ClassesDao {
    public boolean saveClasses(Classes cla) {
        hibernateTemplate.save(cla);
        return true;
    }

    public Classes getOneClasses(String claId) {
        return hibernateTemplate.get(Classes.class, claId);
    }

    public int count() {
        Query query = getSession().createQuery("select count(*) from Classes");
        return Integer.parseInt(query.uniqueResult().toString());
    }

    public Pager findAllClasses(int pageCount, int pageSize) {
        DetachedCriteria criteria = DetachedCriteria.forClass(Classes.class);
        List<Classes> list = (List<Classes>) hibernateTemplate.findByCriteria(criteria, (pageCount - 1) * pageSize, pageSize);
        return new Pager(pageSize, pageCount, count(), list);
    }

    public void deleteClasses(String claId) {
        hibernateTemplate.delete(getOneClasses(claId));
    }

    public void editClasses(Classes cla) {
        hibernateTemplate.update(cla);
    }

    public List<Classes> searchClasses(String claName) {
        return (List<Classes>) hibernateTemplate.find("from Classes where claName like'%" + claName + "%'");
    }

    public List<Classes> findClasses() {
        return (List<Classes>) hibernateTemplate.find("from Classes");
    }
}
