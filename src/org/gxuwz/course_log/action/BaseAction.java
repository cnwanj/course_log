package org.gxuwz.course_log.action;

import org.apache.struts2.ServletActionContext;
import org.gxuwz.course_log.model.vo.DataTable;
import org.gxuwz.course_log.model.vo.Pager;
import org.gxuwz.course_log.utils.DateFormatUtil;
import org.gxuwz.course_log.utils.ExcelUtil;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

public class BaseAction<T> extends ExcelUtil {
    boolean target;
    int pageCount;
    int pageSize;
    Pager pages;
    DataTable<T> dataTable;
    Integer page;
    Integer limit;
    Map<String, Object> res = new HashMap<>();
    DateFormatUtil formatUtil = new DateFormatUtil();

    public HttpServletRequest request() {
        return ServletActionContext.getRequest();
    }

    public HttpServletResponse response() {
        return ServletActionContext.getResponse();
    }

    // 获取cookie里面value
    public String getCookie(String name) {
        String str = "";
        Cookie[] cookies = request().getCookies();
        if (cookies == null) {
            return str;
        } else {
            for (Cookie cookie : cookies) {
                if (name.equals(cookie.getName())) {
                    str = cookie.getValue();
                    break;
                }
            }
        }
        return str;
    }

    public boolean isTarget() {
        return target;
    }

    public void setTarget(boolean target) {
        this.target = target;
    }

    public int getPageCount() {
        return pageCount;
    }

    public void setPageCount(int pageCount) {
        this.pageCount = pageCount;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public Pager getPages() {
        return pages;
    }

    public void setPages(Pager pages) {
        this.pages = pages;
    }

    public DataTable<T> getDataTable() {
        return dataTable;
    }

    public void setDataTable(DataTable<T> dataTable) {
        this.dataTable = dataTable;
    }

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Integer getLimit() {
        return limit;
    }

    public void setLimit(Integer limit) {
        this.limit = limit;
    }

    public HttpSession session() {
        return ServletActionContext.getRequest().getSession();
    }

    public Map<String, Object> getRes() {
        return res;
    }

    public void setRes(Map<String, Object> res) {
        this.res = res;
    }
}
