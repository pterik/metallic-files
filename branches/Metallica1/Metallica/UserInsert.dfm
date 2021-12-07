object FormUserInsert: TFormUserInsert
  Left = 308
  Top = 210
  Width = 220
  Height = 315
  Caption = #1042#1074#1077#1076#1080#1090#1077' '#1085#1086#1074#1086#1075#1086' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
  Color = clBtnFace
  Constraints.MinHeight = 250
  Constraints.MinWidth = 220
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnKeyUp = FormKeyUp
  DesignSize = (
    212
    281)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 48
    Width = 192
    Height = 16
    Caption = #1051#1086#1075#1080#1085' '#1076#1083#1103' '#1074#1093#1086#1076#1072' '#1074' '#1087#1088#1086#1075#1088#1072#1084#1084#1091
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 16
    Top = 104
    Width = 49
    Height = 16
    Caption = #1055#1072#1088#1086#1083#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 16
    Top = 0
    Width = 150
    Height = 16
    Caption = #1060#1072#1084#1080#1083#1080#1103' '#1080#1084#1103' '#1086#1090#1095#1077#1089#1090#1074#1086
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 16
    Top = 152
    Width = 71
    Height = 16
    Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object EditLogin: TEdit
    Left = 16
    Top = 64
    Width = 179
    Height = 24
    Anchors = [akLeft, akTop, akRight]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    Text = 'EditLogin'
  end
  object BitBtnCancel: TBitBtn
    Left = 16
    Top = 240
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 5
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
  object EditPWD: TEdit
    Left = 16
    Top = 120
    Width = 179
    Height = 24
    Anchors = [akLeft, akTop, akRight]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    Text = 'EditPWD'
  end
  object EditFIO: TEdit
    Left = 16
    Top = 16
    Width = 179
    Height = 24
    Anchors = [akLeft, akTop, akRight]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    Text = 'EditFIO'
  end
  object EditComment: TEdit
    Left = 16
    Top = 168
    Width = 179
    Height = 24
    Anchors = [akLeft, akTop, akRight]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    Text = 'EditComment'
  end
  object BitBtnSave: TBitBtn
    Left = 99
    Top = 240
    Width = 105
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' (F2)'
    ModalResult = 1
    TabOrder = 6
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
  object CBEditPrices: TCheckBox
    Left = 8
    Top = 208
    Width = 201
    Height = 17
    Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1091#1077#1090' '#1087#1088#1072#1081#1089'-'#1083#1080#1089#1090#1099
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object QMaxUserID: TZQuery
    Connection = FormMain.ZC
    SQL.Strings = (
      'SELECT MAX(U_ID)  AS MAXID FROM USERS')
    Params = <>
    Options = []
    Left = 176
    Top = 96
  end
  object QInsertUser: TZQuery
    Connection = FormMain.ZC
    SQL.Strings = (
      
        'INSERT INTO USERS(U_ID, U_LOGIN, U_PASSWORD, U_ISBOSS, U_FIO, U_' +
        'COMMENT, U_EDIT_PRICES)'
      
        'VALUES (:U_ID, :U_LOGIN, :U_PASSWORD, 0, :U_FIO, :U_COMMENT, :U_' +
        'EDIT_PRICES)')
    Params = <
      item
        DataType = ftUnknown
        Name = 'U_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'U_LOGIN'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'U_PASSWORD'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'U_FIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'U_COMMENT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'U_EDIT_PRICES'
        ParamType = ptUnknown
      end>
    Options = []
    Left = 176
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'U_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'U_LOGIN'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'U_PASSWORD'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'U_FIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'U_COMMENT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'U_EDIT_PRICES'
        ParamType = ptUnknown
      end>
  end
  object QBOSSES: TZQuery
    Connection = FormMain.ZC
    SQL.Strings = (
      'SELECT * FROM USERS '
      'WHERE U_ISBOSS=1')
    Params = <>
    Options = []
    Left = 80
    Top = 56
    object QBOSSESU_LOGIN: TStringField
      FieldName = 'U_LOGIN'
      Size = 30
    end
    object QBOSSESU_PASSWORD: TStringField
      FieldName = 'U_PASSWORD'
      Size = 10
    end
    object QBOSSESU_FIO: TStringField
      FieldName = 'U_FIO'
      Size = 50
    end
    object QBOSSESU_COMMENT: TStringField
      FieldName = 'U_COMMENT'
      Size = 50
    end
    object QBOSSESU_ID: TIntegerField
      FieldName = 'U_ID'
      Required = True
    end
    object QBOSSESU_ISBOSS: TIntegerField
      FieldName = 'U_ISBOSS'
    end
    object QBOSSESU_ISCLOSED: TSmallintField
      FieldName = 'U_ISCLOSED'
      Required = True
    end
  end
  object QInsertBOSS: TZQuery
    Connection = FormMain.ZC
    SQL.Strings = (
      'INSERT INTO USERSFORBOSS (UB_USERID,UB_VIEWERID)'
      'VALUES (:UB_USERID, :UB_VIEWERID)')
    Params = <
      item
        DataType = ftUnknown
        Name = 'UB_USERID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'UB_VIEWERID'
        ParamType = ptUnknown
      end>
    Options = []
    Left = 128
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'UB_USERID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'UB_VIEWERID'
        ParamType = ptUnknown
      end>
  end
end
