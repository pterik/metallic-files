object FormSelectTree: TFormSelectTree
  Left = 283
  Top = 202
  Caption = #1042#1099#1073#1088#1072#1090#1100' '#1080#1079' '#1088#1091#1073#1088#1080#1082#1072#1090#1086#1088#1072
  ClientHeight = 458
  ClientWidth = 384
  Color = clBtnFace
  Constraints.MinHeight = 250
  Constraints.MinWidth = 400
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    384
    458)
  PixelsPerInch = 96
  TextHeight = 13
  object Tree: TsTreeView
    Left = 8
    Top = 8
    Width = 377
    Height = 401
    Anchors = [akLeft, akTop, akRight, akBottom]
    Indent = 19
    ReadOnly = True
    RightClickSelect = True
    TabOrder = 0
    OnChange = TreeChange
    OnDblClick = TreeDblClick
    OnExpanding = TreeExpanding
    Items.NodeData = {
      03020000002A0000000000000000000000FFFFFFFFFFFFFFFF00000000000000
      0001000000010654006500730074006F0031002E0000000000000000000000FF
      FFFFFFFFFFFFFF000000000000000000000000010854006500730074006F0020
      0031003200260000000000000000000000FFFFFFFFFFFFFFFF00000000000000
      000100000001041A044004430433042C0000000000000000000000FFFFFFFFFF
      FFFFFF00000000000000000000000001071A04400443043304200031003000}
  end
  object BitBtnCancel: TsBitBtn
    Left = 281
    Top = 424
    Width = 104
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
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
    TabOrder = 1
    OnClick = BitBtnCancelClick
  end
  object StaticText1: TStaticText
    Left = 16
    Top = 416
    Width = 257
    Height = 33
    Anchors = [akLeft, akRight, akBottom]
    AutoSize = False
    Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1086#1076#1080#1085' '#1080#1079' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1086#1074' '#1076#1074#1086#1081#1085#1099#1084' '#1097#1077#1083#1095#1082#1086#1084' '#1084#1099#1096#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
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
