object FormSettings: TFormSettings
  Left = 438
  Top = 257
  Caption = #1044#1088#1091#1075#1080#1077' '#1085#1072#1089#1090#1088#1086#1081#1082#1080
  ClientHeight = 156
  ClientWidth = 221
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    221
    156)
  PixelsPerInch = 96
  TextHeight = 13
  object BitBtnCancel: TsBitBtn
    Left = 8
    Top = 128
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    Default = True
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333333333333000033338833333333333333333F333333333333
      0000333911833333983333333388F333333F3333000033391118333911833333
      38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
      911118111118333338F3338F833338F3000033333911111111833333338F3338
      3333F8330000333333911111183333333338F333333F83330000333333311111
      8333333333338F3333383333000033333339111183333333333338F333833333
      00003333339111118333333333333833338F3333000033333911181118333333
      33338333338F333300003333911183911183333333383338F338F33300003333
      9118333911183333338F33838F338F33000033333913333391113333338FF833
      38F338F300003333333333333919333333388333338FFF830000333333333333
      3333333333333333333888330000333333333333333333333333333333333333
      0000}
    ModalResult = 2
    NumGlyphs = 2
    TabOrder = 2
  end
  object BitBtnSave: TsBitBtn
    Left = 113
    Top = 128
    Width = 105
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' (F2)'
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333FFFFFFFFFFFFF33000077777770033377777777777773F000007888888
      00037F3337F3FF37F37F00000780088800037F3337F77F37F37F000007800888
      00037F3337F77FF7F37F00000788888800037F3337777777337F000000000000
      00037F3FFFFFFFFFFF7F00000000000000037F77777777777F7F000FFFFFFFFF
      00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
      00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
      00037F7F333333337F7F000FFFFFFFFF07037F7F33333333777F000FFFFFFFFF
      0003737FFFFFFFFF7F7330099999999900333777777777777733}
    ModalResult = 1
    NumGlyphs = 2
    TabOrder = 3
    OnClick = BitBtnSaveClick
  end
  object MESearch: TsMaskEdit
    Left = 178
    Top = 12
    Width = 18
    Height = 21
    MaxLength = 1
    TabOrder = 0
    CheckOnExit = True
    EditMask = '9;1;_'
    Text = ' '
  end
  object StaticText1: TStaticText
    Left = 8
    Top = 8
    Width = 161
    Height = 41
    AutoSize = False
    Caption = 
      #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1089#1080#1084#1074#1086#1083#1086#1074' '#1074' '#1087#1086#1080#1089#1082#1077' '#1087#1086#1093#1086#1078#1080#1093' '#1080#1084#1077#1085' '#1082#1086#1084#1087#1072#1085#1080#1081' ('#1085#1077' '#1073#1086#1083#1077#1077' '#1076#1077#1074 +
      #1103#1090#1080')'
    TabOrder = 4
  end
  object StaticText2: TStaticText
    Left = 8
    Top = 56
    Width = 161
    Height = 49
    AutoSize = False
    Caption = 
      #1050#1086#1076' '#1075#1086#1088#1086#1076#1072' '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102' ('#1091#1082#1072#1078#1080#1090#1077' '#1082#1086#1076' '#1042#1072#1096#1077#1075#1086' '#1075#1086#1088#1086#1076#1072'). '#1050#1086#1076' '#1076#1086#1083#1078#1077#1085' ' +
      #1073#1099#1090#1100' '#1076#1074#1091#1093#1079#1085#1072#1095#1085#1099#1084
    TabOrder = 5
  end
  object MECode: TsMaskEdit
    Left = 178
    Top = 60
    Width = 29
    Height = 21
    MaxLength = 2
    TabOrder = 1
    CheckOnExit = True
    EditMask = '99;1;_'
    Text = '  '
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
