package org.gxuwz.course_log.dao.impl;

import org.gxuwz.course_log.dao.DepartmentDao;
import org.gxuwz.course_log.model.entity.Department;
import org.gxuwz.course_log.model.vo.Pager;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("depDao")
public class DepartmentDaoImpl extends BaseDao implements DepartmentDao {
    public boolean saveDepartment(Department dep) {
        hibernateTemplate.save(dep);
        return true;
    }

    public Department getOneDepartment(String depId) {
        return hibernateTemplate.get(Department.class, depId);
    }

    public Pager findAllDepartment(int pageCount, int pageSize) {
        int totalCount = count();
        DetachedCriteria criteria = DetachedCriteria.forClass(Department.class);
        List<Department> list = (List<Department>) hibernateTemplate.findByCriteria(criteria, (pageCount - 1) * pageSize, pageSize);
        Pager pages = new Pager(pageSize, pageCount, totalCount, list);
        return pages;
    }

    public int count() {
        Session session = hibernateTemplate.getSessionFactory().getCurrentSession();
        Query query = session.createQuery("select count(*) from Department");
        return Integer.parseInt(query.uniqueResult().toString());
    }

    public void deleteDepartment(String depId) {
        hibernateTemplate.delete(getOneDepartment(depId));
    }

    public void editDepartment(Department dep) {
        hibernateTemplate.update(dep);
    }

    public List<Department> searchDepartment(String depName) {
        return (List<Department>) hibernateTemplate.find("from Department where depName like '%" + depName + "%'");
    }

    public List<Department> listAllDepartment() {
        return (List<Department>) hibernateTemplate.find("from Department");
    }
}
