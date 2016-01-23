%Let fpath = C:\Path\To\SAS\File\;

proc xsl 
	in="C:\Path\To\Input.xml"
	out="C:\Path\To\Output.xml"
	xsl="C:\Path\To\XSLT_Script.xsl";
run;
