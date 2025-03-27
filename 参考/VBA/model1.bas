' Attribute VB_Name = "model1"
'*******************************************************************************
' 模块: model1
' 描述: 包含文本处理和颜色处理相关函数
'*******************************************************************************

'*******************************************************************************
' 函数: Coloring
' 描述: 为文本添加魔兽争霸3引擎支持的颜色代码
' 参数:
'   c - 颜色名称（如"红色"、"蓝色"等）
'   s - 需要着色的文本字符串
' 返回值: 添加了颜色代码的文本字符串
'*******************************************************************************
Function Coloring(c, s)
  Dim a
  If c = "红色" Then
    a = "'|cffff0000" + s + "|r'"
  Elseif c = "橙色" Then
    a = "'|cffff6800" + s + "|r'"
  Elseif c = "紫色" Then
    a = "'|cff8400ff" + s + "|r'"
  Elseif c = "黑色" Then
    a = "'|cff000000" + s + "|r'"
  Elseif c = "蓝色" Then
    a = "'|cff0000ff" + s + "|r'"
  Elseif c = "绿色" Then
    a = "'|cff00ff00" + s + "|r'"
  Elseif c = "黄色" Then
    a = "'|cffffff00" + s + "|r'"
  Elseif c = "棕色" Then
    a = "'|cff993300" + s + "|r'"
  Elseif c = "灰色" Then
    a = "'|cff333333" + s + "|r'"
  Elseif c = "浅蓝色" Then
    a = "'|cff00ffff" + s + "|r'"
  Elseif c = "粉色" Then
    a = "'|cffff52a9" + s + "|r'"
  Elseif c = "白色" Then
    a = "'|cffffffff" + s + "|r'"
  End If
  Coloring = a
End Function

'*******************************************************************************
' 函数: Level
' 描述: 根据物品等级返回对应的RGB颜色值
' 参数:
'   c - 包含物品等级文本的单元格范围
'   s - 颜色通道标识("R"、"G"或"B")
' 返回值: 指定颜色通道的值(0-255)
'*******************************************************************************
Function Level(c As Range, s)
  Dim a
  a = 0
  If s = "R" Then
    If c.Text = """普通""" Then
      a = 255
    Elseif c.Text = """高级""" Then
      a = 0
    Elseif c.Text = """稀有""" Then
      a = 140
    Elseif c.Text = """神器""" Then
      a = 255
    Elseif c.Text = """史诗""" Then
      a = 255
    Elseif c.Text = """神话""" Then
      a = 255
    End If
  End If
  If s = "G" Then
    If c = """普通""" Then
      a = 255
    Elseif c = """高级""" Then
      a = 100
    Elseif c = """稀有""" Then
      a = 0
    Elseif c = """神器""" Then
      a = 0
    Elseif c = """史诗""" Then
      a = 150
    Elseif c = """神话""" Then
      a = 0
    End If
  End If
  If s = "B" Then
    If c = """普通""" Then
      a = 255
    Elseif c = """高级""" Then
      a = 200
    Elseif c = """稀有""" Then
      a = 255
    Elseif c = """神器""" Then
      a = 255
    Elseif c = """史诗""" Then
      a = 0
    Elseif c = """神话""" Then
      a = 0
    End If
  End If
  Level = a
End Function

'*******************************************************************************
' 子程序: aaa
' 描述: 测试函数，显示单元格(3,26)的文本内容
'*******************************************************************************
Sub aaa()
  MsgBox Cells(3, 26).Text
End Sub

'*******************************************************************************
' 函数: pinyin
' 描述: 获取中文字符的拼音首字母
' 参数:
'   p - 单个字符
' 返回值: 拼音首字母（大写）
'*******************************************************************************
Function pinyin(p As String) As String

  i = Asc(p)

  Select Case i

   Case -20319 To -20284: pinyin = "A"

   Case -20283 To -19776: pinyin = "B"

   Case -19775 To -19219: pinyin = "C"

   Case -19218 To -18711: pinyin = "D"

   Case -18710 To -18527: pinyin = "E"

   Case -18526 To -18240: pinyin = "F"

   Case -18239 To -17923: pinyin = "G"

   Case -17922 To -17418: pinyin = "H"

   Case -17417 To -16475: pinyin = "J"

   Case -16474 To -16213: pinyin = "K"

   Case -16212 To -15641: pinyin = "L"

   Case -15640 To -15166: pinyin = "M"

   Case -15165 To -14923: pinyin = "N"

   Case -14922 To -14915: pinyin = "O"

   Case -14914 To -14631: pinyin = "P"

   Case -14630 To -14150: pinyin = "Q"

   Case -14149 To -14091: pinyin = "R"

   Case -14090 To -13319: pinyin = "S"

   Case -13318 To -12839: pinyin = "T"

   Case -12838 To -12557: pinyin = "W"

   Case -12556 To -11848: pinyin = "X"

   Case -11847 To -11056: pinyin = "Y"

   Case -11055 To -2050: pinyin = "Z"

   Case Else: pinyin = p

  End Select

End Function

'*******************************************************************************
' 函数: getpy
' 描述: 获取整个中文字符串的拼音首字母
' 参数:
'   str - 中文字符串
' 返回值: 每个字的拼音首字母组合
'*******************************************************************************
Function getpy(str)

  For i = 1 To Len(str)

    getpy = getpy + pinyin(Mid(str, i, 1))

  Next i

End Function
