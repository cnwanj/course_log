package org.gxuwz.course_log.dao.impl;

import org.gxuwz.course_log.dao.TeacherDao;
import org.gxuwz.course_log.model.entity.Teacher;
import org.gxuwz.course_log.model.vo.Pager;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("teaDao")
public class TeacherDaoImpl extends BaseDao implements TeacherDao {
    //添加
    public boolean saveTeacher(Teacher teacher) {
        try {
            hibernateTemplate.save(teacher);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    //登录查询
    public Teacher loginTeacher(String teaId, String teaPwd) {
        String hql = "from Teacher where teaId=? and teaPwd=?";
        List<Teacher> teaList = (List<Teacher>) hibernateTemplate.find(hql, teaId, teaPwd);
        return teaList.size() == 0 ? null : teaList.get(0);
    }

    //查询一个
    public Teacher getTeacher(String teaId) {
        Teacher teacher = hibernateTemplate.get(Teacher.class, teaId);
        return teacher;
    }

    //分页查询
    public Pager findAllTeacher(int pageCount, int pageSize) {
        //获取总数据数
        int totalCount = count();
        DetachedCriteria criteria = DetachedCriteria.forClass(Teacher.class);
        List<Teacher> teaList = (List<Teacher>) hibernateTemplate.findByCriteria(criteria, (pageCount - 1) * pageSize, pageSize);
        return new Pager(pageSize, pageCount, totalCount, teaList);
    }

    //查询总数
    public int count() {
        Session session = hibernateTemplate.getSessionFactory().getCurrentSession();
        Query query = session.createQuery("select count(*) from Teacher");
        return Integer.parseInt((query.uniqueResult().toString()));
    }

    //删除
    public void deleteTeacher(String teaId) {
        hibernateTemplate.delete(hibernateTemplate.get(Teacher.class, teaId));
    }

    //修改用户
    public void editTeacher(Teacher teacher) {
        hibernateTemplate.update(teacher);
    }

    //模糊搜索
    public List<Teacher> searchTeacher(String teaName) {
        return (List<Teacher>) hibernateTemplate.find("from Teacher where teaName like'%" + teaName + "%'");
    }
}
