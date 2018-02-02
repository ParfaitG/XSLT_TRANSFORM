library(xslt)

doc <- read_xml("/path/to/Input.xml", package = "xslt")
style <- read_xml("/path/to/Script.xsl", package = "xslt")
new_xml <- xml_xslt(doc, style)

# OUTPUT TO SCREEN
cat(as.character(new_xml))

# OUTPUT TO FILE
write_xml(new_xml, "/path/to/Output.xml")

print("Successfully transformed XML file!")

