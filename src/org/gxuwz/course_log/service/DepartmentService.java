package org.gxuwz.course_log.service;

import org.gxuwz.course_log.model.entity.Department;
import org.gxuwz.course_log.model.vo.Pager;

import java.util.List;

public interface DepartmentService {

    boolean saveDepartment(Department dep);

    Department getOneDepartment(String depId);

    Pager findAllDepartment(int pageCount, int pageSize);

    void deleteDepartment(String depId);

    void editDepartment(Department dep);

    public List<Department> searchDepartment(String depName);

    List<Department> listAllDepartment();
}
