object FormNewPhone: TFormNewPhone
  Left = 261
  Top = 137
  Width = 395
  Height = 411
  Caption = 'FormNewPhone'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 24
    Width = 43
    Height = 16
    Caption = #1053#1086#1084#1077#1088
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 24
    Top = 56
    Width = 320
    Height = 16
    Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081' ('#1082#1090#1086' '#1079#1074#1086#1085#1080#1083' '#1095#1090#1086#1073#1099' '#1079#1072#1073#1083#1086#1082#1080#1088#1086#1074#1072#1090#1100')'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 32
    Top = 120
    Width = 113
    Height = 16
    Caption = #1044#1072#1090#1072' '#1073#1083#1086#1082#1080#1088#1086#1074#1082#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 240
    Top = 24
    Width = 126
    Height = 16
    Caption = '('#1080#1079' 6,7 '#1080#1083#1080' 10 '#1094#1080#1092#1088')'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object BitBtnSave: TBitBtn
    Left = 232
    Top = 336
    Width = 99
    Height = 25
    Caption = 'OK'
    Default = True
    TabOrder = 3
    OnClick = BitBtnSaveClick
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object BitBtnCancel: TBitBtn
    Left = 24
    Top = 336
    Width = 89
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 4
    OnClick = BitBtnCancelClick
    Kind = bkCancel
  end
  object EditComment: TEdit
    Left = 24
    Top = 80
    Width = 321
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object MonthCalendar: TMonthCalendar
    Left = 64
    Top = 144
    Width = 191
    Height = 154
    Date = 37314.6786716088
    TabOrder = 2
  end
  object EditPhone: TEdit
    Left = 56
    Top = 24
    Width = 177
    Height = 21
    TabOrder = 0
  end
  object SPSetPhone: TStoredProc
    DatabaseName = 'BaseLocal'
    StoredProcName = 'Set_Phone;1'
    Left = 304
    Top = 136
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = '@number'
        ParamType = ptInput
        Value = '101010'
      end
      item
        DataType = ftString
        Name = '@who_blocks'
        ParamType = ptInputOutput
        Value = '1010'
      end
      item
        DataType = ftDateTime
        Name = '@date_insert'
        ParamType = ptInputOutput
        Value = '1.01.2002'
      end>
  end
end
