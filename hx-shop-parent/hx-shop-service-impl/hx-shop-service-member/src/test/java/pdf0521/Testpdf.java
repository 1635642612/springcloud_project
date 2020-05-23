package pdf0521;

import com.itextpdf.awt.geom.Rectangle2D;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.pdf.PdfReader;
import com.itextpdf.text.pdf.PdfStamper;
import com.itextpdf.text.pdf.parser.PdfReaderContentParser;
import org.junit.Test;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.Map;

public class Testpdf {

    @Test
    public void test() throws IOException, DocumentException {

        PdfReader reader = new PdfReader("D:\\jj.pdf");
//新建一个PDF解析对象
        PdfReaderContentParser parser = new PdfReaderContentParser(reader);
//包含了PDF页面的信息，作为处理的对象
        PdfStamper stamper = new PdfStamper(reader, new FileOutputStream("D:\\jj.pdf"));
        for(int i = 1;i <= reader.getNumberOfPages();i++){
            //新建一个ImageRenderListener对象，该对象实现了RenderListener接口，作为处理PDF的主要类
            TestRenderListener listener = new TestRenderListener();
            //解析PDF，并处理里面的文字
            try {
                parser.processContent(i, listener);
            } catch (IOException e) {
                e.printStackTrace();
            }
            //获取文字的矩形边框
            List<Rectangle2D.Float> rectText = listener.rectText;
            List<String> textList = listener.textList;
            List<Float> listY = listener.listY;
            List<Map<String,Rectangle2D.Float>> list_text = listener.rows_text_rect;
            for(int k = 0;k < list_text.size();k++){
                Map<String,Rectangle2D.Float> map = list_text.get(k);
                for(Map.Entry<String, Rectangle2D.Float>entry:map.entrySet()){
                    System.out.println(entry.getKey()+"---"+entry.getValue());
                }
            }
        }
        reader.close();
    }
}
