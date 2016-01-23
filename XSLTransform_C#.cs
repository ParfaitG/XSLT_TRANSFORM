
using System;
using System.IO;
using System.Xml;
using System.Xml.Xsl;
using System.Xml.XPath;

public class TransformXML
{
    public static void Main(string[] args)
    {
        try
        {
            String xmlDoc = "C:\\Path\\To\\Input.xml"
            String xslDoc = "C:\\Path\\To\\XSLT_Script.xsl"
            String newDoc = "C:\\Path\\To\\Output.xml"
            
            XPathDocument myXPathDocument = new XPathDocument(xmlDoc);
            XslTransform myXslTransform = new XslTransform();
                        
            myXslTransform.Load(xslDoc);
            myXslTransform.Transform(myXPathDocument, newDoc);
        }
        catch (Exception e)
        {
            Console.WriteLine ("Exception: {0}", e.ToString());
        }
    }
}