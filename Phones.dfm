object FormPhones: TFormPhones
  Left = 244
  Top = 134
  Width = 550
  Height = 300
  Caption = #1041#1083#1086#1082#1080#1088#1086#1074#1072#1085#1085#1099#1077' '#1090#1077#1083#1077#1092#1086#1085#1099
  Color = clBtnFace
  Constraints.MaxHeight = 600
  Constraints.MaxWidth = 800
  Constraints.MinHeight = 300
  Constraints.MinWidth = 550
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    542
    273)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 48
    Width = 118
    Height = 16
    Caption = #1055#1077#1088#1077#1093#1086#1076' '#1082' '#1085#1086#1084#1077#1088#1091
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object LabelComment: TLabel
    Left = 8
    Top = 80
    Width = 91
    Height = 16
    Caption = 'LabelComment'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object LabelNum: TLabel
    Left = 8
    Top = 120
    Width = 46
    Height = 16
    Caption = #1053#1086#1084#1077#1088':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object LabelBlock: TLabel
    Left = 8
    Top = 160
    Width = 84
    Height = 13
    Caption = #1050#1090#1086' '#1073#1083#1086#1082#1080#1088#1086#1074#1072#1083':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object LabelDate: TLabel
    Left = 8
    Top = 200
    Width = 113
    Height = 16
    Caption = #1044#1072#1090#1072' '#1073#1083#1086#1082#1080#1088#1086#1074#1082#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 24
    Width = 326
    Height = 13
    Caption = #1042' '#1084#1077#1078#1076#1091#1075#1086#1088#1086#1076#1085#1077#1084' '#1085#1086#1084#1077#1088#1077' '#1086#1073#1103#1079#1072#1090#1077#1083#1100#1085#1086' '#1091#1082#1072#1079#1099#1074#1072#1081#1090#1077' 8 '#1074' '#1085#1072#1095#1072#1083#1077'!!'
  end
  object Label3: TLabel
    Left = 8
    Top = 8
    Width = 228
    Height = 13
    Caption = #1054#1073#1088#1072#1073#1072#1090#1099#1074#1072#1102#1090#1089#1103' '#1090#1077#1083#1077#1092#1086#1085#1099' '#1080#1079' 6,7 '#1080' 10 '#1094#1080#1092#1088
  end
  object BitBtnClose: TBitBtn
    Left = 360
    Top = 232
    Width = 129
    Height = 25
    Anchors = [akLeft, akRight, akBottom]
    Cancel = True
    Caption = #1047#1072#1082#1088#1099#1090#1100
    TabOrder = 2
    OnClick = BitBtnCloseClick
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
      F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
      000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
      338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
      45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
      3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
      F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
      000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
      338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
      4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
      8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
      333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
      0000}
    NumGlyphs = 2
  end
  object ButtonSearch: TButton
    Left = 360
    Top = 40
    Width = 129
    Height = 25
    Anchors = [akRight]
    Caption = #1048#1089#1082#1072#1090#1100' '#1090#1077#1083#1077#1092#1086#1085
    TabOrder = 1
    OnClick = ButtonSearchClick
  end
  object EditSearch: TEdit
    Left = 144
    Top = 48
    Width = 121
    Height = 21
    TabOrder = 0
    OnKeyUp = EditSearchKeyUp
  end
  object QPhones: TQuery
    DatabaseName = 'BaseLocal'
    SQL.Strings = (
      'select *  from blockedphones where number=:number')
    Left = 152
    Top = 160
    ParamData = <
      item
        DataType = ftInteger
        Name = 'number'
        ParamType = ptUnknown
        Value = 100000
      end>
  end
  object QPhonesCount: TQuery
    DatabaseName = 'BaseLocal'
    SQL.Strings = (
      'select count(*) as cntr from blockedphones where number=:number')
    Left = 312
    Top = 160
    ParamData = <
      item
        DataType = ftInteger
        Name = 'number'
        ParamType = ptUnknown
        Value = '1'
      end>
  end
  object OD: TOpenDialog
    DefaultExt = '*.txt'
    Filter = '*.txt|*.txt'
    InitialDir = 'c:\1work\ImposerPlace'
    Left = 112
    Top = 112
  end
  object Query: TQuery
    DatabaseName = 'BaseLocal'
    Left = 152
    Top = 112
  end
  object SaveDialog: TSaveDialog
    Filter = '*.txt|*.txt'
    Left = 240
    Top = 112
  end
end
