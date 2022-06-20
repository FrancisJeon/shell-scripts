Attribute VB_Name = "A2_cellControl"
''' 서브모듈
Sub 기본멘트()
' 기본 멘트를 검색 후 카피해서 가지고 있음
    Range("A2").Copy

End Sub
Sub saveFile()
' 저장하기 ctrl+s 눌러주는 기능
    ActiveWorkbook.Save

End Sub

''' 메인모듈
Sub dblClick()
' 로컬 HTML 파일을 열어 준 뒤 더블클릭을 실행한다.

    Dim IE_ctrl As InternetExplorer
    Dim HTMLDoc As IHTMLDocument
    Dim targTag As IHTMLElement
    Dim URL As String
    URL = "C:/Users/franc/Documents/GitHub/shellScripts/vba_excel/dblClickPrac.html"
    
    Set IE_ctrl = New InternetExplorer

    IE_ctrl.Silent = True
    IE_ctrl.Visible = True
    IE_ctrl.navigate URL

    
    'Wait_Browser IE_ctrl
     
     'Set HTMLDoc = IE_ctrl.document
     
     'Set targTag = HTMLDoc.getElementById("dblclick")
     'Dim objEvent As Object
     'Set objEvent = HTMLDoc.parentWindow.createEvent("MouseEvents")
     'objEvent.FireEvent "dblclick", True, True
     'targTag objEvent

End Sub
