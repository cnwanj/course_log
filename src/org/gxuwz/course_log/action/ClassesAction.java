package org.gxuwz.course_log.action;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ModelDriven;
import org.gxuwz.course_log.model.entity.Classes;
import org.gxuwz.course_log.model.entity.Department;
import org.gxuwz.course_log.service.ClassesService;
import org.gxuwz.course_log.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class ClassesAction extends BaseAction<Classes> implements ModelDriven<Classes> {
    // private c 接口

    @Autowired
    private ClassesService claService;

    @Autowired
    private Classes cla;
    @Autowired
    private DepartmentService depService;
    private List<Department> depList;
    private List<Classes> claList;
    private Classes classes;

    public String saveClasses() {
        target = claService.saveClasses(cla);
        return Action.SUCCESS;
    }

    public String findAllClasses() {
        if (pageCount == 0) pageCount = 1;
        if (pageSize == 0) pageSize = 5;
        pages = claService.findAllClasses(pageCount, pageSize);
        depList = depService.listAllDepartment();
        return "classes_list";
    }

    public String deleteClasses() {
        claService.deleteClasses(cla.getClaId());
        return this.findAllClasses();
    }

    public String getOneClasses() {
        classes = claService.getOneClasses(cla.getClaId());
        depList = depService.listAllDepartment();
        return "classes_edit";
    }

    public String editClasses() {
        claService.editClasses(cla);
        return this.findAllClasses();
    }

    public String searchClasses() {
        claList = claService.searchClasses(cla.getClaName());
        return Action.SUCCESS;
    }


    public Classes getModel() {
        return cla;
    }

    public boolean isTarget() {
        return target;
    }

    public void setTarget(boolean target) {
        this.target = target;
    }

    public Classes getClasses() {
        return classes;
    }

    public void setClasses(Classes classes) {
        this.classes = classes;
    }

    public List<Department> getDepList() {
        return depList;
    }

    public void setDepList(List<Department> depList) {
        this.depList = depList;
    }

    public List<Classes> getClaList() {
        return claList;
    }

    public void setClaList(List<Classes> claList) {
        this.claList = claList;
    }
}
