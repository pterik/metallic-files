object FormUpdateCompany: TFormUpdateCompany
  Left = 390
  Top = 279
  Caption = #1048#1079#1084#1077#1085#1077#1085#1080#1077' '#1076#1072#1085#1085#1099#1093' '#1086' '#1082#1086#1084#1087#1072#1085#1080#1080
  ClientHeight = 513
  ClientWidth = 358
  Color = clBtnFace
  Constraints.MinHeight = 315
  Constraints.MinWidth = 332
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnKeyUp = FormKeyUp
  DesignSize = (
    358
    513)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TsLabel
    Left = 8
    Top = 8
    Width = 64
    Height = 16
    Caption = #1050#1086#1084#1087#1072#1085#1080#1103
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object Label2: TsLabel
    Left = 8
    Top = 224
    Width = 39
    Height = 16
    Caption = #1043#1086#1088#1086#1076
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object Label4: TsLabel
    Left = 8
    Top = 431
    Width = 174
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = #1042' '#1087#1086#1080#1089#1082#1077' '#1087#1086#1093#1086#1078#1080#1093' '#1080#1084#1105#1085' '#1091#1095#1072#1089#1090#1074#1091#1102#1090
  end
  object Label5: TsLabel
    Left = 210
    Top = 431
    Width = 65
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = #1089#1080#1084#1074#1086#1083#1072' ('#1086#1074')'
  end
  object LabelisClosed: TsLabel
    Left = 8
    Top = 457
    Width = 87
    Height = 16
    Anchors = [akLeft, akBottom]
    Caption = 'LabelisClosed'
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object Label6: TsLabel
    Left = 10
    Top = 382
    Width = 248
    Height = 13
    Anchors = [akLeft, akRight]
    Caption = #1050#1086#1085#1090#1072#1082#1090#1085#1099#1077' '#1090#1077#1083#1077#1092#1086#1085#1099' '#1082#1086#1084#1087#1072#1085#1080#1081' '#1091#1082#1072#1079#1099#1074#1072#1102#1090#1089#1103' '#1074
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object Label7: TsLabel
    Left = 10
    Top = 406
    Width = 190
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = #1086#1090#1076#1077#1083#1100#1085#1086#1084' '#1086#1082#1085#1077', '#1082#1085#1086#1087#1082#1072' "'#1058#1077#1083#1077#1092#1086#1085#1099'"'
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object Label3: TsLabel
    Left = 8
    Top = 272
    Width = 255
    Height = 16
    Caption = #1040#1076#1088#1077#1089', '#1076#1088#1091#1075#1072#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086' '#1082#1086#1084#1087#1072#1085#1080#1080
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object Label8: TsLabel
    Left = 8
    Top = 196
    Width = 57
    Height = 16
    Caption = #1044#1086#1074#1077#1088#1080#1077
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object Label9: TsLabel
    Left = 8
    Top = 56
    Width = 75
    Height = 16
    Caption = #1055#1088#1072#1081#1089'-'#1083#1080#1089#1090
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object btnSelectPrice: TsSpeedButton
    Left = 328
    Top = 72
    Width = 23
    Height = 22
    Caption = '...'
    OnClick = btnSelectPriceClick
  end
  object lblBusiness: TsLabel
    Left = 8
    Top = 100
    Width = 230
    Height = 16
    Caption = #1042#1080#1076#1099' '#1076#1077#1103#1090#1077#1083#1100#1085#1086#1089#1090#1080' '#1095#1077#1088#1077#1079' '#1079#1072#1087#1103#1090#1091#1102
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object EditCompany: TsEdit
    Left = 8
    Top = 24
    Width = 343
    Height = 24
    Anchors = [akLeft, akTop, akRight]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    Text = 'EditCompany'
  end
  object MEChars: TsMaskEdit
    Left = 186
    Top = 428
    Width = 18
    Height = 21
    TabStop = False
    Anchors = [akLeft, akBottom]
    MaxLength = 1
    TabOrder = 6
    CheckOnExit = True
    EditMask = '9;1;_'
    Text = ' '
    ReadOnly = True
  end
  object BitBtnCancel: TsBitBtn
    Left = 24
    Top = 480
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
    TabOrder = 7
    OnClick = BitBtnCancelClick
  end
  object EditComment: TsMemo
    Left = 8
    Top = 296
    Width = 347
    Height = 81
    Anchors = [akLeft, akTop, akRight]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Lines.Strings = (
      'EditComment')
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 5
    Text = 'EditComment'#13#10
  end
  object BitBtnSave: TsBitBtn
    Left = 245
    Top = 480
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
    TabOrder = 8
    OnClick = BitBtnSaveClick
  end
  object EditCity: TsEdit
    Left = 8
    Top = 240
    Width = 343
    Height = 24
    Anchors = [akLeft, akTop, akRight]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    Text = 'EditCity'
  end
  object CBTrustLevel: TsComboBox
    Left = 80
    Top = 192
    Width = 265
    Height = 24
    TabOrder = 3
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Text = 'CBTrustLevel'
  end
  object txtPriceList: TsEdit
    Left = 8
    Top = 72
    Width = 321
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object mmoBusiness: TsMemo
    Left = 8
    Top = 120
    Width = 337
    Height = 75
    Anchors = [akLeft, akTop, akRight, akBottom]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ScrollBars = ssVertical
    ShowHint = False
    TabOrder = 2
  end
  object SelectPriceDialog: TsOpenDialog
    Filter = 'Excel|*.xls;*xlsx|All|*.*'
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Left = 176
    Top = 216
  end
  object QTrustLevel: TUniQuery
    Connection = FormMain.ZC
    SQL.Strings = (
      'select TL_ID, TL_LEVEL, TL_COLOR, TL_NAME'
      'from TRUSTLEVEL'
      'where TL_ISCLOSED = 0'
      'order by TL_ORDERBY')
    Left = 288
    Top = 224
    object QTrustLevelTL_ID: TIntegerField
      FieldName = 'TL_ID'
      Required = True
    end
    object QTrustLevelTL_LEVEL: TIntegerField
      FieldName = 'TL_LEVEL'
    end
    object QTrustLevelTL_COLOR: TIntegerField
      FieldName = 'TL_COLOR'
      Required = True
    end
    object QTrustLevelTL_NAME: TStringField
      FieldName = 'TL_NAME'
      Size = 100
    end
  end
  object QCompany: TUniQuery
    Connection = FormMain.ZC
    SQL.Strings = (
      
        'SELECT cm_id, cm_city, cm_name, cm_trust, cm_comment, cm_isclose' +
        'd, '
      'CM_HYPERLINK, CM_BUSINESS'
      'FROM company'
      'WHERE cm_id=:COMPANYID')
    Left = 112
    Top = 152
    ParamData = <
      item
        DataType = ftInteger
        Name = 'COMPANYID'
        ParamType = ptInput
        Value = nil
      end>
    object QCompanyCM_ID: TIntegerField
      FieldName = 'CM_ID'
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
    object QCompanyCM_TRUST: TIntegerField
      FieldName = 'CM_TRUST'
      Required = True
    end
    object QCompanyCM_COMMENT: TStringField
      FieldName = 'CM_COMMENT'
      Size = 255
    end
    object QCompanyCM_ISCLOSED: TIntegerField
      FieldName = 'CM_ISCLOSED'
    end
    object QCompanyCM_HYPERLINK: TStringField
      FieldName = 'CM_HYPERLINK'
      Size = 1000
    end
    object QCompanyCM_BUSINESS: TStringField
      FieldName = 'CM_BUSINESS'
      Required = True
      Size = 100
    end
  end
  object DSTrust: TUniDataSource
    DataSet = QTrustLevel
    Left = 224
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
    Left = 72
    Top = 8
  end
end
