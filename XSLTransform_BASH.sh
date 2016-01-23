#!/bin/sh
# CALL FROM COMMAND LINE AS sh XSLTransform_BASH.sh

cd path/to/working/directory
xsltproc XSLT_Script.xsl Input.xml -o Output.xml

