

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
 
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.AcroFields;
import com.itextpdf.text.pdf.AcroFields.FieldPosition;
import com.itextpdf.text.pdf.PdfReader;
import com.itextpdf.text.pdf.parser.FilteredTextRenderListener;
import com.itextpdf.text.pdf.parser.LocationTextExtractionStrategy;
import com.itextpdf.text.pdf.parser.PdfTextExtractor;
import com.itextpdf.text.pdf.parser.RegionTextRenderFilter;
import com.itextpdf.text.pdf.parser.RenderFilter;
import com.itextpdf.text.pdf.parser.TextExtractionStrategy;
 
public class PdfTest2
{     
    public static void main(String[] args) throws Exception
    {        
        /*String res = "";
        String filePath = "E:\\jj.pdf";
        PdfReader reader = new PdfReader(filePath); 
        float[] p = getPdfTextPosition(reader);
        res = getPdfTextContent(reader, p);
        System.out.println(res)*/;
        parsePdf();
    }
 
    public static float[] getPdfTextPosition(PdfReader reader) throws Exception
    {
        AcroFields fields = reader.getAcroFields();
        List<FieldPosition> pos = fields.getFieldPositions("检测结论");

        FieldPosition pitem = pos.get(0);
        Rectangle pRectangle = pitem.position;
        String res = pRectangle.getLeft()+","+pRectangle.getBottom()+","+pRectangle.getRight()+","+pRectangle.getTop();
        System.out.println(res);
        float[] arr = {pRectangle.getLeft(), pRectangle.getBottom(), pRectangle.getRight(), pRectangle.getTop()};
        return arr;
    }
    
    public static String getPdfTextContent(PdfReader reader, float[] p) throws Exception
    {
        Rectangle rect = new Rectangle(p[0], p[1], p[2], p[3]);        
        RenderFilter regionFilter = new RegionTextRenderFilter(rect);
        TextExtractionStrategy strategys = new FilteredTextRenderListener(new LocationTextExtractionStrategy(), regionFilter);
        String res = PdfTextExtractor.getTextFromPage(reader, 1, strategys);
        System.out.println(res);
        return res;
    }

    public static void parsePdf() throws IOException {
        PdfReader reader = new PdfReader("E:\\jj.pdf");
        PrintWriter out = new PrintWriter(new FileOutputStream("E:\\test.txt"));
        Rectangle rect = new Rectangle( 539.74f, 487.27f,0, 1.7886963f);
        RenderFilter filter = new RegionTextRenderFilter(rect);
        TextExtractionStrategy strategy;
        for (int i = 1; i <= reader.getNumberOfPages(); i++) {
            strategy = new FilteredTextRenderListener(new LocationTextExtractionStrategy(), filter);
            out.println(PdfTextExtractor.getTextFromPage(reader, i, strategy));
        }
        out.flush();
        out.close();
        reader.close();
    }
}
