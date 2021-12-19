object FormCompaniesShow: TFormCompaniesShow
  Left = 298
  Top = 241
  Caption = #1057#1087#1080#1089#1086#1082' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1086#1074
  ClientHeight = 613
  ClientWidth = 1013
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
    1013
    613)
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TsLabel
    Left = 8
    Top = 6
    Width = 80
    Height = 16
    Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082#1080
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object lbl2: TsLabel
    Left = 248
    Top = 6
    Width = 119
    Height = 16
    Caption = #1042#1080#1076' '#1076#1077#1103#1090#1077#1083#1100#1085#1086#1089#1090#1080
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object lbl3: TsLabel
    Left = 520
    Top = 6
    Width = 39
    Height = 16
    Caption = #1043#1086#1088#1086#1076
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object CBActive: TsCheckBox
    Left = 744
    Top = 8
    Width = 223
    Height = 20
    Caption = #1058#1086#1083#1100#1082#1086' '#1074#1099#1073#1088#1072#1085#1085#1099#1081' '#1087#1086#1089#1090#1072#1074#1097#1080#1082
    Alignment = taLeftJustify
    Anchors = [akTop, akRight]
    BiDiMode = bdLeftToRight
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
  object BitBtnClose: TsBitBtn
    Left = 928
    Top = 580
    Width = 77
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1047#1072#1082#1088#1099#1090#1100
    Default = True
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
    ModalResult = 1
    NumGlyphs = 2
    TabOrder = 3
  end
  object DBGridCompanies: TDBGridEh
    Left = 8
    Top = 28
    Width = 718
    Height = 580
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DSCompanies
    DynProps = <>
    FooterParams.Color = clWindow
    IndicatorOptions = []
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    RowLines = 3
    TabOrder = 0
    TitleParams.RowLines = 2
    OnDrawColumnCell = DBGridCompaniesDrawColumnCell
    OnTitleClick = DBGridCompaniesTitleClick
    Columns = <
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'CM_NAME'
        Footers = <>
        Title.Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082
        Width = 140
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'CM_CITY'
        Footers = <>
        Title.Caption = #1043#1086#1088#1086#1076
        Width = 90
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'CM_TRUNC_COMMENT'
        Footers = <>
        Title.Caption = #1040#1076#1088#1077#1089
        Width = 188
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'TL_NAME'
        Footers = <>
        Title.Caption = #1044#1086#1074#1077#1088#1080#1077
        Width = 102
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'SISCLOSED'
        Footers = <>
        Title.Caption = #1057#1086#1090#1088#1091#1076#1085#1080#1095#1072#1077#1084'?'
        Width = 84
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'CM_HYPERLINK'
        Footers = <>
        Title.Caption = #1055#1088#1072#1081#1089'-'#1083#1080#1089#1090
        Width = 100
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object DBGridPhones: TDBGridEh
    Left = 733
    Top = 32
    Width = 281
    Height = 537
    Anchors = [akTop, akRight, akBottom]
    DataSource = DSPhones
    DynProps = <>
    FooterParams.Color = clWindow
    IndicatorOptions = []
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleParams.RowLines = 2
    Columns = <
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'PH_STR'
        Footers = <>
        Title.Caption = #1058#1077#1083#1077#1092#1086#1085
        Width = 87
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'PH_COMMENT'
        Footers = <>
        Title.Caption = #1050#1086#1085#1090#1072#1082#1090#1085#1086#1077' '#1083#1080#1094#1086' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1072
        Width = 96
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'SISCLOSED'
        Footers = <>
        Title.Caption = #1059#1076#1072#1083#1077#1085'?'
        Width = 52
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object btnShowPrice: TsBitBtn
    Left = 733
    Top = 580
    Width = 105
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1055#1088#1072#1081#1089'-'#1083#1080#1089#1090
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      04000000000080000000232E0000232E00001000000000000000FFFFFF008080
      80000000000000800000C0C0C000006850000704780050070400000000000000
      00000000900055090400E07C2600040800000000200000000000000000000000
      0000000222222222222200010000000000020001044444444402000104000440
      4002000104000444400200010444444040023333333300400002300011130040
      0002311101034444400230101103004000023001110300400002311111034444
      2222300000030000042033333333000042000001000000002000}
    TabOrder = 4
    OnClick = btnShowPriceClick
  end
  object edtCompany: TsEdit
    Left = 96
    Top = 4
    Width = 145
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnExit = edtCompanyExit
  end
  object edtBusiness: TsEdit
    Left = 368
    Top = 4
    Width = 137
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    OnExit = edtBusinessExit
  end
  object edtCity: TsEdit
    Left = 568
    Top = 4
    Width = 137
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    OnExit = edtCityExit
  end
  object QPhones: TUniQuery
    Connection = FormMain.ZC
    SQL.Strings = (
      'select p.ph_id, p.ph_comment, p.ph_isclosed,'
      'p.ph_datebegin,u.u_login||'#39' '#39'||u.u_fio as username'
      'from phones p, phones_companies pc, users u'
      'where p.ph_id=pc.pc_phid'
      'and u.u_id=pc.pc_uid'
      'and pc.pc_company=:COMPANYID'
      'order by p.ph_isclosed, p.ph_id')
    Active = True
    Left = 536
    Top = 192
    ParamData = <
      item
        DataType = ftInteger
        Name = 'COMPANYID'
        ParamType = ptInput
        Value = 367
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
    object QPhonesPH_ID: TFloatField
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
  object QCompany: TUniQuery
    Connection = FormMain.ZC
    SQL.Strings = (
      'SELECT cm_id as COMPANYID, cm_name, cm_city, c.cm_comment,'
      
        'c.cm_isclosed, c.CM_HYPERLINK, c.cm_owner, tl.tl_level, tl.tl_co' +
        'lor , tl.tl_name'
      'FROM company c left join TRUSTLEVEL tl on tl.tl_id = c.cm_trust'
      
        'WHERE (CM_ISCLOSED = 0) and ((cm_id = :COMPANYID) or (:COMPANYID' +
        ' = -1) )'
      
        'and ((upper(cm_name COLLATE WIN1251) like '#39'%'#39'||upper(:company)||' +
        #39'%'#39') or (cast(:company as varchar(100)) ='#39#39') )'
      
        'and (upper(cm_city) like upper('#39'%'#39'||:CITY||'#39'%'#39') or (cast(:CITY a' +
        's varchar(100))  = '#39#39'))'
      
        'and ((UPPER(cm_business COLLATE WIN1251) like '#39'%'#39'||upper(:busine' +
        'ss)||'#39'%'#39' ) or (cast(:business as varchar(100)) ='#39#39') )'
      'order by c.cm_name'
      ' '
      ' ')
    Active = True
    Left = 96
    Top = 200
    ParamData = <
      item
        DataType = ftInteger
        Name = 'COMPANYID'
        ParamType = ptInput
        Value = -1
      end
      item
        DataType = ftString
        Name = 'company'
        ParamType = ptInput
        Value = ''
      end
      item
        DataType = ftString
        Name = 'CITY'
        ParamType = ptInput
        Value = ''
      end
      item
        DataType = ftString
        Name = 'business'
        ParamType = ptInput
        Value = ''
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
      FieldName = 'CM_COMMENT'
      Size = 255
    end
    object QCompanyCM_ISCLOSED: TIntegerField
      FieldName = 'CM_ISCLOSED'
    end
    object QCompanyCM_OWNER: TIntegerField
      FieldName = 'CM_OWNER'
      Required = True
    end
    object QCompanyCM_TRUNC_COMMENT: TStringField
      FieldKind = fkCalculated
      FieldName = 'CM_TRUNC_COMMENT'
      Calculated = True
    end
    object QCompanyCOMPANYID: TIntegerField
      FieldName = 'COMPANYID'
      Required = True
    end
    object QCompanyCM_CITY: TStringField
      FieldName = 'CM_CITY'
      Required = True
      Size = 100
    end
    object QCompanyTL_LEVEL: TIntegerField
      FieldName = 'TL_LEVEL'
      ReadOnly = True
    end
    object QCompanyTL_COLOR: TIntegerField
      FieldName = 'TL_COLOR'
      ReadOnly = True
    end
    object QCompanyTL_NAME: TStringField
      FieldName = 'TL_NAME'
      ReadOnly = True
      Size = 100
    end
    object QCompanyCM_HYPERLINK: TStringField
      FieldName = 'CM_HYPERLINK'
      Size = 1000
    end
  end
  object DSCompanies: TUniDataSource
    DataSet = QCompany
    Left = 176
    Top = 200
  end
  object DSPhones: TUniDataSource
    AutoEdit = False
    DataSet = QPhones
    Left = 624
    Top = 192
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
    Left = 192
    Top = 328
  end
  object sSkinProvider1: TsSkinProvider
    AddedTitle.Font.Charset = DEFAULT_CHARSET
    AddedTitle.Font.Color = clNone
    AddedTitle.Font.Height = -11
    AddedTitle.Font.Name = 'Tahoma'
    AddedTitle.Font.Style = []
    SkinData.SkinSection = 'FORM'
    TitleButtons = <>
    Left = 352
    Top = 344
  end
end
