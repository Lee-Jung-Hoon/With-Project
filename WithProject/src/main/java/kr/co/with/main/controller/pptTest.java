package kr.co.with.main.controller;

import java.awt.Color;
import java.awt.Dimension;
import java.awt.Graphics2D;
import java.awt.geom.Rectangle2D;
import java.awt.image.BufferedImage;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.imageio.ImageIO;

import org.apache.poi.hdf.extractor.WordDocument;
import org.apache.poi.hslf.model.Slide;
import org.apache.poi.hslf.usermodel.SlideShow;
import org.apache.poi.hwpf.converter.WordToFoConverter;
import org.apache.poi.hwpf.converter.WordToFoUtils;
import org.apache.poi.hwpf.converter.WordToHtmlConverter;
import org.apache.poi.hwpf.extractor.Word6Extractor;


public class pptTest {
   
   private String pptFile;
   private String cvtImgFile;
 
   public pptTest(String pptFile, String cvtImgFile) {
      this.pptFile = pptFile;
      this.cvtImgFile = cvtImgFile;
   }
 
   /**
    * 이미지 변환 실행
    * @throws IOException
    */
   public void convter(String pptFile, String cvtImgFile, String type) throws IOException {   
   // PPT파일
   
         FileInputStream is = new FileInputStream(pptFile);
         SlideShow ppt = new SlideShow(is);
         
         // PPT파일 닫기
         is.close();
    
         Dimension pgsize = ppt.getPageSize();
    
         Slide[] slide = ppt.getSlides();
    
         for (int i = 0; i < slide.length; i++) {
    
            BufferedImage img = new BufferedImage(pgsize.width, pgsize.height,
                  BufferedImage.TYPE_INT_RGB);
            Graphics2D graphics = img.createGraphics();
            // 이미지 영역을 클리어
            graphics.setPaint(Color.white);
            graphics.fill(new Rectangle2D.Float(0, 0, pgsize.width,
                  pgsize.height));
    
            // 이미지 그리기
            slide[i].draw(graphics);
    
            // 파일로 저장
            FileOutputStream out = new FileOutputStream(cvtImgFile + (i + 1)
                  + "."+type);
            ImageIO.write(img, type, out);
            out.close();
         }
      }
    
      /**
       * @param args
       */
      public static void main(String[] args) {
    
         String pptFile = "C:\\java73\\aa.ppt";
         String cvtImgFile = "C:\\java73\\";
    
         pptTest cvtImage = new pptTest(pptFile, cvtImgFile);
         try {
            cvtImage.convter(pptFile, cvtImgFile, "png");
         } catch (IOException e) {
            e.printStackTrace();
         }
      }
}