object FormExport: TFormExport
  Left = 211
  Top = 158
  Width = 450
  Height = 310
  Caption = #1048#1084#1087#1088#1086#1090'\'#1101#1082#1089#1087#1086#1088#1090' '#1085#1072#1089#1090#1088#1086#1077#1082' '#1074' '#1090#1077#1082#1089#1090#1086#1074#1086#1084' '#1092#1086#1088#1084#1072#1090#1077
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object BitBtnLoad: TBitBtn
    Left = 8
    Top = 258
    Width = 129
    Height = 25
    Caption = #1055#1088#1086#1095#1077#1089#1090#1100' '#1080#1079' INI'
    TabOrder = 0
    OnClick = BitBtnLoadClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
      333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
      0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
      07333337F3FF3FFF7F333330F00F000F07333337F77377737F333330FFFFFFFF
      07333FF7F3FFFF3F7FFFBBB0F0000F0F0BB37777F7777373777F3BB0FFFFFFFF
      0BBB3777F3FF3FFF77773330F00F000003333337F773777773333330FFFF0FF0
      33333337F3FF7F37F3333330F08F0F0B33333337F7737F77FF333330FFFF003B
      B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
      3BB33773333773333773B333333B3333333B7333333733333337}
    NumGlyphs = 2
  end
  object BitBtnSave: TBitBtn
    Left = 168
    Top = 258
    Width = 137
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1082#1072#1082' INI'
    TabOrder = 1
    OnClick = BitBtnSaveClick
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
  object BitBtnClose: TBitBtn
    Left = 328
    Top = 258
    Width = 105
    Height = 25
    Cancel = True
    Caption = #1047#1072#1082#1088#1099#1090#1100
    Default = True
    ModalResult = 1
    TabOrder = 2
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
    NumGlyphs = 2
  end
  object MemoLoad: TMemo
    Left = 8
    Top = 72
    Width = 425
    Height = 177
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 3
  end
  object StaticText1: TStaticText
    Left = 16
    Top = 0
    Width = 401
    Height = 65
    AutoSize = False
    Caption = 
      #1052#1086#1078#1085#1086' '#1089#1086#1093#1088#1072#1085#1080#1090#1100' '#1087#1072#1088#1072#1084#1077#1090#1088#1099' '#1089#1086#1077#1076#1080#1085#1077#1085#1080#1103' '#1074' INI '#1092#1072#1081#1083#1077' '#1080' '#1087#1077#1088#1077#1085#1086#1089#1080#1090#1100' '#1080#1093 +
      ' '#1084#1077#1078#1076#1091' '#1082#1086#1084#1087#1100#1102#1090#1077#1088#1072#1084#1080'. '#1047#1076#1077#1089#1100' '#1078#1077' '#1089#1086#1093#1088#1072#1085#1077#1085#1099' '#1091#1089#1090#1072#1085#1086#1074#1082#1080' "'#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102'"' +
      '. '#1055#1072#1088#1086#1083#1100' '#1074' INI '#1092#1072#1081#1083#1077' '#1074' '#1089#1086#1093#1088#1072#1085#1105#1085' '#1074' '#1054#1058#1050#1056#1067#1058#1054#1052' '#1074#1080#1076#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object OD: TOpenDialog
    DefaultExt = '*.ini'
    Filter = #1060#1072#1081#1083' '#1085#1072#1089#1090#1088#1086#1077#1082' (*.txt)|*.ini|'#1051#1102#1073#1086#1081' '#1092#1072#1081#1083' (*.*)|*.*'
    Options = [ofHideReadOnly, ofExtensionDifferent, ofEnableSizing]
    Left = 264
    Top = 136
  end
end
