' Attribute VB_Name = "model4"
'*******************************************************************************
' ģ��: model4
' ����: ��������GIFģ����ص������ļ�
'*******************************************************************************

'*******************************************************************************
' ����: CreateGifModel
' ����: ��Excel��"GIFģ������"��ȡ���ݲ�����ħ��ģ���ļ�
'       ����һ������ģ�����ã��������кͶ�����Ϣ
' ����: ��
' ����ֵ: ��
'*******************************************************************************
Function CreateGifModel()
  Dim Ws, Ws2 As Object
  Dim str, s As String
  Dim cel, rng As Range
  Dim sheet As Worksheet

  Set sheet = Sheets("GIFģ������")
  Set Ws = CreateObject("adodb.stream")

  str = "Version {FormatVersion 800,}" + vbCrLf
  str = "Model """" {NumGeosets 1,NumBones 1,BlendTime 150,BoundsRadius 150,}" + vbCrLf
  str = "Sequences 1 {" + vbCrLf
  str = "Anim ""Stand"" { Interval { 0, " + sheet.Cells(2, 2) * sheet.Cells(2, 3) + " },} }" + vbCrLf
  str = "" + vbCrLf
  str = "" + vbCrLf
  str = "" + vbCrLf
  str = "" + vbCrLf
  With Ws
    .Type = 2
    .Charset = "UTF-8"
    .Open



    .writetext str
    .SaveToFile ThisWorkbook.path + "\GifToModel\" + sheet.Cells(2, 1), 2
    .Flush
    .Close
  End With
  Set Ws = Nothing
End Function
