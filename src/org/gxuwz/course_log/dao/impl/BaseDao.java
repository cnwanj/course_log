package org.gxuwz.course_log.dao.impl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;

public class BaseDao {
    @Autowired
    HibernateTemplate hibernateTemplate;

    public SessionFactory sessionFactory() {
        return hibernateTemplate.getSessionFactory();
    }

    public Session getSession() {
        return sessionFactory().getCurrentSession();
    }

    public HibernateTemplate getHibernateTemplate() {
        return hibernateTemplate;
    }

    public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
        this.hibernateTemplate = hibernateTemplate;
    }
}
