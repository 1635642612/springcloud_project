import org.apache.poi.hwpf.HWPFDocument;
import org.apache.poi.hwpf.usermodel.*;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class Word_M28008 {

    public static void main(String[] args) {
        // TODO Auto-generated method stub
        try {
            List list = new ArrayList<>();
            //M28008
            InputStream is = new FileInputStream(new File("E:\\M28008.doc"));  //需要将文件路更改为word文档所在路径。
            POIFSFileSystem fs = new POIFSFileSystem(is);
            HWPFDocument document = new HWPFDocument(fs);
            Range range = document.getRange();
             printInfo(range);
           // readTable(range);
           

            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    public static void printInfo(Range range) {
        //获取段落数
        int paraNum = range.numParagraphs();
        System.out.println("段落数:"+paraNum);

        CharacterRun run1 = null;//用来存储第一行内容的属性
        CharacterRun run2 = null;//用来存储第二行内容的属性
        int q=1;
        for (int i=0; i<paraNum; i++) {

            Paragraph para1 = range.getParagraph(i);// 获取第i段
            Paragraph para2 = range.getParagraph(i+1);// 获取第i+1段
            int t=i;              //记录当前分析的段落数

            String paratext1 = para1.text().trim().replaceAll("\r\n", "");   //当前段落和下一段
            String paratext2 = para2.text().trim().replaceAll("\r\n", "");
            run1=para1.getCharacterRun(0);
            run2=para2.getCharacterRun(0);

            if (paratext1.length() > 0 && paratext2.length() > 0) {
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
                        int flag = range.getParagraph(t+1).getTableLevel();
                        if(flag>0){
                            break;
                        }
                        String detail = range.getParagraph(t+1).text().trim().replaceAll("\r\n", "");
                       /* if(detail.indexOf("检测单位")!=-1){
                            break;
                        }*/
                        //连续的相同
                        content+=detail;
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

            ///System.out.println( range.getParagraph(i).getSection(0).text());
           // System.out.println( range.getParagraph(i).getCharacterRun(0).toString());
            //System.out.println("段落" + (i+1) + "：" + range.getParagraph(i).text());

        }
        /*int secNum = range.numSections();
        System.out.println(secNum);
        Section section;
        for (int i=0; i<secNum; i++) {
            section = range.getSection(i);
            System.out.println(section.getMarginLeft());
            System.out.println(section.getMarginRight());
            System.out.println(section.getMarginTop());
            System.out.println(section.getMarginBottom());
            System.out.println(section.getPageHeight());
            System.out.println(section.text());
        }*/
    }

    /**
     * 读表格
     * 每一个回车符代表一个段落，所以对于表格而言，每一个单元格至少包含一个段落，每行结束都是一个段落。
     * @param range
     */
    public static void readTable(Range range) {
        //遍历range范围内的table。
        TableIterator tableIter = new TableIterator(range);
        Table table;
        TableRow row;
        TableCell cell;
        //存储表格数据


        while (tableIter.hasNext()) {
            List<Map<String,String>> dataList = new ArrayList();
            table = tableIter.next();
            int rowNum = table.numRows();
            //j=1 从第二行起，忽略表头
            TableRow rowHead = table.getRow(0);

            for (int j=1; j<rowNum; j++) {
                row = table.getRow(j);
                int cellNum = row.numCells();
                //map用来存储每一行数据
                Map<String,String> map = new HashMap();
                //String [] array = new String[cellNum];
                for (int k=0; k<cellNum; k++) {
                    //获取表头
                    String thead = rowHead.getCell(k).text().trim().replaceAll("\r", "");

                    cell = row.getCell(k);
                    if(cell.isMerged()){
                        continue;
                    }

                    //输出单元格的文本
                    map.put(thead , cell.text().trim());
                   // array[k]=cell.text().trim();

                    //System.out.println(cell.text().trim());
                }
                dataList.add(map);
            }
            System.out.println(dataList);
        }

    }

    

}