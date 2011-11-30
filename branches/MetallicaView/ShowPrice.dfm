object FormPriceShow: TFormPriceShow
  Left = 340
  Top = 228
  Width = 940
  Height = 625
  Caption = #1055#1086#1079#1080#1094#1080#1080' '#1087#1088#1072#1081#1089'-'#1083#1080#1089#1090#1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyUp = FormKeyUp
  OnPaint = FormPaint
  PixelsPerInch = 96
  TextHeight = 13
  object Grid: TDBGridEh
    Left = 0
    Top = 72
    Width = 913
    Height = 505
    DataSource = DSData
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    HorzScrollBar.Tracking = True
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghDblClickOptimizeColWidth, dghDialogFind]
    ReadOnly = True
    RowSizingAllowed = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    UseMultiTitle = True
    VertScrollBar.VisibleMode = sbAlwaysShowEh
    OnDrawColumnCell = GridDrawColumnCell
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
  object Panel1: TPanel
    Left = 248
    Top = 0
    Width = 649
    Height = 65
    Alignment = taLeftJustify
    TabOrder = 1
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 241
    Height = 65
    TabOrder = 2
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 26
      Height = 13
      Caption = #1055#1086#1083#1077
    end
    object Label2: TLabel
      Left = 8
      Top = 24
      Width = 30
      Height = 13
      Caption = #1088#1072#1074#1085#1086
    end
    object CBFields: TComboBox
      Left = 40
      Top = 4
      Width = 105
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      Text = 'CBFields'
      OnSelect = CBFieldsSelect
    end
    object BitBtnInsert: TBitBtn
      Left = 152
      Top = 0
      Width = 81
      Height = 17
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' (F2)'
      TabOrder = 1
      OnClick = BitBtnInsertClick
    end
    object CBFilter: TComboBox
      Left = 40
      Top = 28
      Width = 105
      Height = 21
      ItemHeight = 13
      TabOrder = 2
      Text = 'CBFilter'
      OnExit = CBFilterExit
    end
    object ButtonFilterClear: TButton
      Left = 150
      Top = 22
      Width = 83
      Height = 17
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100' (F3)'
      TabOrder = 3
      OnClick = ButtonFilterClearClick
    end
    object btnPrevFilter: TButton
      Left = 136
      Top = 44
      Width = 97
      Height = 17
      Caption = #1055#1088#1077#1076#1099#1076#1091#1097#1080#1081' (F4)'
      TabOrder = 4
      OnClick = btnPrevFilterClick
    end
  end
  object qData: TZReadOnlyQuery
    Connection = FormMain.ZC
    SQL.Strings = (
      'SELECT pl_id, pl_headerid, pl.pl_treeid, pl_price,'
      'cast(:node as varchar(200)) as pl_parent,'
      '(select pt_value from prices_tree pt'
      '  where pt.pt_id = pl.pl_treeid'
      '  and pt_isclosed =0) pt_value,'
      'cm.cm_name, cm.cm_id, cm_city,  tl_color,'
      'pl_value1, pl_value2, pl_value3,'
      'pl_value4, pl_value5, pl_value6,'
      'pl_value7, pl_value8, pl_value9,'
      'pl_orderby, pl_date_update, pl_isclosed'
      'FROM price_lines pl, price_headers ph , company cm'
      'left join TRUSTLEVEL tl on tl.tl_id = cm.cm_trust'
      'WHERE ((pl.pl_treeid = :treeid)'
      'OR (pl.pl_treeid IN ('
      '    SELECT pt_id FROM prices_tree'
      '    WHERE pt_parentid =:treeid'
      '    and pt_isclosed =0'
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
    object qDataTL_COLOR: TIntegerField
      FieldName = 'TL_COLOR'
      Required = True
    end
  end
  object DSData: TDataSource
    DataSet = qData
    Left = 80
    Top = 64
  end
  object qDataFl: TZReadOnlyQuery
    Connection = FormMain.ZC
    SQL.Strings = (
      'SELECT pl_id, pl_headerid, pl.pl_treeid, pl_price,'
      'cast(:node as varchar(200)) as pl_parent,'
      
        '(select pt_value from prices_tree pt where pt.pt_id = pl.pl_tree' +
        'id) pt_value,'
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
    Left = 256
    Top = 192
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
  end
end
