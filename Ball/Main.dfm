object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 23
  object Label1: TLabel
    Left = 104
    Top = 16
    Width = 54
    Height = 23
    Caption = 'Label1'
  end
  object Label2: TLabel
    Left = 104
    Top = 56
    Width = 54
    Height = 23
    Caption = 'Label1'
  end
  object Label3: TLabel
    Left = 104
    Top = 96
    Width = 54
    Height = 23
    Caption = 'Label1'
  end
  object PaintBox1: TPaintBox
    Left = 0
    Top = 194
    Width = 635
    Height = 105
    Align = alBottom
    OnPaint = PaintBox1Paint
    ExplicitLeft = 272
    ExplicitTop = 120
    ExplicitWidth = 105
  end
  object Timer1: TTimer
    Interval = 100
    OnTimer = Timer1Timer
    Left = 192
    Top = 8
  end
end
