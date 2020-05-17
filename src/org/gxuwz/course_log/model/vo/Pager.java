package org.gxuwz.course_log.model.vo;

import java.util.List;

public class Pager<T> {
    private Integer pageSize;   //页面大小
    private Integer pageCount;  //页码
    private Integer totalCount; //总数据数
    private Integer totalPage;  //总页面
    private List<T> list;

    public Pager() {
    }

    public Pager(Integer pageSize, Integer pageCount, Integer totalCount, List<T> list) {
        this.pageSize = pageSize;
        this.pageCount = pageCount;
        this.totalCount = totalCount;
        if (totalCount == pageSize) {
            this.totalPage = totalCount / pageSize;
        } else {
            this.totalPage = totalCount / pageSize + 1;
        }
        this.list = list;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Integer getPageCount() {
        return pageCount;
    }

    public void setPageCount(Integer pageCount) {
        this.pageCount = pageCount;
    }

    public Integer getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(Integer totalCount) {
        this.totalCount = totalCount;
    }

    public Integer getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(Integer totalPage) {
        this.totalPage = totalPage;
    }

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }

    @Override
    public String toString() {
        return "Pager{" +
                "pageSize=" + pageSize +
                ", pageCount=" + pageCount +
                ", totalCount=" + totalCount +
                ", totalPage=" + totalPage +
                ", list=" + list +
                '}';
    }
}
