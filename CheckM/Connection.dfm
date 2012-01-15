object FormConnection: TFormConnection
  Left = 316
  Top = 249
  Width = 410
  Height = 490
  Caption = #1055#1086#1076#1082#1083#1102#1095#1077#1085#1080#1077' '#1082' '#1073#1072#1079#1077' '#1076#1072#1085#1085#1099#1093
  Color = clBtnFace
  Constraints.MinHeight = 490
  Constraints.MinWidth = 410
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  KeyPreview = True
  OldCreateOrder = False
  OnCreate = FormCreate
  OnKeyUp = FormKeyUp
  DesignSize = (
    402
    456)
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 400
    Height = 417
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    object Label1: TLabel
      Left = 72
      Top = 6
      Width = 205
      Height = 13
      Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086' '#1041#1044' '#1080' '#1083#1086#1075#1080#1085' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1103
    end
    object lblProtocol: TLabel
      Left = 30
      Top = 90
      Width = 49
      Height = 13
      Caption = #1055#1088#1086#1090#1086#1082#1086#1083
    end
    object lblHostName: TLabel
      Left = 8
      Top = 28
      Width = 67
      Height = 13
      Caption = #1048#1084#1103' '#1089#1077#1088#1074#1077#1088#1072
    end
    object lblDatabase: TLabel
      Left = 16
      Top = 116
      Width = 65
      Height = 13
      Caption = #1041#1072#1079#1072' '#1076#1072#1085#1085#1099#1093
    end
    object lblUserName: TLabel
      Left = 8
      Top = 142
      Width = 73
      Height = 13
      Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
    end
    object lblPassword: TLabel
      Left = 40
      Top = 168
      Width = 38
      Height = 13
      Caption = #1055#1072#1088#1086#1083#1100
    end
    object Label2: TLabel
      Left = 88
      Top = 50
      Width = 214
      Height = 13
      Caption = '('#1082#1086#1084#1087#1100#1102#1090#1077#1088#1072', '#1075#1076#1077' '#1085#1072#1093#1086#1076#1080#1090#1089#1103' '#1073#1072#1079#1072' '#1076#1072#1085#1085#1099#1093')'
    end
    object Label3: TLabel
      Left = 288
      Top = 160
      Width = 96
      Height = 13
      Caption = '('#1089#1084'. '#1092#1072#1081#1083' '#1087#1086#1084#1086#1097#1080')'
    end
    object edtHostName: TEdit
      Left = 90
      Top = 26
      Width = 167
      Height = 21
      TabOrder = 0
      OnChange = edtHostNameChange
    end
    object edtDatabase: TEdit
      Left = 91
      Top = 116
      Width = 238
      Height = 21
      TabOrder = 1
      OnChange = edtDatabaseChange
    end
    object edtUser: TEdit
      Left = 91
      Top = 142
      Width = 193
      Height = 21
      TabOrder = 2
      OnChange = edtUserChange
    end
    object edtPassword: TEdit
      Left = 91
      Top = 168
      Width = 193
      Height = 21
      TabOrder = 3
      OnChange = edtPasswordChange
    end
    object MemoInfo: TMemo
      Left = 8
      Top = 200
      Width = 385
      Height = 153
      Color = clWhite
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 4
    end
    object BitBtnPing: TBitBtn
      Left = 264
      Top = 24
      Width = 89
      Height = 25
      Caption = #1044#1086#1089#1090#1091#1087#1077#1085'?'
      TabOrder = 5
      OnClick = BitBtnPingClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
        00333FF777777777773F0000FFFFFFFFFF0377773F3F3F3F3F7308880F0F0F0F
        0FF07F33737373737337088880FFFFFFFFF07F3337FFFFFFFFF7088880000000
        00037F3337777777777308888033330F03337F3337F3FF7F7FFF088880300000
        00007F3337F7777777770FFFF030FFFFFFF07F3FF7F7F3FFFFF708008030F000
        00F07F7737F7F77777F70FFFF030F0AAE0F07F3FF7F7F7F337F708008030F0DA
        D0F07F7737F7F7FFF7F70FFFF030F00000F07F33F7F7F77777370FF9F030FFFF
        FFF07F3737F7FFFFFFF70FFFF030000000007FFFF7F777777777000000333333
        3333777777333333333333333333333333333333333333333333}
      NumGlyphs = 2
    end
    object CBProtocol: TComboBox
      Left = 90
      Top = 91
      Width = 191
      Height = 21
      ItemHeight = 13
      TabOrder = 6
      Items.Strings = (
        'firebird-2.1'
        'firebird-2.0'
        'ado'
        'ASA7'
        'ASA8'
        'ASA9'
        'firebird-1.5'
        'interbase-5'
        'interbase-6'
        'mssql'
        'mysql'
        'mysql-4.1'
        'mysql-5'
        'mysqld-4.1'
        'mysqld-5'
        'oracle'
        'oracle-9i'
        'postgresql'
        'postgresql-7'
        'postgresql-8'
        'sqlite'
        'sqlite-2.8'
        'sqlite-3'
        'sybase'
        'firebirdd-1.5'
        'firebirdd-2.0')
    end
    object ButtonSetDB: TButton
      Left = 336
      Top = 120
      Width = 25
      Height = 17
      Caption = '...'
      TabOrder = 7
      OnClick = ButtonSetDBClick
    end
    object StaticText1: TStaticText
      Left = 8
      Top = 360
      Width = 385
      Height = 49
      AutoSize = False
      Caption = 
        #1045#1089#1083#1080' '#1085#1077' '#1087#1086#1083#1091#1095#1072#1077#1090#1089#1103' '#1085#1072#1089#1090#1088#1086#1080#1090#1100' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1077' '#1082' '#1073#1072#1079#1077' '#1076#1072#1085#1085#1099#1093', '#1087#1088#1086#1095#1080#1090#1072#1081 +
        #1090#1077' '#1092#1072#1081#1083' '#1087#1086#1084#1086#1097#1080' (F1). '#1042#1089#1077' '#1085#1072#1089#1090#1088#1086#1081#1082#1080' '#1089#1086#1093#1088#1072#1085#1103#1102#1090#1089#1103' '#1074' '#1088#1077#1077#1089#1090#1077' '#1082#1085#1086#1087#1082#1086#1081' ' +
        '"'#1057#1086#1093#1088#1072#1085#1080#1090#1100'"'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
    end
    object CheckBox1: TCheckBox
      Left = 80
      Top = 64
      Width = 249
      Height = 25
      Caption = #1042' '#1080#1084#1077#1085#1080' '#1089#1077#1088#1074#1077#1088#1072' '#1091#1082#1072#1079#1072#1085' '#1101#1090#1086#1090' '#1082#1086#1084#1087#1100#1102#1090#1077#1088
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
      OnClick = CheckBox1Click
    end
  end
  object BitBtnClose: TBitBtn
    Left = 322
    Top = 426
    Width = 74
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1047#1072#1082#1088#1099#1090#1100
    TabOrder = 1
    OnClick = BitBtnCloseClick
    Kind = bkClose
  end
  object BitBtnSave: TBitBtn
    Left = 208
    Top = 426
    Width = 105
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' (F2)'
    ModalResult = 1
    TabOrder = 2
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
  object BitBtnConnect: TBitBtn
    Left = 8
    Top = 426
    Width = 89
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1057#1086#1077#1076#1080#1085#1077#1085#1080#1077
    TabOrder = 3
    OnClick = BitBtnConnectClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000333300
      0000377777F3337777770FFFF099990FFFF07FFFF7FFFF7FFFF7000000999900
      00007777777777777777307703399330770337FF7F37F337FF7F300003399330
      000337777337F337777333333339933333333FFFFFF7F33FFFFF000000399300
      0000777777F7F37777770FFFF099990FFFF07FFFF7F7FF7FFFF7000000999900
      00007777777777777777307703399330770337FF7F37F337FF7F300003399330
      0003377773F7FFF77773333330000003333333333777777F3333333330FFFF03
      3333333337FFFF7F333333333000000333333333377777733333333333077033
      33333333337FF7F3333333333300003333333333337777333333}
    NumGlyphs = 2
  end
  object BitBtnExport: TBitBtn
    Left = 104
    Top = 426
    Width = 97
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'INI '#1092#1072#1081#1083#1099
    ModalResult = 1
    TabOrder = 4
    OnClick = BitBtnExportClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333303
      333333333333337FF3333333333333903333333333333377FF33333333333399
      03333FFFFFFFFF777FF3000000999999903377777777777777FF0FFFF0999999
      99037F3337777777777F0FFFF099999999907F3FF777777777770F00F0999999
      99037F773777777777730FFFF099999990337F3FF777777777330F00FFFFF099
      03337F773333377773330FFFFFFFF09033337F3FF3FFF77733330F00F0000003
      33337F773777777333330FFFF0FF033333337F3FF7F3733333330F08F0F03333
      33337F7737F7333333330FFFF003333333337FFFF77333333333000000333333
      3333777777333333333333333333333333333333333333333333}
    NumGlyphs = 2
  end
  object QDual: TZQuery
    SQL.Strings = (
      'SELECT * FROM USERS'
      'WHERE U_ISCLOSED=0')
    Params = <>
    Options = []
    Left = 184
    Top = 96
  end
  object ZC: TZConnection
    Protocol = 'sybase'
    HostName = 'localhost'
    Database = 'C:\Projects\Calendar\database.fdb'
    User = 'SYSDBA'
    Password = 'masterkey'
    ReadOnly = True
    SQLHourGlass = True
    Left = 152
    Top = 96
  end
  object IdIcmpClient: TIdIcmpClient
    ReceiveTimeout = 1000
    OnReply = IdIcmpClientReply
    Left = 80
    Top = 184
  end
  object OpenDB: TOpenDialog
    DefaultExt = '*.fdb'
    Filter = 
      #1060#1072#1081#1083' '#1076#1083#1103' Firebird (*.fdb)|*.fdb|'#1060#1072#1081#1083' '#1076#1083#1103' Interbase (*.ib;*.gdb)|' +
      '*.ib;*.gdb|'#1051#1102#1073#1086#1081' '#1092#1072#1081#1083' (*.*)|*.*'
    Options = [ofHideReadOnly, ofExtensionDifferent, ofEnableSizing]
    Left = 336
    Top = 56
  end
  object IdIPWatch1: TIdIPWatch
    Active = False
    HistoryEnabled = False
    HistoryFilename = 'iphist.dat'
    Left = 80
    Top = 256
  end
end
