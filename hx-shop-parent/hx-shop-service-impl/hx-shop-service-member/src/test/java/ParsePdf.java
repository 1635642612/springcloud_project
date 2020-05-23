

import com.itextpdf.text.pdf.PdfReader;
import com.itextpdf.text.pdf.parser.ImageRenderInfo;
import com.itextpdf.text.pdf.parser.PdfReaderContentParser;
import com.itextpdf.text.pdf.parser.RenderListener;
import com.itextpdf.text.pdf.parser.TextRenderInfo;
import org.apache.commons.lang3.StringUtils;
import org.assertj.core.util.Lists;

import java.io.IOException;
import java.util.List;

 class Parsepdf {
    // 定义返回页码
    private static int i = 0;
    private static com.itextpdf.awt.geom.Rectangle2D.Float boundingRectange =null;

    private static StringBuilder content;

    private static List<Object[]> arrays = Lists.newArrayList();

    public static void main(String[] argus){
        String filePath = "E:\\jj.pdf";
        String keyWord = "检测结论";
        List<Object[]> result = getKeyWords(filePath, keyWord);
        System.out.println(result);
    }

    private static List<Object[]> getKeyWords(String filePath, final String keyWord) {

        try {
            PdfReader pdfReader = new PdfReader(filePath);
            int pageNum = pdfReader.getNumberOfPages();
            PdfReaderContentParser pdfReaderContentParser = new PdfReaderContentParser(pdfReader);

            for (i = 1; i < (pageNum + 1); i++) {
                content = new StringBuilder();
                boundingRectange =new com.itextpdf.awt.geom.Rectangle2D.Float();
                pdfReaderContentParser.processContent(i, new RenderListener() {
                    @Override
                    public void renderText(TextRenderInfo textRenderInfo) {
                        String text = textRenderInfo.getText(); // 整页内容
                        content.append(text);

                        boundingRectange= textRenderInfo.getBaseline().getBoundingRectange();
                    /*if (null != text && StringUtils.contains(content, keyWord)) {
                        float[] resu = new float[3];
                        resu[0] = boundingRectange.x;
                        resu[1] = boundingRectange.y;
                        resu[2] = i;
                        arrays.add(resu);
                    }*/
                    }

                    @Override
                    public void renderImage(ImageRenderInfo arg0) {
                        // TODO Auto-generated method stub

                    }

                    @Override
                    public void endTextBlock() {
                        // TODO Auto-generated method stub

                    }

                    @Override
                    public void beginTextBlock() {
                        // TODO Auto-generated method stub

                    }
                });

                if (null != content && StringUtils.contains(content, keyWord)) {
                    Object[] resu = new Object[4];
                    resu[0] = content;
                    resu[1] = boundingRectange.x;
                    resu[2] = boundingRectange.y;
                    resu[3] = i;
                    float h = boundingRectange.height;
                    float w=  boundingRectange.width;
                    arrays.add(resu);
                }

                   System.out.println("第"+i+"页，内容："+content);
            }


        } catch (IOException e) {
            e.printStackTrace();
        }
        return arrays;
    }
}