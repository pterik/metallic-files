object FormNewPhone: TFormNewPhone
  Left = 388
  Top = 290
  Caption = #1042#1074#1086#1076' '#1085#1086#1074#1086#1075#1086' '#1090#1077#1083#1077#1092#1086#1085#1072
  ClientHeight = 211
  ClientWidth = 234
  Color = clBtnFace
  Constraints.MinHeight = 250
  Constraints.MinWidth = 250
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnKeyUp = FormKeyUp
  DesignSize = (
    234
    211)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TsLabel
    Left = 16
    Top = 40
    Width = 60
    Height = 16
    Caption = #1058#1077#1083#1077#1092#1086#1085
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object Label2: TsLabel
    Left = 8
    Top = 8
    Width = 64
    Height = 16
    Caption = #1050#1086#1084#1087#1072#1085#1080#1103
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object BitBtnCancel: TsBitBtn
    Left = 8
    Top = 183
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
    TabOrder = 5
    OnClick = BitBtnCancelClick
  end
  object MEditPref1: TsMaskEdit
    Left = 80
    Top = 40
    Width = 30
    Height = 24
    EditMask = '00;1;_'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 2
    ParentFont = False
    TabOrder = 1
    Text = '  '
    CheckOnExit = True
  end
  object MEditPhone1: TsMaskEdit
    Left = 112
    Top = 40
    Width = 73
    Height = 24
    EditMask = '000\-00\-00;1;_'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 9
    ParentFont = False
    TabOrder = 2
    Text = '   -  -  '
    CheckOnExit = True
  end
  object DT: TDateTimePicker
    Left = 8
    Top = 152
    Width = 121
    Height = 24
    Date = 39069.000000000000000000
    Time = 0.710792199082789000
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object StaticText1: TStaticText
    Left = 8
    Top = 128
    Width = 169
    Height = 17
    AutoSize = False
    Caption = #1044#1072#1090#1072' '#1087#1077#1088#1074#1086#1075#1086' '#1079#1074#1086#1085#1082#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
  end
  object EditCompany: TsEdit
    Left = 80
    Top = 8
    Width = 153
    Height = 24
    TabStop = False
    Anchors = [akLeft, akTop, akRight]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
    Text = 'EditCompany'
  end
  object EditContacter: TsEdit
    Left = 8
    Top = 96
    Width = 225
    Height = 24
    Anchors = [akLeft, akTop, akRight]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    Text = 'EditContacter'
  end
  object StaticText2: TStaticText
    Left = 8
    Top = 72
    Width = 209
    Height = 17
    AutoSize = False
    Caption = #1050#1086#1085#1090#1072#1082#1090#1085#1086#1077' '#1083#1080#1094#1086' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
  end
  object BitBtnSave: TsBitBtn
    Left = 129
    Top = 183
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
    TabOrder = 6
    OnClick = BitBtnSaveClick
  end
end
