import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.encryption.InvalidPasswordException;
import org.apache.pdfbox.text.PDFTextStripper;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;

/**
 * 生成pdf,word转pdf，获取pdf中文字，图片
 * Created by yx on 2019/9/19.
 */
public class PDFUtils {

    //=================================获取pdf中文字========================================

    /**
     * 读取dpf中的内容 获取pdf中的文本内容
     *
     * @param file
     * @return
     */
    public static String pdfToString(MultipartFile file) {
        String content = null;
        InputStream input = null;
        PDDocument document = null;
        try {
            boolean sort = false;
            // 开始提取页数
            input = file.getInputStream();
            int startPage = 1;
            // 结束提取页数
            int endPage = Integer.MAX_VALUE;
            document = PDDocument.load(input);
            PDFTextStripper pts = new PDFTextStripper();
            pts.setSortByPosition(sort);
            endPage = document.getNumberOfPages();
            //System.out.println("Total Page: " + endPage);
            pts.setStartPage(startPage);
            pts.setEndPage(endPage);
            content = pts.getText(document);
            return content;
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (InvalidPasswordException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "";
    }

    /**
     * 读取dpf中的内容 获取pdf中的文本内容
     *
     * @param file
     * @return
     */
    public static String pdfToString(File file) {
        String content = null;
        InputStream input = null;
        PDDocument document = null;
        try {
            input = new FileInputStream(file);
            boolean sort = false;
            // 开始提取页数
            int startPage = 1;
            // 结束提取页数
            int endPage = Integer.MAX_VALUE;
            document = PDDocument.load(input);
            PDFTextStripper pts = new PDFTextStripper();
            pts.setSortByPosition(sort);
            endPage = document.getNumberOfPages();
            //System.out.println("Total Page: " + endPage);
            pts.setStartPage(startPage);
            pts.setEndPage(endPage);
           // pts.getCurrentPage().getContents().
            content = pts.getText(document);
            return content;
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (InvalidPasswordException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "";
    }

    /**
     * 读取dpf中的内容 获取pdf中的文本内容
     *
     * @param inputStream
     * @return
     */
    public static String pdfToString(FileInputStream inputStream) {
        String content = null;
        InputStream input = inputStream;
        PDDocument document = null;
        try {
            boolean sort = false;
            // 开始提取页数
            int startPage = 1;
            // 结束提取页数
            int endPage = Integer.MAX_VALUE;
            document = PDDocument.load(input);
            PDFTextStripper pts = new PDFTextStripper();
            pts.setSortByPosition(sort);
            endPage = document.getNumberOfPages();
            //System.out.println("Total Page: " + endPage);
            pts.setStartPage(startPage);
            pts.setEndPage(endPage);
            content = pts.getText(document);
            return content;
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (InvalidPasswordException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "";
    }

}
