object FormNewPriceRow: TFormNewPriceRow
  Left = 215
  Top = 212
  Caption = #1053#1086#1074#1072#1103' '#1089#1090#1088#1086#1082#1072' '#1087#1088#1072#1081#1089'-'#1083#1080#1089#1090#1072
  ClientHeight = 266
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
    266)
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
  object EditCompany: TsEdit
    Left = 72
    Top = 8
    Width = 209
    Height = 21
    ReadOnly = True
    TabOrder = 1
    Text = 'EditCompany'
  end
  object EditAddress: TsEdit
    Left = 472
    Top = 8
    Width = 201
    Height = 21
    ReadOnly = True
    TabOrder = 2
    Text = 'EditAddress'
  end
  object BitBtnCancel: TsBitBtn
    Left = 8
    Top = 237
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
    TabOrder = 4
    OnClick = BitBtnCancelClick
    ExplicitTop = 428
  end
  object BitBtnSave: TsBitBtn
    Left = 586
    Top = 237
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
    ExplicitTop = 428
  end
  object EditNodeValue: TsEdit
    Left = 72
    Top = 32
    Width = 353
    Height = 21
    ReadOnly = True
    TabOrder = 3
    Text = 'EditNodeValue'
  end
  object EditCity: TsEdit
    Left = 328
    Top = 8
    Width = 97
    Height = 21
    ReadOnly = True
    TabOrder = 5
    Text = 'EditCity'
  end
  object sPanel1: TsPanel
    Left = 8
    Top = 59
    Width = 672
    Height = 159
    TabOrder = 6
    object sLabel2: TsLabel
      Left = 10
      Top = 14
      Width = 26
      Height = 13
      Caption = #1062#1077#1085#1072
    end
    object sL1: TsLabel
      Left = 11
      Top = 48
      Width = 60
      Height = 13
      Caption = 'PL_VALUE1'
    end
    object sL2: TsLabel
      Left = 11
      Top = 83
      Width = 60
      Height = 13
      Caption = 'PL_VALUE2'
    end
    object sL3: TsLabel
      Left = 11
      Top = 123
      Width = 60
      Height = 13
      Caption = 'PL_VALUE3'
    end
    object sL4: TsLabel
      Left = 232
      Top = 48
      Width = 60
      Height = 13
      Caption = 'PL_VALUE4'
    end
    object sL5: TsLabel
      Left = 234
      Top = 80
      Width = 60
      Height = 13
      Caption = 'PL_VALUE5'
    end
    object sL6: TsLabel
      Left = 234
      Top = 122
      Width = 60
      Height = 13
      Caption = 'PL_VALUE6'
    end
    object sL7: TsLabel
      Left = 456
      Top = 48
      Width = 60
      Height = 13
      Caption = 'PL_VALUE7'
    end
    object sL8: TsLabel
      Left = 456
      Top = 77
      Width = 60
      Height = 13
      Caption = 'PL_VALUE8'
    end
    object sL9: TsLabel
      Left = 456
      Top = 120
      Width = 60
      Height = 13
      Caption = 'PL_VALUE9'
    end
    object sPL_PRICE: TsEdit
      Left = 76
      Top = 11
      Width = 121
      Height = 21
      TabOrder = 0
      Text = 'PL_PRICE'
    end
    object sPL_VALUE1: TsEdit
      Left = 77
      Top = 45
      Width = 121
      Height = 21
      TabOrder = 1
      Text = 'PL_VALUE1'
    end
    object sPL_VALUE2: TsEdit
      Left = 77
      Top = 80
      Width = 121
      Height = 21
      TabOrder = 2
      Text = 'PL_VALUE2'
    end
    object sPL_VALUE3: TsEdit
      Left = 77
      Top = 118
      Width = 121
      Height = 21
      TabOrder = 3
      Text = 'PL_VALUE3'
    end
    object sPL_VALUE4: TsEdit
      Left = 298
      Top = 45
      Width = 121
      Height = 21
      TabOrder = 4
      Text = 'PL_VALUE4'
    end
    object sPL_VALUE5: TsEdit
      Left = 298
      Top = 77
      Width = 121
      Height = 21
      TabOrder = 5
      Text = 'PL_VALUE5'
    end
    object sPL_VALUE6: TsEdit
      Left = 300
      Top = 119
      Width = 121
      Height = 21
      TabOrder = 6
      Text = 'PL_VALUE6'
    end
    object sPL_VALUE7: TsEdit
      Left = 528
      Top = 45
      Width = 121
      Height = 21
      TabOrder = 7
      Text = 'PL_VALUE7'
    end
    object sPL_VALUE8: TsEdit
      Left = 528
      Top = 77
      Width = 121
      Height = 21
      TabOrder = 8
      Text = 'PL_VALUE8'
    end
    object sPL_VALUE9: TsEdit
      Left = 528
      Top = 117
      Width = 121
      Height = 21
      TabOrder = 9
      Text = 'PL_VALUE9'
    end
  end
  object QCompany: TUniQuery
    Connection = FormMain.ZC
    SQL.Strings = (
      'SELECT cm_id as COMPANYID, cm_city, cm_name, c.cm_comment '
      'FROM company c'
      'WHERE CM_ISCLOSED= 0 '
      'AND cm_id =:COMPANYID')
    Left = 208
    Top = 8
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
    Left = 560
    Top = 40
  end
  object sSkinProvider1: TsSkinProvider
    AddedTitle.Font.Charset = DEFAULT_CHARSET
    AddedTitle.Font.Color = clNone
    AddedTitle.Font.Height = -11
    AddedTitle.Font.Name = 'Tahoma'
    AddedTitle.Font.Style = []
    SkinData.SkinSection = 'FORM'
    TitleButtons = <>
    Left = 488
    Top = 48
  end
  object UniSQLRowInsert: TUniSQL
    Connection = FormMain.ZC
    SQL.Strings = (
      'insert into price_lines (PL_HEADERID, PL_TREEID, PL_PRICE,'
      'PL_VALUE1, PL_VALUE2, PL_VALUE3,'
      'PL_VALUE4, PL_VALUE5, PL_VALUE6,'
      'PL_VALUE7, PL_VALUE8, PL_VALUE9,'
      'PL_ORDERBY, PL_DATE_UPDATE, PL_ISCLOSED)'
      'values(:PL_HEADERID, :PL_TREEID, :PL_PRICE,'
      ':PL_VALUE1, :PL_VALUE2, :PL_VALUE3,'
      ':PL_VALUE4, :PL_VALUE5, :PL_VALUE6,'
      ':PL_VALUE7, :PL_VALUE8, :PL_VALUE9,'
      ':PL_ORDERBY, :PL_DATE_UPDATE, 0)')
    Left = 440
    Top = 40
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PL_HEADERID'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'PL_TREEID'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftFloat
        Name = 'PL_PRICE'
        ParamType = ptInput
        Value = 0.000000000000000000
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
        DataType = ftInteger
        Name = 'PL_ORDERBY'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftDateTime
        Name = 'PL_DATE_UPDATE'
        ParamType = ptInput
        Value = nil
      end>
  end
  object QueryFieldNames: TUniQuery
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
    Left = 624
    Top = 40
    ParamData = <
      item
        DataType = ftInteger
        Name = 'treeid'
        ParamType = ptInput
        Value = 189
      end>
    object QueryFieldNamesGS_TREEID: TIntegerField
      FieldName = 'GS_TREEID'
    end
    object QueryFieldNamesGS_FIELD: TStringField
      FieldName = 'GS_FIELD'
      Size = 50
    end
    object QueryFieldNamesGS_HEADER: TStringField
      FieldName = 'GS_HEADER'
      Size = 50
    end
    object QueryFieldNamesGS_SHOW: TSmallintField
      FieldName = 'GS_SHOW'
      Required = True
    end
    object QueryFieldNamesGS_SIZE: TIntegerField
      FieldName = 'GS_SIZE'
      Required = True
    end
    object QueryFieldNamesGS_DISPLAYFORMAT: TStringField
      FieldName = 'GS_DISPLAYFORMAT'
    end
    object QueryFieldNamesGS_ORDERBY: TIntegerField
      FieldName = 'GS_ORDERBY'
    end
  end
end
