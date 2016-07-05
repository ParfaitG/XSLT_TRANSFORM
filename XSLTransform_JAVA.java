
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import javax.xml.transform.*;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.TransformerException;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;
import javax.xml.transform.OutputKeys;

import java.io.File;
import java.io.IOException;
import java.net.URISyntaxException;

import org.w3c.dom.Document;
import org.xml.sax.SAXException;

public class XSLTransform_JAVA {
    public static void main(String[] args) throws IOException, URISyntaxException,
                                                  SAXException, ParserConfigurationException,
                                                  TransformerException {
        
            // Load XML and XSL Document
            String inputXML = "C:\\Path\\To\\Input.xml";
            String xslFile = "C:\\Path\\To\\XSLT_Script.xsl";
            String outputXML = "C:\\Path\\To\\Output.xml";
                                
            Source xslt = new StreamSource(new File(xslFile));            
            DocumentBuilderFactory docFactory = DocumentBuilderFactory.newInstance();            
            DocumentBuilder docBuilder = docFactory.newDocumentBuilder();
            Document doc = docBuilder.parse (new File(inputXML));
            
            // XSLT Transformation  with pretty print
            TransformerFactory prettyPrint = TransformerFactory.newInstance();
            Transformer transformer = prettyPrint.newTransformer(xslt);
            
            transformer.setOutputProperty(OutputKeys.OMIT_XML_DECLARATION, "no");
            transformer.setOutputProperty(OutputKeys.STANDALONE, "yes");
            transformer.setOutputProperty(OutputKeys.METHOD, "xml");
            transformer.setOutputProperty(OutputKeys.INDENT, "yes");
            transformer.setOutputProperty(OutputKeys.ENCODING, "UTF-8");
            transformer.setOutputProperty("{http://xml.apache.org/xslt}indent-amount", "4");                        
            
            // Output Result to File
            DOMSource source = new DOMSource(doc);
            StreamResult result = new StreamResult(new File(outputXML));		
            transformer.transform(source, result);
    }
}
