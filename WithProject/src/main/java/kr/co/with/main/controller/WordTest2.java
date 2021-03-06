package kr.co.with.main.controller;

import java.io.BufferedWriter;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStreamWriter;
import java.util.List;

import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.apache.poi.hwpf.HWPFDocument;
import org.apache.poi.hwpf.converter.PicturesManager;
import org.apache.poi.hwpf.converter.WordToHtmlConverter;
import org.apache.poi.hwpf.usermodel.Picture;
import org.apache.poi.hwpf.usermodel.PictureType;
import org.w3c.dom.Document;

/**
 * @author zas
 */
public class WordTest2 {
	
	/**
	 * Convert doc to HTML
	 * @param path
	 * @param file
	 * @throws Throwable
	 */
	public static void convert(String path, String file) throws Throwable {
		 InputStream input = new FileInputStream (path + file);
	        HWPFDocument wordDocument = new HWPFDocument (input);
	        WordToHtmlConverter wordToHtmlConverter = new WordToHtmlConverter (DocumentBuilderFactory.newInstance().newDocumentBuilder().newDocument() );
	        wordToHtmlConverter.setPicturesManager (new PicturesManager() {
	            public String savePicture (byte[] content, PictureType pictureType, String suggestedName, float widthInches, float heightInches) {
	                return suggestedName;
	            }
	        });
	        wordToHtmlConverter.processDocument (wordDocument);
	        List<?> pics = wordDocument.getPicturesTable().getAllPictures();
	        if (pics != null) {
	            for (int i = 0; i <pics.size(); i++) {
	                Picture pic = (Picture) pics.get (i);
	                try {
	                    pic.writeImageContent (new FileOutputStream (path + pic.suggestFullFileName() ) );
	                } catch (FileNotFoundException e) {
	                    e.printStackTrace();
	                }
	            }
	        }
	        Document htmlDocument = wordToHtmlConverter.getDocument();
	        ByteArrayOutputStream outStream = new ByteArrayOutputStream();
	        DOMSource domSource = new DOMSource (htmlDocument);
	        StreamResult streamResult = new StreamResult (outStream);

	        TransformerFactory tf = TransformerFactory.newInstance();
	        Transformer serializer = tf.newTransformer();
	        serializer.setOutputProperty (OutputKeys.ENCODING, "gbk");
	        serializer.setOutputProperty (OutputKeys.INDENT, "yes");
	        serializer.setOutputProperty (OutputKeys.METHOD, "html");
	        serializer.transform (domSource, streamResult);
	        outStream.close();

	        String content = new String (outStream.toByteArray() );

	        writeFile (content, path + "result.html", "gbk");
	}
	
	/**
	 * The write file
	 * @param content
	 * @param path
	 * @param encode
	 */
	public static void writeFile(String content, String path, String encode) {
		FileOutputStream fos = null;
		BufferedWriter bw = null;
		try {
			File file = new File(path);
			fos = new FileOutputStream(file);
			bw = new BufferedWriter(new OutputStreamWriter(fos, encode));
			bw.write(content);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (bw != null){
					bw.close();
				}
				if (fos != null){
					fos.close();
				}
			} catch (IOException ie) {
				ie.printStackTrace();
			}
		}
	}

    public static void main (String[] args) throws Throwable {
        final String path = "C:\\java73\\";
        final String file = "11.doc";
        WordTest2.convert(path, file);
    }
}