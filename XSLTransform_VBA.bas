Sub XSLTransform()
On Error GoTo ErrHandle
    Dim xmldoc As New MSXML2.DOMDocument, xslDoc As New MSXML2.DOMDocument, newDoc As New MSXML2.DOMDocument
         
    ' LOAD XML AND XSL FILES
    xslDoc.async = False
    xmlDoc.Load "C:\Path\To\InputXML.xml"

    xslDoc.async = False    
    xslDoc.Load "C:\Path\To\XSLT_Script.xml"        
    
    ' TRANSFORM XML 
    xmldoc.transformNodeToObject xslDoc, newDoc
    newDoc.Save "C:\Path\To\OutputXML.xml"
            
    MsgBox "Successfully transformed XML!", vbInformation
    Exit Sub
            
ExitHandle:
    Set xmlDoc = Nothing: Set xslDoc = Nothing: Set newDoc = Nothing
    Exit Sub
                            
ErrHandle:
    MsgBox Err.Number & " - " & Err.Description, vbCritical
    Err.Raise xslDoc.parseError.ErrorCode, , xslDoc.parseError.reason
    Resume ExitHandle
    
End Sub
