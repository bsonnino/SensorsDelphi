object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 352
  ClientWidth = 434
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
    Left = 152
    Top = 16
    Width = 54
    Height = 23
    Caption = 'Label1'
  end
  object Label4: TLabel
    Left = 152
    Top = 112
    Width = 54
    Height = 23
    Caption = 'Label1'
  end
  object Label5: TLabel
    Left = 152
    Top = 144
    Width = 54
    Height = 23
    Caption = 'Label1'
  end
  object Label6: TLabel
    Left = 152
    Top = 176
    Width = 54
    Height = 23
    Caption = 'Label1'
  end
  object Label7: TLabel
    Left = 152
    Top = 208
    Width = 54
    Height = 23
    Caption = 'Label1'
  end
  object Label8: TLabel
    Left = 152
    Top = 240
    Width = 54
    Height = 23
    Caption = 'Label1'
  end
  object Label9: TLabel
    Left = 152
    Top = 273
    Width = 54
    Height = 23
    Caption = 'Label1'
  end
  object Label10: TLabel
    Left = 152
    Top = 305
    Width = 54
    Height = 23
    Caption = 'Label1'
  end
  object lbl1: TLabel
    Left = 32
    Top = 16
    Width = 49
    Height = 23
    Caption = 'Nome'
  end
  object Label11: TLabel
    Left = 32
    Top = 112
    Width = 109
    Height = 23
    Caption = 'Temperatura'
  end
  object Label12: TLabel
    Left = 32
    Top = 144
    Width = 88
    Height = 23
    Caption = 'Max Temp'
  end
  object Label13: TLabel
    Left = 32
    Top = 176
    Width = 84
    Height = 23
    Caption = 'Min Temp'
  end
  object Label14: TLabel
    Left = 32
    Top = 208
    Width = 74
    Height = 23
    Caption = 'Umidade'
  end
  object Label15: TLabel
    Left = 32
    Top = 240
    Width = 63
    Height = 23
    Caption = 'Press'#227'o'
  end
  object Label16: TLabel
    Left = 32
    Top = 272
    Width = 45
    Height = 23
    Caption = 'Clima'
  end
  object Label17: TLabel
    Left = 32
    Top = 305
    Width = 79
    Height = 23
    Caption = 'Vel.Vento'
  end
  object lbl2: TLabel
    Left = 32
    Top = 48
    Width = 67
    Height = 23
    Caption = 'Latitude'
  end
  object lbl3: TLabel
    Left = 32
    Top = 80
    Width = 83
    Height = 23
    Caption = 'Longitude'
  end
  object Label2: TLabel
    Left = 152
    Top = 48
    Width = 54
    Height = 23
    Caption = 'Label1'
  end
  object Label3: TLabel
    Left = 152
    Top = 80
    Width = 54
    Height = 23
    Caption = 'Label1'
  end
  object RESTClient1: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'UTF-8, *;q=0.8'
    BaseURL = 'http://api.openweathermap.org/data/2.5'
    Params = <>
    HandleRedirects = True
    Left = 336
    Top = 152
  end
  object RESTRequest1: TRESTRequest
    Client = RESTClient1
    Params = <
      item
        name = 'lat'
        Value = '-23.522778'
      end
      item
        name = 'lon'
        Value = '-46.187778'
      end
      item
        name = 'units'
        Value = 'metric'
      end
      item
        name = 'APPID'
        Value = 'EntreComSuaAppId'
      end>
    Resource = 'weather'
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 336
    Top = 104
  end
  object RESTResponse1: TRESTResponse
    ContentType = 'application/json'
    Left = 336
    Top = 56
  end
end
