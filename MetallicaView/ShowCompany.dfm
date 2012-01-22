object FormCompaniesShow: TFormCompaniesShow
  Left = 261
  Top = 200
  Width = 987
  Height = 507
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
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object pnlRight: TPanel
    Left = 634
    Top = 0
    Width = 337
    Height = 469
    Align = alRight
    TabOrder = 0
    object pnlTop: TPanel
      Left = 1
      Top = 1
      Width = 335
      Height = 48
      Align = alTop
      TabOrder = 0
      DesignSize = (
        335
        48)
      object Panel1: TPanel
        Left = 8
        Top = 8
        Width = 321
        Height = 33
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
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
    end
    object pnlClient: TPanel
      Left = 1
      Top = 49
      Width = 335
      Height = 419
      Align = alClient
      TabOrder = 1
      DesignSize = (
        335
        419)
      object DBGridPhones: TDBGridEh
        Left = 9
        Top = 8
        Width = 320
        Height = 377
        Anchors = [akLeft, akTop, akRight, akBottom]
        AutoFitColWidths = True
        DataSource = DSPhones
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
        Columns = <
          item
            EditButtons = <>
            FieldName = 'PH_STR'
            Footers = <>
            Title.Caption = #1058#1077#1083#1077#1092#1086#1085
            Width = 104
          end
          item
            EditButtons = <>
            FieldName = 'PH_COMMENT'
            Footers = <>
            MaxWidth = 300
            MinWidth = 100
            Title.Caption = #1050#1086#1085#1090#1072#1082#1090
            Width = 156
          end
          item
            EditButtons = <>
            FieldName = 'SISCLOSED'
            Footers = <>
            Title.Caption = #1040#1082#1090#1091#1072#1083#1077#1085'?'
          end>
      end
      object btnShowPrice: TBitBtn
        Left = 14
        Top = 390
        Width = 105
        Height = 25
        Anchors = [akLeft, akBottom]
        Caption = #1055#1088#1072#1081#1089'-'#1083#1080#1089#1090
        TabOrder = 1
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
    end
  end
  object pnlLeft: TPanel
    Left = 0
    Top = 0
    Width = 634
    Height = 469
    Align = alClient
    TabOrder = 1
    object DBGridCompanies: TDBGridEh
      Left = 1
      Top = 73
      Width = 632
      Height = 395
      Align = alClient
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
      OnCellClick = DBGridCompaniesCellClick
      OnDblClick = DBGridCompaniesDblClick
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
        end
        item
          EditButtons = <>
          FieldName = 'CM_HYPERLINK'
          Footers = <>
          Title.Caption = #1055#1088#1072#1081#1089'-'#1083#1080#1089#1090
          Width = 256
        end>
    end
    object pnlLeftTop: TPanel
      Left = 1
      Top = 1
      Width = 632
      Height = 72
      Align = alTop
      TabOrder = 1
      DesignSize = (
        632
        72)
      object Panel2: TPanel
        Left = 8
        Top = 8
        Width = 241
        Height = 57
        TabOrder = 0
        object Label1: TLabel
          Left = 8
          Top = 4
          Width = 26
          Height = 13
          Caption = #1055#1086#1083#1077
        end
        object Label2: TLabel
          Left = 8
          Top = 32
          Width = 30
          Height = 13
          Caption = #1088#1072#1074#1085#1086
        end
        object cbxFilterField: TComboBox
          Left = 40
          Top = 4
          Width = 105
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 0
          OnSelect = cbxFilterFieldSelect
        end
        object btnFilterAdd: TBitBtn
          Left = 152
          Top = 8
          Width = 81
          Height = 17
          Caption = #1044#1086#1073#1072#1074#1080#1090#1100' (F2)'
          TabOrder = 1
          OnClick = btnFilterAddClick
        end
        object cbxFilterValue: TComboBox
          Left = 40
          Top = 28
          Width = 105
          Height = 21
          ItemHeight = 13
          TabOrder = 2
        end
        object btnFilterClear: TButton
          Left = 150
          Top = 32
          Width = 83
          Height = 17
          Caption = #1054#1095#1080#1089#1090#1080#1090#1100' (F3)'
          TabOrder = 3
          OnClick = btnFilterClearClick
        end
      end
      object pnlDisplayFilter: TPanel
        Left = 256
        Top = 8
        Width = 369
        Height = 57
        Alignment = taLeftJustify
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
      end
    end
  end
  object QCompany: TZQuery
    Connection = FormMain.ZC
    AfterScroll = QCompanyAfterScroll
    OnCalcFields = QCompanyCalcFields
    SQL.Strings = (
      'SELECT cm_id as COMPANYID, cm_name, c.cm_comment, '
      
        'c.cm_isclosed, c.CM_HYPERLINK, c.cm_owner, tl.tl_color, tl.tl_na' +
        'me'
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
    object QCompanyCM_HYPERLINK: TStringField
      FieldName = 'CM_HYPERLINK'
      Size = 1000
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
  object qFilter: TZReadOnlyQuery
    Connection = FormMain.ZC
    SQL.Strings = (
      'SELECT DISTINCT  /*FIELD*/'
      'FROM company left join TRUSTLEVEL tl on tl.tl_id = cm_trust'
      
        'WHERE (CM_ISCLOSED = 0) and ((cm_id = :COMPANYID) or (:COMPANYID' +
        ' = -1) )'
      '/*FILTER*/'
      'order by 1'
      '')
    Params = <
      item
        DataType = ftUnknown
        Name = 'COMPANYID'
        ParamType = ptUnknown
      end>
    Left = 88
    Top = 216
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'COMPANYID'
        ParamType = ptUnknown
      end>
  end
end
