#!/usr/bin/python
import os
import lxml.etree as ET

cd = os.path.dirname(os.path.abspath(__file__))

dom = ET.parse(os.path.join(cd, 'Input.xml'))
xslt = ET.parse(os.path.join(cd, 'XSLT_Script.xsl'))

transform = ET.XSLT(xslt)
newdom = transform(dom)
    
tree_out = ET.tostring(newdom, encoding='UTF-8', xml_declaration=True)

xmlfile = open(os.path.join(cd, 'Output.xml'),'wb')
xmlfile.write(tree_out)
xmlfile.close()

print("Successfully transformed XML file!")
