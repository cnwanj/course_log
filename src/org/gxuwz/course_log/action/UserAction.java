package org.gxuwz.course_log.action;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.views.freemarker.tags.ActionModel;
import org.gxuwz.course_log.model.entity.Teacher;
import org.gxuwz.course_log.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;

public class UserAction extends BaseAction implements ModelDriven<Teacher> {
    @Autowired
    private TeacherService teaService;
    @Autowired
    private Teacher teacher;
    private Teacher tea;
    private String teaId;
    public String getOneUser(){
        tea = (Teacher)session().getAttribute("tea");
        return "user_edit";
    }

    public String editUser(){
        teacher.setTeaTags("0");
        teaService.editTeacher(teacher);
        session().invalidate();
        return "login";
    }

    public String getTeaId() {
        return teaId;
    }

    public void setTeaId(String teaId) {
        this.teaId = teaId;
    }

    public Teacher getTea() {
        return tea;
    }

    public void setTea(Teacher tea) {
        this.tea = tea;
    }

    public Teacher getModel() {
        return teacher;
    }
}
