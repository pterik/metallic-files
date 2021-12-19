object FormNewPriceRow: TFormNewPriceRow
  Left = 215
  Top = 212
  Caption = #1053#1086#1074#1072#1103' '#1089#1090#1088#1086#1082#1072' '#1087#1088#1072#1081#1089'-'#1083#1080#1089#1090#1072
  ClientHeight = 458
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
    458)
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
  object Label2: TsLabel
    Left = 8
    Top = 248
    Width = 189
    Height = 20
    Caption = #1057#1090#1072#1088#1099#1077' '#1079#1085#1072#1095#1077#1085#1080#1103' '#1089#1090#1088#1086#1082#1080
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object Label3: TsLabel
    Left = 8
    Top = 64
    Width = 181
    Height = 20
    Caption = #1053#1086#1074#1099#1077' '#1079#1085#1072#1095#1077#1085#1080#1103' '#1089#1090#1088#1086#1082#1080
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object Label4: TsLabel
    Left = 432
    Top = 8
    Width = 31
    Height = 13
    Caption = #1040#1076#1088#1077#1089
  end
  object GridView: TDBGridEh
    Left = 8
    Top = 280
    Width = 689
    Height = 137
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
    TabOrder = 2
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
    TabOrder = 3
    Text = 'EditCompany'
  end
  object EditAddress: TsEdit
    Left = 472
    Top = 8
    Width = 201
    Height = 21
    ReadOnly = True
    TabOrder = 4
    Text = 'EditAddress'
  end
  object BitBtnCancel: TsBitBtn
    Left = 8
    Top = 429
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
    OnClick = BitBtnCancelClick
  end
  object BitBtnSave: TsBitBtn
    Left = 586
    Top = 429
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
    TabOrder = 1
    OnClick = BitBtnSaveClick
  end
  object EditNodeValue: TsEdit
    Left = 72
    Top = 32
    Width = 353
    Height = 21
    ReadOnly = True
    TabOrder = 5
    Text = 'EditNodeValue'
  end
  object GridTable: TDBGridEh
    Left = 8
    Top = 88
    Width = 689
    Height = 153
    Anchors = [akLeft, akTop, akRight]
    DataSource = DSEdit
    DynProps = <>
    FooterParams.Color = clWindow
    GridLineParams.VertEmptySpaceStyle = dessNonEh
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghDblClickOptimizeColWidth, dghDialogFind, dghColumnResize, dghColumnMove]
    RowLines = 3
    RowSizingAllowed = True
    TabOrder = 0
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
  object EditCity: TsEdit
    Left = 328
    Top = 8
    Width = 97
    Height = 21
    ReadOnly = True
    TabOrder = 7
    Text = 'EditCity'
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
  end
  object qDataView: TUniQuery
    Connection = FormMain.ZC
    SQL.Strings = (
      'select * from PRICE_LINES'
      'where pl_id = :line_id')
    Left = 272
    Top = 352
    ParamData = <
      item
        DataType = ftInteger
        Name = 'line_id'
        ParamType = ptInput
        Value = nil
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
    DataSet = ZTableEdit
    Left = 136
    Top = 216
  end
  object DSData: TUniDataSource
    DataSet = qDataView
    Left = 360
    Top = 352
  end
  object ZTableEdit: TUniTable
    Connection = FormMain.ZC
    Left = 56
    Top = 208
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
    Left = 80
    Top = 16
  end
end
