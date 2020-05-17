package org.gxuwz.course_log.action;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ModelDriven;

import org.apache.struts2.ServletActionContext;
import org.gxuwz.course_log.model.entity.Department;
import org.gxuwz.course_log.model.entity.Teacher;
import org.gxuwz.course_log.service.DepartmentService;
import org.gxuwz.course_log.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class TeacherAction extends BaseAction<Teacher> implements ModelDriven<Teacher>{
    @Autowired
    private Teacher teacher;
    @Autowired
    private TeacherService teaService;
    @Autowired
    private DepartmentService depService;
    private List<Department> depList;
    private List<Teacher> teachers;
    //添加
    public String saveTeacher(){
        teacher.setTeaTags("1");
        target = teaService.saveTeacher(teacher);
        return Action.SUCCESS;
    }
    //分页
    public String findAllTeacher(){
        if(pageCount == 0)
            pageCount = 1;
        if(pageSize == 0)
            pageSize = 5;
        pages = teaService.findAllTeacher(pageCount,pageSize);
//        for(int i=0; i<pages.getList().size(); i++){
            pages.getList().remove(0);
//        }
        depList = depService.listAllDepartment();
        return "teacher_list";
    }
    //删除
    public String deleteTeacher(){
        teaService.deleteTeacher(teacher.getTeaId());
        return this.findAllTeacher();
    }
    //查询一个
    public String getOneTeacher(){
        teacher = teaService.getTeacher(teacher.getTeaId());
        depList = depService.listAllDepartment();
        return "teacher_edit";
    }
    //编辑
    public String editTeacher(){
        teacher.setTeaTags("1");
        teaService.editTeacher(teacher);
        return this.findAllTeacher();
    }
    //搜索框
    public String searchTeacher(){
        teachers = teaService.searchTeacher(teacher.getTeaName());
        return Action.SUCCESS;
    }

    public void setTeacher(Teacher teacher) {
        this.teacher = teacher;
    }

    public Teacher getTeacher() {
        return teacher;
    }

    public boolean isTarget() {
        return target;
    }

    public void setTarget(boolean target) {
        this.target = target;
    }

    public Teacher getModel() {
        return teacher;
    }

    public List<Teacher> getTeachers() {
        return teachers;
    }

    public void setTeachers(List<Teacher> teachers) {
        this.teachers = teachers;
    }

    public List<Department> getDepList() {
        return depList;
    }

    public void setDepList(List<Department> depList) {
        this.depList = depList;
    }
}
