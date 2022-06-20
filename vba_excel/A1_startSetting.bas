Attribute VB_Name = "A1_startSetting"
Sub 저장()
'
' 저장 매크로
' 매크로 파일은 저장할 때 다른이름으로 저장 메시지가 뜨니까 임의로 저장해주지 않으면 번거롭다.
' xltm 형식으로 저장하므로 FileFormat이 XMLTemplate로 적혀있다.

    ActiveWorkbook.SaveAs Filename:="C:\Users\franc\Documents\GitHub\shellScripts\vba_excel\macro_Prac.xltm", FileFormat:= _
    xlOpenXMLTemplateMacroEnabled, Password:="", WriteResPassword:="", _
    ReadOnlyRecommended:=False, CreateBackup:=False
    
End Sub
Sub 시작페이지()
'
' 시작페이지로 이동해서 id값이 일치하는곳에 값을 채워준다.
' 클래스를 찾으려면 getElementByClassName("")를 사용한다.
' getElementsByClassName의 경우 .Item으로 묶어야 정상적으로 작동하는 경우도 있다.

    Dim IE_ctrl As InternetExplorer
    Dim HTMLDoc As IHTMLDocument
    Dim input_Data, target As IHTMLElement
    Dim URL As String
    URL = "https://nid.naver.com/nidlogin.login?mode=form&url=https%3A%2F%2Fwww.naver.com"
    
    Set IE_ctrl = New InternetExplorer
    With IE_ctrl
        .Silent = True
        .Visible = True
        .navigate URL
    End With
    
    Wait_Browser IE_ctrl
    
    Set HTMLDoc = IE_ctrl.document
    
    Set input_Data = HTMLDoc.getElementById("id")
    input_Data.Value = "francis_jeon"
    
    Set target = HTMLDoc.getElementsByClassName("btn_login").Item
    target.FireEvent "click", True, True
    'Dim objEvent As Object
    'Set objEvent = HTMLDoc.createEvent("MouseEvents")
    'objEvent.FireEvent "dblclick", True, True
    'targTag.objEvent
        
End Sub
Sub Wait_Browser(Browser As InternetExplorer, Optional t As Integer = 1)
' 브라우저가 로딩되기 전에는 멈춰주는 메소드
' readyState의 <> 기호의미와 반복해서 등장하는 DoEvents를 알아봐야 한다.

    While Browser.Busy Or Browser.readyState <> 4
    DoEvents
    Wend
    
    Application.Wait DateAdd("s", t, Now)
    
End Sub
