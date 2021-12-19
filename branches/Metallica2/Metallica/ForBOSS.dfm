object FormForBoss: TFormForBoss
  Left = 416
  Top = 289
  Caption = #1042#1086#1079#1084#1086#1078#1085#1086#1089#1090#1080' '#1076#1083#1103' BOSS'#1072
  ClientHeight = 170
  ClientWidth = 225
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    225
    170)
  PixelsPerInch = 96
  TextHeight = 13
  object BitBtnClose: TsBitBtn
    Left = 15
    Top = 140
    Width = 200
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1047#1072#1082#1088#1099#1090#1100
    Default = True
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
    ModalResult = 1
    NumGlyphs = 2
    TabOrder = 2
  end
  object BitBtnAdditional: TsBitBtn
    Left = 15
    Top = 97
    Width = 202
    Height = 25
    Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1077' '#1085#1072#1089#1090#1088#1086#1081#1082#1080
    NumGlyphs = 2
    TabOrder = 1
    OnClick = BitBtnAdditionalClick
  end
  object BitBtnUpdateTree: TsBitBtn
    Left = 15
    Top = 17
    Width = 202
    Height = 25
    Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1088#1091#1073#1088#1080#1082#1072#1090#1086#1088
    NumGlyphs = 2
    TabOrder = 0
    OnClick = BitBtnUpdateTreeClick
  end
  object BitBtn1: TsBitBtn
    Left = 15
    Top = 57
    Width = 202
    Height = 25
    Caption = #1056#1072#1079#1084#1077#1088#1099' '#1087#1086#1083#1077#1081' "'#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102'"'
    NumGlyphs = 2
    TabOrder = 3
    OnClick = BitBtn1Click
  end
  object qGlobDelete: TUniSQL
    Connection = FormMain.ZC
    SQL.Strings = (
      'delete FROM grid_show'
      'WHERE (gs_treeid IS NULL)')
    Left = 160
    Top = 24
  end
  object qGlobInsert: TUniSQL
    Connection = FormMain.ZC
    SQL.Strings = (
      'INSERT INTO GRID_SHOW (GS_TREEID, GS_FIELD, GS_HEADER, GS_SHOW,'
      'GS_SIZE, GS_DISPLAYFORMAT, GS_ORDERBY)'
      'VALUES (NULL, :FIELD, :HEADER, :SHOW,'
      ':SIZE, :DISPLAYFORMAT, :ORDERBY)')
    Left = 160
    Top = 104
    ParamData = <
      item
        DataType = ftString
        Name = 'FIELD'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'HEADER'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftSmallint
        Name = 'SHOW'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftInteger
        Name = 'SIZE'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'DISPLAYFORMAT'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftInteger
        Name = 'ORDERBY'
        ParamType = ptInput
        Value = nil
      end>
  end
  object sSkinManager1: TsSkinManager
    ButtonsOptions.OldGlyphsMode = True
    IsDefault = False
    InternalSkins = <>
    SkinDirectory = 'c:\Skins'
    SkinName = 'AlterMetro'
    SkinInfo = '15'
    ThirdParty.ThirdEdits = ' '
    ThirdParty.ThirdButtons = 'TButton'
    ThirdParty.ThirdBitBtns = ' '
    ThirdParty.ThirdCheckBoxes = ' '
    ThirdParty.ThirdGroupBoxes = ' '
    ThirdParty.ThirdListViews = ' '
    ThirdParty.ThirdPanels = ' '
    ThirdParty.ThirdGrids = ' '
    ThirdParty.ThirdTreeViews = ' '
    ThirdParty.ThirdComboBoxes = ' '
    ThirdParty.ThirdWWEdits = ' '
    ThirdParty.ThirdVirtualTrees = ' '
    ThirdParty.ThirdGridEh = ' '
    ThirdParty.ThirdPageControl = ' '
    ThirdParty.ThirdTabControl = ' '
    ThirdParty.ThirdToolBar = ' '
    ThirdParty.ThirdStatusBar = ' '
    ThirdParty.ThirdSpeedButton = ' '
    ThirdParty.ThirdScrollControl = ' '
    ThirdParty.ThirdUpDown = ' '
    ThirdParty.ThirdScrollBar = ' '
    ThirdParty.ThirdStaticText = ' '
    ThirdParty.ThirdNativePaint = ' '
    Left = 24
    Top = 8
  end
  object sSkinProvider1: TsSkinProvider
    AddedTitle.Font.Charset = DEFAULT_CHARSET
    AddedTitle.Font.Color = clNone
    AddedTitle.Font.Height = -11
    AddedTitle.Font.Name = 'Tahoma'
    AddedTitle.Font.Style = []
    SkinData.SkinSection = 'FORM'
    TitleButtons = <>
    Left = 72
    Top = 8
  end
end
