package kr.co.with.studygroup.reference.controller;

import java.io.BufferedWriter;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStreamWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

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
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.w3c.dom.Document;

/**
 * @author zas
 */

@Controller
@RequestMapping("/referenceRoom")
public class ConvertWord {
	/**
	 * Convert doc to HTML
	 * @param path
	 * @param file
	 * @throws Throwable
	 */
	@ResponseBody
	@RequestMapping("/convertFile.json")
	public String convert(MultipartFile file) throws Throwable {
		String path = "C:\\java73\\tomcat-work\\wtpwebapps\\WithProject\\images\\";
		File dir = new File(path);
		if (!dir.exists()) {
			dir.mkdirs();
		}
		String orgFileName = file.getOriginalFilename();
		System.out.println("orgFileName : " + orgFileName);
		
		// 확장자 붙이기
		String ext = "";
		int index = orgFileName.lastIndexOf(".");
		if (index != -1) {
			ext = orgFileName.substring(index);
		}
		
		// UUID를 통해 파일명의 중복을 방지하기위한 새로운 이름명 + 확장자(ext)
		String realFile = UUID.randomUUID().toString()+ext;
		// 파일을 업로드 폴더에 업로드
		FileCopyUtils.copy(file.getInputStream(), new FileOutputStream(path + "/" + realFile));

		// 프로젝트에 다운로드 된 파일을 html태그명으로 바꾸어주는 코드 POI
		 InputStream input = new FileInputStream (path + "/" + realFile);
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
	        
	        
//	        wordToHtmlConverter.setPicturesManager (new PicturesManager() {
//	            public String savePicture (byte[] content, PictureType pictureType, String suggestedName, float widthInches, float heightInches) {
//	                return suggestedName;
//	            }
//	        });
//	        
//	        wordToHtmlConverter.processDocument (wordDocument);
//	        List<?> pics = wordDocument.getPicturesTable().getAllPictures();
//	        if (pics != null) {
//	            for (int i = 0; i <pics.size(); i++) {
//	                Picture pic = (Picture) pics.get (i);
//	                try {
//	                    pic.writeImageContent (new FileOutputStream (path + pic.suggestFullFileName() ) );
//	                } catch (FileNotFoundException e) {
//	                    e.printStackTrace();
//	                }
//	            }
//	        }
	        
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
	        UUID uuid = UUID.randomUUID();
	        writeFile(content, path + uuid+".html", "gbk");
	        
	        
	        return content;
	}
	
	/**
	 * The write file
	 * @param content
	 * @param path
	 * @param encode
	 */
	
	public void writeFile(String content, String path, String encode) {
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
}