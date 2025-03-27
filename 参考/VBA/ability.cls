' VERSION 1.0 CLASS
' BEGIN
' MultiUse = -1  'True
' END
' Attribute VB_Name = "ability"
' Attribute VB_GlobalNameSpace = False
' Attribute VB_Creatable = False
' Attribute VB_PredeclaredId = True
' Attribute VB_Exposed = True

'*******************************************************************************
' 类: ability
' 描述: 处理技能相关的工作表事件
'       当用户双击工作表中的单元格时，根据位置创建并打开对应的TypeScript文件
' 作者: 
' 创建日期: 
' 修改记录:
'*******************************************************************************

'*******************************************************************************
' 过程: Worksheet_BeforeDoubleClick
' 描述: 当用户双击工作表中的单元格时触发
'       如果双击的是"code"列，会为对应的技能创建TypeScript文件并用VS Code打开
' 参数:
'   Target - 用户双击的单元格范围
'   Cancel - 是否取消默认的双击行为
' 返回值: 无
'*******************************************************************************
Private Sub Worksheet_BeforeDoubleClick(Byval Target As Range, Cancel As Boolean)
  ' 声明变量
  Dim Ws As Object                ' ADODB流对象,用于文件操作
  Dim name As String             ' 技能名称
  Dim str As String              ' 存储要写入文件的内容
  Dim exe As String              ' VS Code可执行文件路径
  Dim path As String             ' 目标文件完整路径
  Dim thispath As String         ' 当前工作簿所在路径
  Dim r As Integer               ' 目标单元格行号
  Dim c As Integer               ' 目标单元格列号
  Dim sheet As Worksheet         ' 当前工作表对象

  ' 获取当前活动工作表
  Set sheet = ThisWorkbook.ActiveSheet

  ' 获取项目根目录路径(去掉\MPQ后缀)
  thispath = Replace(ThisWorkbook.path, "\MPQ", "")

  ' 获取目标单元格的行列号
  r = Target.Row
  c = Target.Column
  
  ' 检查是否点击的是code列,如果不是则退出
  If sheet.Cells(3, c) <> "code" Then
    End
  End If
  
  ' 获取技能名称(去掉首尾的引号)
  name = sheet.Cells(r, 1)
  name = Mid(name, 2, Len(name) - 2)

  ' 确保目录结构存在
  If Len(Dir(thispath + "\src\Scripts\base\excel2ts", vbDirectory)) = 0 Then
    MkDir thispath + "\src\Scripts\base\excel2ts"
  End If
  If Len(Dir(thispath + "\src\Scripts\base\excel2ts\ability", vbDirectory)) = 0 Then
    MkDir thispath + "\src\Scripts\base\excel2ts\ability"
  End If

  ' 如果技能文件不存在,则创建新的技能类模板
  If Len(Dir(thispath + "\src\Scripts\base\excel2ts\ability\" + name + ".ts", vbDirectory)) = 0 Then
    ' 创建ADODB流对象用于写文件
    Set Ws = CreateObject("adodb.stream")
    With Ws
      .Type = 2                  ' 设置为文本模式
      .Charset = "UTF-8"         ' 使用UTF-8编码
      .Open

      ' 构建TypeScript类模板内容
      str = str + "import { AbilityType } from ""../../object/事件/Abilitytype""" + vbCrLf
      str = str + "export class " + name + "{" + vbCrLf
      str = str + "  static onInit(){" + vbCrLf

      ' 创建AbilityType实例
      str = str + "    New AbilityType({" + vbCrLf
      str = str + "      name:""" + name + """," + vbCrLf
      str = str + "      ubertips:(unit,ab)=>{" + vbCrLf
      str = str + "        return """"" + vbCrLf
      str = str + "      }," + vbCrLf
      
      ' 添加各种事件回调函数注释
      str = str + "      //获得技能时触发" + vbCrLf
      str = str + "      //GetEffect:(unit,abil)=>{}," + vbCrLf
      str = str + "      //失去技能时触发" + vbCrLf
      str = str + "      //LostEffect:(unit,abil)=>{}," + vbCrLf
      str = str + "      //无目标使用技能时触发" + vbCrLf
      str = str + "      //UseEffect:(unit,abil)=>{}," + vbCrLf
      str = str + "      //对目标使用技能时触发" + vbCrLf
      str = str + "      //UseEffectTarget:(unit,target,abil)=>{}," + vbCrLf
      str = str + "      //点击地点使用技能时触发" + vbCrLf
      str = str + "      //UseEffectLoc:(unit,loc,abil)=>{}," + vbCrLf
      str = str + "      //技能等级改变时触发" + vbCrLf
      str = str + "      //LevelEffect:(unit,level,abil)=>{}," + vbCrLf
      str = str + "      //鼠标右键点击技能图标时触发" + vbCrLf
      str = str + "      //MouseRightClickEffect:(unit,abil)=>{}," + vbCrLf
      str = str + "      //攻击时触发" + vbCrLf
      str = str + "      //AttackEffect:(attacker,attacked,abil)=>{}," + vbCrLf
      str = str + "      //准备攻击时触发" + vbCrLf
      str = str + "      //AttackingEffect:(attacker,attacked,abil)=>{}," + vbCrLf
      str = str + "      //击杀或死亡时触发" + vbCrLf
      str = str + "      //KillEffect:(deather,killer,abil)=>{}," + vbCrLf
      str = str + "      //暴击时触发" + vbCrLf
      str = str + "      //CriticalEffect:(damager,damaged,damage,abil)=>{}," + vbCrLf
      str = str + "      //闪避时触发" + vbCrLf
      str = str + "      //MissEffect:(damage,abil)=>{}," + vbCrLf
      str = str + "      //造成或受到伤害时触发" + vbCrLf
      str = str + "      //DamageEffect:(damage,abil)=>{}," + vbCrLf
      str = str + "      //治疗时触发" + vbCrLf
      str = str + "      //HealEffect:(healer,healed,heal,abil)=>{}," + vbCrLf
      str = str + "      //施放技能时触发" + vbCrLf
      str = str + "      //SpellEffect:(speller,spell,abil)=>{}," + vbCrLf
      str = str + "      //设置属性时触发" + vbCrLf
      str = str + "      //SetAttriEffect:(unit,abil)=>{}," + vbCrLf
      str = str + "    })" + vbCrLf

      str = str + "  }" + vbCrLf
      str = str + "}" + vbCrLf

      ' 写入文件并保存
      .writetext str
      .SaveToFile thispath + "\src\Scripts\base\excel2ts\ability\" + name + ".ts", 2
      .Flush
      .Close
    End With
    Set Ws = Nothing
  End If

  ' ' 读取VS Code可执行文件路径
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

  ' ' 使用VS Code打开技能文件
  ' path = " " + thispath + "\src\Scripts\base\excel2ts\ability\" + name + ".ts"
  ' Shell exe & path
End Sub
