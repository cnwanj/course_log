package org.gxuwz.course_log.dao.impl;

import org.gxuwz.course_log.dao.CourseDao;
import org.gxuwz.course_log.model.entity.Course;
import org.gxuwz.course_log.model.vo.Pager;
import org.gxuwz.course_log.utils.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("couDao")
public class CourseDaoImpl extends BaseDao implements CourseDao {
    public boolean saveCourse(Course cou) {
        hibernateTemplate.save(cou);
        return true;
    }

    public Course getOneCourse(String couId) {
        return hibernateTemplate.get(Course.class, couId);
    }

    public Pager findCourse(int pageCount, int pageSize) {
        DetachedCriteria criteria = DetachedCriteria.forClass(Course.class);
        List<Course> list = (List<Course>) hibernateTemplate.findByCriteria(criteria, (pageCount - 1) * pageSize, pageSize);
        Pager pages = new Pager(pageSize, pageCount, count(), list);
        return pages;
    }

    public int count() {
        Query query = getSession().createQuery("select count(*) from Course");
        return Integer.parseInt(query.uniqueResult().toString());
    }

    public void deleteCourse(String couId) {
        hibernateTemplate.delete(getOneCourse(couId));
    }

    public void editCourse(Course cou) {
        hibernateTemplate.update(cou);
    }

    public List<Course> searchCourse(String couName) {
        return (List<Course>) hibernateTemplate.find("from Course where couName like'%" + couName + "%'");
    }
}
