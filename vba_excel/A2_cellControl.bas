Attribute VB_Name = "A2_cellControl"
''' ������
Sub �⺻��Ʈ()
' �⺻ ��Ʈ�� �˻� �� ī���ؼ� ������ ����
    Range("A2").Copy

End Sub
Sub saveFile()
' �����ϱ� ctrl+s �����ִ� ���
    ActiveWorkbook.Save

End Sub

''' ���θ��
Sub dblClick()
' ���� HTML ������ ���� �� �� ����Ŭ���� �����Ѵ�.

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
