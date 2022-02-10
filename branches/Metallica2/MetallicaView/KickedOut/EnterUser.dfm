object FormEnterUser: TFormEnterUser
  Left = 447
  Top = 232
  Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103' '#1080#1079' '#1089#1087#1080#1089#1082#1072
  ClientHeight = 123
  ClientWidth = 344
  Color = clBtnFace
  Constraints.MaxHeight = 400
  Constraints.MaxWidth = 360
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TsLabel
    Left = 64
    Top = 12
    Width = 39
    Height = 16
    Caption = #1051#1086#1075#1080#1085
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object Label2: TsLabel
    Left = 56
    Top = 68
    Width = 49
    Height = 16
    Caption = #1055#1072#1088#1086#1083#1100
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object Label4: TsLabel
    Left = 8
    Top = 40
    Width = 95
    Height = 16
    Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object BitBtnCancel: TsBitBtn
    Left = 72
    Top = 96
    Width = 89
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 1
    OnClick = BitBtnCancelClick
  end
  object BitBtnEnter: TsBitBtn
    Left = 200
    Top = 96
    Width = 75
    Height = 25
    Caption = #1042#1093#1086#1076
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 2
    OnClick = BitBtnEnterClick
  end
  object EPWD: TsEdit
    Left = 112
    Top = 64
    Width = 201
    Height = 21
    PasswordChar = '*'
    TabOrder = 0
  end
  object DBUsers: TDBLookupComboboxEh
    Left = 112
    Top = 9
    Width = 201
    Height = 24
    DynProps = <>
    DataField = ''
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    KeyField = 'U_ID'
    ListField = 'U_LOGIN'
    ListSource = DSUsers
    ParentFont = False
    TabOrder = 3
    Visible = True
    OnChange = DBUsersChange
  end
  object EFIO: TsEdit
    Left = 112
    Top = 37
    Width = 201
    Height = 24
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    Text = 'EFIO'
  end
  object DSUsers: TDataSource
    DataSet = QUsers
    Left = 248
    Top = 8
  end
  object QUsers: TUniQuery
    Connection = FormMain.ZC
    SQL.Strings = (
      'SELECT * FROM USERS'
      'WHERE U_ISCLOSED=0'
      'AND U_LOGIN=:U_LOGIN'
      'union all'
      'SELECT * FROM USERS'
      'WHERE U_ISCLOSED=0'
      'AND U_LOGIN<> :U_LOGIN')
    Left = 48
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'U_LOGIN'
        ParamType = ptInput
        Value = nil
      end>
    object QUsersU_ID: TIntegerField
      FieldName = 'U_ID'
      Required = True
    end
    object QUsersU_LOGIN: TStringField
      FieldName = 'U_LOGIN'
      Size = 30
    end
    object QUsersU_PASSWORD: TStringField
      FieldName = 'U_PASSWORD'
      Size = 10
    end
    object QUsersU_ISBOSS: TIntegerField
      FieldName = 'U_ISBOSS'
    end
    object QUsersU_FIO: TStringField
      FieldName = 'U_FIO'
      Size = 50
    end
    object QUsersU_COMMENT: TStringField
      FieldName = 'U_COMMENT'
      Size = 50
    end
    object QUsersU_EDIT_OWN_JOBS: TSmallintField
      FieldName = 'U_EDIT_OWN_JOBS'
      Required = True
    end
    object QUsersU_EDIT_PRICES: TSmallintField
      FieldName = 'U_EDIT_PRICES'
      Required = True
    end
    object QUsersU_ISCLOSED: TSmallintField
      FieldName = 'U_ISCLOSED'
      Required = True
    end
  end
end