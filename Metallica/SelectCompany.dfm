object FormSelectCompany: TFormSelectCompany
  Left = 234
  Top = 207
  Width = 790
  Height = 497
  Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1082#1086#1084#1087#1072#1085#1080#1102' '#1076#1074#1086#1081#1085#1099#1084' '#1097#1077#1083#1095#1082#1086#1084' '#1080#1079' '#1089#1087#1080#1089#1082#1072' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1086#1074
  Color = clBtnFace
  Constraints.MinHeight = 250
  Constraints.MinWidth = 790
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  DesignSize = (
    782
    463)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 424
    Width = 491
    Height = 24
    Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1085#1091#1078#1085#1091#1102' '#1082#1086#1084#1087#1072#1085#1080#1102' '#1076#1074#1086#1081#1085#1099#1084' '#1097#1077#1083#1095#1082#1086#1084' '#1085#1072' '#1085#1077#1081
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object DBGridCompanies: TDBGridEh
    Left = 0
    Top = 0
    Width = 777
    Height = 409
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DSCompanies
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleLines = 2
    OnDblClick = DBGridCompaniesDblClick
    OnTitleClick = DBGridCompaniesTitleClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'CM_NAME'
        Footers = <>
        Title.Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082
        Width = 227
      end
      item
        EditButtons = <>
        FieldName = 'SISFINISHED'
        Footers = <>
        Title.Caption = #1055#1088#1072#1081#1089' '#1079#1072#1087#1086#1083#1085#1077#1085'?'
        Width = 99
      end
      item
        EditButtons = <>
        FieldName = 'CM_CITY'
        Footers = <>
        Title.Caption = #1043#1086#1088#1086#1076
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'CM_TRUNC_COMMENT'
        Footers = <>
        Title.Caption = #1040#1076#1088#1077#1089
        Width = 231
      end>
  end
  object BitBtnCancel: TBitBtn
    Left = 632
    Top = 424
    Width = 131
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 1
    OnClick = BitBtnCancelClick
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
    NumGlyphs = 2
  end
  object QCompany: TZQuery
    Connection = FormMain.ZC
    OnCalcFields = QCompanyCalcFields
    Active = True
    SQL.Strings = (
      'SELECT fn.*,'
      '    (SELECT ph_isfinished FROM price_headers cm'
      '    WHERE fn.maxph_id=cm.ph_id) ph_isfinished'
      'FROM'
      '(SELECT cm_id AS COMPANYID, cm_name, cm_city, cm_comment,'
      '    (SELECT MAX(ph_id) ph_id FROM price_headers'
      '    WHERE ph_companyid=c.cm_id'
      '    AND ph_isclosed =0) maxph_id'
      'FROM company c'
      'WHERE cm_isclosed =0) fn'
      'ORDER BY cm_name')
    Params = <>
    WhereMode = wmWhereAll
    Options = []
    Left = 80
    Top = 112
    object QCompanyCM_NAME: TStringField
      FieldName = 'CM_NAME'
      Size = 100
    end
    object QCompanyCM_CITY: TStringField
      FieldName = 'CM_CITY'
      Size = 100
    end
    object QCompanyCM_COMMENT: TStringField
      DisplayWidth = 1024
      FieldName = 'CM_COMMENT'
      Size = 255
    end
    object QCompanyCM_TRUNC_COMMENT: TStringField
      FieldKind = fkCalculated
      FieldName = 'CM_TRUNC_COMMENT'
      Size = 1024
      Calculated = True
    end
    object QCompanyCOMPANYID: TIntegerField
      FieldName = 'COMPANYID'
      Required = True
    end
    object QCompanyMAXPH_ID: TIntegerField
      FieldName = 'MAXPH_ID'
      ReadOnly = True
    end
    object QCompanyPH_ISFINISHED: TSmallintField
      FieldName = 'PH_ISFINISHED'
      ReadOnly = True
    end
    object QCompanySISFINISHED: TStringField
      FieldKind = fkCalculated
      FieldName = 'SISFINISHED'
      Calculated = True
    end
  end
  object DSCompanies: TDataSource
    DataSet = QCompany
    Left = 176
    Top = 120
  end
  object qPriceHeader: TZReadOnlyQuery
    Connection = FormMain.ZC
    SQL.Strings = (
      'select max(ph_id) ph_id from price_headers'
      'where ph_companyid=:companyid'
      'and ph_isclosed =0')
    Params = <
      item
        DataType = ftUnknown
        Name = 'companyid'
        ParamType = ptUnknown
      end>
    Left = 288
    Top = 120
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'companyid'
        ParamType = ptUnknown
      end>
    object qPriceHeaderPH_ID: TIntegerField
      FieldName = 'PH_ID'
      ReadOnly = True
    end
  end
  object QNewHeader: TZQuery
    Connection = FormMain.ZC
    SQL.Strings = (
      
        'INSERT INTO PRICE_HEADERS (PH_COMPANYID, PH_DATE_INSERT, PH_ISCL' +
        'OSED)'
      'VALUES (:COMPANYID, :DATE_INSERT, 0)')
    Params = <
      item
        DataType = ftUnknown
        Name = 'COMPANYID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATE_INSERT'
        ParamType = ptUnknown
      end>
    Left = 376
    Top = 120
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'COMPANYID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATE_INSERT'
        ParamType = ptUnknown
      end>
  end
end
