object FormSQL: TFormSQL
  Left = 372
  Top = 311
  Caption = #1042#1099#1087#1086#1083#1085#1077#1085#1080#1077' '#1087#1088#1086#1080#1079#1074#1086#1083#1100#1085#1086#1075#1086' SQL '#1079#1072#1087#1088#1086#1089#1072
  ClientHeight = 419
  ClientWidth = 350
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnKeyUp = FormKeyUp
  DesignSize = (
    350
    419)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TsLabel
    Left = 48
    Top = 0
    Width = 244
    Height = 13
    Caption = #1047#1072#1087#1088#1086#1089' '#1076#1086#1083#1078#1077#1085' '#1073#1099#1090#1100' '#1090#1086#1083#1100#1082#1086' '#1080#1079' '#1086#1076#1085#1086#1081' '#1082#1086#1084#1072#1085#1076#1099'.'
  end
  object Label2: TsLabel
    Left = 40
    Top = 248
    Width = 170
    Height = 13
    Caption = #1044#1083#1103' '#1082#1086#1084#1072#1085#1076' c INSERT '#1080' UPDATE'
  end
  object BitBtnExecute: TsBitBtn
    Left = 224
    Top = 235
    Width = 121
    Height = 30
    Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100' (F9)'
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333FFFFFFFFFFFFF3344444444444443337777777777777F334CCCCCCCCCC
      C43337777777777777F33444881B188444333777F3737337773333308881FF70
      33333337F3373337F3333330888BF770333333373F33F337333333330881F703
      3333333373F73F7333333333308B703333333333373F77333333333333080333
      3333333333777FF333333333301F103333333333377777FF3333333301B1F103
      333333337737777FF3333330881BFB7033333337F3737F77F333333088881F70
      333333F7F3337777FFF334448888888444333777FFFFFFF777F334CCCCCCCCCC
      C43337777777777777F334444444444444333777777777777733}
    NumGlyphs = 2
    TabOrder = 4
    OnClick = BitBtnExecuteClick
  end
  object MemoSQL: TsMemo
    Left = 8
    Top = 16
    Width = 337
    Height = 185
    ScrollBars = ssBoth
    TabOrder = 0
  end
  object EditName: TsEdit
    Left = 8
    Top = 208
    Width = 313
    Height = 21
    TabOrder = 1
  end
  object ButtonOpenFile: TsButton
    Left = 328
    Top = 210
    Width = 17
    Height = 17
    Caption = '...'
    TabOrder = 2
    OnClick = ButtonOpenFileClick
  end
  object CBExecute: TsCheckBox
    Left = 16
    Top = 232
    Width = 197
    Height = 17
    Caption = #1047#1072#1087#1088#1086#1089' '#1085#1077' '#1074#1086#1079#1074#1088#1072#1097#1072#1077#1090' '#1088#1077#1079#1091#1083#1100#1090#1072#1090
    TabOrder = 3
  end
  object DBGridEh1: TDBGridEh
    Left = 8
    Top = 272
    Width = 337
    Height = 105
    DataSource = DSQuery
    DynProps = <>
    FooterParams.Color = clWindow
    TabOrder = 5
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object BitBtnCancel: TsBitBtn
    Left = 8
    Top = 390
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
    TabOrder = 6
  end
  object SDSQL: TsSaveDialog
    DefaultExt = 'Text files|*.txt'
    Filter = 'SQL file|*.sql|Any file|*.*'
    Left = 200
    Top = 80
  end
  object ZQuery: TUniQuery
    Left = 128
    Top = 344
  end
  object DSQuery: TUniDataSource
    DataSet = ZQuery
    Left = 216
    Top = 344
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
