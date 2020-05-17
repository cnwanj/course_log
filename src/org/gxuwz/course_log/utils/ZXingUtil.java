package org.gxuwz.course_log.utils;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.geom.RoundRectangle2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.Hashtable;

public class ZXingUtil {
    //加密：文字->二维码(图片)
    public static void encodeImg(String imgPath, String format, String content, int width, int height, String logo) throws Exception {
        Hashtable<EncodeHintType, Object> hints = new Hashtable<EncodeHintType, Object>();
        //排错率L<M<Q<H
        hints.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.H);
        //编码
        hints.put(EncodeHintType.CHARACTER_SET, "utf-8");
        //外边距：margin
        hints.put(EncodeHintType.MARGIN, 1);
        /**
         * content:需要解析的文本，
         * BarcodeFormat:解析的类型(二维码、条形码)，
         * 宽，高
         */
        BitMatrix bitMatrix = new MultiFormatWriter().encode(content, BarcodeFormat.QR_CODE, width, height, hints);

        //内存中的一张图片：此时需要的图片是二维码->需要一个boolean[][]->BitMatrix
        //产生一张图片，宽，高，可以由任何颜色组成
        BufferedImage img = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        for (int x = 0; x < width; x++) {
            for (int y = 0; y < height; y++) {
                img.setRGB(x, y, (bitMatrix.get(x, y) ? new Color(0, 0, 0).getRGB() : new Color(255, 255, 255).getRGB()));
            }
        }

        //画logo
        img = logoMatrix(img, logo);

        //根据文件路径创建文件
        File file = new File(imgPath);
        //生成图片
        ImageIO.write(img, format, file);

    }

    //传入logo、二维码->带Logo的二维码
    public static BufferedImage logoMatrix(BufferedImage matrixImage, String logo) throws IOException, IOException {
        //在二维码上画logo：产生一个二维码画板
        Graphics2D g2 = matrixImage.createGraphics();

        //画logo:String->BufferedImage内存
        BufferedImage logoImg = ImageIO.read(new File(logo));
        int height = matrixImage.getHeight();
        int width = matrixImage.getWidth();
        //纯logo图片
        g2.drawImage(logoImg, width * 2 / 5, height * 2 / 5, width * 1 / 5, height * 1 / 5, null);
        /**
         *产生一个画白色圆角正方形的画笔
         * (1)笔的宽度
         * (2)笔的类型
         * (3)正方形圆角
         */
        BasicStroke stroke = new BasicStroke(5, BasicStroke.CAP_ROUND, BasicStroke.JOIN_ROUND);
        //将画笔和画板关联
        g2.setStroke(stroke);
        //创建一个正方形
        RoundRectangle2D.Float round = new RoundRectangle2D.Float(width * 2 / 5, height * 2 / 5, width * 1 / 5, height * 1 / 5, BasicStroke.CAP_ROUND, BasicStroke.JOIN_ROUND);
        g2.setColor(Color.WHITE);
        g2.draw(round);

        //灰色边框
        BasicStroke stroke2 = new BasicStroke(1, BasicStroke.CAP_ROUND, BasicStroke.JOIN_ROUND);
        g2.setStroke(stroke2);
        //创建一个正方形
        RoundRectangle2D.Float round2 = new RoundRectangle2D.Float(width * 2 / 5 + 2, height * 2 / 5 + 2, width * 1 / 5 - 4, height * 1 / 5 - 4, BasicStroke.CAP_ROUND, BasicStroke.JOIN_ROUND);
        g2.setColor(Color.GRAY);
        g2.draw(round2);

        g2.dispose();
        matrixImage.flush();
        return matrixImage;

    }

    public static void main(String[] args) throws Exception {
        String imgPath = "src/log.png";
        String content = "考勤签到成功！";
        String logo = "src/wz.jpg";
        encodeImg(imgPath, "gif", content, 430, 430, logo);
    }
}
