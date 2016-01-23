
# RUN BELOW AT COMMAND LINE (WITH THREE PARAMETERS): 
# Powershell.exe -File XSLTransform_PowerShell.ps1
#         "C:\Path\To\Input.xml",
#         "C:\Path\To\XSLT_Script.xml",
#         "C:\Path\To\Output.xml",

param ($xml, $xsl, $output)

if (-not $xml -or -not $xsl -or -not $output) {
	Write-Host "& .\xslt.ps1 [-xml] xml-input [-xsl] xsl-input [-output] transform-output"
	exit;
}

trap [Exception]{
	Write-Host $_.Exception;
}

$xslt = New-Object System.Xml.Xsl.XslCompiledTransform;
$xslt.Load($xsl);
$xslt.Transform($xml, $output);

Write-Host "generated" $output;