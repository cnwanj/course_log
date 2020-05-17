package org.gxuwz.course_log.model.vo;

import org.gxuwz.course_log.utils.ExcelUtil;

import java.util.List;

public class DataTable<T> extends ExcelUtil {
    Integer code;
    String msg;
    Integer count;
    List<T> data;

    public DataTable(Integer count, List<T> data) {
        this.code = 0;
        this.count = count;
        this.data = data;
        this.msg = "";
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public List<T> getData() {
        return data;
    }

    public void setData(List<T> data) {
        this.data = data;
    }

    //    public Map<String, Object> dataTable(int count, List<Object> list){
//        map.put("code",0);
//        map.put("msg", "");
//        map.put("count", count);
//        map.put("data", list);
//        return map;
//    }
}
