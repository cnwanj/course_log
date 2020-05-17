package org.gxuwz.course_log.action;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import org.apache.struts2.ServletActionContext;
import org.gxuwz.course_log.model.entity.Teacher;
import org.gxuwz.course_log.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;

public class LoginAction {
    @Autowired
    private TeacherService teaService;
    @Autowired
    private Teacher tea;
    private boolean tags;
    private String id;
    private String pwd;

    public String loginAction() {
        tea = teaService.loginTeacher(id, pwd);
        ServletActionContext.getRequest().getSession().setAttribute("tea", tea);
        return Action.SUCCESS;
    }

    public String outLogin() {
        ServletActionContext.getRequest().getSession().invalidate();
        return Action.SUCCESS;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public Teacher getTea() {
        return tea;
    }

    public void setTea(Teacher tea) {
        this.tea = tea;
    }

    public boolean isTags() {
        return tags;
    }

    public void setTags(boolean tags) {
        this.tags = tags;
    }
}
