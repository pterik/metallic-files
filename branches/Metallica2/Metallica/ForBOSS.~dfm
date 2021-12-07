object FormForBoss: TFormForBoss
  Left = 416
  Top = 289
  Width = 241
  Height = 209
  Caption = #1042#1086#1079#1084#1086#1078#1085#1086#1089#1090#1080' '#1076#1083#1103' BOSS'#1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    233
    182)
  PixelsPerInch = 96
  TextHeight = 13
  object BitBtnClose: TBitBtn
    Left = 15
    Top = 140
    Width = 200
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1047#1072#1082#1088#1099#1090#1100
    Default = True
    ModalResult = 1
    TabOrder = 2
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
  object BitBtnAdditional: TBitBtn
    Left = 15
    Top = 97
    Width = 202
    Height = 25
    Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1077' '#1085#1072#1089#1090#1088#1086#1081#1082#1080
    TabOrder = 1
    OnClick = BitBtnAdditionalClick
    NumGlyphs = 2
  end
  object BitBtnUpdateTree: TBitBtn
    Left = 15
    Top = 17
    Width = 202
    Height = 25
    Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1088#1091#1073#1088#1080#1082#1072#1090#1086#1088
    TabOrder = 0
    OnClick = BitBtnUpdateTreeClick
    NumGlyphs = 2
  end
  object BitBtn1: TBitBtn
    Left = 15
    Top = 57
    Width = 202
    Height = 25
    Caption = #1056#1072#1079#1084#1077#1088#1099' '#1087#1086#1083#1077#1081' "'#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102'"'
    TabOrder = 3
    OnClick = BitBtn1Click
    NumGlyphs = 2
  end
  object qGlobDelete: TZQuery
    Connection = FormMain.ZC
    SQL.Strings = (
      'delete FROM grid_show'
      'WHERE (gs_treeid IS NULL)')
    Params = <>
    WhereMode = wmWhereAll
    Options = []
    Left = 40
    Top = 56
    object qGlobDeleteCNTR: TIntegerField
      FieldName = 'CNTR'
      ReadOnly = True
    end
  end
  object qGlobInsert: TZQuery
    Connection = FormMain.ZC
    SQL.Strings = (
      'INSERT INTO GRID_SHOW (GS_TREEID, GS_FIELD, GS_HEADER, GS_SHOW,'
      'GS_SIZE, GS_DISPLAYFORMAT, GS_ORDERBY)'
      'VALUES (NULL, :FIELD, :HEADER, :SHOW,'
      ':SIZE, :DISPLAYFORMAT, :ORDERBY)')
    Params = <
      item
        DataType = ftUnknown
        Name = 'FIELD'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'HEADER'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SHOW'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SIZE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DISPLAYFORMAT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ORDERBY'
        ParamType = ptUnknown
      end>
    WhereMode = wmWhereAll
    Options = []
    Left = 112
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'FIELD'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'HEADER'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SHOW'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SIZE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DISPLAYFORMAT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ORDERBY'
        ParamType = ptUnknown
      end>
  end
end
