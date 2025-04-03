' VERSION 1.0 CLASS
' BEGIN
' MultiUse = -1  'True
' END
' Attribute VB_Name = "Sheet9"
' Attribute VB_GlobalNameSpace = False
' Attribute VB_Creatable = False
' Attribute VB_PredeclaredId = True
' Attribute VB_Exposed = True

'*******************************************************************************
' 类: Sheet9
' 描述: 处理Buff相关的工作表事件
'       当用户双击工作表中的单元格时，根据位置创建并打开对应的TypeScript文件
'*******************************************************************************

'*******************************************************************************
' 过程: Worksheet_BeforeDoubleClick
' 描述: 当用户双击工作表中的单元格时触发
'       如果双击的是"code"列，会为对应的Buff创建TypeScript文件并用VS Code打开
' 参数:
'   Target - 用户双击的单元格范围
'   Cancel - 是否取消默认的双击行为
' 返回值: 无
'*******************************************************************************
Private Sub Worksheet_BeforeDoubleClick(Byval Target As Range, Cancel As Boolean)
  Dim Ws As Object
  Dim name, str, exe, path, thispath As String
  Dim r, c As Integer
  Dim sheet As Worksheet

  Set sheet = ThisWorkbook.ActiveSheet

  thispath = Replace(ThisWorkbook.path, "\MPQ", "")

  r = Target.Row
  c = Target.Column
  If sheet.Cells(3, c) <> "code" Then
    End
  End If
  name = sheet.Cells(r, 1)
  name = Mid(name, 2, Len(name) - 2)

  ' 确保目录存在
  If Len(Dir(thispath + "\src\Scripts\base\excel2ts", vbDirectory)) = 0 Then
    MkDir thispath + "\src\Scripts\base\excel2ts"
  End If
  If Len(Dir(thispath + "\src\Scripts\base\excel2ts\buff", vbDirectory)) = 0 Then
    MkDir thispath + "\src\Scripts\base\excel2ts\buff"
  End If

  ' 如果文件不存在，创建新的Buff类模板
  If Len(Dir(thispath + "\src\Scripts\base\excel2ts\buff\" + name + ".ts", vbDirectory)) = 0 Then
    Set Ws = CreateObject("adodb.stream")
    With Ws
      .Type = 2
      .Charset = "UTF-8"
      .Open

      str = str + "import { BuffType } from ""../../object/事件/BuffType""" + vbCrLf
      str = str + "export class " + name + "{" + vbCrLf
      str = str + "  static onInit(){" + vbCrLf

      str = str + "    New BuffType({" + vbCrLf
      str = str + "      name:""" + name + """," + vbCrLf
      str = str + "      ubertips:(unit,buff)=>{" + vbCrLf
      str = str + "        return """"" + vbCrLf
      str = str + "      }," + vbCrLf
      str = str + "      //获得" + vbCrLf
      str = str + "      //GetEffect:(unit,buff)=>{}," + vbCrLf
      str = str + "      //失去" + vbCrLf
      str = str + "      //LostEffect:(unit,buff)=>{}," + vbCrLf
      str = str + "      //叠加" + vbCrLf
      str = str + "      //CoverEffect:(unit,buff)=>{}," + vbCrLf
      str = str + "      //完成" + vbCrLf
      str = str + "      //OverEffect:(unit,buff)=>{}," + vbCrLf
      str = str + "      //攻击" + vbCrLf
      str = str + "      //AttackEffect:(attacker,attacked,buff)=>{}," + vbCrLf
      str = str + "      //准备攻击" + vbCrLf
      str = str + "      //AttackingEffect:(attacker,attacked,buff)=>{}," + vbCrLf
      str = str + "      //击杀\死亡" + vbCrLf
      str = str + "      //KillEffect:(deather,killer,buff)=>{}," + vbCrLf
      str = str + "      //暴击" + vbCrLf
      str = str + "      //CriticalEffect:(damager,damaged,damage,buff)=>{}," + vbCrLf
      str = str + "      //闪避" + vbCrLf
      str = str + "      //MissEffect:(damage,buff)=>{}," + vbCrLf
      str = str + "      //伤害\被伤害" + vbCrLf
      str = str + "      //DamageEffect:(damage,buff)=>{}," + vbCrLf
      str = str + "      //治疗" + vbCrLf
      str = str + "      //HealEffect:(healer,healed,heal,buff)=>{}," + vbCrLf
      str = str + "      //施放技能" + vbCrLf
      str = str + "      //SpellEffect:(speller,spell,buff)=>{}," + vbCrLf
      str = str + "      //设置属性" + vbCrLf
      str = str + "      //SetAttriEffect:(unit,buff)=>{}," + vbCrLf
      str = str + "    })" + vbCrLf

      str = str + "  }" + vbCrLf
      str = str + "}" + vbCrLf

      .writetext str
      .SaveToFile thispath + "\src\Scripts\base\excel2ts\buff\" + name + ".ts", 2
      .Flush
      .Close
    End With
    Set Ws = Nothing
  End If

  ' ' 获取VS Code路径并打开文件
  ' Set Ws = CreateObject("adodb.stream")
  ' With Ws
  '   .Type = 2
  '   .Charset = "UTF-8"
  '   .Open
  '   .LoadFromFile (ThisWorkbook.path + "\vscode")

  '   exe = Ws.Readtext()

  '   .Flush
  '   .Close
  ' End With
  ' Set Ws = Nothing

  ' path = " " + thispath + "\src\Scripts\base\excel2ts\buff\" + name + ".ts"
  ' Shell exe & path
End Sub
