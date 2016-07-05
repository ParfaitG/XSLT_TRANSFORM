<?php

// Load the XML source and XSLT file
$cd = dirname(__FILE__);

$doc = new DOMDocument();
$doc->load($cd.'/Input.xml');

$xsl = new DOMDocument;
$xsl->load($cd.'/XSLT_Script.xsl');

// Configure the transformer
$proc = new XSLTProcessor;
$proc->importStyleSheet($xsl); 

// Transform XML source
$newXml = $proc->transformToXML($doc);

// Save output to file
$xmlfile = $cd.'/Output.xml';
file_put_contents($xmlfile, $newXml);

echo "Successfully transformed XML file!\n";
?>