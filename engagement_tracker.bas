Attribute VB_Name = "Module1"
Sub standup_tracker()
Dim MainWkbk As Workbook
Dim Itm
Dim ws As Worksheet
Dim wb As Workbook
Dim row_cnt As Integer
'Business Unit
Dim BU As String
Dim CIB As Range
Dim PBB As Range
Dim Wealth As Range
'Corporate Function
Dim Compliance As Range
Dim Finance As Range
Dim Governance As Range
Dim GRES As Range
Dim GSS As Range
Dim HC As Range
Dim Internal_Audit As Range
Dim IT As Range
Dim Legal As Range
Dim Marketing As Range
Dim Procurement As Range
Dim Risk As Range

Set MainWkbk = Workbooks("Stakeholder Engagement Tracker.xlsm")
Set ws = Worksheets("Macro")

'Business Units Ranges
Set CIB = ws.Range("CIB")
Set PBB = ws.Range("PBB")
Set Wealth = ws.Range("Wealth")

'Corporate Function Ranges
Set Compliance = ws.Range("Compliance")
Set Finance = ws.Range("Finance")
Set Governance = ws.Range("Governance")
Set GRES = ws.Range("GRES")
Set GSS = ws.Range("GSS")
Set HC = ws.Range("HC")
Set Internal_Audit = ws.Range("Internal_Audit")
Set IT = ws.Range("IT")
Set Legal = ws.Range("Legal")
Set Marketing = ws.Range("Marketing")
Set Procurement = ws.Range("Procurement")
Set Risk = ws.Range("Risk")

'Loop through the Business Units

For Each Itm In Array(CIB, PBB, Wealth):
    If Itm.Value = "True" Then
    
        Set wb = Workbooks.Open("https://de.eyd.ey.com/sites/4u300i2orfqz/4/SharedDocuments/Project Governance/Stakeholders/Business Units/" & Itm.Offset(0, -1).Value & ".xlsx")
        wb.Activate
        ActiveSheet.Range("A4").Select
        On Error Resume Next
        mylastrow = Cells.Find("*", [a1], , , xlByRows, xlPrevious).Row
        mylastcol = Cells.Find("*", [a1], , , xlByColumns, xlPrevious).Column
        mylastcell = Cells(mylastrow, mylastcol).Address
        myrange = "A4:" & mylastcell
        Range(myrange).Select
        Selection.Copy
        
        MainWkbk.Activate
        Sheets("Stakeholder Engagement Tracker").Activate
        mylastrowSET = Cells.Find("*", [a1], , , xlByRows, xlPrevious).Row
        mylastcellSET = Cells(mylastrowSET + 1, "A").Address
        ActiveWorkbook.ActiveSheet.Range(mylastcellSET).Select
        ActiveWorkbook.ActiveSheet.Range(mylastcellSET).PasteSpecial xlPasteValues
        Application.CutCopyMode = False
        wb.Close False
    
    Else:
        End If
        
Next

'Loop through the Corporate Function

For Each Itm In Array(Compliance, Finance, Governance, GRES, GSS, HC, Internal_Audit, IT, Legal, Marketing, Procurement, Risk):
    If Itm.Value = "True" Then
    
        Set wb = Workbooks.Open("https://de.eyd.ey.com/sites/4u300i2orfqz/4/SharedDocuments/Project Governance/Stakeholders/Corporate Functions/" & Itm.Offset(0, -1).Value & ".xlsx")
        wb.Activate
        ActiveSheet.Range("A4").Select
        On Error Resume Next
        mylastrow = Cells.Find("*", [a1], , , xlByRows, xlPrevious).Row
        mylastcol = Cells.Find("*", [a1], , , xlByColumns, xlPrevious).Column
        mylastcell = Cells(mylastrow, mylastcol).Address
        myrange = "A4:" & mylastcell
        Range(myrange).Select
        Selection.Copy
        
        MainWkbk.Activate
        Sheets("Stakeholder Engagement Tracker").Activate
        mylastrowSET = Cells.Find("*", [a1], , , xlByRows, xlPrevious).Row
        mylastcellSET = Cells(mylastrowSET + 1, "A").Address
        ActiveWorkbook.ActiveSheet.Range(mylastcellSET).Select
        ActiveWorkbook.ActiveSheet.Range(mylastcellSET).PasteSpecial xlPasteValues
        Application.CutCopyMode = False
        wb.Close False
    
    Else:
        End If
        
Next

MsgBox "Completed!", vbInformation, "Status Update"

End Sub



