' Attribute VB_Name = "model2"
'*******************************************************************************
' 模块: model2
' 描述: 技能编辑和物品技能生成模块
'       负责生成魔兽争霸3地图中的物品和技能相关数据
'*******************************************************************************

Dim thispath As String '路径

Dim itemnums As Integer '物品技能数量
Dim ors As Integer  '命令字符串

Dim abilini As String '物品技能ini
Dim abilstr As String '144个技能数据拼接成的字符串
Dim itemabil As String '物品技能id
Dim orders(197) As String '命令字符串数组，记录所有基础命令id


'用于技能编辑
'物品自动生成技能，4*12*3=144个技能
'生成144个基础技能+4个建造技能+1个移动技能+6个物品栏技能

'书写144个基础技能,12个位置，每个位置 X/0被动或无目标 Y/1单位目标 Z/3单位或点 4种 共48*4种

'*******************************************************************************
' 函数: WirteBaseAbil
' 描述: 生成基础技能数据
'       为4个玩家生成144个基础技能，包括无目标/被动、单位目标和点目标类型
'       同时生成建造技能和移动技能
' 参数: 无
' 返回值: 无
'*******************************************************************************
Function WirteBaseAbil()
  '循环4个玩家
  For p = 0 To 3
    n = 1
    '12个技能
    '竖排3
    For i = 0 To 2
      '横排4
      For j = 0 To 3
        '4种技能类型
        For a = 0 To 2
          If a = 0 Then
            '无目标或被动
            abilstr = abilstr + "[X" + CStr(p) + CStr(j) + CStr(i) + "]" + vbCrLf
            abilstr = abilstr + "DataB=" + CStr(0) + vbCrLf
            abilstr = abilstr + "DataC=1" + vbCrLf
          Else
            If a = 1 Then
              '单位目标
              abilstr = abilstr + "[Y" + CStr(p) + CStr(j) + CStr(i) + "]" + vbCrLf
              abilstr = abilstr + "DataB=" + CStr(1) + vbCrLf
              abilstr = abilstr + "DataC=1" + vbCrLf
              ' 目标允许
              abilstr = abilstr + "targs=""notself,ground,enemies,air,item,friend,self""" + vbCrLf
            Elseif a = 2 Then
              '点目标
              abilstr = abilstr + "[Z" + CStr(p) + CStr(j) + CStr(i) + "]" + vbCrLf
              abilstr = abilstr + "DataB=" + CStr(3) + vbCrLf
              abilstr = abilstr + "DataC=1" + vbCrLf
              ' 目标允许
              abilstr = abilstr + "targs=""ground,enemies,friend""" + vbCrLf
            End If
          End If
          ' 命令串
          abilstr = abilstr + "Order=" + orders(n) + vbCrLf
          ' 基础命令id
          abilstr = abilstr + "DataF=" + orders(n) + vbCrLf
          ' 冷却时间
          abilstr = abilstr + "Cool=0" + vbCrLf
          ' 魔法消耗
          abilstr = abilstr + "Cost=0" + vbCrLf
          ' 施法时间
          abilstr = abilstr + "Cast=0.01" + vbCrLf
          ' 数据E，使其他技能无效，=0：false
          abilstr = abilstr + "DataE=0" + vbCrLf
          ' 数据A，施法持续时间
          abilstr = abilstr + "DataA=0" + vbCrLf
          ' 数据D，动作持续时间
          abilstr = abilstr + "DataD=0.1" + vbCrLf
          ' 父级
          abilstr = abilstr + "_parent=""ANcl""" + vbCrLf
          ' 按钮位置x:0-3
          abilstr = abilstr + "Buttonpos_1=" + CStr(j) + vbCrLf
          ' 按钮位置y:0-2
          abilstr = abilstr + "Buttonpos_2=" + CStr(i) + vbCrLf
          ' 名称
          abilstr = abilstr + "Name=""" + CStr(p) + CStr(j) + CStr(i) + """" + vbCrLf
          ' 通用属性
          abilstr = abilstr + writeStr() + vbCrLf

          nums = nums + 1
        Next a
        n = n + 1
      Next j
    Next i
  Next p

  '建造技能
  For m = 1 To 4
    abilstr = abilstr + "[JZT" + CStr(m) + "]" + vbCrLf
    '父：建造技能
    abilstr = abilstr + "_parent=""AIbt""" + vbCrLf
    '按钮位置x:0-3
    abilstr = abilstr + "Buttonpos_1=" + CStr(m - 1) + vbCrLf
    '按钮位置y:2，默认最下面
    abilstr = abilstr + "Buttonpos_2=2" + vbCrLf
    '名称
    abilstr = abilstr + "Name=""建造""" + vbCrLf
    abilstr = abilstr + "Dur=0" + vbCrLf
    '物品技能
    abilstr = abilstr + "item=1" + vbCrLf
    ' 施法范围
    abilstr = abilstr + "Rng=4000" + vbCrLf
    '创建单位：设置好的指定瞭望塔
    abilstr = abilstr + "UnitID=""jzd" + CStr(m) + """" + vbCrLf + vbCrLf
  Next m

  '移动技能
  abilstr = abilstr + "[TJYD]" + vbCrLf
  '父：建造技能
  abilstr = abilstr + "_parent=""AIbt""" + vbCrLf
  '按钮位置x:0-3
  abilstr = abilstr + "Buttonpos_1=0" + vbCrLf
  '按钮位置y:0-2
  abilstr = abilstr + "Buttonpos_2=1" + vbCrLf
  '名称
  abilstr = abilstr + "Name=""移动""" + vbCrLf
  abilstr = abilstr + "Dur=0" + vbCrLf
  abilstr = abilstr + "item=0" + vbCrLf
  abilstr = abilstr + "Rng=6000" + vbCrLf
  abilstr = abilstr + "UnitID=""jzd1""" + vbCrLf + vbCrLf

  '物品栏技能
  For m = 1 To 6
    abilstr = abilstr + "[WPL" + CStr(m) + "]" + vbCrLf

    abilstr = abilstr + "_parent=""AInv""" + vbCrLf
    '名称
    abilstr = abilstr + "Name=""物品栏""" + vbCrLf
    abilstr = abilstr + "DataC=1" + vbCrLf
    abilstr = abilstr + "DataA=" + CStr(m) + vbCrLf
    abilstr = abilstr + "DataB=1" + vbCrLf
  Next m
End Function

'*******************************************************************************
' 函数: writeStr
' 描述: 生成技能的通用属性字符串
' 参数: 无
' 返回值: 包含技能通用属性的字符串
'*******************************************************************************
Function writeStr() As String
  Dim s As String
  s = ""
  ' 技能图标
  s = s + "Art=""ui\\tmbj.blp""" + vbCrLf
  ' 英雄技能
  s = s + "hero=0" + vbCrLf
  ' 物品技能
  s = s + "item=0" + vbCrLf
  ' 施法者图标
  s = s + "CasterArt=""""" + vbCrLf
  ' 效果图标
  s = s + "EffectArt=""""" + vbCrLf
  ' 目标图标
  s = s + "TargetArt=""""" + vbCrLf
  ' 技能等级
  s = s + "levels=1" + vbCrLf
  ' 施法范围
  s = s + "Rng=500" + vbCrLf
  ' 施法区域
  s = s + "area=100" + vbCrLf
  ' 动画名称
  s = s + "Animnames=""""" + vbCrLf
  ' 快捷键
  s = s + "Hotkey=""""" + vbCrLf
  writeStr = s
End Function

'*******************************************************************************
' 函数: Init
' 描述: 初始化模块，读取命令文件并设置必要的变量
' 参数: 无
' 返回值: 无
'*******************************************************************************
Function Init()
  Dim Ws As Object
  Dim i As Integer
  Dim str As String

  thispath = Replace(ThisWorkbook.path, "\MPQ", "") '路径
  itemnums = 0 '物品技能数量
  abilini = "" '物品技能ini
  ors = 13 '命令字符串
  itemabil = "const itemabil=[]" + vbCrLf '物品技能

  '获取order
  Set Ws = CreateObject("adodb.stream")
  With Ws
    .Type = 2
    .Charset = "UTF-8"
    .Open
    '读取基础命令id文件
    .LoadFromFile (thispath + "\MPQ\command.txt")

    str = Ws.Readtext()
    i = 0
    Do While i < 193
      a = InStr(str, vbCrLf)
      '记录193个基础命令id
      orders(i) = Left(str, a - 1)
      str = Right(str, Len(str) - a - 1)
      i = i + 1
    Loop
    .Flush
    .Close
  End With
  Set Ws = Nothing
End Function

'*******************************************************************************
' 函数: WriteItemAbil
' 描述: 为指定行的物品生成技能数据
' 参数:
'   i - Excel表中的物品行号
' 返回值: 物品技能属性字符串
'*******************************************************************************
Function WriteItemAbil(i) As String
  Dim sheet As Worksheet
  Dim str, sss As String
  '物品sheet数据
  Set sheet = Sheets("item")
  '判断物品技能方式：无/无目标/点/单位/建筑
  '无：无技能，返回空字符
  If sheet.Cells(i, 2) = """无""" Then
    WriteItemAbil = """"""
  Else
    itemnums = itemnums + 1
    '物品属性数据
    '使用次数1
    sss = sss + "uses=1" + vbCrLf
    '使用完会消失:=0：false
    sss = sss + "perishable=0" + vbCrLf
    '主动使用:=1:true
    sss = sss + "usable=1" + vbCrLf
    '拾取自动使用:=0：false·
    sss = sss + "powerup=0"
    '返回A+物品数量(3位)
    'N2T:不足三位：补2位
    WriteItemAbil = """A" + N2T(itemnums) + """" + vbCrLf + sss

    '物品技能id：[A+物品数量(3位)]=物品名称
    '比如：itemabil["A001"]="Item1"
    itemabil = itemabil + "itemabil[""A" + N2T(itemnums) + """]=" + sheet.Cells(i, 1) + vbCrLf

    '技能基础
    abilini = abilini + "[A" + N2T(itemnums) + "]" + vbCrLf
    '父：ANcl
    abilini = abilini + "_parent=""ANcl""" + vbCrLf
    '名称
    abilini = abilini + "Name=""ttt""" + vbCrLf

    '技能释放方式
    If sheet.Cells(i, 2) = """无目标""" Then
      abilini = abilini + "DataB=0" + vbCrLf
    Elseif sheet.Cells(i, 2) = """点""" Then
      abilini = abilini + "DataB=2" + vbCrLf
      '第4列：使用范围
      If sheet.Cells(i, 4) = 0 Then
        abilini = abilini + "DataC=1" + vbCrLf
      Else
        abilini = abilini + "DataC=3" + vbCrLf
      End If
    Elseif sheet.Cells(i, 2) = """单位""" Then
      abilini = abilini + "DataB=1" + vbCrLf
      abilini = abilini + "DataC=1" + vbCrLf
    End If

    '技能命令id，每次+1
    abilini = abilini + "Order=" + orders(ors) + vbCrLf
    abilini = abilini + "DataF=" + orders(ors) + vbCrLf
    '技能施法范围
    abilini = abilini + "Rng=" + CStr(sheet.Cells(i, 3)) + vbCrLf
    abilini = abilini + "Area=" + CStr(sheet.Cells(i, 4)) + vbCrLf

    abilini = abilini + "Art=""ui\\tmbj.blp""" + vbCrLf
    abilini = abilini + "Buttonpos_1=0" + vbCrLf
    abilini = abilini + "Buttonpos_2=0" + vbCrLf
    abilini = abilini + "hero=0" + vbCrLf
    abilini = abilini + "item=1" + vbCrLf
    abilini = abilini + "CasterArt=""""" + vbCrLf
    abilini = abilini + "EffectArt=""""" + vbCrLf
    abilini = abilini + "TargetArt=""""" + vbCrLf
    abilini = abilini + "levels=1" + vbCrLf
    abilini = abilini + "Cool=0" + vbCrLf
    abilini = abilini + "Cost=0" + vbCrLf
    abilini = abilini + "DataA=0" + vbCrLf
    abilini = abilini + "DataD=0" + vbCrLf
    abilini = abilini + "DataE=0" + vbCrLf
    abilini = abilini + "targs=""notself,ground,enemies,item,friend,self""" + vbCrLf
    ors = ors + 1
  End If
End Function

'*******************************************************************************
' 函数: WriteItemAbilIni
' 描述: 将生成的技能数据写入到INI文件
' 参数: 无
' 返回值: 无
'*******************************************************************************
Function WriteItemAbilIni()
  Dim Ws As Object
  Dim s As String

  Set Ws = CreateObject("adodb.stream")
  With Ws
    .Type = 2
    .Charset = "UTF-8"
    .Open
    '144+4+1+6=155个基础技能数据+物品技能数据ini
    s = abilstr + abilini
    '写入文件ability.ini
    .writetext s
    .SaveToFile thispath + "\MPQ\map\table\ability.ini", 2
    .Flush
    .Close
  End With
  Set Ws = Nothing
End Function

'*******************************************************************************
' 函数: WriteItemAbilTS
' 描述: 生成物品技能的TypeScript代码并写入文件
' 参数: 无
' 返回值: 无
'*******************************************************************************
Function WriteItemAbilTS()
  Dim Ws As Object
  Set Ws = CreateObject("adodb.stream")
  With Ws
    .Type = 2
    .Charset = "UTF-8"
    .Open

    '写入文件itemabil.ts
    .writetext itemabil
    .SaveToFile thispath + "\src\Scripts\base\objectdata\itemabil.ts", 2
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

