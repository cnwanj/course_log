package org.gxuwz.course_log.action;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ModelDriven;
import org.gxuwz.course_log.model.entity.Classes;
import org.gxuwz.course_log.model.entity.Student;
import org.gxuwz.course_log.model.vo.DataTable;
import org.gxuwz.course_log.service.ClassesService;
import org.gxuwz.course_log.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class StudentAction extends BaseAction<Student> implements ModelDriven<Student> {
    @Autowired
    private StudentService stuService;
    @Autowired
    private ClassesService claService;
    @Autowired
    private Student stu;
    private Student student;
    private List<Classes> claList;
    private String sum;
    private List<Student> stuList;
    private String code;    //签到验证码

    //  学生微信小程序端登录
    public String loginWeiXin() {
        stu = stuService.loginWeiXin(stu);
        request().getSession().getAttribute("code");
//        String id = request().getSession().getId();
//        System.out.println(id);
        res.put("stu", stu);
//        res.put("id", id);
        return SUCCESS;
    }

    //  获取微信小程序端的签到验证码
    public String codeWeiXin() {
        String cookieCode = (String) request().getSession().getAttribute("code");
        if (cookieCode == null) {
            res.put("msg", "签到码不存在！");
        } else if (!cookieCode.equalsIgnoreCase(code)) {
            res.put("msg", "签到码不匹配！");
        } else {
            res.put("msg", "签到成功！");
        }
        System.out.println(code + "--" + stu.getStuId() + "--" + cookieCode);
//        stuService.getOneStudent(stu.getStuId());
        return SUCCESS;
    }

    public String saveStudent() {
        target = stuService.saveStudent(stu);
        return Action.SUCCESS;
    }

    public String findStudent() {
        pages = stuService.findStudent(page, limit);
        dataTable = new DataTable<Student>(pages.getTotalCount(), pages.getList());
        return Action.SUCCESS;
    }

    public String deleteStudent() {
        stuService.deleteStudent(stu.getStuId());
        return Action.SUCCESS;
    }

    //  编辑学生页面返回班级信息
    public String getOneStudent() {
        claList = claService.findClasses();
        return Action.SUCCESS;
    }

    public String editStudent() {
        stuService.editStudent(stu);
        return Action.SUCCESS;
    }

    public String deleteManyStudent() {
        stuService.deleteManyStudent(sum);
        return Action.SUCCESS;
    }

    //获取搜索输入框的nama
    public String searchStudent() {
        stuList = stuService.searchStudent(stu.getStuName());
        return Action.SUCCESS;
    }

    //获取单击输入框的值并返回数据表格的格式
    public String searchBtnStudent() {
        stuList = stuService.searchStudent(stu.getStuName());
        dataTable = new DataTable<>(stuList.size(), stuList);
        return Action.SUCCESS;
    }

    public Student getModel() {
        return stu;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public List<Classes> getClaList() {
        return claList;
    }

    public void setClaList(List<Classes> claList) {
        this.claList = claList;
    }

    public String getSum() {
        return sum;
    }

    public void setSum(String sum) {
        this.sum = sum;
    }

    public List<Student> getStuList() {
        return stuList;
    }

    public void setStuList(List<Student> stuList) {
        this.stuList = stuList;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }
}
