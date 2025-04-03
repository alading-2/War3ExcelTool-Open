' VERSION 1.0 CLASS
' BEGIN
' MultiUse = -1  'True
' END
' Attribute VB_Name = "ThisWorkbook"
' Attribute VB_GlobalNameSpace = False
' Attribute VB_Creatable = False
' Attribute VB_PredeclaredId = True
' Attribute VB_Exposed = True

'*******************************************************************************
' 类: ThisWorkbook
' 描述: 处理工作簿级别的事件和数据处理
'       负责将Excel数据导出为魔兽争霸3地图所需的各种配置文件
'*******************************************************************************

Dim selfstr, selfall, thispath As String

'*******************************************************************************
' 过程: Workbook_Open
' 描述: 工作簿打开时执行的初始化操作
' 参数: 无
' 返回值: 无
'*******************************************************************************
Private Sub Workbook_Open()
  Dim Ws As Object
  Dim path, str As String

End Sub

'*******************************************************************************
' 过程: Workbook_AfterSave
' 描述: 工作簿保存后自动执行数据导出操作
'       处理各类游戏数据并生成对应的配置文件
' 参数:
'   Success - 指示保存操作是否成功
' 返回值: 无
'*******************************************************************************
Private Sub Workbook_AfterSave(Byval Success As Boolean)
  Dim sheet As Worksheet


  thispath = Replace(ThisWorkbook.path, "\MPQ", "")
  Call Init

  For Each sheet In ThisWorkbook.Worksheets
    If sheet.name = "unit" Then
      '单位
      RunUnitIni (sheet.name)
      RunUnitTs (sheet.name)
      RunUnitData (sheet.name)
    Elseif sheet.name = "item" Then
      '物品
      RunItemIni (sheet.name)
      RunItemTs (sheet.name)
      RunItemData (sheet.name)
    Elseif sheet.name = "config" Then
      '自用基础设置
      Call RunConfig
    Elseif sheet.name = "mallitem" Then
      '商城物品数据
      Call RunMallItem
    Elseif sheet.name = "Server" Then
      '存档数据
      Call RunServer
      Call RunServerData
    Elseif sheet.name = "buff" Then
      'buff数据
      Call RunBuff
    End If
  Next


    '写物编技能
    Call WirteBaseAbil
    '写物品技能
    Call WriteItemAbilIni
    '物品技能
    Call WriteItemAbilTS

    '写技能
    Call WriteAbilTS

    '写数据
    Call Exceldata

    Set Ws = CreateObject("adodb.stream")
    With Ws
      .Type = 2
      .Charset = "UTF-8"
      .Open
      .writetext ""
      .SaveToFile thispath + "\mpq\map\table\update", 2
      .Flush
      .Close
    End With

End Sub

'excel数据
Function Exceldata()
  Dim Ws As Object
  Dim str, s, s2, s3, s4, s5, str2, ss, path As String
  Dim cel, rng As Range
  Dim rmax, cmax As Integer
  Dim sheet As Worksheet

  'sheet
  'const excelsheets=["config","unit","ability","buff","item","mallitem","Server",]
  str = str + "const excelsheets=["
  For i = 1 To ThisWorkbook.Sheets.Count
    Set sheet = ThisWorkbook.Sheets(i)
    str = str + """" + sheet.name + ""","
  Next i
  str = str + "]" + vbCrLf

  '写数据
  str = str + "const exceldata={" + vbCrLf
  For i = 1 To ThisWorkbook.Sheets.Count
    Set sheet = ThisWorkbook.Sheets(i)
    '获取行数及列数
    Set cel = sheet.Cells(1, 1).End(xlToRight)
    cmax = cel.Column
    Set cel = sheet.Cells(1, 1).End(xlDown)
    rmax = cel.Row

    str = str + "  " + sheet.name + ":[" + vbCrLf
    For a = 1 To rmax
      str = str + "    ["
      For b = 1 To cmax
        Set cel = sheet.Cells(a, b)
        s = cel.Text
        '如果表格数据为空，则赋值""
        If s = "" Then
          s = """"""
          '如果表格数据不为空，则用""包裹
        Elseif Not Left(s, 1) = """" Then
          s = """" + s + """"
        End If
        str = str + s + ","
      Next b
      str = str + "]," + vbCrLf
    Next a
    str = str + "  ]," + vbCrLf

  Next i
  str = str + "}"

  Set Ws = CreateObject("adodb.stream")
  With Ws
    .Type = 2
    .Charset = "UTF-8"
    .Open
    .writetext str
    .SaveToFile thispath + "\src\Scripts\base\excel2ts\exceldata.ts", 2
    .Flush
    .Close
  End With

End Function

'物编
Function RunUnitIni(name As String)
  Dim Ws As Object
  Dim str, s, s2, s3, s4, s5, str2, ss, path As String
  Dim cel, rng As Range
  Dim rmax, cmax As Integer
  Dim sheet As Worksheet

  Set sheet = Sheets(name)

  '获取行数及列数
  Set cel = sheet.Cells(2, 1).End(xlToRight)
  rmax = cel.Column
  Set cel = sheet.Cells(2, 1).End(xlDown)
  cmax = cel.Row

  '自定义属性列表
  selfall = "const " + name + "self:string[]=["

  '特殊特效-单位模拟
  str = "[h000]" + vbCrLf
  str = str + "_parent=""hpea""" + vbCrLf

  str = str + "collision=0" + vbCrLf
  str = str + "weapsOn=0" + vbCrLf
  str = str + "regenType=""""" + vbCrLf

  '逐行编写数据
  For i = 4 To cmax
    '逐列编写数据
    For j = 1 To rmax
      '如果为第一列，根据行数赋予物编ID
      If j = 1 Then
        s = "[h" + N2T(i) + "]" + vbCrLf
        '默认数据
        s = s + "_parent=""hpea""" + vbCrLf
        s = s + "auto=""""" + vbCrLf
        s = s + "heroAbilList=""""" + vbCrLf
        s = s + "abilList=""""" + vbCrLf
        s = s + "upgrades=""""" + vbCrLf
        s = s + "Trains=""""" + vbCrLf
        s = s + "Researches=""""" + vbCrLf
        s = s + "Makeitems=""""" + vbCrLf
        s = s + "Builds=""""" + vbCrLf
        s = s + "DependencyOr=""""" + vbCrLf
        s = s + "regenHP=0" + vbCrLf
        s = s + "HP=10000" + vbCrLf
        s = s + "run=300" + vbCrLf
        s = s + "propWin=180" + vbCrLf  '转向角度
        s = s + "orientInterp=0" + vbCrLf
        s = s + "canFlee=0" + vbCrLf
        s = s + "turnRate=3" + vbCrLf  '转身速度
        s = s + "atkType1=""""" + vbCrLf
        s = s + "weapType1=""""" + vbCrLf
        s = s + "type=""""" + vbCrLf
        s = s + "regenType=""""" + vbCrLf
        s = s + "fused=0" + vbCrLf
        s = s + "selZ=50" + vbCrLf  '选择圈高度
        s = s + "modelScale=1" + vbCrLf  '模型缩放
      Else
        '获取标题
        s2 = sheet.Cells(3, j)
        '判断是否为攻击速度
        If s2 = "cool1" Then
          s = "cool1=" + CStr(1 / (sheet.Cells(i, j)/100)) + vbCrLf
        Elseif s2 = "file" Then
          s = "file=" + sheet.Cells(i, j) + vbCrLf

          '碰撞不填默认16
        Elseif s2 = "collision" Then
          If sheet.Cells(i, j) <> "" Then
            s = "collision=""" + CStr(sheet.Cells(i, j)) + """" + vbCrLf
          Else
            s = "collision=16" + vbCrLf
          End If

          '选择缩放不填默认1
        Elseif s2 = "scale" Then
          If sheet.Cells(i, j) <> "" Then
            s = "scale=" + sheet.Cells(i, j).Text + vbCrLf
          Else
            s = "scale=1" + vbCrLf
          End If
        Elseif s2 = "spd" Then
          s = "spd=" + sheet.Cells(i, j) + vbCrLf

          '主动攻击范围=0：无法攻击
        Elseif s2 = "acquire" Then
          If sheet.Cells(i, j) = 0 Then
            s = "acquire=0" + vbCrLf
            s = s + "weapsOn=0" + vbCrLf
          Else
            s = "acquire=" + CStr(sheet.Cells(i, j)) + vbCrLf
            s = s + "weapsOn=1" + vbCrLf
          End If
        Elseif s2 = "rangeN1" Then
          s = "rangeN1=" + CStr(sheet.Cells(i, j)) + vbCrLf

          '移动高度不填默认0
        Elseif s2 = "moveHeight" Then
          If sheet.Cells(i, j) <> "" Then
            s = "moveHeight=" + CStr(sheet.Cells(i, j)) + vbCrLf
          Else
            s = "moveHeight=0" + vbCrLf
          End If

          '模型缩放不填默认1
        Elseif s2 = "modelScale" Then
          If sheet.Cells(i, j) <> "" Then
            s = "modelScale=" + CStr(sheet.Cells(i, j)) + vbCrLf
          Else
            s = "modelScale=1" + vbCrLf
          End If
        Elseif s2 = "movetp" Then
          s = s + "movetp=" + sheet.Cells(i, j) + vbCrLf
        Elseif s2 = "unitSound" Then
          s = s + "unitSound=" + sheet.Cells(i, j) + vbCrLf
        End If
      End If
      str = str + s
      s = ""
    Next j

  Next i

'建造技能单位：瞭望塔
  For m = 1 To 4
    str = str + "[jzd" + CStr(m) + "]" + vbCrLf
    str = str + "_parent=""owtw""" + vbCrLf
    str = str + "abilList=""""" + vbCrLf
    str = str + "Requires=""""" + vbCrLf
    str = str + "upgrades=""""" + vbCrLf
    str = str + "preventPlace=""unbuildable,unwalkable""" + vbCrLf
    str = str + "buildingShadow=""""" + vbCrLf
    str = str + "uberSplat=""""" + vbCrLf
    str = str + "file=""model\\建造\\0.mdx""" + vbCrLf
    str = str + "pathTex=""PathTextures\\4x4Default.tga""" + vbCrLf
    str = str + "acquire=0" + vbCrLf
    str = str + "rangeN1=0" + vbCrLf
    str = str + "weapsOn=0" + vbCrLf
    str = str + "targType=""""" + vbCrLf
    str = str + "modelScale=1" + vbCrLf
  Next m
  '没有模型
  str = str + "[tmdw]" + vbCrLf
  str = str + "_parent=""owtw""" + vbCrLf
  str = str + "abilList=""""" + vbCrLf
  str = str + "Requires=""""" + vbCrLf
  str = str + "upgrades=""""" + vbCrLf
  str = str + "preventPlace=""unbuildable,unwalkable""" + vbCrLf
  str = str + "buildingShadow=""""" + vbCrLf
  str = str + "uberSplat=""""" + vbCrLf
  str = str + "file=""""" + vbCrLf
  str = str + "pathTex=""PathTextures\\4x4Default.tga""" + vbCrLf
  str = str + "acquire=0" + vbCrLf
  str = str + "rangeN1=0" + vbCrLf
  str = str + "weapsOn=0" + vbCrLf
  str = str + "targType=""""" + vbCrLf

  Set Ws = CreateObject("adodb.stream")
  With Ws
    .Type = 2
    .Charset = "UTF-8"
    .Open

    '写入文件
    .writetext str
    .SaveToFile thispath + "\MPQ\map\table\unit.ini", 2

    .Flush
    .Close
  End With
  Set Ws = Nothing
End Function

'编写TS文件，主要用于名称与ID的转换unitid.ts
Function RunUnitTs(name As String)
  Dim Ws As Object
  Dim str, s, s2 As String
  Dim cel, rng As Range
  Dim rmax, cmax, id As Integer
  Dim sheet As Worksheet

  Set sheet = Sheets(name)

  '获取行数及列数
  Set cel = sheet.Cells(2, 1).End(xlToRight)
  rmax = cel.Column
  Set cel = sheet.Cells(2, 1).End(xlDown)
  cmax = cel.Row

  '将名称与ID写入数据中
  Set Ws = CreateObject("adodb.stream")
  With Ws
    .Type = 2
    .Charset = "UTF-8"
    .Open

    str = "const unitid=KVTable()" + vbCrLf
    For i = 4 To cmax
      s = "h" + N2T(i)
      s2 = sheet.Cells(i, 1)

      str = str + "unitid[""" + s + """]=" + s2 + vbCrLf
      'str = str + "  " + s2 + ":'" + s + "',"
      'str = str + "'" + s + "':" + s2 + "," + vbCrLf

    Next i

    .writetext str
    .SaveToFile thispath + "\src\Scripts\base\objectdata\" + name + "id.ts", 2
    .Flush
    .Close
  End With
End Function

'编写TS文件，主要用于名称与ID的转换unitdata.ts
Function RunUnitData(name As String)
  Dim Ws As Object
  Dim str, s, s2, s3, s4, s5, str2, ss, path As String
  Dim cel, rng As Range
  Dim rmax, cmax As Integer
  Dim sheet As Worksheet

  Set sheet = Sheets(name)

  '获取行数及列数
  Set cel = sheet.Cells(2, 1).End(xlToRight)
  rmax = cel.Column
  Set cel = sheet.Cells(2, 1).End(xlDown)
  cmax = cel.Row

  Set Ws = CreateObject("adodb.stream")
  With Ws
    .Type = 2
    .Charset = "UTF-8"
    .Open

    'const unitself=["名字","类别","弹道模型","弹道大小","弹道速度","collision","RGBA","modelScale","file","movetp","moveHeight","血条高度","unitSound","scale","spd","acquire","rangeN1","cool1","攻击力","等级","基础生命值",]
    str = "const unitself=["
    For i = 1 To rmax
      str = str + """" + sheet.Cells(3, i) + ""","
    Next i
    str = str + "]" + vbCrLf

    '接口
    str = str + "interface unitdatatype{" + vbCrLf
    str = str + "  [key:string]:{" + vbCrLf
    For i = 1 To rmax
      str = str + "    " + sheet.Cells(3, i) + ":" + sheet.Cells(1, i) + "," + vbCrLf
    Next i
    str = str + "  }" + vbCrLf
    str = str + "}" + vbCrLf

    '逐行编写数据
    str = str + "const unitdata:unitdatatype={" + vbCrLf
    For i = 4 To cmax
      '逐列编写数据
      str = str + "  " + sheet.Cells(i, 1) + ":{" + vbCrLf
      For j = 1 To rmax
        s2 = sheet.Cells(3, j)
        s3 = "0"
        If sheet.Cells(i, j) <> "" Then
          s3 = sheet.Cells(i, j).Text
        End If
        str = str + "    " + sheet.Cells(3, j) + ":" + s3 + "," + vbCrLf
      Next j
      str = str + "  }," + vbCrLf
    Next i
    str = str + "}" + vbCrLf

    '写入文件
    .writetext str
    .SaveToFile thispath + "\src\Scripts\base\objectdata\" + name + "data.ts", 2

    .Flush
    .Close
  End With
  Set Ws = Nothing
End Function

'物编item.ini
Function RunItemIni(name As String)
  Dim Ws As Object
  Dim str, s, s2, s3, s4, s5, str2, ss, path As String
  Dim cel, rng As Range
  Dim rmax, cmax As Integer
  Dim sheet As Worksheet

  Set sheet = Sheets(name)

  '获取行数及列数
  Set cel = sheet.Cells(2, 1).End(xlToRight)
  rmax = cel.Column
  Set cel = sheet.Cells(2, 1).End(xlDown)
  cmax = cel.Row

  Set Ws = CreateObject("adodb.stream")
  With Ws
    .Type = 2
    .Charset = "UTF-8"
    .Open

    '逐行编写数据
    For i = 4 To cmax
      '逐列编写数据
      For j = 1 To rmax
        '如果为第一列，根据列数赋予物编ID
        If j = 1 Then
          '如果为单位
          s = "[I" + N2T(i) + "]" + vbCrLf
          s = s + "_parent=""rat6""" + vbCrLf
          s = s + "Name=""""" + vbCrLf

          s = s + "scale=0.7" + vbCrLf
          '物品技能写入，“无”则不加技能
          If sheet.Cells(i, 2) <> """无""" Then
            If sheet.Cells(i, 2) = """建造""" Then
              s = s + "abilList=""JZT1""" + vbCrLf
              s = s + "uses=1" + vbCrLf
              s = s + "perishable=0" + vbCrLf
              s = s + "usable=1" + vbCrLf
              s = s + "powerup=0" + vbCrLf
            Else
              s = s + "abilList=" + WriteItemAbil(i) + vbCrLf
            End If
          End If

        Else
          '获取标题
          s2 = sheet.Cells(3, j)

          '是否可丢弃不填默认1,即true
          If s2 = "droppable" Then
            If sheet.Cells(i, j) <> "" Then
              s = "droppable=" + CStr(sheet.Cells(i, j)) + vbCrLf
            Else
              s = "droppable=1" + vbCrLf
            End If

            '金币消耗不填默认0
          Elseif s2 = "goldcost" Then
            If sheet.Cells(i, j) <> "" Then
              s = "goldcost=" + CStr(sheet.Cells(i, j)) + vbCrLf
            Else
              s = "goldcost=0" + vbCrLf
            End If

            '模型不填默认物品.mdx
          Elseif s2 = "model" Then
            If sheet.Cells(i, j) <> "" Then
              s = "file=" + sheet.Cells(i, j) + vbCrLf
            Else
              s = "file=""物品.mdx""" + vbCrLf
            End If
          End If
        End If
        str = str + s

        s = ""
      Next j
    Next i

    '写入文件
    .writetext str
    .SaveToFile thispath + "\MPQ\map\table\" + name + ".ini", 2

    .Flush
    .Close
  End With
  Set Ws = Nothing
End Function

'编写TS文件，主要用于名称与ID的转换
Function RunItemTs(name As String)
  Dim Ws As Object
  Dim str, s, s2 As String
  Dim cel, rng As Range
  Dim rmax, cmax, id As Integer
  Dim sheet As Worksheet

  Set sheet = Sheets(name)

  '获取行数及列数
  Set cel = sheet.Cells(2, 1).End(xlToRight)
  rmax = cel.Column
  Set cel = sheet.Cells(2, 1).End(xlDown)
  cmax = cel.Row

  '将名称与ID写入数据中
  Set Ws = CreateObject("adodb.stream")
  With Ws
    .Type = 2
    .Charset = "UTF-8"
    .Open

    str = "const itemid=KVTable()" + vbCrLf
    For i = 4 To cmax
      s = "I" + N2T(i)
      s2 = sheet.Cells(i, 1)

      str = str + "itemid[""" + s + """]=" + s2 + vbCrLf
      'str = str + name + "id[" + s2 + "]='" + s + "'" + vbCrLf
      'str = str + name + "id['" + s + "']=" + s2 + "" + vbCrLf
    Next i

    .writetext str
    .SaveToFile thispath + "\src\Scripts\base\objectdata\" + name + "id.ts", 2
    .Flush
    .Close
  End With
End Function

'编写TS文件，itemdata.ts
Function RunItemData(name As String)
  Dim Ws As Object
  Dim str, s, s2, s3, s4, s5, str2, ss, path As String
  Dim cel, rng As Range
  Dim rmax, cmax As Integer
  Dim sheet As Worksheet

  Set sheet = Sheets(name)

  '获取行数及列数
  Set cel = sheet.Cells(2, 1).End(xlToRight)
  rmax = cel.Column - 1
  Set cel = sheet.Cells(2, 1).End(xlDown)
  cmax = cel.Row

  Set Ws = CreateObject("adodb.stream")
  With Ws
    .Type = 2
    .Charset = "UTF-8"
    .Open

    'itemself
    str = str + "const itemself=["
    For i = 1 To rmax
      str = str + """" + sheet.Cells(2, i) + ""","
    Next i
    str = str + "]" + vbCrLf

    '接口
    str = str + "interface itemdatatype{" + vbCrLf
    str = str + "  [key:string]:{" + vbCrLf
    For i = 1 To rmax
      str = str + "    " + sheet.Cells(3, i) + ":" + sheet.Cells(1, i) + "," + vbCrLf
    Next i
    str = str + "  }" + vbCrLf
    str = str + "}" + vbCrLf

    '逐行编写数据
    str = str + "const itemdata:itemdatatype={" + vbCrLf
    For i = 4 To cmax
      '逐列编写数据
      str = str + "  " + sheet.Cells(i, 1) + ":{" + vbCrLf
      For j = 1 To rmax
        s2 = sheet.Cells(3, j)
        s3 = "0"
        If sheet.Cells(i, j) <> "" Then
          s3 = sheet.Cells(i, j).Text
        End If
        str = str + "    " + sheet.Cells(3, j) + ":" + s3 + "," + vbCrLf
      Next j
      str = str + "  }," + vbCrLf
    Next i
    str = str + "}" + vbCrLf

    '写入文件
    .writetext str
    .SaveToFile thispath + "\src\Scripts\base\objectdata\" + name + "data.ts", 2

    .Flush
    .Close
  End With
  Set Ws = Nothing
End Function

' '编写命令按钮文件
' Function RunCommand()
'   Dim Ws As Object
'   Dim str, s As String
'   Dim cel, rng As Range
'   Dim rmax, cmax As Integer
'   Dim sheet As Worksheet

'   Set sheet = Sheets("command")
'   Set Ws = CreateObject("adodb.stream")
'   With Ws
'     .Type = 2
'     .Charset = "UTF-8"
'     .Open

'     For i = 1 To 55
'       Set cel = sheet.Cells(i, 10)
'       str = str + cel + vbCrLf
'     Next i

'     .writetext str
'     .SaveToFile ThisWorkbook.path + "\mpq\map\Units\CommandFunc.txt", 2
'     .Flush
'     .Close
'   End With
'   Set Ws = Nothing
' End Function

'写入商城物品数据文件mallitem.ts
Function RunMallItem()
  Dim Ws As Object
  Dim str, s, s2, s3, s4 As String
  Dim cel, rng As Range
  Dim rmax, cmax, id As Integer
  Dim sheet As Worksheet

  Set sheet = Sheets("mallitem")

  '获取行数及列数
  Set cel = sheet.Cells(2, 1).End(xlToRight)
  rmax = cel.Column - 1
  Set cel = sheet.Cells(2, 1).End(xlDown)
  cmax = cel.Row

  Set Ws = CreateObject("adodb.stream")
  With Ws
    .Type = 2
    .Charset = "UTF-8"
    .Open

    'mallitemself
    str = str + "const mallitemself=["
    For i = 1 To rmax
      str = str + """" + sheet.Cells(2, i) + ""","
    Next i
    str = str + "]" + vbCrLf

    '接口
    str = str + "interface mallitemdatatype{" + vbCrLf
    str = str + "  [key:string]:{" + vbCrLf
    For i = 1 To rmax
      str = str + "    " + sheet.Cells(3, i) + ":" + sheet.Cells(1, i) + "," + vbCrLf
    Next i
    str = str + "  }" + vbCrLf
    str = str + "}" + vbCrLf

    '逐行编写数据
    str = str + "const mallitem:mallitemdatatype={" + vbCrLf
    For i = 4 To cmax
      '逐列编写数据
      str = str + "  " + sheet.Cells(i, 1) + ":{" + vbCrLf
      For j = 1 To rmax
        s2 = sheet.Cells(3, j)
        s3 = "0"
        If sheet.Cells(i, j) <> "" Then
          s3 = sheet.Cells(i, j).Text
        End If
        str = str + "    " + sheet.Cells(3, j) + ":" + s3 + "," + vbCrLf
      Next j
      str = str + "  }," + vbCrLf
    Next i
    str = str + "}" + vbCrLf

    .writetext str
    .SaveToFile thispath + "\src\Scripts\base\objectdata\mallitem.ts", 2
    .Flush
    .Close
  End With
  Set Ws = Nothing
End Function

' '写入魔兽基础设置文件misc.ini
' Function RunMisc()
'   Dim Ws As Object
'   Dim str, s As String
'   Dim cel, rng As Range
'   Dim rmax, cmax As Integer
'   Dim sheet As Worksheet

'   Set sheet = Sheets("misc")
'   Set Ws = CreateObject("adodb.stream")
'   Set cel = sheet.Cells(1, 2).End(xlDown)
'   rmax = cel.Row
'   str = "[Misc]" + vbCrLf + "_parent = ""Misc""" + vbCrLf
'   With Ws
'     .Type = 2
'     .Charset = "UTF-8"
'     .Open

'     For i = 1 To rmax
'       If sheet.Cells(i, 3).Text <> "" Then
'         str = str + sheet.Cells(i, 2) + "=" + sheet.Cells(i, 3).Text + vbCrLf
'       End If
'     Next i

'     .writetext str
'     .SaveToFile ThisWorkbook.path + "\mpq\w3x\table\misc.ini", 2
'     .Flush
'     .Close
'   End With
'   Set Ws = Nothing
' End Function

'写入自定义设置文件config.ts
Function RunConfig()
  Dim Ws, Ws2 As Object
  Dim str, s As String
  Dim cel, rng As Range
  Dim rmax, cmax As Integer
  Dim sheet As Worksheet

  Set sheet = Sheets("config")
  Set Ws = CreateObject("adodb.stream")
  Set cel = sheet.Cells(1, 1).End(xlDown)
  rmax = cel.Row
  str = "const config={" + vbCrLf
  With Ws
    .Type = 2
    .Charset = "UTF-8"
    .Open

    For i = 2 To rmax
      If sheet.Cells(i, 2).Text <> "" Then
        str = str + "'" + sheet.Cells(i, 1) + "':" + sheet.Cells(i, 2).Text + "," + vbCrLf
      End If
    Next i

    str = str + "}"
    .writetext str
    .SaveToFile thispath + "\src\Scripts\base\normal\config.ts", 2
    .Flush
    .Close
  End With
  Set Ws = Nothing
End Function

'编写TS文件，通过war3map.j文件编写globals.ts
Function RunGlobal()
  Dim Ws, Ws2 As Object
  Dim str, s1, s2, s3, s4 As String
  Dim cel, rng As Range
  Dim rmax, cmax, a, b, c As Integer
  Dim sheet As Worksheet

  ' Set sheet = Sheets("config")
  ' Set cel = sheet.Cells(1, 1).End(xlDown)
  ' rmax = cel.Row
  Set Ws = CreateObject("adodb.stream")
  Set Ws2 = CreateObject("adodb.stream")

  s4 = "import { Rect } from '../object/war3/Rect'" + vbCrLf
  s4 = s4 + "export class Global{" + vbCrLf
  With Ws
    .Type = 2
    .Charset = "UTF-8"
    .Open
    .LoadFromFile (ThisWorkbook.path + "\test\map\war3map.j")

    str = Ws.Readtext()
    Do While s1 <> "endglobals"
      a = InStr(str, vbCrLf)
      s1 = Left(str, a - 1)
      s2 = Left(s1, 4)
      '区域全局变量
      If s2 = "rect" Then
        s3 = Mid(s1, 13, Len(s1) - 18)
        s4 = s4 + "static " + s3 + "=Rect.byRect(globals.gg_rct_" + s3 + ")" + vbCrLf
      End If
      str = Right(str, Len(str) - a - 1)
    Loop
    s4 = s4 + "}"
    .Flush
    .Close
  End With
  Set Ws = Nothing

  With Ws2
    .Type = 2
    .Charset = "UTF-8"
    .Open

    .writetext s4
    .SaveToFile thispath + "\src\Scripts\base\normal\globals.ts", 2
    .Flush
    .Close
  End With
  Set Ws2 = Nothing
End Function

'写入存档创建文件Server.ts
Function RunServer()
  Dim Ws, Ws2 As Object
  Dim str, s As String
  Dim cel, rng As Range
  Dim rmax, cmax As Integer
  Dim sheet As Worksheet

  Set sheet = Sheets("Server")
  Set Ws = CreateObject("adodb.stream")
  Set cel = sheet.Cells(1, 1).End(xlDown)
  rmax = cel.Row

  str = "import { ChildServerData, ServerData } from ""../object/玩家/ServerData""" + vbCrLf
  str = str + "export class Server{" + vbCrLf
  str = str + "    static Init(){" + vbCrLf
  With Ws
    .Type = 2
    .Charset = "UTF-8"
    .Open

    For i = 3 To rmax
      '写父档
      str = str + "        new ServerData('" + sheet.Cells(i, 1) + "'," + CStr(sheet.Cells(i, 2)) + "," + CStr(i - 1) + ")" + vbCrLf
      Set cel = sheet.Cells(i, 1).End(xlToRight)
      cmax = cel.Column
      For j = 3 To cmax
        '写子档
        str = str + "        new ChildServerData('" + sheet.Cells(i, j) + "'," + CStr(i - 1) + "," + CStr(j - 2) + ")" + vbCrLf
      Next j
    Next i

    str = str + "}}"
    .writetext str
    .SaveToFile thispath + "\src\Scripts\base\normal\Server.ts", 2
    .Flush
    .Close
  End With
  Set Ws = Nothing
End Function

'写入存档数据文件
Function RunServerData()
  Dim Ws, Ws2 As Object
  Dim str, s As String
  Dim cel, rng As Range
  Dim rmax, cmax As Integer
  Dim sheet As Worksheet

  Set sheet = Sheets("Server")
  Set Ws = CreateObject("adodb.stream")
  Set cel = sheet.Cells(1, 1).End(xlDown)
  rmax = cel.Row

  With Ws
    .Type = 2
    .Charset = "UTF-8"
    .Open

    str = str + "import { Player } from '../object/玩家/Player';" + vbCrLf
    '写父档
    str = str + "export class serverdata{" + vbCrLf
    str = str + "  player:Player" + vbCrLf
    For i = 3 To rmax
      str = str + "  " + sheet.Cells(i, 1) + ":" + sheet.Cells(i, 1) + vbCrLf
    Next i
    str = str + "  constructor(player:Player){" + vbCrLf
    str = str + "     this.player=player" + vbCrLf
    For i = 3 To rmax
      str = str + "     this." + sheet.Cells(i, 1) + "=new " + sheet.Cells(i, 1) + "(player)" + vbCrLf
    Next i
    str = str + "  }" + vbCrLf
    str = str + "}" + vbCrLf

    '写子档
    For i = 3 To rmax
      str = str + "class " + sheet.Cells(i, 1) + "{" + vbCrLf
      str = str + "  player:Player" + vbCrLf
      str = str + "  constructor(player:Player){" + vbCrLf
      str = str + "    this.player=player" + vbCrLf
      str = str + "  }" + vbCrLf

      Set cel = sheet.Cells(i, 1).End(xlToRight)
      cmax = cel.Column
      For j = 3 To cmax
        s = sheet.Cells(i, j)
        str = str + "  set " + s + "(n:number){Player.serverdata[this.player.id]['" + s + "']=n}" + vbCrLf
        str = str + "  get " + s + "():number{return Player.serverdata[this.player.id]['" + s + "']}" + vbCrLf + vbCrLf
      Next j

      str = str + "}" + vbCrLf
    Next i

    .writetext str
    .SaveToFile thispath + "\src\Scripts\base\objectdata\serverdata.ts", 2
    .Flush
    .Close
  End With
  Set Ws = Nothing
End Function

'写入buff文件
Function RunBuff()
  Dim Ws, Ws2 As Object
  Dim str, s As String
  Dim cel, rng As Range
  Dim rmax, cmax, i As Integer
  Dim sheet As Worksheet

  Set sheet = Sheets("buff")
  Set Ws = CreateObject("adodb.stream")
  Set cel = sheet.Cells(1, 1).End(xlDown)
  rmax = cel.Row
  Set cel = sheet.Cells(2, 1).End(xlToRight)
  cmax = cel.Column - 1

  '接口
  str = str + "interface buffdatatype{" + vbCrLf
  str = str + "  [key:string]:{" + vbCrLf
  For j = 1 To cmax
    str = str + "    " + sheet.Cells(3, j) + ":" + sheet.Cells(1, j) + "," + vbCrLf
  Next j
  str = str + "  }" + vbCrLf
  str = str + "}" + vbCrLf

  With Ws
    .Type = 2
    .Charset = "UTF-8"
    .Open

    str = str + "const buffdata:buffdatatype={" + vbCrLf
    For i = 4 To rmax
      str = str + "  " + sheet.Cells(i, 1) + ":{" + vbCrLf
      For j = 1 To cmax
        str = str + "    " + sheet.Cells(3, j) + ":" + sheet.Cells(i, j).Text + "," + vbCrLf
      Next j
      str = str + "  }," + vbCrLf
    Next i
    str = str + "}" + vbCrLf

    .writetext str
    .SaveToFile thispath + "\src\Scripts\base\objectdata\buffdata.ts", 2
    .Flush
    .Close
  End With
  Set Ws = Nothing
End Function


Function N2T(n) As String
  If n < 10 Then
    N2T = "00" + CStr(n)
  Elseif n < 100 Then
    N2T = "0" + CStr(n)
  Else
    N2T = CStr(n)
  End If
End Function


