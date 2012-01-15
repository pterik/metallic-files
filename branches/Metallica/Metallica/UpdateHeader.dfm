object FormUpdateHeader: TFormUpdateHeader
  Left = 408
  Top = 267
  Width = 281
  Height = 351
  Caption = #1047#1072#1076#1072#1090#1100' '#1087#1072#1088#1072#1084#1077#1090#1088#1099' '#1079#1072#1075#1086#1083#1086#1074#1086#1082#1072
  Color = clBtnFace
  Constraints.MinHeight = 100
  Constraints.MinWidth = 100
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyUp = FormKeyUp
  DesignSize = (
    273
    324)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 110
    Height = 16
    Caption = #1058#1077#1082#1089#1090' '#1079#1072#1075#1086#1083#1086#1074#1082#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 16
    Top = 128
    Width = 124
    Height = 16
    Caption = #1056#1072#1079#1084#1077#1088' '#1074' '#1087#1080#1082#1089#1077#1083#1072#1093
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 16
    Top = 104
    Width = 73
    Height = 16
    Caption = #1057#1090#1086#1083#1073#1077#1094' '#8470
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object BitBtnCancel: TBitBtn
    Left = 16
    Top = 278
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 5
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
  object BitBtnSave: TBitBtn
    Left = 153
    Top = 278
    Width = 105
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' (F2)'
    Default = True
    ModalResult = 1
    TabOrder = 4
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
  object EditHeader: TEdit
    Left = 16
    Top = 24
    Width = 249
    Height = 21
    TabOrder = 0
    Text = 'EditHeader'
  end
  object EditOrderby: TEdit
    Left = 152
    Top = 104
    Width = 57
    Height = 21
    ReadOnly = True
    TabOrder = 1
    Text = 'EditOrderby'
  end
  object EditFormat: TEdit
    Left = 16
    Top = 192
    Width = 73
    Height = 21
    TabOrder = 2
    Text = 'EditFormat'
  end
  object StaticText1: TStaticText
    Left = 16
    Top = 152
    Width = 249
    Height = 33
    AutoSize = False
    Caption = #1060#1086#1088#1084#1072#1090' '#1086#1090#1086#1073#1088#1072#1078#1077#1085#1080#1103' ('#1088#1077#1082#1086#1084#1077#1085#1076#1091#1077#1090#1089#1103' '#1086#1089#1090#1072#1074#1080#1090#1100' '#1087#1091#1089#1090#1099#1084')'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
  end
  object CBSaveGlobally: TCheckBox
    Left = 16
    Top = 248
    Width = 249
    Height = 17
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1076#1083#1103' '#1074#1089#1077#1075#1086' '#1088#1091#1073#1088#1080#1082#1072#1090#1086#1088#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object STRubrika: TStaticText
    Left = 16
    Top = 56
    Width = 249
    Height = 41
    AutoSize = False
    Caption = #1056#1091#1073#1088#1080#1082#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
  end
  object EditSize: TEdit
    Left = 152
    Top = 128
    Width = 57
    Height = 21
    ReadOnly = True
    TabOrder = 8
    Text = 'EditSize'
  end
  object CBHideField: TCheckBox
    Left = 16
    Top = 224
    Width = 249
    Height = 17
    Caption = #1055#1086#1083#1077' '#1085#1077#1074#1080#1076#1080#1084#1086' '#1074' '#1087#1086#1076#1088#1091#1073#1088#1080#1082#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
    Visible = False
  end
end
