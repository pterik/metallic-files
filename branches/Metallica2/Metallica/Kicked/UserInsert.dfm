object FormUserInsert: TFormUserInsert
  Left = 0
  Top = 0
  Caption = #1042#1074#1077#1076#1080#1090#1077#1085#1086#1074#1086#1075#1086#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
  ClientHeight = 276
  ClientWidth = 214
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  DesignSize = (
    214
    276)
  PixelsPerInch = 96
  TextHeight = 13
  object sLabel1: TsLabel
    Left = 14
    Top = 8
    Width = 192
    Height = 16
    Caption = #1051#1086#1075#1080#1085' '#1076#1083#1103' '#1074#1093#1086#1076#1072' '#1074' '#1087#1088#1086#1075#1088#1072#1084#1084#1091
    ParentFont = False
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object sLabel2: TsLabel
    Left = 16
    Top = 60
    Width = 49
    Height = 16
    Caption = #1055#1072#1088#1086#1083#1100
    ParentFont = False
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object sLabel3: TsLabel
    Left = 16
    Top = 112
    Width = 150
    Height = 16
    Caption = #1060#1072#1084#1080#1083#1080#1103' '#1080#1084#1103' '#1086#1090#1095#1077#1089#1090#1074#1086
    ParentFont = False
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object sLabel4: TsLabel
    Left = 16
    Top = 164
    Width = 89
    Height = 16
    Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
    ParentFont = False
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object EditLogin: TsEdit
    Left = 16
    Top = 30
    Width = 177
    Height = 24
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    Text = 'EditLogin'
  end
  object BitBtnCancel: TsBitBtn
    Left = 8
    Top = 243
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
    TabOrder = 1
    OnClick = BitBtnCancelClick
    OnKeyUp = BitBtnCancelKeyUp
  end
  object BitBtnSave: TsBitBtn
    Left = 101
    Top = 243
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
    TabOrder = 2
    OnClick = BitBtnSaveClick
  end
  object EditPWD: TsEdit
    Left = 16
    Top = 82
    Width = 177
    Height = 24
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    Text = 'EditPWD'
  end
  object EditFIO: TsEdit
    Left = 16
    Top = 134
    Width = 177
    Height = 24
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    Text = 'EditFIO'
  end
  object EditComment: TsEdit
    Left = 16
    Top = 186
    Width = 177
    Height = 24
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    Text = 'EditComment'
  end
  object CBEditPrices: TsCheckBox
    Left = 96
    Top = 60
    Width = 85
    Height = 17
    Caption = 'CBEditPrices'
    TabOrder = 6
  end
  object QMaxUserID: TUniQuery
    Connection = FormMain.ZC
    SQL.Strings = (
      'SELECT MAX(U_ID)  AS MAXID FROM USERS')
    Left = 144
    Top = 216
    object QMaxUserIDMAXID: TIntegerField
      FieldName = 'MAXID'
      ReadOnly = True
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
    Left = 104
    Top = 208
  end
  object sSkinProvider1: TsSkinProvider
    AddedTitle.Font.Charset = DEFAULT_CHARSET
    AddedTitle.Font.Color = clNone
    AddedTitle.Font.Height = -11
    AddedTitle.Font.Name = 'Tahoma'
    AddedTitle.Font.Style = []
    SkinData.SkinSection = 'FORM'
    TitleButtons = <>
    Left = 64
    Top = 208
  end
  object QInsertUser: TUniSQL
    Connection = FormMain.ZC
    SQL.Strings = (
      
        'INSERT INTO USERS(U_ID, U_LOGIN, U_PASSWORD, U_ISBOSS, U_FIO, U_' +
        'COMMENT, U_EDIT_PRICES)'
      
        'VALUES (:U_ID, :U_LOGIN, :U_PASSWORD, 0, :U_FIO, :U_COMMENT, :U_' +
        'EDIT_PRICES)')
    Left = 144
    Top = 176
    ParamData = <
      item
        DataType = ftInteger
        Name = 'U_ID'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'U_LOGIN'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'U_PASSWORD'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'U_FIO'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'U_COMMENT'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftSmallint
        Name = 'U_EDIT_PRICES'
        ParamType = ptInput
        Value = nil
      end>
  end
  object QBOSSES: TUniQuery
    Connection = FormMain.ZC
    SQL.Strings = (
      'SELECT * FROM USERS WHERE U_ISBOSS=1')
    Left = 144
    Top = 136
    object QBOSSESU_ID: TIntegerField
      FieldName = 'U_ID'
      Required = True
    end
    object QBOSSESU_LOGIN: TStringField
      FieldName = 'U_LOGIN'
      Size = 30
    end
    object QBOSSESU_PASSWORD: TStringField
      FieldName = 'U_PASSWORD'
      Size = 10
    end
    object QBOSSESU_ISBOSS: TIntegerField
      FieldName = 'U_ISBOSS'
    end
    object QBOSSESU_FIO: TStringField
      FieldName = 'U_FIO'
      Size = 50
    end
    object QBOSSESU_COMMENT: TStringField
      FieldName = 'U_COMMENT'
      Size = 50
    end
    object QBOSSESU_EDIT_OWN_JOBS: TSmallintField
      FieldName = 'U_EDIT_OWN_JOBS'
      Required = True
    end
    object QBOSSESU_EDIT_PRICES: TSmallintField
      FieldName = 'U_EDIT_PRICES'
      Required = True
    end
    object QBOSSESU_ISCLOSED: TSmallintField
      FieldName = 'U_ISCLOSED'
      Required = True
    end
  end
  object QInsertBOSS: TUniSQL
    Connection = FormMain.ZC
    SQL.Strings = (
      'INSERT INTO USERSFORBOSS (UB_USERID,UB_VIEWERID)'
      'VALUES (:UB_USERID, :UB_VIEWERID)')
    Left = 136
    Top = 88
    ParamData = <
      item
        DataType = ftInteger
        Name = 'UB_USERID'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftInteger
        Name = 'UB_VIEWERID'
        ParamType = ptInput
        Value = nil
      end>
  end
end
