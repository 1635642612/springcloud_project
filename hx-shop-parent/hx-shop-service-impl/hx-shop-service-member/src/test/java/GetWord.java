import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.poi.POIXMLDocument;
import org.apache.poi.POIXMLTextExtractor;
import org.apache.poi.hwpf.HWPFDocument;
import org.apache.poi.hwpf.extractor.WordExtractor;
import org.apache.poi.hwpf.usermodel.*;
import org.apache.poi.openxml4j.opc.OPCPackage;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.poi.xwpf.extractor.XWPFWordExtractor;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.poi.xwpf.usermodel.XWPFParagraph;
import org.apache.poi.xwpf.usermodel.XWPFRun;




public class GetWord {

    public static void main(String[] args) {
        // TODO Auto-generated method stub
        try {
            List list = new ArrayList<>();
            InputStream is = new FileInputStream(new File("E:\\M28008.doc"));  //需要将文件路更改为word文档所在路径。
            POIFSFileSystem fs = new POIFSFileSystem(is);
            HWPFDocument document = new HWPFDocument(fs);
            Range range = document.getRange();

            CharacterRun run1 = null;//用来存储第一行内容的属性
            CharacterRun run2 = null;//用来存储第二行内容的属性
            int q=1;
            for (int i = 0; i < range.numParagraphs()-1; i++) {
                Paragraph para1 = range.getParagraph(i);// 获取第i段
                Paragraph para2 = range.getParagraph(i+1);// 获取第i段
                int t=i;              //记录当前分析的段落数

                String paratext1 = para1.text().trim().replaceAll("\r\n", "");   //当前段落和下一段
                String paratext2 = para2.text().trim().replaceAll("\r\n", "");
                run1=para1.getCharacterRun(0);

                run2=para2.getCharacterRun(0);
                if (paratext1.length() > 0&&paratext2.length() > 0) {
                        //这个if语句为的是去除大标题，连续三个段落字体大小递减就跳过
                        if(run1.getFontSize()>run2.getFontSize()&&run2.getFontSize()>range.getParagraph(i+2).getCharacterRun(0).getFontSize()) {
                            continue;
                        }                        
                        //连续两段字体格式不同
                        if(run1.getFontSize()>run2.getFontSize()) {

                            
                            String content=paratext2;
                            run1=run2;  //从新定位run1  run2
                            run2=range.getParagraph(t+2).getCharacterRun(0);
                            t=t+1;
                            while(run1.getFontSize()==run2.getFontSize()) {
                                //连续的相同
                                content+=range.getParagraph(t+1).text().trim().replaceAll("\r\n", "");
                                run1=run2;
                                run2=range.getParagraph(t+2).getCharacterRun(0);
                                t++;
                            }
                            
                            if(paratext1.indexOf("HYPERLINK")==-1&&content.indexOf("HYPERLINK")==-1) {
                                System.out.println(q+"(标题：)"+paratext1+"\t(内容:)"+content);
                                i=t;
                                q++;
                            }
                                
                        }
                }
            }
           

            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }



    

}