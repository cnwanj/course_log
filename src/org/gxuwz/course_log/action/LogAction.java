package org.gxuwz.course_log.action;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ModelDriven;
import org.gxuwz.course_log.model.entity.Classes;
import org.gxuwz.course_log.model.entity.Log;
import org.gxuwz.course_log.model.entity.Student;
import org.gxuwz.course_log.model.vo.DataTable;
import org.gxuwz.course_log.service.ClassesService;
import org.gxuwz.course_log.service.LogService;
import org.gxuwz.course_log.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

//考勤记录action模块
public class LogAction extends BaseAction implements ModelDriven<Log> {
    @Autowired
    private ClassesService claService;
    @Autowired
    private StudentService stuService;
    @Autowired
    private LogService logService;
    @Autowired
    private Log log;
    private List<Log> list;
    private Student stu;
    private List<Classes> claList;
    private List<Student> stuList;
    private int time;       // 签到码有效时间，单位：秒

    // 生成签到码(包含数字和字母)
    public String logCode() {
        String code = formatUtil.checkCode(4);
        String str = (String) request().getSession().getAttribute("code");
        System.out.println(str);
        request().getSession().setAttribute("code", code);
        res.put("code", code);
        return SUCCESS;
    }

    // 销毁签到码
    public String destroyCode() {
        // 设置：Access-Control-Allow-Origin头，处理Session问题
        response().setHeader("Access-Control-Allow-Origin", request().getHeader("Origin"));
        response().setHeader("Access-Control-Allow-Credentials", "true");
        response().setHeader("P3P", "CP=CAO PSA OUR");
        if (request().getHeader("Access-Control-Request-Method") != null && "OPTIONS".equals(request().getMethod())) {
            response().addHeader("Access-Control-Allow-Methods", "POST,GET,TRACE,OPTIONS");
            response().addHeader("Access-Control-Allow-Headers", "Content-Type,Origin,Accept");
            response().addHeader("Access-Control-Max-Age", "120");
        }

        System.out.println("123");
        String str = (String) request().getSession().getAttribute("code");
        System.out.println(str);
        System.out.println("456");
        return SUCCESS;
    }

    public String findClaLog() {
        claList = claService.findClasses();
        return Action.SUCCESS;
    }

    //根据班级编号查询学生，并跳转到点名全部
    public String logAllListLog() {
        stuList = stuService.findByClaIdStudent(log.getClaId());
        return "logAll_list";
    }

    //获取全部点名的学生点名信息,并修改考勤记录信息
    public String editLogAllLog() {
        session().removeAttribute("stuList");
        target = stuService.editLogAllStudent(stuList);
        return Action.SUCCESS;
    }

    //根据班级编号查询学生，并跳转到随机点名
    public String logRandomListLog() {
        stuList = stuService.findByClaIdStudent(log.getClaId());
        //将获取的学生放入session域中
        session().removeAttribute("stuList");
        session().setAttribute("stuList", stuList);
        return "logRandom_list";
    }

    //随机抽取学生
    public String randomDrawLog() {
        //获取session域中的学生集合stuList
        stuList = (List<Student>) session().getAttribute("stuList");
        if (stuList.size() > 0) {
            //获取一个在集合范围内的随机数
            int n = (int) (Math.random() * stuList.size());
            stu = stuList.get(n);   //通过随机数获取一个学生  1
            stuList.remove(n);      //将该学生从集合中除去    1
            session().removeAttribute("stuList");       //从session域中除去原来的学生集合
            session().setAttribute("stuList", stuList); //将新的集合放入session域中
        }
        return Action.SUCCESS;
    }

    //获取搜索输入框的name，根据班级班级编号
    public String searchByClaIdStudent() {
        stuList = stuService.searchByClaIdStudent(log.getClaId());
        return Action.SUCCESS;
    }

    //获取单击输入框的值并返回数据表格的格式
    public String searchBtnByClaIdStudent() {
        stuList = stuService.searchByClaIdStudent(log.getClaId());
        dataTable = new DataTable<>(stuList.size(), stuList);
        return Action.SUCCESS;
    }

    //查询所有考勤统计记录
    public String findAllListLog() {
        pages = logService.findAllListLog(page, limit);
        System.out.println(pages.getList().size());
        dataTable = new DataTable<Log>(pages.getTotalCount(), pages.getList());
        return SUCCESS;
    }

    //导出excel
    public String logExcelLog() {
        stuList = stuService.findByClaIdStudent(log.getClaId());
        String[] arr = {claService.getOneClasses(log.getClaId()).getClaName() + "课程考勤表"
                , "学号", "姓名", "班级", "性别", "地址", "电话", "已到", "请假", "迟到", "旷课", "日期"};
        getExcel(arr, stuList);
        return null;
    }

    public List<Classes> getClaList() {
        return claList;
    }

    public void setClaList(List<Classes> claList) {
        this.claList = claList;
    }

    public List<Student> getStuList() {
        return stuList;
    }

    public void setStuList(List<Student> stuList) {
        this.stuList = stuList;
    }

    public Student getStu() {
        return stu;
    }

    public void setStu(Student stu) {
        this.stu = stu;
    }

    public Log getLog() {
        return log;
    }

    public void setLog(Log log) {
        this.log = log;
    }

    public List<Log> getList() {
        return list;
    }

    public void setList(List<Log> list) {
        this.list = list;
    }

    @Override
    public Log getModel() {
        return log;
    }

    public int getTime() {
        return time;
    }

    public void setTime(int time) {
        this.time = time;
    }
}
