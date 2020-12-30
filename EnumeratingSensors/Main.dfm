object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Enumerando sensores'
  ClientHeight = 357
  ClientWidth = 697
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 23
  object Label1: TLabel
    Left = 249
    Top = 48
    Width = 54
    Height = 23
    Caption = 'Label1'
  end
  object Label2: TLabel
    Left = 249
    Top = 85
    Width = 54
    Height = 23
    Caption = 'Label1'
  end
  object Label3: TLabel
    Left = 249
    Top = 123
    Width = 54
    Height = 23
    Caption = 'Label1'
  end
  object Label4: TLabel
    Left = 249
    Top = 161
    Width = 54
    Height = 23
    Caption = 'Label1'
  end
  object Label5: TLabel
    Left = 249
    Top = 199
    Width = 54
    Height = 23
    Caption = 'Label1'
  end
  object Label6: TLabel
    Left = 249
    Top = 237
    Width = 54
    Height = 23
    Caption = 'Label1'
  end
  object lbl1: TLabel
    Left = 54
    Top = 48
    Width = 80
    Height = 23
    Caption = 'Descri'#231#227'o'
  end
  object lbl5: TLabel
    Left = 54
    Top = 199
    Width = 88
    Height = 23
    Caption = 'Num.S'#233'rie'
  end
  object lbl4: TLabel
    Left = 54
    Top = 161
    Width = 60
    Height = 23
    Caption = 'Modelo'
  end
  object lbl3: TLabel
    Left = 54
    Top = 123
    Width = 88
    Height = 23
    Caption = 'Fabricante'
  end
  object lbl8: TLabel
    Left = 54
    Top = 313
    Width = 107
    Height = 23
    Caption = 'Identifica'#231#227'o'
  end
  object lbl7: TLabel
    Left = 54
    Top = 275
    Width = 86
    Height = 23
    Caption = 'Data/Hora'
  end
  object lbl2: TLabel
    Left = 54
    Top = 85
    Width = 79
    Height = 23
    Caption = 'Categoria'
  end
  object lbl6: TLabel
    Left = 54
    Top = 237
    Width = 56
    Height = 23
    Caption = 'Estado'
  end
  object Label7: TLabel
    Left = 249
    Top = 275
    Width = 54
    Height = 23
    Caption = 'Label1'
  end
  object Label8: TLabel
    Left = 249
    Top = 313
    Width = 54
    Height = 23
    Caption = 'Label1'
  end
  object cbSensors: TComboBox
    Left = 16
    Top = 8
    Width = 665
    Height = 31
    Style = csDropDownList
    TabOrder = 0
    OnChange = cbSensorsChange
  end
end
