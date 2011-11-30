object FormPriceShow: TFormPriceShow
  Left = 218
  Top = 220
  Width = 790
  Height = 480
  Caption = #1055#1086#1079#1080#1094#1080#1080' '#1087#1088#1072#1081#1089'-'#1083#1080#1089#1090#1072
  Color = clBtnFace
  Constraints.MinHeight = 250
  Constraints.MinWidth = 790
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    774
    442)
  PixelsPerInch = 96
  TextHeight = 13
  object BitBtnClose: TBitBtn
    Left = 674
    Top = 407
    Width = 77
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1047#1072#1082#1088#1099#1090#1100
    Default = True
    ModalResult = 1
    TabOrder = 0
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
  object Grid: TDBGridEh
    Left = 7
    Top = 8
    Width = 768
    Height = 392
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DSData
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    HorzScrollBar.Visible = False
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghDblClickOptimizeColWidth, dghDialogFind]
    ReadOnly = True
    RowLines = 3
    RowSizingAllowed = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    UseMultiTitle = True
    VertScrollBar.VisibleMode = sbNeverShowEh
    OnCellClick = GridCellClick
    OnDblClick = GridDblClick
    OnTitleClick = GridTitleClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'CM_NAME'
        Footers = <>
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'PL_DATE_UPDATE'
        Footers = <>
        Width = 80
      end
      item
        DisplayFormat = '#0.00'
        EditButtons = <>
        FieldName = 'PL_PRICE'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'PL_VALUE1'
        Footers = <>
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'PL_VALUE2'
        Footers = <>
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'PL_VALUE3'
        Footers = <>
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'PL_VALUE4'
        Footers = <>
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'PL_VALUE5'
        Footers = <>
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'PL_VALUE6'
        Footers = <>
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'PL_VALUE7'
        Footers = <>
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'PL_VALUE8'
        Footers = <>
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'PL_VALUE9'
        Footers = <>
        Width = 100
      end>
  end
  object BitBtnCompanies: TBitBtn
    Left = 16
    Top = 405
    Width = 201
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1050#1086#1084#1087#1072#1085#1080#1103' ('#1044#1074#1086#1081#1085#1086#1081' '#1097#1077#1083#1095#1086#1082')'
    TabOrder = 2
    OnClick = BitBtnCompaniesClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333FF3333333333333C0C333333333333F777F3333333333CC0F0C3
      333333333777377F33333333C30F0F0C333333337F737377F333333C00FFF0F0
      C33333F7773337377F333CC0FFFFFF0F0C3337773F33337377F3C30F0FFFFFF0
      F0C37F7373F33337377F00FFF0FFFFFF0F0C7733373F333373770FFFFF0FFFFF
      F0F073F33373F333373730FFFFF0FFFFFF03373F33373F333F73330FFFFF0FFF
      00333373F33373FF77333330FFFFF000333333373F333777333333330FFF0333
      3333333373FF7333333333333000333333333333377733333333333333333333
      3333333333333333333333333333333333333333333333333333}
    NumGlyphs = 2
  end
  object qData: TZReadOnlyQuery
    Connection = FormMain.ZC
    SQL.Strings = (
      'SELECT pl_id, pl_headerid, pl.pl_treeid, pl_price,'
      'cast(:node as varchar(200)) as pl_parent,'
      
        '(select pt_value from prices_tree pt where pt.pt_id = pl.pl_tree' +
        'id'
      '      and pt_isclosed =0) pt_value,'
      'cm.cm_name, cm.cm_id, cm_city, '
      'pl_value1, pl_value2, pl_value3,'
      'pl_value4, pl_value5, pl_value6,'
      'pl_value7, pl_value8, pl_value9,'
      'pl_orderby, pl_date_update, pl_isclosed'
      'FROM price_lines pl, price_headers ph , company cm'
      'WHERE ((pl.pl_treeid = :treeid)'
      'OR (pl.pl_treeid IN ('
      '    SELECT pt_id FROM prices_tree'
      '    WHERE pt_parentid =:treeid'
      '    and pt_isclosed = 0'
      '    )))'
      'AND ph.ph_id = pl.pl_headerid'
      'AND cm.cm_id = ph.ph_companyid'
      'AND cm.cm_isclosed = 0'
      'AND ph.ph_isclosed = 0'
      'AND pl.pl_isclosed = 0'
      'ORDER BY ph.ph_date_insert, pl_orderby')
    Params = <
      item
        DataType = ftUnknown
        Name = 'node'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'treeid'
        ParamType = ptUnknown
        Value = '8'
      end>
    Left = 32
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'node'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'treeid'
        ParamType = ptUnknown
        Value = '8'
      end>
    object qDataPL_ID: TIntegerField
      FieldName = 'PL_ID'
      Required = True
    end
    object qDataPL_HEADERID: TIntegerField
      FieldName = 'PL_HEADERID'
      Required = True
    end
    object qDataPL_TREEID: TIntegerField
      FieldName = 'PL_TREEID'
    end
    object qDataCM_NAME: TStringField
      FieldName = 'CM_NAME'
      Size = 100
    end
    object qDataCM_CITY: TStringField
      FieldName = 'CM_CITY'
      Required = True
      Size = 100
    end
    object qDataCM_ID: TIntegerField
      FieldName = 'CM_ID'
      Required = True
    end
    object qDataPL_PRICE: TFloatField
      FieldName = 'PL_PRICE'
      Required = True
    end
    object qDataPL_VALUE1: TStringField
      FieldName = 'PL_VALUE1'
      Size = 200
    end
    object qDataPL_VALUE2: TStringField
      FieldName = 'PL_VALUE2'
      Size = 200
    end
    object qDataPL_VALUE3: TStringField
      FieldName = 'PL_VALUE3'
      Size = 200
    end
    object qDataPL_VALUE4: TStringField
      FieldName = 'PL_VALUE4'
      Size = 200
    end
    object qDataPL_VALUE5: TStringField
      FieldName = 'PL_VALUE5'
      Size = 200
    end
    object qDataPL_VALUE6: TStringField
      FieldName = 'PL_VALUE6'
      Size = 200
    end
    object qDataPL_VALUE7: TStringField
      FieldName = 'PL_VALUE7'
      Size = 200
    end
    object qDataPL_VALUE8: TStringField
      FieldName = 'PL_VALUE8'
      Size = 200
    end
    object qDataPL_VALUE9: TStringField
      FieldName = 'PL_VALUE9'
      Size = 200
    end
    object qDataPL_ORDERBY: TIntegerField
      FieldName = 'PL_ORDERBY'
    end
    object qDataPL_DATE_UPDATE: TDateTimeField
      FieldName = 'PL_DATE_UPDATE'
    end
    object qDataPL_ISCLOSED: TSmallintField
      FieldName = 'PL_ISCLOSED'
      Required = True
    end
    object qDataPL_PARENT: TStringField
      FieldName = 'PL_PARENT'
      ReadOnly = True
      Size = 200
    end
    object qDataPT_VALUE: TStringField
      FieldName = 'PT_VALUE'
      ReadOnly = True
      Size = 100
    end
  end
  object DSData: TDataSource
    DataSet = qData
    Left = 96
    Top = 64
  end
end
