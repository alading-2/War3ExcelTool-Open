' Attribute VB_Name = "model4"
'*******************************************************************************
' 模块: model4
' 描述: 用于生成GIF模型相关的配置文件
'*******************************************************************************

'*******************************************************************************
' 函数: CreateGifModel
' 描述: 从Excel表"GIF模型生成"读取数据并生成魔兽模型文件
'       创建一个基础模型配置，包含序列和动画信息
' 参数: 无
' 返回值: 无
'*******************************************************************************
Function CreateGifModel()
  Dim Ws, Ws2 As Object
  Dim str, s As String
  Dim cel, rng As Range
  Dim sheet As Worksheet

  Set sheet = Sheets("GIF模型生成")
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
