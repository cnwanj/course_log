package org.gxuwz.course_log.service.impl;

import org.gxuwz.course_log.dao.DepartmentDao;
import org.gxuwz.course_log.model.entity.Department;
import org.gxuwz.course_log.model.vo.Pager;
import org.gxuwz.course_log.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
@Service("depService")
public class DepartmentServiceImpl implements DepartmentService {
    @Autowired
    private DepartmentDao depDao;

    public boolean saveDepartment(Department dep) {
        if (getOneDepartment(dep.getDepId()) == null)
            return depDao.saveDepartment(dep);
        else
            return false;
    }

    public Department getOneDepartment(String depId) {
        return depDao.getOneDepartment(depId);
    }

    public Pager findAllDepartment(int pageCount, int pageSize) {
        return depDao.findAllDepartment(pageCount, pageSize);
    }

    public void deleteDepartment(String depId) {
        depDao.deleteDepartment(depId);
    }

    public void editDepartment(Department dep) {
        depDao.editDepartment(dep);
    }

    public List<Department> searchDepartment(String depName) {
        return depDao.searchDepartment(depName);
    }

    public List<Department> listAllDepartment() {
        return depDao.listAllDepartment();
    }


}
