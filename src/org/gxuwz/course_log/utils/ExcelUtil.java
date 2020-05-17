package org.gxuwz.course_log.utils;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.poi.hssf.usermodel.*;
import org.apache.struts2.ServletActionContext;
import org.gxuwz.course_log.model.entity.Student;

import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.List;

public class ExcelUtil extends ActionSupport {
    //    public HSSFSheet sheet;
    private HSSFRow row = null;

    public void getExcel(String[] arr, List<Student> stuList) {
        // 1.创建一个workbook，对应一个Excel文件
        HSSFWorkbook wb = new HSSFWorkbook();
        String fileName = arr[0];
        // 2.在workbook中添加一个sheet，对应Excel中的一个sheet
        HSSFSheet sheet = wb.createSheet(fileName);
        // 3.在sheet中添加表头第0行，老版本poi对excel行数列数有限制short
        row = sheet.createRow(0);
        // 4.创建单元格，设置值表头，设置表头居中
        HSSFCellStyle style = wb.createCellStyle();
        // 居中格式
        style.setAlignment(HSSFCellStyle.ALIGN_CENTER);

        // 设置表头
        for (int i = 1; i < arr.length; i++) {
            HSSFCell cell = row.createCell(i - 1);
            cell.setCellValue(arr[i]);
            cell.setCellStyle(style);
        }

        for (int i = 0; i < stuList.size(); i++) {
            row = sheet.createRow(i + 1);
            Student stu = stuList.get(i);
            // 创建单元格，设置值
            row.createCell(0).setCellValue(stu.getStuId());
            row.createCell(1).setCellValue(stu.getStuName());
            row.createCell(2).setCellValue(stu.getClaId());
            row.createCell(3).setCellValue(stu.getStuSex() == 1 ? "男" : "女");
            row.createCell(4).setCellValue(stu.getStuAddress());
            row.createCell(5).setCellValue(stu.getStuPhone());
            row.createCell(6).setCellValue(stu.getLogArrive() == null ? 0 : stu.getLogArrive());
            row.createCell(7).setCellValue(stu.getLogLeave() == null ? 0 : stu.getLogLeave());
            row.createCell(8).setCellValue(stu.getLogLate() == null ? 0 : stu.getLogLate());
            row.createCell(9).setCellValue(stu.getLogAbsent() == null ? 0 : stu.getLogAbsent());
            row.createCell(10).setCellValue(stu.getLogDate());
        }

        try {
            BufferedInputStream bis = null;
            BufferedOutputStream bos = null;
            ByteArrayOutputStream os = new ByteArrayOutputStream();
            wb.write(os);
            byte[] content = os.toByteArray();
            InputStream is = new ByteArrayInputStream(content);
            // 设置response参数，可以打开下载页面
            HttpServletResponse res = ServletActionContext.getResponse();
            res.reset();
            res.setContentType("application/vnd.ms-excel;charset=utf-8");
            res.setHeader("Content-Disposition", "attachment;filename="
                    + new String((fileName + ".xls").getBytes(), "iso-8859-1"));
            OutputStream out = res.getOutputStream();

            bis = new BufferedInputStream(is);
            bos = new BufferedOutputStream(out);
            byte[] buff = new byte[2048];
            int bytesRead;
            while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
                bos.write(buff, 0, bytesRead);
            }
            bis.close();
            bos.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
