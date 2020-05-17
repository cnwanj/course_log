package org.gxuwz.course_log.dao.impl;

import org.gxuwz.course_log.dao.LogDao;
import org.gxuwz.course_log.model.entity.Log;
import org.gxuwz.course_log.model.vo.Pager;
import org.hibernate.Query;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("logDao")
public class LogDaoImpl extends BaseDao implements LogDao {

    public void saveLog(Log log) {
        hibernateTemplate.save(log);
    }

    public Pager findAllListLog(int page, int limit) {
        DetachedCriteria criteria = DetachedCriteria.forClass(Log.class);
        List<Log> list = (List<Log>) hibernateTemplate.findByCriteria(criteria, (page - 1) * limit, limit);
        return new Pager(page, limit, count(), list);
    }

    public int count() {
        Query query = getSession().createQuery("select count(*) from Log");
        return Integer.parseInt(query.uniqueResult().toString());
    }
}
