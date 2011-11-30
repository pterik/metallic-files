object FormCompaniesShow: TFormCompaniesShow
  Left = 264
  Top = 264
  Width = 900
  Height = 500
  Caption = #1057#1087#1080#1089#1086#1082' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1086#1074
  Color = clBtnFace
  Constraints.MinHeight = 500
  Constraints.MinWidth = 900
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  object DBGridCompanies: TDBGridEh
    Left = 0
    Top = 0
    Width = 542
    Height = 449
    AutoFitColWidths = True
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
    OnDrawColumnCell = DBGridCompaniesDrawColumnCell
    OnTitleClick = DBGridCompaniesTitleClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'CM_NAME'
        Footers = <>
        MaxWidth = 400
        MinWidth = 250
        Title.Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082
        Width = 296
      end
      item
        EditButtons = <>
        FieldName = 'CM_TRUNC_COMMENT'
        Footers = <>
        Title.Caption = #1040#1076#1088#1077#1089
        Width = 132
      end
      item
        EditButtons = <>
        FieldName = 'TL_NAME'
        Footers = <>
        Title.Caption = #1044#1086#1074#1077#1088#1080#1077
        Width = 111
      end>
  end
  object DBGridPhones: TDBGridEh
    Left = 553
    Top = 32
    Width = 317
    Height = 417
    AutoFitColWidths = True
    DataSource = DSPhones
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleLines = 2
    Columns = <
      item
        EditButtons = <>
        FieldName = 'PH_STR'
        Footers = <>
        Title.Caption = #1058#1077#1083#1077#1092#1086#1085
        Width = 51
      end
      item
        EditButtons = <>
        FieldName = 'PH_COMMENT'
        Footers = <>
        MaxWidth = 300
        MinWidth = 200
        Title.Caption = #1050#1086#1085#1090#1072#1082#1090#1085#1086#1077' '#1083#1080#1094#1086' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1072
        Width = 200
      end
      item
        EditButtons = <>
        FieldName = 'SISCLOSED'
        Footers = <>
        Title.Caption = #1040#1082#1090#1091#1072#1083#1077#1085'?'
      end>
  end
  object Panel1: TPanel
    Left = 544
    Top = 0
    Width = 329
    Height = 33
    TabOrder = 2
    object CBActive: TCheckBox
      Left = 36
      Top = 5
      Width = 221
      Height = 20
      Alignment = taLeftJustify
      BiDiMode = bdLeftToRight
      Caption = #1058#1086#1083#1100#1082#1086' '#1074#1099#1073#1088#1072#1085#1085#1099#1081' '#1087#1086#1089#1090#1072#1074#1097#1080#1082
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentBiDiMode = False
      ParentFont = False
      State = cbChecked
      TabOrder = 0
      OnClick = CBActiveClick
    end
  end
  object QCompany: TZQuery
    Connection = FormMain.ZC
    AfterScroll = QCompanyAfterScroll
    OnCalcFields = QCompanyCalcFields
    SQL.Strings = (
      'SELECT cm_id as COMPANYID, cm_name, c.cm_comment, '
      'c.cm_isclosed, c.cm_owner, tl.tl_color, tl.tl_name'
      'FROM company c'
      'left join TRUSTLEVEL tl on tl.tl_id = c.cm_trust'
      'WHERE (CM_ISCLOSED = 0)'
      'and ((cm_id = :COMPANYID) or (:COMPANYID = -1) )'
      'order by c.cm_name')
    Params = <
      item
        DataType = ftUnknown
        Name = 'COMPANYID'
        ParamType = ptUnknown
      end>
    WhereMode = wmWhereAll
    Options = []
    Left = 96
    Top = 120
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'COMPANYID'
        ParamType = ptUnknown
      end>
    object QCompanySISCLOSED: TStringField
      FieldKind = fkCalculated
      FieldName = 'SISCLOSED'
      Calculated = True
    end
    object QCompanyCM_NAME: TStringField
      FieldName = 'CM_NAME'
      Size = 100
    end
    object QCompanyCM_COMMENT: TStringField
      DisplayWidth = 1024
      FieldName = 'CM_COMMENT'
      Size = 255
    end
    object QCompanyCM_ISCLOSED: TIntegerField
      FieldName = 'CM_ISCLOSED'
    end
    object QCompanyCM_OWNER: TIntegerField
      FieldName = 'CM_OWNER'
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
    object QCompanyTL_NAME: TStringField
      FieldName = 'TL_NAME'
      Size = 100
    end
    object QCompanyTL_COLOR: TIntegerField
      FieldName = 'TL_COLOR'
      Required = True
    end
  end
  object DSCompanies: TDataSource
    DataSet = QCompany
    Left = 176
    Top = 120
  end
  object QPhones: TZQuery
    Connection = FormMain.ZC
    OnCalcFields = QPhonesCalcFields
    SQL.Strings = (
      'select p.ph_id, p.ph_comment, p.ph_isclosed,'
      'p.ph_datebegin,u.u_login||'#39' '#39'||u.u_fio as username'
      'from phones p, phones_companies pc, users u'
      'where p.ph_id=pc.pc_phid'
      'and u.u_id=pc.pc_uid'
      'and pc.pc_company=:COMPANYID'
      'order by p.ph_isclosed, p.ph_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'COMPANYID'
        ParamType = ptUnknown
      end>
    WhereMode = wmWhereAll
    Options = []
    Left = 536
    Top = 104
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'COMPANYID'
        ParamType = ptUnknown
      end>
    object QPhonesPH_COMMENT: TStringField
      FieldName = 'PH_COMMENT'
      Size = 100
    end
    object QPhonesPH_DATEBEGIN: TDateField
      FieldName = 'PH_DATEBEGIN'
    end
    object QPhonesUSERNAME: TStringField
      FieldName = 'USERNAME'
      ReadOnly = True
      Size = 81
    end
    object QPhonesPH_ID: TLargeintField
      FieldName = 'PH_ID'
      Required = True
    end
    object QPhonesPH_STR: TStringField
      FieldKind = fkCalculated
      FieldName = 'PH_STR'
      Calculated = True
    end
    object QPhonesWHO_WHERE: TStringField
      FieldKind = fkCalculated
      FieldName = 'WHO_WHERE'
      Calculated = True
    end
    object QPhonesPH_ISCLOSED: TSmallintField
      FieldName = 'PH_ISCLOSED'
      Required = True
    end
    object QPhonesSISCLOSED: TStringField
      FieldKind = fkCalculated
      FieldName = 'SISCLOSED'
      Calculated = True
    end
  end
  object DSPhones: TDataSource
    AutoEdit = False
    DataSet = QPhones
    Left = 624
    Top = 104
  end
end
