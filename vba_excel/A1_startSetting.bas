Attribute VB_Name = "A1_startSetting"
Sub ����()
'
' ���� ��ũ��
' ��ũ�� ������ ������ �� �ٸ��̸����� ���� �޽����� �ߴϱ� ���Ƿ� ���������� ������ ���ŷӴ�.
' xltm �������� �����ϹǷ� FileFormat�� XMLTemplate�� �����ִ�.

    ActiveWorkbook.SaveAs Filename:="C:\Users\franc\Documents\GitHub\shellScripts\vba_excel\macro_Prac.xltm", FileFormat:= _
    xlOpenXMLTemplateMacroEnabled, Password:="", WriteResPassword:="", _
    ReadOnlyRecommended:=False, CreateBackup:=False
    
End Sub
Sub ����������()
'
' ������������ �̵��ؼ� id���� ��ġ�ϴ°��� ���� ä���ش�.
' Ŭ������ ã������ getElementByClassName("")�� ����Ѵ�.
' getElementsByClassName�� ��� .Item���� ����� ���������� �۵��ϴ� ��쵵 �ִ�.

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
' �������� �ε��Ǳ� ������ �����ִ� �޼ҵ�
' readyState�� <> ��ȣ�ǹ̿� �ݺ��ؼ� �����ϴ� DoEvents�� �˾ƺ��� �Ѵ�.

    While Browser.Busy Or Browser.readyState <> 4
    DoEvents
    Wend
    
    Application.Wait DateAdd("s", t, Now)
    
End Sub
