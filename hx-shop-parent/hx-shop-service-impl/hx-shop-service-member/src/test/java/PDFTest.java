

import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.PdfReader;
import com.itextpdf.text.pdf.parser.*;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;

public class PDFTest {
    public static void main(String[] args) throws IOException {
        String outputPath = "E:\\wordParser\\4.txt";
        PrintWriter writer = new PrintWriter(new FileOutputStream(outputPath));
        String fileName = "E:\\wordParser\\jj.pdf";
        //String fileName = "http://192.168.3.241:8888/group1/M00/00/15/wKgD8V0W-6aAHbfQAAXX31OH_LQ078.pdf";

      //  readPdf(writer, fileName);//直接读全PDF面
        readPdf_filter(writer,fileName);//读取PDF面的某个区域

    }

    //读取全部
    public static void readPdf(PrintWriter writer,String fileName){
        String pageContent = "";
        String ewaybillNo = "";
        String ewaybillCurrencyStr = "";
        String ewaybillAmount = "";
        try {
            PdfReader reader = new PdfReader(fileName);//解析pdf
            int pageNum = reader.getNumberOfPages();
            for(int i=1;i<=pageNum;i++){
                pageContent += PdfTextExtractor.getTextFromPage(reader, i);//读取第i页的文档内容
            }

            //pageContent是String类型(xxxxUnique No.aaaaEntered DatexxxxValue of GoodsbbbbHSN Codexxxx)
            if (pageContent.indexOf("检测到与临床") != -1 ) {
                String[] split = pageContent.split("检测到与临床");
                ewaybillNo = split[1].replaceAll("\\s*", "");
                String[] split1 = pageContent.split("检测到与临床");
                String str = split1[1].replaceAll("\\s*", "");
                ewaybillCurrencyStr = str.substring(0, 1);
                ewaybillAmount = str.substring(1, str.length());
                //pageContent是String类型(xxxxE-Way Bill No:aaaaEntered DatexxxxValue of GoodsbbbbHSN Codexxxx)
            } else if (pageContent.indexOf("E-Way Bill No:") != -1 && pageContent.indexOf("Entered Date") != -1 && pageContent.indexOf("Value of Goods") != -1 && pageContent.indexOf("HSN Code") != -1) {
                String[] split = pageContent.split("E-Way Bill No:|Entered Date");
                ewaybillNo = split[1].replaceAll("\\s*", "");
                String[] split1 = pageContent.split("Value of Goods|HSN Code");
                String str = split1[1].replaceAll("\\s*", "");
                ewaybillCurrencyStr = str.substring(0, 1);
                ewaybillAmount = str.substring(1, str.length());
            }
            writer.write(pageContent);
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            writer.close();
        }
    }

    //读取PDF面的某个区域
    public static void readPdf_filter(PrintWriter writer,String fileName){
        String pageContent = "";
        try {
            Rectangle rect = new Rectangle(2.5219193f, 0.0f,41.16f,62.784f );
            RenderFilter filter = new RegionTextRenderFilter(rect);
            PdfReader reader = new PdfReader(fileName);
            int pageNum = reader.getNumberOfPages();
            TextExtractionStrategy strategy;
            for (int i = 1; i <= pageNum; i++) {
                strategy = new FilteredTextRenderListener(new LocationTextExtractionStrategy(), filter);
                pageContent +=PdfTextExtractor.getTextFromPage(reader, i, strategy);
            }

            //将字符串写入对应得文件中
            writer.write(pageContent);
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            writer.close();
        }
    }


}