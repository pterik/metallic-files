object FormPriceChange: TFormPriceChange
  Left = 469
  Top = 172
  Caption = #1048#1079#1084#1077#1085#1077#1085#1080#1077' '#1094#1077#1085#1099' '#1080' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1072
  ClientHeight = 140
  ClientWidth = 211
  Color = clBtnFace
  Constraints.MinHeight = 100
  Constraints.MinWidth = 60
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnKeyUp = FormKeyUp
  DesignSize = (
    211
    140)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 72
    Height = 13
    Caption = #1058#1077#1082#1091#1097#1072#1103' '#1094#1077#1085#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 112
    Top = 8
    Width = 59
    Height = 13
    Caption = #1053#1086#1074#1072#1103' '#1094#1077#1085#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 56
    Width = 88
    Height = 13
    Caption = #1058#1077#1082#1091#1097#1080#1081' '#1086#1089#1090#1072#1090#1086#1082
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 120
    Top = 56
    Width = 77
    Height = 13
    Caption = #1053#1086#1074#1099#1081' '#1086#1089#1090#1072#1090#1086#1082
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object BitBtnCancel: TBitBtn
    Left = 8
    Top = 113
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
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
    TabOrder = 3
  end
  object BitBtnSave: TBitBtn
    Left = 98
    Top = 113
    Width = 105
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' (F2)'
    Default = True
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
  object edtPrice: TEdit
    Left = 8
    Top = 24
    Width = 73
    Height = 21
    TabStop = False
    Enabled = False
    ReadOnly = True
    TabOrder = 4
    Text = 'edtPrice'
  end
  object edtNewPrice: TEdit
    Left = 104
    Top = 24
    Width = 73
    Height = 21
    TabOrder = 0
    Text = 'edtNewPrice'
  end
  object edtRest: TEdit
    Left = 8
    Top = 80
    Width = 73
    Height = 21
    TabStop = False
    Enabled = False
    ReadOnly = True
    TabOrder = 5
    Text = 'edtRest'
  end
  object edtNewRest: TEdit
    Left = 104
    Top = 80
    Width = 73
    Height = 21
    TabOrder = 1
    Text = 'edtNewRest'
  end
  object DSPrice: TDataSource
    DataSet = QPrice
    Left = 96
    Top = 24
  end
  object QPrice: TZReadOnlyQuery
    Connection = FormMain.ZC
    SQL.Strings = (
      
        'select PL_ID, PL_PRICE,  PL_VALUE5 REST from price_lines pl wher' +
        'e pl_id = :id'
      ' ')
    Params = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end>
    Left = 56
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end>
    object intgrfldQPricePL_ID: TIntegerField
      FieldName = 'PL_ID'
      Required = True
    end
    object fltfldQPricePL_PRICE: TFloatField
      FieldName = 'PL_PRICE'
      Required = True
    end
    object strngfldQPriceREST: TStringField
      FieldName = 'REST'
      Size = 200
    end
  end
  object QUpdatePrice: TZQuery
    Connection = FormMain.ZC
    SQL.Strings = (
      'UPDATE PRICE_LINES'
      'SET PL_PRICE=:PRICE'
      'WHERE PL_ID=:ID')
    Params = <
      item
        DataType = ftUnknown
        Name = 'PRICE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    Left = 144
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PRICE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
  end
  object QRestField: TZReadOnlyQuery
    Connection = FormMain.ZC
    SQL.Strings = (
      'select gs_field, gs_orderby from ('
      'SELECT gs_field,'
      'gs_orderby FROM grid_show'
      'WHERE gs_treeid IS NULL'
      'AND gs_field NOT IN'
      '    (SELECT gs_field FROM grid_show'
      '    WHERE gs_treeid = :treeid)'
      'and (upper(gs_header) = '#39#1054#1057#1058#1040#1058#1054#1050#39')'
      'and gs_show = 1'
      'UNION ALL'
      'SELECT gs_field, gs_orderby FROM grid_show'
      'WHERE gs_treeid = :treeid'
      'and (upper(gs_header) = '#39#1054#1057#1058#1040#1058#1054#1050#39')'
      'and gs_show = 1)'
      'where gs_field is not null'
      'order by gs_orderby desc')
    Params = <
      item
        DataType = ftUnknown
        Name = 'treeid'
        ParamType = ptUnknown
      end>
    Left = 144
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'treeid'
        ParamType = ptUnknown
      end>
    object strngfldQRestFieldGS_FIELD: TStringField
      FieldName = 'GS_FIELD'
      Size = 50
    end
    object intgrfldQRestFieldGS_ORDERBY: TIntegerField
      FieldName = 'GS_ORDERBY'
      ReadOnly = True
    end
  end
end