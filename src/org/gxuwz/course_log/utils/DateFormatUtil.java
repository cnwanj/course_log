package org.gxuwz.course_log.utils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

public class DateFormatUtil {
    public String date() {
        Date date = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        return dateFormat.format(date) + "";
    }

    public String time() {
        Date date = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return dateFormat.format(date);
    }

    public String ran() {
        Date date = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
        return dateFormat.format(date) + ((int) (Math.random() * 900) + 100);
    }

    public String checkCode(int length) {
        Random ran = new Random();
        String code = "";
        for (int i = 0; i < length; i++) {
            if (ran.nextInt(2) == 0) {     // 如果是字母
                char a = (char) (ran.nextInt(26) + 65);
//                if (ran.nextInt(2) == 0) { // 如果是小写字母
//                    a = (char)(ran.nextInt(26)+97);
//                } else {                           // 如果是大写字母
//                    a = (char)(ran.nextInt(26)+65);
//                }
                code = code + a;
            } else {                                // 如果是数字
                int n = ran.nextInt(10);
                code = code + n;
            }
        }
        return code;
    }

    public static void main(String[] args) {
//        Random r = new Random();
//        int ra = r.nextInt(2);
//        int i = new Random().nextInt(1);
//        for(int j=0; j<10; j++) {
//            System.out.println(r.nextInt(2));
//        }
//        System.out.println(checkCode(4));
    }
}
