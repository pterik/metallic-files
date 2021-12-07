object FormPriceShow: TFormPriceShow
  Left = 285
  Top = 168
  Caption = #1055#1086#1079#1080#1094#1080#1080' '#1087#1088#1072#1081#1089'-'#1083#1080#1089#1090#1072
  ClientHeight = 551
  ClientWidth = 987
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
  PixelsPerInch = 96
  TextHeight = 13
  object Grid: TDBGridEh
    Left = 0
    Top = 65
    Width = 987
    Height = 486
    Align = alClient
    AutoFitColWidths = True
    DataSource = DSData
    DynProps = <>
    FooterParams.Color = clWindow
    GridLineParams.VertEmptySpaceStyle = dessNonEh
    IndicatorOptions = []
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghDblClickOptimizeColWidth, dghDialogFind, dghColumnResize, dghColumnMove]
    ReadOnly = True
    RowSizingAllowed = True
    TabOrder = 0
    TitleParams.MultiTitle = True
    VertScrollBar.VisibleMode = sbAlwaysShowEh
    OnCellClick = GridCellClick
    OnDblClick = GridDblClick
    OnDrawColumnCell = GridDrawColumnCell
    OnKeyUp = GridKeyUp
    OnTitleClick = GridTitleClick
    Columns = <
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'CM_NAME'
        Footers = <>
        Width = 100
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'PL_DATE_UPDATE'
        Footers = <>
        Width = 80
      end
      item
        CellButtons = <>
        DisplayFormat = '#0.00'
        DynProps = <>
        EditButtons = <>
        FieldName = 'PL_PRICE'
        Footers = <>
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'PL_VALUE1'
        Footers = <>
        Width = 100
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'PL_VALUE2'
        Footers = <>
        Width = 100
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'PL_VALUE3'
        Footers = <>
        Width = 100
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'PL_VALUE4'
        Footers = <>
        Width = 100
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'PL_VALUE5'
        Footers = <>
        Width = 100
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'PL_VALUE6'
        Footers = <>
        Width = 100
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'PL_VALUE7'
        Footers = <>
        Width = 100
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'PL_VALUE8'
        Footers = <>
        Width = 100
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'PL_VALUE9'
        Footers = <>
        Width = 100
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object pnlTop: TsPanel
    Left = 0
    Top = 0
    Width = 987
    Height = 65
    Align = alTop
    TabOrder = 1
    DesignSize = (
      987
      65)
    object pnlButtons: TsPanel
      Left = 8
      Top = 8
      Width = 257
      Height = 50
      TabOrder = 0
      object Label1: TsLabel
        Left = 8
        Top = 8
        Width = 26
        Height = 13
        Caption = #1055#1086#1083#1077
      end
      object Label2: TsLabel
        Left = 8
        Top = 24
        Width = 30
        Height = 13
        Caption = #1088#1072#1074#1085#1086
      end
      object CBFields: TsComboBox
        Left = 40
        Top = 4
        Width = 105
        Height = 21
        ItemIndex = -1
        TabOrder = 0
        Text = 'CBFields'
        OnSelect = CBFieldsSelect
        Items.Strings = (
          '11111')
      end
      object BitBtnInsert: TsBitBtn
        Left = 160
        Top = 4
        Width = 81
        Height = 17
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100' (F2)'
        TabOrder = 2
        OnClick = BitBtnInsertClick
      end
      object CBFilter: TsComboBox
        Left = 40
        Top = 28
        Width = 105
        Height = 21
        ItemIndex = -1
        TabOrder = 1
        Text = 'CBFilter'
      end
      object ButtonFilterClear: TsButton
        Left = 158
        Top = 24
        Width = 83
        Height = 17
        Caption = #1054#1095#1080#1089#1090#1080#1090#1100' (F3)'
        TabOrder = 3
        OnClick = ButtonFilterClearClick
      end
    end
    object pnlFilters: TsPanel
      Left = 273
      Top = 0
      Width = 712
      Height = 63
      Alignment = taLeftJustify
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      OnResize = pnlFiltersResize
      object chk1: TsCheckBox
        Left = 1
        Top = 9
        Width = 46
        Height = 17
        Caption = 'chk1'
        BiDiMode = bdRightToLeftNoAlign
        Checked = True
        ParentBiDiMode = False
        State = cbChecked
        TabOrder = 0
        OnClick = chk1Click
        WordWrap = True
      end
      object chk2: TsCheckBox
        Left = 141
        Top = 10
        Width = 46
        Height = 17
        Caption = 'chk2'
        BiDiMode = bdRightToLeftNoAlign
        Checked = True
        ParentBiDiMode = False
        State = cbChecked
        TabOrder = 1
        OnClick = chk2Click
        WordWrap = True
      end
      object chk3: TsCheckBox
        Left = 280
        Top = 10
        Width = 46
        Height = 17
        Caption = 'chk3'
        BiDiMode = bdRightToLeftNoAlign
        Checked = True
        ParentBiDiMode = False
        State = cbChecked
        TabOrder = 2
        OnClick = chk3Click
        WordWrap = True
      end
      object chk4: TsCheckBox
        Left = 421
        Top = 10
        Width = 46
        Height = 17
        Caption = 'chk4'
        BiDiMode = bdRightToLeftNoAlign
        Checked = True
        ParentBiDiMode = False
        State = cbChecked
        TabOrder = 3
        OnClick = chk4Click
        WordWrap = True
      end
      object chk5: TsCheckBox
        Left = 561
        Top = 10
        Width = 46
        Height = 17
        Caption = 'chk5'
        BiDiMode = bdRightToLeftNoAlign
        Checked = True
        ParentBiDiMode = False
        State = cbChecked
        TabOrder = 4
        OnClick = chk5Click
        WordWrap = True
      end
    end
  end
  object DSData: TDataSource
    DataSet = qData
    Left = 160
    Top = 200
  end
  object qData: TUniQuery
    Connection = FormMain.ZC
    SQL.Strings = (
      'SELECT pl_id, pl_headerid, pl.pl_treeid, pl_price,'
      'cast(:node as varchar(200)) as pl_parent,'
      '(select pt_value from prices_tree pt'
      '  where pt.pt_id = pl.pl_treeid'
      '  and pt_isclosed =0) pt_value,'
      
        'cm.cm_name, cm.cm_id, cm_city,  cm_business, cm_hyperlink,  tl_c' +
        'olor,'
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
      'and upper(cm_name) like '#39'%'#39'||:company||'#39'%'#39
      
        'and (upper(cm_city) like upper('#39'%'#39'||:CITY||'#39'%'#39') or (cast(:CITY a' +
        's varchar(100))  = '#39#39'))'
      
        'and (upper(cm_business) like '#39'%'#39'||:business||'#39'%'#39' or (cast(:busin' +
        'ess as varchar(100)) ='#39#39') )'
      'ORDER BY ph.ph_date_insert, pl_orderby')
    Left = 216
    Top = 336
    ParamData = <
      item
        DataType = ftString
        Name = 'node'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'treeid'
        ParamType = ptInput
        Value = ''
      end
      item
        DataType = ftString
        Name = 'company'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'CITY'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'business'
        ParamType = ptInput
        Value = nil
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
      ReadOnly = True
      Size = 100
    end
    object qDataCM_CITY: TStringField
      FieldName = 'CM_CITY'
      ReadOnly = True
      Required = True
      Size = 100
    end
    object qDataCM_ID: TIntegerField
      FieldName = 'CM_ID'
      ReadOnly = True
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
      Required = True
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
      ReadOnly = True
    end
    object qDataCM_BUSINESS: TStringField
      FieldName = 'CM_BUSINESS'
      ReadOnly = True
      Required = True
      Size = 100
    end
    object qDataCM_HYPERLINK: TStringField
      FieldName = 'CM_HYPERLINK'
      ReadOnly = True
      Size = 1000
    end
  end
  object qDataFl: TUniQuery
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
      'and upper(cm_name) like '#39'%'#39'||:company||'#39'%'#39
      
        'and (upper(cm_city) like upper('#39'%'#39'||:CITY||'#39'%'#39') or (cast(:CITY a' +
        's varchar(100))  = '#39#39'))'
      
        'and (upper(cm_business) like '#39'%'#39'||:business||'#39'%'#39' or (cast(:busin' +
        'ess as varchar(100)) ='#39#39'))'
      'ORDER BY ph.ph_date_insert, pl_orderby'
      ' ')
    Left = 296
    Top = 336
    ParamData = <
      item
        DataType = ftString
        Name = 'node'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'treeid'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'company'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'CITY'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'business'
        ParamType = ptInput
        Value = nil
      end>
    object qDataFlPL_ID: TIntegerField
      FieldName = 'PL_ID'
      Required = True
    end
    object qDataFlPL_HEADERID: TIntegerField
      FieldName = 'PL_HEADERID'
      Required = True
    end
    object qDataFlPL_TREEID: TIntegerField
      FieldName = 'PL_TREEID'
    end
    object qDataFlPL_PRICE: TFloatField
      FieldName = 'PL_PRICE'
      Required = True
    end
    object qDataFlPL_PARENT: TStringField
      FieldName = 'PL_PARENT'
      ReadOnly = True
      Size = 200
    end
    object qDataFlPT_VALUE: TStringField
      FieldName = 'PT_VALUE'
      ReadOnly = True
      Size = 100
    end
    object qDataFlCM_NAME: TStringField
      FieldName = 'CM_NAME'
      ReadOnly = True
      Size = 100
    end
    object qDataFlCM_ID: TIntegerField
      FieldName = 'CM_ID'
      ReadOnly = True
      Required = True
    end
    object qDataFlCM_CITY: TStringField
      FieldName = 'CM_CITY'
      ReadOnly = True
      Required = True
      Size = 100
    end
    object qDataFlPL_VALUE1: TStringField
      FieldName = 'PL_VALUE1'
      Size = 200
    end
    object qDataFlPL_VALUE2: TStringField
      FieldName = 'PL_VALUE2'
      Size = 200
    end
    object qDataFlPL_VALUE3: TStringField
      FieldName = 'PL_VALUE3'
      Size = 200
    end
    object qDataFlPL_VALUE4: TStringField
      FieldName = 'PL_VALUE4'
      Size = 200
    end
    object qDataFlPL_VALUE5: TStringField
      FieldName = 'PL_VALUE5'
      Size = 200
    end
    object qDataFlPL_VALUE6: TStringField
      FieldName = 'PL_VALUE6'
      Size = 200
    end
    object qDataFlPL_VALUE7: TStringField
      FieldName = 'PL_VALUE7'
      Size = 200
    end
    object qDataFlPL_VALUE8: TStringField
      FieldName = 'PL_VALUE8'
      Size = 200
    end
    object qDataFlPL_VALUE9: TStringField
      FieldName = 'PL_VALUE9'
      Size = 200
    end
    object qDataFlPL_ORDERBY: TIntegerField
      FieldName = 'PL_ORDERBY'
      Required = True
    end
    object qDataFlPL_DATE_UPDATE: TDateTimeField
      FieldName = 'PL_DATE_UPDATE'
    end
    object qDataFlPL_ISCLOSED: TSmallintField
      FieldName = 'PL_ISCLOSED'
      Required = True
    end
  end
end
