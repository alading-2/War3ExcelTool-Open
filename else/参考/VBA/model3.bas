' Attribute VB_Name = "model3"
'*******************************************************************************
' ģ��: model3
' ����: ���������ݲ�����TypeScript�ӿں������ļ�
'*******************************************************************************

'*******************************************************************************
' ����: WriteAbilTS
' ����: ��Excel�����ɼ������ݵ�TypeScript�ļ�
'       ��ȡability�������TypeScript�ӿںͼ������ݶ���
' ����: ��
' ����ֵ: ��
'*******************************************************************************
Function WriteAbilTS()
  Dim sheet As Worksheet
  Dim str As String
  Dim Ws As Object
  Dim rmax, cmax As Integer

  Set sheet = Sheets("ability")
  '��ȡ����������
  Set cel = sheet.Cells(2, 1).End(xlToRight)
  rmax = cel.Column - 1 '-1�ǲ�Ҫcode��һ��
  Set cel = sheet.Cells(2, 1).End(xlDown)
  cmax = cel.Row

  '�ӿ�
  str = str + "interface abilitydatatype{" + vbCrLf
  str = str + "  [key:string]:{" + vbCrLf
  For i = 1 To rmax
    str = str + "    " + sheet.Cells(3, i) + "?:" + sheet.Cells(1, i) + "," + vbCrLf
  Next i
  str = str + "  }" + vbCrLf
  str = str + "}" + vbCrLf


  Set Ws = CreateObject("adodb.stream")
  With Ws
    .Type = 2
    .Charset = "UTF-8"
    .Open

    str = str + "const abilitydata:abilitydatatype={" + vbCrLf
    For i = 4 To cmax
      str = str + "  " + sheet.Cells(i, 1) + ":{" + vbCrLf
      For j = 1 To rmax
        s3 = sheet.Cells(i, j).Text
        '����������Ϊ�գ�number������ֵ0������������ֵ''
        If s3 = "" Then
          If sheet.Cells(1, j) = "number" Then
            s3 = "0"
          Else
            s3 = "''"
          End If
        End If

        str = str + "    " + sheet.Cells(3, j) + ":" + s3 + "," + vbCrLf


      Next j
      str = str + "  }," + vbCrLf
    Next i
    str = str + "}" + vbCrLf

    'д���ļ�
    .writetext str
    .SaveToFile Replace(ThisWorkbook.path, "\MPQ", "") + "\src\Scripts\base\objectdata\abilitydata.ts", 2
    .Flush
    .Close
  End With
  Set Ws = Nothing
End Function

'*******************************************************************************
' ����: N2T
' ����: ������ת��Ϊ�̶���ʽ���ַ���������ID���ɣ�
' ����:
'   n - Ҫת��������
' ����ֵ: ��ʽ������ַ�������λ��������ǰ�油0��
'*******************************************************************************
Function N2T(n) As String
  If n < 10 Then
    N2T = "00" + CStr(n)
  Elseif n < 100 Then
    N2T = "0" + CStr(n)
  Else
    N2T = CStr(n)
  End If
End Function
