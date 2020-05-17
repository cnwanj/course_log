package org.gxuwz.course_log.action;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ModelDriven;
import org.gxuwz.course_log.model.entity.Course;
import org.gxuwz.course_log.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class CourseAction extends BaseAction<Course> implements ModelDriven<Course> {
    @Autowired
    private CourseService couService;
    @Autowired
    private Course cou;
    private Course course;
    private List<Course> couList;

    public String saveCourse() {
        target = couService.saveCourse(cou);
        return Action.SUCCESS;
    }

    public String findCourse() {
        if (pageCount == 0) pageCount = 1;
        if (pageSize == 0) pageSize = 5;
        pages = couService.findCourse(pageCount, pageSize);
        return "course_list";
    }

    public String deleteCourse() {
        couService.deleteCourse(cou.getCouId());
        return this.findCourse();
    }

    public String getOneCourse() {
        course = couService.getOneCourse(cou.getCouId());
        return "course_edit";
    }

    public String editCourse() {
        couService.editCourse(cou);
        return Action.SUCCESS;
    }

    public String searchCourse() {
        couList = couService.searchCourse(cou.getCouName());
        return Action.SUCCESS;
    }

    public Course getModel() {
        return cou;
    }

//    public boolean isTarget() {
//        return target;
//    }
//
//    public void setTarget(boolean target) {
//        this.target = target;
//    }
//
//    public int getPageCount() {
//        return pageCount;
//    }
//
//    public void setPageCount(int pageCount) {
//        this.pageCount = pageCount;
//    }
//
//    public int getPageSize() {
//        return pageSize;
//    }
//
//    public void setPageSize(int pageSize) {
//        this.pageSize = pageSize;
//    }
//
//    public Pager getPages() {
//        return pages;
//    }
//
//    public void setPages(Pager pages) {
//        this.pages = pages;
//    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public List<Course> getCouList() {
        return couList;
    }

    public void setCouList(List<Course> couList) {
        this.couList = couList;
    }
}
