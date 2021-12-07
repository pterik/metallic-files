object FormUpdateContact: TFormUpdateContact
  Left = 375
  Top = 305
  Width = 360
  Height = 453
  Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1086#1090#1082#1088#1099#1090#1086#1077' '#1086#1073#1103#1079#1072#1090#1077#1083#1100#1089#1090#1074#1086
  Color = clBtnFace
  Constraints.MinHeight = 425
  Constraints.MinWidth = 360
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnKeyUp = FormKeyUp
  DesignSize = (
    352
    426)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TsLabel
    Left = 0
    Top = 0
    Width = 64
    Height = 16
    Caption = #1050#1086#1084#1087#1072#1085#1080#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object StaticText2: TStaticText
    Left = 0
    Top = 64
    Width = 105
    Height = 41
    AutoSize = False
    Caption = #1055#1086#1076#1088#1086#1073#1085#1099#1081' '#1082#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
  end
  object MemoComment: TsMemo
    Left = 120
    Top = 56
    Width = 225
    Height = 69
    Anchors = [akLeft, akTop, akRight, akBottom]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Lines.Strings = (
      'MemoComment')
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object StaticText3: TStaticText
    Left = 0
    Top = 24
    Width = 121
    Height = 33
    AutoSize = False
    Caption = #1050#1086#1085#1090#1072#1082#1090#1085#1086#1077' '#1083#1080#1094#1086' '#1082#1083#1080#1077#1085#1090#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
  end
  object EContacter: TsEdit
    Left = 120
    Top = 32
    Width = 226
    Height = 24
    Anchors = [akLeft, akTop, akRight]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    Text = 'EContacter'
  end
  object GroupBox1: TsGroupBox
    Left = 0
    Top = 132
    Width = 347
    Height = 249
    Anchors = [akLeft, akRight, akBottom]
    Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1072#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080' '#1089#1086#1079#1072#1074#1072#1077#1084#1099#1093' '#1079#1072#1076#1072#1085#1080#1081
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    DesignSize = (
      347
      249)
    object Label5: TsLabel
      Left = 16
      Top = 24
      Width = 103
      Height = 16
      Caption = #1055#1077#1088#1080#1086#1076#1080#1095#1085#1086#1089#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object LabelParameter: TsLabel
      Left = 16
      Top = 84
      Width = 97
      Height = 16
      Caption = 'LabelParameter'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TsLabel
      Left = 8
      Top = 217
      Width = 71
      Height = 16
      Caption = #1050#1086#1085#1090#1088#1086#1083#1105#1088
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TsLabel
      Left = 8
      Top = 104
      Width = 87
      Height = 16
      Caption = #1048#1089#1087#1086#1083#1085#1080#1090#1077#1083#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TsLabel
      Left = 8
      Top = 132
      Width = 83
      Height = 16
      Caption = #1058#1080#1087' '#1079#1072#1076#1072#1085#1080#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object DBPeriod: TDBLookupComboboxEh
      Left = 160
      Top = 24
      Width = 137
      Height = 24
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      KeyField = 'PR_ID'
      ListField = 'PR_COMMENT'
      ListSource = DSPeriod
      ParentFont = False
      TabOrder = 0
      Visible = True
      OnExit = DBPeriodExit
    end
    object StaticText4: TStaticText
      Left = 16
      Top = 40
      Width = 121
      Height = 41
      Alignment = taCenter
      AutoSize = False
      Caption = #1044#1072#1090#1072' '#1089#1083#1077#1076#1091#1102#1097#1077#1075#1086' '#1079#1072#1076#1072#1085#1080#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
    end
    object DT: TDateTimePicker
      Left = 160
      Top = 49
      Width = 137
      Height = 24
      Date = 39121.740475925920000000
      Time = 39121.740475925920000000
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnExit = DTExit
    end
    object StaticText5: TStaticText
      Left = 8
      Top = 160
      Width = 129
      Height = 49
      AutoSize = False
      Caption = #1058#1077#1082#1089#1090' '#1072#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080' '#1089#1086#1079#1076#1072#1085#1085#1099#1093' '#1079#1072#1076#1072#1085#1080#1081
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
    end
    object MemoJobComment: TsMemo
      Left = 144
      Top = 160
      Width = 195
      Height = 49
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Lines.Strings = (
        'MemoJobComment')
      ParentFont = False
      ScrollBars = ssVertical
      TabOrder = 4
    end
    object DBOwner: TDBLookupComboboxEh
      Left = 112
      Top = 216
      Width = 226
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      KeyField = 'U_FIO'
      ListField = 'U_FIO_PLUS_BOSS'
      ListSource = DSOwner
      ParentFont = False
      TabOrder = 5
      Visible = True
    end
    object DBManager: TDBLookupComboboxEh
      Left = 112
      Top = 104
      Width = 226
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      KeyField = 'U_ID'
      ListField = 'U_FIO_PLUS_BOSS'
      ListSource = DSManager
      ParentFont = False
      TabOrder = 2
      Visible = True
    end
    object DBJobType: TDBLookupComboboxEh
      Left = 112
      Top = 130
      Width = 226
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      KeyField = 'JT_ID'
      ListField = 'JT_NAME'
      ListSource = DSJobtype
      ParentFont = False
      TabOrder = 3
      Visible = True
    end
    object STDate: TStaticText
      Left = 160
      Top = 48
      Width = 20
      Height = 20
      Alignment = taCenter
      Caption = #1044'1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
    end
  end
  object DBCompanies: TDBLookupComboboxEh
    Left = 120
    Top = 2
    Width = 226
    Height = 24
    Anchors = [akLeft, akTop, akRight]
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    KeyField = 'CM_ID'
    ListField = 'CM_NAME'
    ListSource = DSCompanies
    ParentFont = False
    TabOrder = 0
    Visible = True
  end
  object BitBtnCancel: TsBitBtn
    Left = 16
    Top = 389
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    Default = True
    ModalResult = 2
    TabOrder = 4
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
  object BitBtnSave: TsBitBtn
    Left = 225
    Top = 389
    Width = 105
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' (F2)'
    ModalResult = 1
    TabOrder = 5
    OnClick = BitBtnSaveClick
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
    NumGlyphs = 2
  end
  object QManager: TZReadOnlyQuery
    Connection = FormMain.ZC
    OnCalcFields = QManagerCalcFields
    SQL.Strings = (
      'SELECT  U_ID, U_FIO, U_ISBOSS, U_ISCLOSED FROM USERS'
      'order by U_ISBOSS DESC, U_FIO')
    Params = <>
    Left = 208
    Top = 296
    object QManagerU_ID: TIntegerField
      FieldName = 'U_ID'
      Required = True
    end
    object QManagerU_FIO: TStringField
      FieldName = 'U_FIO'
      Size = 50
    end
    object QManagerU_ISBOSS: TIntegerField
      FieldName = 'U_ISBOSS'
    end
    object QManagerU_FIO_PLUS_BOSS: TStringField
      FieldKind = fkCalculated
      FieldName = 'U_FIO_PLUS_BOSS'
      Calculated = True
    end
    object QManagerU_ISCLOSED: TSmallintField
      FieldName = 'U_ISCLOSED'
      Required = True
    end
  end
  object QOwner: TZReadOnlyQuery
    Connection = FormMain.ZC
    OnCalcFields = QOwnerCalcFields
    SQL.Strings = (
      'SELECT U_ID, U_FIO, U_ISBOSS, U_ISCLOSED FROM USERS'
      'ORDER BY U_FIO DESC, U_FIO')
    Params = <>
    Left = 160
    Top = 328
    object QOwnerU_ID: TIntegerField
      FieldName = 'U_ID'
      Required = True
    end
    object QOwnerU_FIO: TStringField
      FieldName = 'U_FIO'
      Size = 50
    end
    object QOwnerU_ISBOSS: TIntegerField
      FieldName = 'U_ISBOSS'
    end
    object QOwnerU_FIO_PLUS_BOSS: TStringField
      FieldKind = fkCalculated
      FieldName = 'U_FIO_PLUS_BOSS'
      Calculated = True
    end
    object QOwnerU_ISCLOSED: TSmallintField
      FieldName = 'U_ISCLOSED'
      Required = True
    end
  end
  object DSManager: TDataSource
    DataSet = QManager
    Left = 272
    Top = 296
  end
  object DSOwner: TDataSource
    DataSet = QOwner
    Left = 248
    Top = 328
  end
  object QPeriod: TZReadOnlyQuery
    Connection = FormMain.ZC
    SQL.Strings = (
      'select pr_id, pr_comment, pr_name from periodicity'
      'order by pr_id')
    Params = <>
    Left = 224
    Top = 128
    object QPeriodPR_ID: TIntegerField
      FieldName = 'PR_ID'
      Required = True
    end
    object QPeriodPR_COMMENT: TStringField
      FieldName = 'PR_COMMENT'
      Size = 255
    end
    object QPeriodPR_NAME: TStringField
      FieldName = 'PR_NAME'
      Required = True
      Size = 255
    end
  end
  object DSPeriod: TDataSource
    DataSet = QPeriod
    Left = 272
    Top = 128
  end
  object QJobtype: TZReadOnlyQuery
    Connection = FormMain.ZC
    OnCalcFields = QManagerCalcFields
    SQL.Strings = (
      'select jt_id, jt_name '
      'from jobtype '
      'order by jt_id')
    Params = <>
    Left = 208
    Top = 256
    object QJobtypeJT_ID: TIntegerField
      FieldName = 'JT_ID'
      Required = True
    end
    object QJobtypeJT_NAME: TStringField
      FieldName = 'JT_NAME'
      Size = 50
    end
  end
  object DSJobtype: TDataSource
    DataSet = QJobtype
    Left = 272
    Top = 256
  end
  object DSContact: TDataSource
    AutoEdit = False
    DataSet = QContact
    Left = 288
    Top = 64
  end
  object QContact: TZReadOnlyQuery
    Connection = FormMain.ZC
    SQL.Strings = (
      'SELECT CN_ID, CN_COMPANY, C.CN_CONTACTER,'
      'C.CN_COMMENT, CN_PERIODICITY,'
      'c.cn_next_job_date, c.cn_last_job_date,'
      'C.cn_jobcomment,'
      'C.cn_jobtype,'
      'C.CN_MANAGER,'
      'C.CN_OWNER,'
      'C.CN_COMMENT_CLOSE'
      'FROM CONTACTS C'
      'where C.CN_ID=:CN_ID')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CN_ID'
        ParamType = ptUnknown
      end>
    Left = 216
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CN_ID'
        ParamType = ptUnknown
      end>
    object QContactCN_ID: TIntegerField
      FieldName = 'CN_ID'
      Required = True
    end
    object QContactCN_COMPANY: TIntegerField
      FieldName = 'CN_COMPANY'
      Required = True
    end
    object QContactCN_CONTACTER: TStringField
      FieldName = 'CN_CONTACTER'
      Size = 200
    end
    object QContactCN_COMMENT: TStringField
      FieldName = 'CN_COMMENT'
      Size = 255
    end
    object QContactCN_PERIODICITY: TIntegerField
      FieldName = 'CN_PERIODICITY'
    end
    object QContactCN_NEXT_JOB_DATE: TDateField
      FieldName = 'CN_NEXT_JOB_DATE'
    end
    object QContactCN_LAST_JOB_DATE: TDateField
      FieldName = 'CN_LAST_JOB_DATE'
    end
    object QContactCN_JOBCOMMENT: TStringField
      FieldName = 'CN_JOBCOMMENT'
      Size = 255
    end
    object QContactCN_JOBTYPE: TIntegerField
      FieldName = 'CN_JOBTYPE'
    end
    object QContactCN_MANAGER: TIntegerField
      FieldName = 'CN_MANAGER'
      Required = True
    end
    object QContactCN_OWNER: TIntegerField
      FieldName = 'CN_OWNER'
      Required = True
    end
    object QContactCN_COMMENT_CLOSE: TStringField
      FieldName = 'CN_COMMENT_CLOSE'
      Size = 255
    end
  end
  object QCompanies: TZQuery
    Connection = FormMain.ZC
    SQL.Strings = (
      'SELECT cm_id, cm_name, c.cm_comment, c.cm_isclosed'
      'FROM company c')
    Params = <>
    Options = []
    Left = 216
    object QCompaniesCM_NAME: TStringField
      FieldName = 'CM_NAME'
      Size = 100
    end
    object QCompaniesCM_COMMENT: TStringField
      FieldName = 'CM_COMMENT'
      Size = 255
    end
    object QCompaniesCM_ISCLOSED: TIntegerField
      FieldName = 'CM_ISCLOSED'
    end
    object QCompaniesCM_ID: TIntegerField
      FieldName = 'CM_ID'
      Required = True
    end
  end
  object DSCompanies: TDataSource
    AutoEdit = False
    DataSet = QCompanies
    Left = 280
  end
end