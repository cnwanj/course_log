package org.gxuwz.course_log.action;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ModelDriven;
import org.gxuwz.course_log.model.entity.Department;
import org.gxuwz.course_log.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class DepartmentAction extends BaseAction<Department> implements ModelDriven<Department> {
    @Autowired
    private Department dep;
    private Department department;
    @Autowired
    private DepartmentService depService;
    private List<Department> departments;

    public String saveDepartment() {
        target = depService.saveDepartment(dep);
        return Action.SUCCESS;
    }

    public String findAllDepartment() {
        if (pageCount == 0) pageCount = 1;
        if (pageSize == 0) pageSize = 5;
        pages = depService.findAllDepartment(pageCount, pageSize);
        return "dep_list";
    }

    public String deleteDepartment() {
        depService.deleteDepartment(dep.getDepId());
        return this.findAllDepartment();
    }

    public String getOneDepartment() {
        department = depService.getOneDepartment(dep.getDepId());
        return "dep_edit";
    }

    public String editDepartment() {
        depService.editDepartment(dep);
        return Action.SUCCESS;
    }

    public String searchDepartment() {
        departments = depService.searchDepartment(dep.getDepName());
        return Action.SUCCESS;
    }


    public Department getModel() {
        return dep;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    public List<Department> getDepartments() {
        return departments;
    }

    public void setDepartments(List<Department> departments) {
        this.departments = departments;
    }
}
