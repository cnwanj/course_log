package org.gxuwz.course_log.dao.impl;

import org.gxuwz.course_log.dao.UserDao;
import org.gxuwz.course_log.model.entity.User;
import org.hibernate.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("userDao")
public class UserDaoImpl extends BaseDao implements UserDao {
    @Autowired
    private HibernateTemplate hibernateTemplate;

    public User loginUser(String userId, String userPwd) {
        String hql = "from User where userId=? and userPwd=?";
        Query query = getSession().createQuery(hql);
        query.setParameter(0, userId);
        query.setParameter(1, userPwd);
        List<User> list = query.list();
        return list.size() == 0 ? null : list.get(0);
    }
}
