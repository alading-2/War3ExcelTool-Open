' Attribute VB_Name = "model2"
'*******************************************************************************
' ģ��: model2
' ����: ���ܱ༭����Ʒ��������ģ��
'       ��������ħ������3��ͼ�е���Ʒ�ͼ����������
'*******************************************************************************

Dim thispath As String '·��

Dim itemnums As Integer '��Ʒ��������
Dim ors As Integer  '�����ַ���

Dim abilini As String '��Ʒ����ini
Dim abilstr As String '144����������ƴ�ӳɵ��ַ���
Dim itemabil As String '��Ʒ����id
Dim orders(197) As String '�����ַ������飬��¼���л�������id


'���ڼ��ܱ༭
'��Ʒ�Զ����ɼ��ܣ�4*12*3=144������
'����144����������+4�����켼��+1���ƶ�����+6����Ʒ������

'��д144����������,12��λ�ã�ÿ��λ�� X/0��������Ŀ�� Y/1��λĿ�� Z/3��λ��� 4�� ��48*4��

'*******************************************************************************
' ����: WirteBaseAbil
' ����: ���ɻ�����������
'       Ϊ4���������144���������ܣ�������Ŀ��/��������λĿ��͵�Ŀ������
'       ͬʱ���ɽ��켼�ܺ��ƶ�����
' ����: ��
' ����ֵ: ��
'*******************************************************************************
Function WirteBaseAbil()
  'ѭ��4�����
  For p = 0 To 3
    n = 1
    '12������
    '����3
    For i = 0 To 2
      '����4
      For j = 0 To 3
        '4�ּ�������
        For a = 0 To 2
          If a = 0 Then
            '��Ŀ��򱻶�
            abilstr = abilstr + "[X" + CStr(p) + CStr(j) + CStr(i) + "]" + vbCrLf
            abilstr = abilstr + "DataB=" + CStr(0) + vbCrLf
            abilstr = abilstr + "DataC=1" + vbCrLf
          Else
            If a = 1 Then
              '��λĿ��
              abilstr = abilstr + "[Y" + CStr(p) + CStr(j) + CStr(i) + "]" + vbCrLf
              abilstr = abilstr + "DataB=" + CStr(1) + vbCrLf
              abilstr = abilstr + "DataC=1" + vbCrLf
              ' Ŀ������
              abilstr = abilstr + "targs=""notself,ground,enemies,air,item,friend,self""" + vbCrLf
            Elseif a = 2 Then
              '��Ŀ��
              abilstr = abilstr + "[Z" + CStr(p) + CStr(j) + CStr(i) + "]" + vbCrLf
              abilstr = abilstr + "DataB=" + CStr(3) + vbCrLf
              abilstr = abilstr + "DataC=1" + vbCrLf
              ' Ŀ������
              abilstr = abilstr + "targs=""ground,enemies,friend""" + vbCrLf
            End If
          End If
          ' ���
          abilstr = abilstr + "Order=" + orders(n) + vbCrLf
          ' ��������id
          abilstr = abilstr + "DataF=" + orders(n) + vbCrLf
          ' ��ȴʱ��
          abilstr = abilstr + "Cool=0" + vbCrLf
          ' ħ������
          abilstr = abilstr + "Cost=0" + vbCrLf
          ' ʩ��ʱ��
          abilstr = abilstr + "Cast=0.01" + vbCrLf
          ' ����E��ʹ����������Ч��=0��false
          abilstr = abilstr + "DataE=0" + vbCrLf
          ' ����A��ʩ������ʱ��
          abilstr = abilstr + "DataA=0" + vbCrLf
          ' ����D����������ʱ��
          abilstr = abilstr + "DataD=0.1" + vbCrLf
          ' ����
          abilstr = abilstr + "_parent=""ANcl""" + vbCrLf
          ' ��ťλ��x:0-3
          abilstr = abilstr + "Buttonpos_1=" + CStr(j) + vbCrLf
          ' ��ťλ��y:0-2
          abilstr = abilstr + "Buttonpos_2=" + CStr(i) + vbCrLf
          ' ����
          abilstr = abilstr + "Name=""" + CStr(p) + CStr(j) + CStr(i) + """" + vbCrLf
          ' ͨ������
          abilstr = abilstr + writeStr() + vbCrLf

          nums = nums + 1
        Next a
        n = n + 1
      Next j
    Next i
  Next p

  '���켼��
  For m = 1 To 4
    abilstr = abilstr + "[JZT" + CStr(m) + "]" + vbCrLf
    '�������켼��
    abilstr = abilstr + "_parent=""AIbt""" + vbCrLf
    '��ťλ��x:0-3
    abilstr = abilstr + "Buttonpos_1=" + CStr(m - 1) + vbCrLf
    '��ťλ��y:2��Ĭ��������
    abilstr = abilstr + "Buttonpos_2=2" + vbCrLf
    '����
    abilstr = abilstr + "Name=""����""" + vbCrLf
    abilstr = abilstr + "Dur=0" + vbCrLf
    '��Ʒ����
    abilstr = abilstr + "item=1" + vbCrLf
    ' ʩ����Χ
    abilstr = abilstr + "Rng=4000" + vbCrLf
    '������λ�����úõ�ָ���t����
    abilstr = abilstr + "UnitID=""jzd" + CStr(m) + """" + vbCrLf + vbCrLf
  Next m

  '�ƶ�����
  abilstr = abilstr + "[TJYD]" + vbCrLf
  '�������켼��
  abilstr = abilstr + "_parent=""AIbt""" + vbCrLf
  '��ťλ��x:0-3
  abilstr = abilstr + "Buttonpos_1=0" + vbCrLf
  '��ťλ��y:0-2
  abilstr = abilstr + "Buttonpos_2=1" + vbCrLf
  '����
  abilstr = abilstr + "Name=""�ƶ�""" + vbCrLf
  abilstr = abilstr + "Dur=0" + vbCrLf
  abilstr = abilstr + "item=0" + vbCrLf
  abilstr = abilstr + "Rng=6000" + vbCrLf
  abilstr = abilstr + "UnitID=""jzd1""" + vbCrLf + vbCrLf

  '��Ʒ������
  For m = 1 To 6
    abilstr = abilstr + "[WPL" + CStr(m) + "]" + vbCrLf

    abilstr = abilstr + "_parent=""AInv""" + vbCrLf
    '����
    abilstr = abilstr + "Name=""��Ʒ��""" + vbCrLf
    abilstr = abilstr + "DataC=1" + vbCrLf
    abilstr = abilstr + "DataA=" + CStr(m) + vbCrLf
    abilstr = abilstr + "DataB=1" + vbCrLf
  Next m
End Function

'*******************************************************************************
' ����: writeStr
' ����: ���ɼ��ܵ�ͨ�������ַ���
' ����: ��
' ����ֵ: ��������ͨ�����Ե��ַ���
'*******************************************************************************
Function writeStr() As String
  Dim s As String
  s = ""
  ' ����ͼ��
  s = s + "Art=""ui\\tmbj.blp""" + vbCrLf
  ' Ӣ�ۼ���
  s = s + "hero=0" + vbCrLf
  ' ��Ʒ����
  s = s + "item=0" + vbCrLf
  ' ʩ����ͼ��
  s = s + "CasterArt=""""" + vbCrLf
  ' Ч��ͼ��
  s = s + "EffectArt=""""" + vbCrLf
  ' Ŀ��ͼ��
  s = s + "TargetArt=""""" + vbCrLf
  ' ���ܵȼ�
  s = s + "levels=1" + vbCrLf
  ' ʩ����Χ
  s = s + "Rng=500" + vbCrLf
  ' ʩ������
  s = s + "area=100" + vbCrLf
  ' ��������
  s = s + "Animnames=""""" + vbCrLf
  ' ��ݼ�
  s = s + "Hotkey=""""" + vbCrLf
  writeStr = s
End Function

'*******************************************************************************
' ����: Init
' ����: ��ʼ��ģ�飬��ȡ�����ļ������ñ�Ҫ�ı���
' ����: ��
' ����ֵ: ��
'*******************************************************************************
Function Init()
  Dim Ws As Object
  Dim i As Integer
  Dim str As String

  thispath = Replace(ThisWorkbook.path, "\MPQ", "") '·��
  itemnums = 0 '��Ʒ��������
  abilini = "" '��Ʒ����ini
  ors = 13 '�����ַ���
  itemabil = "const itemabil=[]" + vbCrLf '��Ʒ����

  '��ȡorder
  Set Ws = CreateObject("adodb.stream")
  With Ws
    .Type = 2
    .Charset = "UTF-8"
    .Open
    '��ȡ��������id�ļ�
    .LoadFromFile (thispath + "\MPQ\command.txt")

    str = Ws.Readtext()
    i = 0
    Do While i < 193
      a = InStr(str, vbCrLf)
      '��¼193����������id
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
' ����: WriteItemAbil
' ����: Ϊָ���е���Ʒ���ɼ�������
' ����:
'   i - Excel���е���Ʒ�к�
' ����ֵ: ��Ʒ���������ַ���
'*******************************************************************************
Function WriteItemAbil(i) As String
  Dim sheet As Worksheet
  Dim str, sss As String
  '��Ʒsheet����
  Set sheet = Sheets("item")
  '�ж���Ʒ���ܷ�ʽ����/��Ŀ��/��/��λ/����
  '�ޣ��޼��ܣ����ؿ��ַ�
  If sheet.Cells(i, 2) = """��""" Then
    WriteItemAbil = """"""
  Else
    itemnums = itemnums + 1
    '��Ʒ��������
    'ʹ�ô���1
    sss = sss + "uses=1" + vbCrLf
    'ʹ�������ʧ:=0��false
    sss = sss + "perishable=0" + vbCrLf
    '����ʹ��:=1:true
    sss = sss + "usable=1" + vbCrLf
    'ʰȡ�Զ�ʹ��:=0��false��
    sss = sss + "powerup=0"
    '����A+��Ʒ����(3λ)
    'N2T:������λ����2λ
    WriteItemAbil = """A" + N2T(itemnums) + """" + vbCrLf + sss

    '��Ʒ����id��[A+��Ʒ����(3λ)]=��Ʒ����
    '���磺itemabil["A001"]="Item1"
    itemabil = itemabil + "itemabil[""A" + N2T(itemnums) + """]=" + sheet.Cells(i, 1) + vbCrLf

    '���ܻ���
    abilini = abilini + "[A" + N2T(itemnums) + "]" + vbCrLf
    '����ANcl
    abilini = abilini + "_parent=""ANcl""" + vbCrLf
    '����
    abilini = abilini + "Name=""ttt""" + vbCrLf

    '�����ͷŷ�ʽ
    If sheet.Cells(i, 2) = """��Ŀ��""" Then
      abilini = abilini + "DataB=0" + vbCrLf
    Elseif sheet.Cells(i, 2) = """��""" Then
      abilini = abilini + "DataB=2" + vbCrLf
      '��4�У�ʹ�÷�Χ
      If sheet.Cells(i, 4) = 0 Then
        abilini = abilini + "DataC=1" + vbCrLf
      Else
        abilini = abilini + "DataC=3" + vbCrLf
      End If
    Elseif sheet.Cells(i, 2) = """��λ""" Then
      abilini = abilini + "DataB=1" + vbCrLf
      abilini = abilini + "DataC=1" + vbCrLf
    End If

    '��������id��ÿ��+1
    abilini = abilini + "Order=" + orders(ors) + vbCrLf
    abilini = abilini + "DataF=" + orders(ors) + vbCrLf
    '����ʩ����Χ
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
' ����: WriteItemAbilIni
' ����: �����ɵļ�������д�뵽INI�ļ�
' ����: ��
' ����ֵ: ��
'*******************************************************************************
Function WriteItemAbilIni()
  Dim Ws As Object
  Dim s As String

  Set Ws = CreateObject("adodb.stream")
  With Ws
    .Type = 2
    .Charset = "UTF-8"
    .Open
    '144+4+1+6=155��������������+��Ʒ��������ini
    s = abilstr + abilini
    'д���ļ�ability.ini
    .writetext s
    .SaveToFile thispath + "\MPQ\map\table\ability.ini", 2
    .Flush
    .Close
  End With
  Set Ws = Nothing
End Function

'*******************************************************************************
' ����: WriteItemAbilTS
' ����: ������Ʒ���ܵ�TypeScript���벢д���ļ�
' ����: ��
' ����ֵ: ��
'*******************************************************************************
Function WriteItemAbilTS()
  Dim Ws As Object
  Set Ws = CreateObject("adodb.stream")
  With Ws
    .Type = 2
    .Charset = "UTF-8"
    .Open

    'д���ļ�itemabil.ts
    .writetext itemabil
    .SaveToFile thispath + "\src\Scripts\base\objectdata\itemabil.ts", 2
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

