object FormCompaniesShow: TFormCompaniesShow
  Left = 298
  Top = 241
  Width = 930
  Height = 497
  Caption = #1057#1087#1080#1089#1086#1082' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1086#1074
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
    914
    459)
  PixelsPerInch = 96
  TextHeight = 13
  object CBActive: TCheckBox
    Left = 645
    Top = 8
    Width = 221
    Height = 20
    Alignment = taLeftJustify
    Anchors = [akTop, akRight]
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
    TabOrder = 1
    OnClick = CBActiveClick
  end
  object BitBtnClose: TBitBtn
    Left = 838
    Top = 432
    Width = 77
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1047#1072#1082#1088#1099#1090#1100
    Default = True
    ModalResult = 1
    TabOrder = 3
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
    NumGlyphs = 2
  end
  object DBGridCompanies: TDBGridEh
    Left = 8
    Top = 8
    Width = 619
    Height = 449
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DSCompanies
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    RowLines = 3
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
        Title.Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082
        Width = 140
      end
      item
        EditButtons = <>
        FieldName = 'CM_CITY'
        Footers = <>
        Title.Caption = #1043#1086#1088#1086#1076
        Width = 90
      end
      item
        EditButtons = <>
        FieldName = 'CM_TRUNC_COMMENT'
        Footers = <>
        Title.Caption = #1040#1076#1088#1077#1089
        Width = 188
      end
      item
        EditButtons = <>
        FieldName = 'TL_NAME'
        Footers = <>
        Title.Caption = #1044#1086#1074#1077#1088#1080#1077
        Width = 102
      end
      item
        EditButtons = <>
        FieldName = 'SISCLOSED'
        Footers = <>
        Title.Caption = #1057#1086#1090#1088#1091#1076#1085#1080#1095#1072#1077#1084'?'
        Width = 84
      end
      item
        EditButtons = <>
        FieldName = 'CM_HYPERLINK'
        Footers = <>
        Title.Caption = #1055#1088#1072#1081#1089'-'#1083#1080#1089#1090
        Width = 100
      end>
  end
  object DBGridPhones: TDBGridEh
    Left = 634
    Top = 32
    Width = 281
    Height = 393
    Anchors = [akTop, akRight, akBottom]
    DataSource = DSPhones
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
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
        Width = 87
      end
      item
        EditButtons = <>
        FieldName = 'PH_COMMENT'
        Footers = <>
        Title.Caption = #1050#1086#1085#1090#1072#1082#1090#1085#1086#1077' '#1083#1080#1094#1086' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1072
        Width = 96
      end
      item
        EditButtons = <>
        FieldName = 'SISCLOSED'
        Footers = <>
        Title.Caption = #1059#1076#1072#1083#1077#1085'?'
        Width = 52
      end>
  end
  object btnShowPrice: TBitBtn
    Left = 640
    Top = 430
    Width = 105
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1055#1088#1072#1081#1089'-'#1083#1080#1089#1090
    TabOrder = 4
    OnClick = btnShowPriceClick
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      04000000000080000000232E0000232E00001000000000000000FFFFFF008080
      80000000000000800000C0C0C000006850000704780050070400000000000000
      00000000900055090400E07C2600040800000000200000000000000000000000
      0000000222222222222200010000000000020001044444444402000104000440
      4002000104000444400200010444444040023333333300400002300011130040
      0002311101034444400230101103004000023001110300400002311111034444
      2222300000030000042033333333000042000001000000002000}
  end
  object QCompany: TZQuery
    Connection = FormMain.ZC
    AfterScroll = QCompanyAfterScroll
    OnCalcFields = QCompanyCalcFields
    SQL.Strings = (
      'SELECT cm_id as COMPANYID, cm_name, cm_city, c.cm_comment,'
      
        'c.cm_isclosed, c.CM_HYPERLINK, c.cm_owner, tl.tl_level, tl.tl_co' +
        'lor , tl.tl_name'
      'FROM company c left join TRUSTLEVEL tl on tl.tl_id = c.cm_trust'
      
        'WHERE (CM_ISCLOSED = 0) and ((cm_id = :COMPANYID) or (:COMPANYID' +
        ' = -1) )'
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
    object QCompanyCM_CITY: TStringField
      FieldName = 'CM_CITY'
      Size = 100
    end
    object QCompanyTL_LEVEL: TIntegerField
      FieldName = 'TL_LEVEL'
    end
    object QCompanyTL_COLOR: TIntegerField
      FieldName = 'TL_COLOR'
      Required = True
    end
    object QCompanyTL_NAME: TStringField
      FieldName = 'TL_NAME'
      Size = 100
    end
    object QCompanyCM_HYPERLINK: TStringField
      FieldName = 'CM_HYPERLINK'
      Size = 256
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
