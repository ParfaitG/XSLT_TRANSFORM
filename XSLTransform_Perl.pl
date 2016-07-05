#!/usr/bin/perl
use strict;
use warnings;
use File::Basename;

use XML::LibXML;
use XML::LibXSLT;

# LOAD XML AND XSL FILES
my $dirname = dirname(__FILE__);

my $xml_file    = $dirname."/Input.xml";
my $xml_parser  = XML::LibXML->new();
my $xml_doc     = $xml_parser->parse_file($xml_file);

my $xsl_file    = $dirname."/XSLT_Script.xsl";
my $xslt_parser = XML::LibXSLT->new;   
my $xsl_doc     = $xml_parser->parse_file($xsl_file);

# TRANSFORM XML 
my $stylesheet  = $xslt_parser->parse_stylesheet($xsl_doc); 
my $results     = $stylesheet->transform($xml_doc);
my $output      = $stylesheet->output_string($results);
 
# OUTPUT TO FILE
my $newxml_file = $dirname."/Output.xml";
$stylesheet->output_file($newxml_file);