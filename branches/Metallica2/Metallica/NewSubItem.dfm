object FormNewSubItem: TFormNewSubItem
  Left = 449
  Top = 259
  Width = 242
  Height = 185
  Caption = #1042#1074#1077#1076#1080#1090#1077' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1088#1072#1079#1076#1077#1083#1072
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
  OnKeyUp = FormKeyUp
  DesignSize = (
    234
    151)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 0
    Width = 184
    Height = 16
    Caption = #1048#1084#1103' '#1076#1083#1103' '#1085#1086#1074#1086#1075#1086' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 16
    Top = 56
    Width = 121
    Height = 16
    Caption = #1056#1072#1079#1076#1077#1083' - '#1088#1086#1076#1080#1090#1077#1083#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object BitBtnCancel: TBitBtn
    Left = 16
    Top = 114
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 2
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
    Left = 114
    Top = 114
    Width = 105
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' (F2)'
    Default = True
    ModalResult = 1
    TabOrder = 1
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
  object EditTree: TEdit
    Left = 16
    Top = 24
    Width = 193
    Height = 21
    TabOrder = 0
    Text = 'EditTree'
  end
  object EditParent: TEdit
    Left = 16
    Top = 80
    Width = 193
    Height = 21
    ReadOnly = True
    TabOrder = 3
    Text = 'EditParent'
  end
  object QTreeInsert: TZQuery
    Connection = FormMain.ZC
    SQL.Strings = (
      
        'insert into PRICES_TREE (PT_PARENTID, PT_VALUE, PT_ORDERBY, PT_D' +
        'ATE, PT_ISCLOSED)'
      'values (:PT_PARENTID, :PT_VALUE, :PT_ORDERBY, :PT_DATE, 0)')
    Params = <
      item
        DataType = ftUnknown
        Name = 'PT_PARENTID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PT_VALUE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PT_ORDERBY'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PT_DATE'
        ParamType = ptUnknown
      end>
    Left = 32
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PT_PARENTID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PT_VALUE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PT_ORDERBY'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PT_DATE'
        ParamType = ptUnknown
      end>
  end
  object qMaxParentPos: TZReadOnlyQuery
    Connection = FormMain.ZC
    SQL.Strings = (
      'SELECT MAX(pt_orderby)+1 AS maxpos FROM prices_tree pt'
      'WHERE pt_parentid =:parentid')
    Params = <
      item
        DataType = ftUnknown
        Name = 'parentid'
        ParamType = ptUnknown
      end>
    Left = 112
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'parentid'
        ParamType = ptUnknown
      end>
    object qMaxParentPosMAXPOS: TLargeintField
      FieldName = 'MAXPOS'
      ReadOnly = True
    end
  end
end
