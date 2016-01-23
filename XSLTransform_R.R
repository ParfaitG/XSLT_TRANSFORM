library(XML)

#######################################################
### LINUX USERS (SXSLT MODULE)
#######################################################
library(Sxslt)   # AVAILABLE ON http://www.omegahat.org/Sxslt/

xmlfile = '/path/to/Input.xml'
xslfile = "/path/to/XSLT_Script.xsl"
newxmlfile = "/path/to/Output.xml"

doc <- xsltApplyStyleSheet(xmlfile, xslfile, isURL= FALSE)

saveXML(doc, file=newxmlfile)


#######################################################
### WINDOWS USERS (RDOMCLIENT MODULE AND MSXML OBJECT)
#######################################################
library(RDCOMClient)

# INITIATE OBJECTS
xmlobj = COMCreate("MSXML2.DOMDocument")
xslobj = COMCreate("MSXML2.DOMDocument")
newxmlobj = COMCreate("MSXML2.DOMDocument")

xmlfile = 'C:\\Path\\To\\Input.xml'
xslfile = "C:\\Path\\To\\XSLT_Script.xsl"
newxmlfile = "C:\\Path\\To\\Output.xml"

# LOADING XML & XSLT FILES
xmlobj.async = FALSE
xmlobj$Load(xmlfile)
        
xslobj.async = FALSE
xslobj$Load(xslfile)

# TRANSFORMING XML FILE
xmlfile$transformNodeToObject(xslobj, newxmlobj)

# OUTPUT RESULT TO FILE
newxmlfile$Save(newxmlfile)

xmlobj <- NULL
xslobj <- NULL
newxmlobj <- NULL

print("Successfully transformed XML file!")

