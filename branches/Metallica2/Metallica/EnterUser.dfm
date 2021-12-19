object FormEnterUser: TFormEnterUser
  Left = 447
  Top = 232
  BorderIcons = []
  Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103' '#1080#1079' '#1089#1087#1080#1089#1082#1072
  ClientHeight = 130
  ClientWidth = 484
  Color = clBtnFace
  Constraints.MaxHeight = 400
  Constraints.MaxWidth = 500
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    484
    130)
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TsLabel
    Left = 8
    Top = 14
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
    Left = 8
    Top = 66
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
    Visible = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object BitBtnEnter: TsBitBtn
    Left = 391
    Top = 97
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1042#1093#1086#1076
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 3
    OnClick = BitBtnEnterClick
  end
  object EPWD: TsEdit
    Left = 112
    Top = 64
    Width = 201
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    PasswordChar = '*'
    TabOrder = 1
  end
  object BitBtnCancel: TsBitBtn
    Left = 30
    Top = 97
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
    TabOrder = 2
    OnClick = BitBtnCancelClick
  end
  object EFIO: TsEdit
    Left = 112
    Top = 35
    Width = 201
    Height = 24
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
    Text = 'EFIO'
  end
  object sComboBox: TsComboBox
    Left = 112
    Top = 5
    Width = 201
    Height = 24
    TabOrder = 4
    OnChange = sComboBoxChange
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Text = 'sComboBox'
  end
  object Memo1: TMemo
    Left = 319
    Top = 8
    Width = 157
    Height = 89
    Lines.Strings = (
      'Memo1')
    TabOrder = 5
  end
  object QUsers: TUniQuery
    Connection = ZCEnter
    SQL.Strings = (
      'SELECT * FROM USERS'
      'WHERE U_ISCLOSED=0'
      'AND U_LOGIN=:U_LOGIN'
      'union all'
      'SELECT * FROM USERS'
      'WHERE U_ISCLOSED=0'
      'AND U_LOGIN<> :U_LOGIN')
    ReadOnly = True
    Active = True
    Left = 248
    Top = 56
    ParamData = <
      item
        DataType = ftString
        Name = 'U_LOGIN'
        ParamType = ptInput
        Value = ''
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
  object DSUsers: TUniDataSource
    DataSet = QUsers
    Left = 200
    Top = 96
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
    Left = 120
    Top = 96
  end
  object sSkinProvider1: TsSkinProvider
    AddedTitle.Font.Charset = DEFAULT_CHARSET
    AddedTitle.Font.Color = clNone
    AddedTitle.Font.Height = -11
    AddedTitle.Font.Name = 'Tahoma'
    AddedTitle.Font.Style = []
    SkinData.SkinSection = 'FORM'
    TitleButtons = <>
    Left = 160
    Top = 96
  end
  object ZCEnter: TUniConnection
    ProviderName = 'InterBase'
    Database = 
      'D:\Projects\GitHub\metallic-files\branches\Metallica2\Database\D' +
      'ATABASE_ODS11.FDB'
    Username = 'SYSDBA'
    Server = 'localhost'
    Connected = True
    LoginPrompt = False
    Left = 192
    Top = 9
    EncryptedPassword = '92FF9EFF8CFF8BFF9AFF8DFF94FF9AFF86FF'
  end
  object InterBaseUniProvider1: TInterBaseUniProvider
    Left = 200
    Top = 57
  end
  object UniSQLMonitor1: TUniSQLMonitor
    Left = 247
    Top = 9
  end
end
