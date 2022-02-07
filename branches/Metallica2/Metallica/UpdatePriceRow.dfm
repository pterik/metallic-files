object FormUpdatePriceRow: TFormUpdatePriceRow
  Left = 215
  Top = 212
  Caption = #1048#1079#1084#1077#1085#1077#1085#1080#1077' '#1089#1090#1088#1086#1082#1080' '#1087#1088#1072#1081#1089'-'#1083#1080#1089#1090#1072
  ClientHeight = 440
  ClientWidth = 696
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
  OnKeyUp = FormKeyUp
  DesignSize = (
    696
    440)
  PixelsPerInch = 96
  TextHeight = 13
  object LabelComp: TsLabel
    Left = 8
    Top = 8
    Width = 58
    Height = 13
    Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082
  end
  object LabelCity: TsLabel
    Left = 288
    Top = 8
    Width = 30
    Height = 13
    Caption = #1043#1086#1088#1086#1076
  end
  object Label1: TsLabel
    Left = 8
    Top = 32
    Width = 36
    Height = 13
    Caption = #1057#1090#1088#1086#1082#1072
  end
  object Label4: TsLabel
    Left = 432
    Top = 8
    Width = 31
    Height = 13
    Caption = #1040#1076#1088#1077#1089
  end
  object sLabel3: TsLabel
    Left = 18
    Top = 56
    Width = 60
    Height = 13
    Caption = 'PL_VALUE1'
  end
  object sLabel4: TsLabel
    Left = 238
    Top = 56
    Width = 60
    Height = 13
    Caption = 'PL_VALUE2'
  end
  object sLabel5: TsLabel
    Left = 458
    Top = 56
    Width = 60
    Height = 13
    Caption = 'PL_VALUE3'
  end
  object GridView: TDBGridEh
    Left = -1
    Top = 76
    Width = 689
    Height = 89
    TabStop = False
    Anchors = [akLeft, akTop, akRight]
    Color = clCream
    DataSource = DSData
    DynProps = <>
    Enabled = False
    FooterParams.Color = clWindow
    GridLineParams.VertEmptySpaceStyle = dessNonEh
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghDblClickOptimizeColWidth, dghDialogFind, dghColumnResize, dghColumnMove]
    ReadOnly = True
    RowLines = 3
    RowSizingAllowed = True
    TabOrder = 1
    TitleParams.MultiTitle = True
    VertScrollBar.VisibleMode = sbNeverShowEh
    Columns = <
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'CM_NAME'
        Footers = <>
        Width = 100
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'PL_DATE_UPDATE'
        Footers = <>
        Width = 80
      end
      item
        CellButtons = <>
        DisplayFormat = '#0.00'
        DynProps = <>
        EditButtons = <>
        FieldName = 'PL_PRICE'
        Footers = <>
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'PL_VALUE1'
        Footers = <>
        Width = 100
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'PL_VALUE2'
        Footers = <>
        Width = 100
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'PL_VALUE3'
        Footers = <>
        Width = 100
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'PL_VALUE4'
        Footers = <>
        Width = 100
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'PL_VALUE5'
        Footers = <>
        Width = 100
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'PL_VALUE6'
        Footers = <>
        Width = 100
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'PL_VALUE7'
        Footers = <>
        Width = 100
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'PL_VALUE8'
        Footers = <>
        Width = 100
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'PL_VALUE9'
        Footers = <>
        Width = 100
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object EditCompany: TsEdit
    Left = 72
    Top = 8
    Width = 209
    Height = 21
    ReadOnly = True
    TabOrder = 2
    Text = 'EditCompany'
  end
  object EditAddress: TsEdit
    Left = 472
    Top = 8
    Width = 201
    Height = 21
    ReadOnly = True
    TabOrder = 3
    Text = 'EditAddress'
  end
  object BitBtnCancel: TsBitBtn
    Left = 8
    Top = 411
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
    TabOrder = 5
    OnClick = BitBtnCancelClick
    ExplicitTop = 429
  end
  object BitBtnSave: TsBitBtn
    Left = 586
    Top = 411
    Width = 105
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' (F9)'
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
    TabOrder = 0
    OnClick = BitBtnSaveClick
    ExplicitTop = 429
  end
  object EditNodeValue: TsEdit
    Left = 72
    Top = 32
    Width = 353
    Height = 21
    ReadOnly = True
    TabOrder = 4
    Text = 'EditNodeValue'
  end
  object EditCity: TsEdit
    Left = 328
    Top = 8
    Width = 97
    Height = 21
    ReadOnly = True
    TabOrder = 6
    Text = 'EditCity'
  end
  object sPanel1: TsPanel
    Left = 8
    Top = 171
    Width = 680
    Height = 222
    TabOrder = 7
    object sTextPrice: TsLabel
      Left = 10
      Top = 14
      Width = 26
      Height = 13
      Caption = #1062#1077#1085#1072
    end
    object sTextValue1: TsLabel
      Left = 14
      Top = 45
      Width = 60
      Height = 13
      Caption = 'PL_VALUE1'
    end
    object sTextValue2: TsLabel
      Left = 220
      Top = 45
      Width = 60
      Height = 13
      Caption = 'PL_VALUE2'
    end
    object sTextValue3: TsLabel
      Left = 450
      Top = 45
      Width = 60
      Height = 13
      Caption = 'PL_VALUE3'
    end
    object sTextValue4: TsLabel
      Left = 10
      Top = 105
      Width = 60
      Height = 13
      Caption = 'PL_VALUE4'
    end
    object sTextValue5: TsLabel
      Left = 220
      Top = 105
      Width = 60
      Height = 13
      Caption = 'PL_VALUE5'
    end
    object sTextValue6: TsLabel
      Left = 450
      Top = 105
      Width = 60
      Height = 13
      Caption = 'PL_VALUE6'
    end
    object sTextValue7: TsLabel
      Left = 10
      Top = 165
      Width = 60
      Height = 13
      Caption = 'PL_VALUE7'
    end
    object sTextValue8: TsLabel
      Left = 220
      Top = 165
      Width = 60
      Height = 13
      Caption = 'PL_VALUE8'
    end
    object sTextValue9: TsLabel
      Left = 450
      Top = 165
      Width = 60
      Height = 13
      Caption = 'PL_VALUE9'
    end
    object sTextOldPrice: TsLabel
      Left = 300
      Top = 13
      Width = 63
      Height = 13
      Caption = #1057#1090#1072#1088#1072#1103' '#1094#1077#1085#1072
    end
    object sOldTextValue2: TsLabel
      Left = 220
      Top = 75
      Width = 60
      Height = 13
      Caption = 'PL_VALUE2'
    end
    object sOldTextValue3: TsLabel
      Left = 450
      Top = 75
      Width = 60
      Height = 13
      Caption = 'PL_VALUE3'
    end
    object sOldTextValue1: TsLabel
      Left = 10
      Top = 75
      Width = 60
      Height = 13
      Caption = 'PL_VALUE1'
    end
    object sOldTextValue7: TsLabel
      Left = 10
      Top = 195
      Width = 60
      Height = 13
      Caption = 'PL_VALUE7'
    end
    object sOldTextValue8: TsLabel
      Left = 220
      Top = 195
      Width = 60
      Height = 13
      Caption = 'PL_VALUE8'
    end
    object sOldTextValue9: TsLabel
      Left = 450
      Top = 195
      Width = 60
      Height = 13
      Caption = 'PL_VALUE9'
    end
    object sOldTextValue4: TsLabel
      Left = 10
      Top = 135
      Width = 60
      Height = 13
      Caption = 'PL_VALUE4'
    end
    object sOldTextValue5: TsLabel
      Left = 220
      Top = 135
      Width = 60
      Height = 16
      Caption = 'PL_VALUE5'
    end
    object sOldTextValue6: TsLabel
      Left = 450
      Top = 135
      Width = 60
      Height = 13
      Caption = 'PL_VALUE6'
    end
    object sPL_PRICE: TsEdit
      Left = 80
      Top = 10
      Width = 121
      Height = 21
      TabOrder = 0
      Text = 'PL_PRICE'
    end
    object sPL_VALUE1: TsEdit
      Left = 80
      Top = 40
      Width = 121
      Height = 21
      TabOrder = 1
      Text = 'PL_VALUE1'
    end
    object sPL_VALUE2: TsEdit
      Left = 300
      Top = 40
      Width = 121
      Height = 21
      TabOrder = 2
      Text = 'PL_VALUE2'
    end
    object sPL_VALUE3: TsEdit
      Left = 520
      Top = 40
      Width = 121
      Height = 21
      TabOrder = 3
      Text = 'PL_VALUE3'
    end
    object sPL_VALUE4: TsEdit
      Left = 80
      Top = 100
      Width = 121
      Height = 21
      TabOrder = 4
      Text = 'PL_VALUE4'
    end
    object sPL_VALUE5: TsEdit
      Left = 300
      Top = 100
      Width = 121
      Height = 21
      TabOrder = 5
      Text = 'PL_VALUE5'
    end
    object sPL_VALUE6: TsEdit
      Left = 520
      Top = 100
      Width = 121
      Height = 21
      TabOrder = 6
      Text = 'PL_VALUE6'
    end
    object sPL_VALUE7: TsEdit
      Left = 80
      Top = 160
      Width = 121
      Height = 21
      TabOrder = 7
      Text = 'PL_VALUE7'
    end
    object sPL_VALUE8: TsEdit
      Left = 300
      Top = 160
      Width = 121
      Height = 21
      TabOrder = 8
      Text = 'PL_VALUE8'
    end
    object sPL_VALUE9: TsEdit
      Left = 520
      Top = 160
      Width = 121
      Height = 21
      TabOrder = 9
      Text = 'PL_VALUE9'
    end
    object sPL_OLDPRICE: TsEdit
      Left = 366
      Top = 9
      Width = 121
      Height = 21
      Enabled = False
      ReadOnly = True
      TabOrder = 10
      Text = 'PL_PRICE'
    end
    object sPL_OLDVALUE1: TsEdit
      Left = 80
      Top = 70
      Width = 121
      Height = 21
      Enabled = False
      ReadOnly = True
      TabOrder = 11
      Text = 'PL_VALUE1'
    end
    object sPL_OLDVALUE2: TsEdit
      Left = 300
      Top = 70
      Width = 121
      Height = 21
      Enabled = False
      ReadOnly = True
      TabOrder = 12
      Text = 'PL_VALUE1'
    end
    object sPL_OLDVALUE3: TsEdit
      Left = 520
      Top = 70
      Width = 121
      Height = 21
      Enabled = False
      ReadOnly = True
      TabOrder = 13
      Text = 'PL_VALUE3'
    end
    object sPL_OLDVALUE7: TsEdit
      Left = 80
      Top = 190
      Width = 121
      Height = 21
      Enabled = False
      ReadOnly = True
      TabOrder = 14
      Text = 'PL_VALUE7'
    end
    object sPL_OLDVALUE8: TsEdit
      Left = 300
      Top = 190
      Width = 121
      Height = 21
      Enabled = False
      ReadOnly = True
      TabOrder = 15
      Text = 'PL_VALUE8'
    end
    object sPL_OLDVALUE9: TsEdit
      Left = 520
      Top = 190
      Width = 121
      Height = 21
      Enabled = False
      ReadOnly = True
      TabOrder = 16
      Text = 'PL_VALUE9'
    end
    object sPL_OLDVALUE4: TsEdit
      Left = 80
      Top = 133
      Width = 121
      Height = 21
      Enabled = False
      ReadOnly = True
      TabOrder = 17
      Text = 'PL_VALUE4'
    end
    object sPL_OLDVALUE5: TsEdit
      Left = 300
      Top = 130
      Width = 121
      Height = 21
      Enabled = False
      ReadOnly = True
      TabOrder = 18
      Text = 'PL_VALUE5'
    end
    object sPL_OLDVALUE6: TsEdit
      Left = 520
      Top = 130
      Width = 121
      Height = 21
      Enabled = False
      ReadOnly = True
      TabOrder = 19
      Text = 'PL_VALUE6'
    end
  end
  object GridTable: TDBGridEh
    Left = 8
    Top = 27
    Width = 689
    Height = 89
    TabStop = False
    Anchors = [akLeft, akTop, akRight]
    Color = clCream
    DataSource = DSData
    DynProps = <>
    Enabled = False
    FooterParams.Color = clWindow
    GridLineParams.VertEmptySpaceStyle = dessNonEh
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghDblClickOptimizeColWidth, dghDialogFind, dghColumnResize, dghColumnMove]
    ReadOnly = True
    RowLines = 3
    RowSizingAllowed = True
    TabOrder = 8
    TitleParams.MultiTitle = True
    VertScrollBar.VisibleMode = sbNeverShowEh
    Columns = <
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'CM_NAME'
        Footers = <>
        Width = 100
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'PL_DATE_UPDATE'
        Footers = <>
        Width = 80
      end
      item
        CellButtons = <>
        DisplayFormat = '#0.00'
        DynProps = <>
        EditButtons = <>
        FieldName = 'PL_PRICE'
        Footers = <>
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'PL_VALUE1'
        Footers = <>
        Width = 100
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'PL_VALUE2'
        Footers = <>
        Width = 100
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'PL_VALUE3'
        Footers = <>
        Width = 100
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'PL_VALUE4'
        Footers = <>
        Width = 100
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'PL_VALUE5'
        Footers = <>
        Width = 100
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'PL_VALUE6'
        Footers = <>
        Width = 100
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'PL_VALUE7'
        Footers = <>
        Width = 100
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'PL_VALUE8'
        Footers = <>
        Width = 100
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'PL_VALUE9'
        Footers = <>
        Width = 100
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object QCompany: TUniQuery
    Connection = FormMain.ZC
    SQL.Strings = (
      'SELECT cm_id as COMPANYID, cm_city, cm_name, c.cm_comment '
      'FROM company c'
      'WHERE CM_ISCLOSED= 0 '
      'AND cm_id =:COMPANYID')
    Left = 320
    Top = 48
    ParamData = <
      item
        DataType = ftInteger
        Name = 'COMPANYID'
        ParamType = ptInput
        Value = nil
      end>
    object QCompanyCOMPANYID: TIntegerField
      FieldName = 'COMPANYID'
      Required = True
    end
    object QCompanyCM_CITY: TStringField
      FieldName = 'CM_CITY'
      Required = True
      Size = 100
    end
    object QCompanyCM_NAME: TStringField
      FieldName = 'CM_NAME'
      Size = 100
    end
    object QCompanyCM_COMMENT: TStringField
      FieldName = 'CM_COMMENT'
      Size = 255
    end
  end
  object qDataView: TUniQuery
    Connection = FormMain.ZC
    SQL.Strings = (
      'SELECT'
      'PL_ID, PL_HEADERID, PL_TREEID, PL_PRICE,'
      'PL_VALUE1, PL_VALUE2, PL_VALUE3,'
      'PL_VALUE4, PL_VALUE5, PL_VALUE6,'
      'PL_VALUE7, PL_VALUE8, PL_VALUE9,'
      'PL_ORDERBY, PL_DATE_UPDATE, PL_ISCLOSED'
      'FROM PRICE_LINES PL'
      'WHERE PL_ID =:PL_ID'
      'AND PL_ISCLOSED=0')
    Left = 504
    Top = 32
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PL_ID'
        ParamType = ptInput
        Value = 0
      end>
    object qDataViewPL_ID: TIntegerField
      FieldName = 'PL_ID'
      Required = True
    end
    object qDataViewPL_HEADERID: TIntegerField
      FieldName = 'PL_HEADERID'
      Required = True
    end
    object qDataViewPL_TREEID: TIntegerField
      FieldName = 'PL_TREEID'
    end
    object qDataViewPL_PRICE: TFloatField
      FieldName = 'PL_PRICE'
      Required = True
    end
    object qDataViewPL_VALUE1: TStringField
      FieldName = 'PL_VALUE1'
      Size = 200
    end
    object qDataViewPL_VALUE2: TStringField
      FieldName = 'PL_VALUE2'
      Size = 200
    end
    object qDataViewPL_VALUE3: TStringField
      FieldName = 'PL_VALUE3'
      Size = 200
    end
    object qDataViewPL_VALUE4: TStringField
      FieldName = 'PL_VALUE4'
      Size = 200
    end
    object qDataViewPL_VALUE5: TStringField
      FieldName = 'PL_VALUE5'
      Size = 200
    end
    object qDataViewPL_VALUE6: TStringField
      FieldName = 'PL_VALUE6'
      Size = 200
    end
    object qDataViewPL_VALUE7: TStringField
      FieldName = 'PL_VALUE7'
      Size = 200
    end
    object qDataViewPL_VALUE8: TStringField
      FieldName = 'PL_VALUE8'
      Size = 200
    end
    object qDataViewPL_VALUE9: TStringField
      FieldName = 'PL_VALUE9'
      Size = 200
    end
    object qDataViewPL_ORDERBY: TIntegerField
      FieldName = 'PL_ORDERBY'
      Required = True
    end
    object qDataViewPL_DATE_UPDATE: TDateTimeField
      FieldName = 'PL_DATE_UPDATE'
    end
    object qDataViewPL_ISCLOSED: TSmallintField
      FieldName = 'PL_ISCLOSED'
      Required = True
    end
  end
  object DSEdit: TUniDataSource
    DataSet = QPriceLinesEdit
    Left = 424
    Top = 40
  end
  object DSData: TUniDataSource
    DataSet = qDataView
    Left = 456
    Top = 40
  end
  object sSkinManager1: TsSkinManager
    ButtonsOptions.OldGlyphsMode = True
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
    Left = 32
    Top = 48
  end
  object sSkinProvider1: TsSkinProvider
    AddedTitle.Font.Charset = DEFAULT_CHARSET
    AddedTitle.Font.Color = clNone
    AddedTitle.Font.Height = -11
    AddedTitle.Font.Name = 'Tahoma'
    AddedTitle.Font.Style = []
    SkinData.SkinSection = 'FORM'
    TitleButtons = <>
    Left = 88
    Top = 64
  end
  object QPriceLinesEdit: TUniQuery
    Connection = FormMain.ZC
    SQL.Strings = (
      'SELECT'
      'PL_ID, PL_HEADERID, PL_TREEID, PL_PRICE,'
      'PL_VALUE1, PL_VALUE2, PL_VALUE3,'
      'PL_VALUE4, PL_VALUE5, PL_VALUE6,'
      'PL_VALUE7, PL_VALUE8, PL_VALUE9,'
      'PL_ORDERBY, PL_DATE_UPDATE, PL_ISCLOSED'
      'FROM PRICE_LINES PL'
      'WHERE PL_ID =:PL_ID'
      'AND PL_ISCLOSED=0')
    Left = 576
    Top = 40
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PL_ID'
        ParamType = ptInput
        Value = 0
      end>
    object QPriceLinesEditPL_ID: TIntegerField
      FieldName = 'PL_ID'
      Required = True
    end
    object QPriceLinesEditPL_HEADERID: TIntegerField
      FieldName = 'PL_HEADERID'
      Required = True
    end
    object QPriceLinesEditPL_TREEID: TIntegerField
      FieldName = 'PL_TREEID'
    end
    object QPriceLinesEditPL_PRICE: TFloatField
      FieldName = 'PL_PRICE'
      Required = True
    end
    object QPriceLinesEditPL_VALUE1: TStringField
      FieldName = 'PL_VALUE1'
      Size = 200
    end
    object QPriceLinesEditPL_VALUE2: TStringField
      FieldName = 'PL_VALUE2'
      Size = 200
    end
    object QPriceLinesEditPL_VALUE3: TStringField
      FieldName = 'PL_VALUE3'
      Size = 200
    end
    object QPriceLinesEditPL_VALUE4: TStringField
      FieldName = 'PL_VALUE4'
      Size = 200
    end
    object QPriceLinesEditPL_VALUE5: TStringField
      FieldName = 'PL_VALUE5'
      Size = 200
    end
    object QPriceLinesEditPL_VALUE6: TStringField
      FieldName = 'PL_VALUE6'
      Size = 200
    end
    object QPriceLinesEditPL_VALUE7: TStringField
      FieldName = 'PL_VALUE7'
      Size = 200
    end
    object QPriceLinesEditPL_VALUE8: TStringField
      FieldName = 'PL_VALUE8'
      Size = 200
    end
    object QPriceLinesEditPL_VALUE9: TStringField
      FieldName = 'PL_VALUE9'
      Size = 200
    end
    object QPriceLinesEditPL_ORDERBY: TIntegerField
      FieldName = 'PL_ORDERBY'
      Required = True
    end
    object QPriceLinesEditPL_DATE_UPDATE: TDateTimeField
      FieldName = 'PL_DATE_UPDATE'
    end
    object QPriceLinesEditPL_ISCLOSED: TSmallintField
      FieldName = 'PL_ISCLOSED'
      Required = True
    end
  end
  object QPriceLinesUpdate: TUniSQL
    Connection = FormMain.ZC
    SQL.Strings = (
      'UPDATE PRICE_LINES PL'
      'SET'
      'PL_PRICE = :PL_PRICE,'
      'PL_VALUE1 = :PL_VALUE1,'
      'PL_VALUE2 = :PL_VALUE2,'
      'PL_VALUE3 = :PL_VALUE3,'
      'PL_VALUE4 = :PL_VALUE4,'
      'PL_VALUE5 = :PL_VALUE5,'
      'PL_VALUE6 = :PL_VALUE6,'
      'PL_VALUE7 = :PL_VALUE7,'
      'PL_VALUE8 = :PL_VALUE8,'
      'PL_VALUE9 = :PL_VALUE9,'
      'PL_DATE_UPDATE = :PL_DATE_UPDATE'
      'WHERE PL_ID =:PL_ID')
    Left = 200
    Top = 56
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PL_PRICE'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'PL_VALUE1'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'PL_VALUE2'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'PL_VALUE3'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'PL_VALUE4'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'PL_VALUE5'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'PL_VALUE6'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'PL_VALUE7'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'PL_VALUE8'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'PL_VALUE9'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftDateTime
        Name = 'PL_DATE_UPDATE'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'PL_ID'
        Value = nil
      end>
  end
  object qDisplay: TUniQuery
    Connection = FormMain.ZC
    SQL.Strings = (
      'SELECT gs_treeid, gs_field, gs_header, gs_show,'
      'gs_size, gs_displayformat, gs_orderby FROM grid_show'
      'WHERE gs_treeid IS NULL'
      'AND gs_field NOT IN'
      '    (SELECT gs_field FROM grid_show'
      '    WHERE gs_treeid = :treeid)'
      'UNION ALL'
      'SELECT gs_treeid, gs_field, gs_header, gs_show,'
      'gs_size, gs_displayformat, gs_orderby FROM grid_show'
      'WHERE gs_treeid = :treeid')
    Left = 376
    Top = 58
    ParamData = <
      item
        DataType = ftInteger
        Name = 'treeid'
        ParamType = ptInput
        Value = nil
      end>
    object qDisplayGS_TREEID: TIntegerField
      FieldName = 'GS_TREEID'
    end
    object qDisplayGS_FIELD: TStringField
      FieldName = 'GS_FIELD'
      Size = 50
    end
    object qDisplayGS_HEADER: TStringField
      FieldName = 'GS_HEADER'
      Size = 50
    end
    object qDisplayGS_SHOW: TSmallintField
      FieldName = 'GS_SHOW'
      Required = True
    end
    object qDisplayGS_SIZE: TIntegerField
      FieldName = 'GS_SIZE'
      Required = True
    end
    object qDisplayGS_DISPLAYFORMAT: TStringField
      FieldName = 'GS_DISPLAYFORMAT'
    end
    object qDisplayGS_ORDERBY: TIntegerField
      FieldName = 'GS_ORDERBY'
    end
  end
end
