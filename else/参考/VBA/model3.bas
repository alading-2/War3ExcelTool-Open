' Attribute VB_Name = "model3"
'*******************************************************************************
' 模块: model3
' 描述: 处理技能数据并生成TypeScript接口和数据文件
'*******************************************************************************

'*******************************************************************************
' 函数: WriteAbilTS
' 描述: 从Excel表生成技能数据的TypeScript文件
'       读取ability表格，生成TypeScript接口和技能数据对象
' 参数: 无
' 返回值: 无
'*******************************************************************************
Function WriteAbilTS()
  Dim sheet As Worksheet
  Dim str As String
  Dim Ws As Object
  Dim rmax, cmax As Integer

  Set sheet = Sheets("ability")
  '获取行数及列数
  Set cel = sheet.Cells(2, 1).End(xlToRight)
  rmax = cel.Column - 1 '-1是不要code那一列
  Set cel = sheet.Cells(2, 1).End(xlDown)
  cmax = cel.Row

  '接口
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
        '如果表格数据为空，number类型则赋值0，其他类型则赋值''
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

    '写入文件
    .writetext str
    .SaveToFile Replace(ThisWorkbook.path, "\MPQ", "") + "\src\Scripts\base\objectdata\abilitydata.ts", 2
    .Flush
    .Close
  End With
  Set Ws = Nothing
End Function

'*******************************************************************************
' 函数: N2T
' 描述: 将数字转换为固定格式的字符串（用于ID生成）
' 参数:
'   n - 要转换的数字
' 返回值: 格式化后的字符串（三位数，不足前面补0）
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
