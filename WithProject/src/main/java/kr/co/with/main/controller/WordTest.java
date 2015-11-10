package kr.co.with.main.controller;

import java.io.BufferedWriter;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.StringWriter;

import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.apache.poi.hwpf.HWPFDocument;
import org.apache.poi.hwpf.converter.WordToHtmlConverter;
import org.apache.poi.hwpf.extractor.WordExtractor;
import org.w3c.dom.Document;

public class WordTest {
    private File docFile;
    private File file;

    public WordTest(File docFile) {
        this.docFile = docFile;
    }

    public void convert(File file) {
    this.file = file;

        try {
            FileInputStream finStream=new FileInputStream(docFile.getAbsolutePath()); 
            HWPFDocument doc=new HWPFDocument(finStream);
            WordExtractor wordExtract=new WordExtractor(doc);
            Document newDocument = DocumentBuilderFactory.newInstance() .newDocumentBuilder().newDocument();
            WordToHtmlConverter wordToHtmlConverter = new WordToHtmlConverter(newDocument) ;
            wordToHtmlConverter.processDocument(doc);

            StringWriter stringWriter = new StringWriter();
            Transformer transformer = TransformerFactory.newInstance().newTransformer();

            transformer.setOutputProperty(OutputKeys.INDENT, "yes");
            transformer.setOutputProperty(OutputKeys.ENCODING, "utf-8");
            transformer.setOutputProperty(OutputKeys.METHOD, "html");
            transformer.transform(new DOMSource( wordToHtmlConverter.getDocument()), new StreamResult( stringWriter ) );

            String html = stringWriter.toString();
            FileOutputStream fos=new FileOutputStream(new File("sample.html"));
            DataOutputStream dos;

            try {
                BufferedWriter out = new BufferedWriter(new OutputStreamWriter(fos,"UTF-8"));    
                out.write(html);
                out.close();
            }
            catch (IOException e) {
               e.printStackTrace();
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
    }  

    public static void main(String args[]) {
        WordTest TTC=new WordTest(new File("11.doc"));
        TTC.convert(TTC.docFile);         
   }
}