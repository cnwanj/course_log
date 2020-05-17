package org.gxuwz.course_log.dao;

import org.gxuwz.course_log.model.entity.Department;
import org.gxuwz.course_log.model.vo.Pager;

import java.util.List;

public interface DepartmentDao {

    boolean saveDepartment(Department dep);

    Department getOneDepartment(String depId);

    Pager findAllDepartment(int pageCount, int pageSize);

    void deleteDepartment(String depId);

    void editDepartment(Department dep);

    List<Department> searchDepartment(String depName);

    List<Department> listAllDepartment();

}
