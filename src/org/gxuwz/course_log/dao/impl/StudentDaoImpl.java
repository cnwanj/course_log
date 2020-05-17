package org.gxuwz.course_log.dao.impl;

import org.gxuwz.course_log.dao.StudentDao;
import org.gxuwz.course_log.model.entity.Student;
import org.gxuwz.course_log.model.vo.Pager;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("stuDao")
public class StudentDaoImpl extends BaseDao implements StudentDao {
    public boolean saveStudent(Student stu) {
        hibernateTemplate.save(stu);
        return true;
    }

    public Student getOneStudent(String stuId) {
        return hibernateTemplate.get(Student.class, stuId);
    }

    public Pager findStudent(int pageCount, int pageSize) {
        DetachedCriteria criteria = DetachedCriteria.forClass(Student.class);
        List<Student> list = (List<Student>) hibernateTemplate.findByCriteria(criteria, (pageCount - 1) * pageSize, pageSize);
        return new Pager(pageSize, pageCount, count(), list);
    }

    public int count() {
        Query query = getSession().createQuery("select count(*) from Student");
        return Integer.parseInt(query.uniqueResult().toString());
    }

    public void deleteStudent(String stuId) {
        hibernateTemplate.delete(getOneStudent(stuId));
    }

    public void editStudent(Student stu) {
        hibernateTemplate.update(stu);
    }

    public List<Student> searchStudent(String stuName) {
        return (List<Student>) hibernateTemplate.find("from Student where stuName like '%" + stuName + "%'");
    }

    public void deleteManyStudent(String sum) {
        getSession().createQuery("delete from Student where stuId in (" + sum + ")").executeUpdate();
    }

    //根据班级编号查询学生
    public List<Student> findByClaIdStudent(String claId) {
        return (List<Student>) hibernateTemplate.find("from Student where claId =?", claId);
    }

    //根据班级编号模糊搜索学生信息
    public List<Student> searchByClaIdStudent(String claId) {
        return (List<Student>) hibernateTemplate.find("from Student where claId like'%" + claId + "%'");
    }

    //  登录微信小程序
    public Student loginWeiXin(Student stu) {
        Criteria criteria = getSession().createCriteria(Student.class);
        criteria.add(Restrictions.eq("stuId", stu.getStuId()))
                .add(Restrictions.eq("stuPwd", stu.getStuPwd()));
        List<Student> list = criteria.list();
        return list.size() == 0 ? null : list.get(0);
    }
}
