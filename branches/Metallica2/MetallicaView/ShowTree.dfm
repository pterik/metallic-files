object FormTree: TFormTree
  Left = 210
  Top = 173
  HorzScrollBar.Tracking = True
  VertScrollBar.Tracking = True
  Caption = #1055#1088#1072#1081#1089'-'#1083#1080#1089#1090
  ClientHeight = 780
  ClientWidth = 1480
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = True
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyUp = FormKeyUp
  PixelsPerInch = 96
  TextHeight = 13
  object pnlRight: TsPanel
    Left = 163
    Top = 0
    Width = 1317
    Height = 780
    Align = alClient
    TabOrder = 0
    object Grid: TDBGridEh
      Left = 1
      Top = 89
      Width = 1315
      Height = 690
      Align = alClient
      DataSource = DSData
      DynProps = <>
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FooterParams.Color = clWindow
      GridLineParams.VertEmptySpaceStyle = dessNonEh
      IndicatorOptions = []
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghDblClickOptimizeColWidth, dghDialogFind, dghColumnResize, dghColumnMove]
      ParentFont = False
      ReadOnly = True
      RowSizingAllowed = True
      SortLocal = True
      SumList.Active = True
      SumList.VirtualRecords = True
      TabOrder = 0
      TitleParams.MultiTitle = True
      VertScrollBar.VisibleMode = sbAlwaysShowEh
      OnCellClick = GridCellClick
      OnDblClick = GridDblClick
      OnDrawColumnCell = GridDrawColumnCell
      OnEnter = GridEnter
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
      Left = 1
      Top = 1
      Width = 1315
      Height = 88
      Align = alTop
      TabOrder = 1
      DesignSize = (
        1315
        88)
      object Panel2: TsPanel
        Left = 8
        Top = 8
        Width = 241
        Height = 74
        TabOrder = 0
        object Label1: TsLabel
          Left = 8
          Top = 4
          Width = 26
          Height = 13
          Caption = #1055#1086#1083#1077
        end
        object Label2: TsLabel
          Left = 8
          Top = 32
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
        end
        object BitBtnInsert: TsBitBtn
          Left = 152
          Top = 4
          Width = 81
          Height = 17
          Caption = #1044#1086#1073#1072#1074#1080#1090#1100' (F2)'
          TabOrder = 1
          OnClick = BitBtnInsertClick
        end
        object CBFilter: TsComboBox
          Left = 40
          Top = 28
          Width = 105
          Height = 21
          ItemIndex = -1
          TabOrder = 2
          Text = 'CBFilter'
        end
        object ButtonFilterClear: TsButton
          Left = 150
          Top = 26
          Width = 83
          Height = 31
          Caption = #1054#1095#1080#1089#1090#1080#1090#1100' (F3)'
          TabOrder = 3
          OnClick = ButtonFilterClearClick
        end
      end
      object Panel1: TsPanel
        Left = 255
        Top = 15
        Width = 1059
        Height = 67
        Alignment = taLeftJustify
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        object chk1: TsCheckBox
          Left = 0
          Top = 4
          Width = 46
          Height = 17
          Caption = 'chk1'
          Checked = True
          State = cbChecked
          TabOrder = 0
          OnClick = chk1Click
          WordWrap = True
        end
        object chk2: TsCheckBox
          Left = 140
          Top = 4
          Width = 46
          Height = 17
          Caption = 'chk2'
          Checked = True
          State = cbChecked
          TabOrder = 1
          OnClick = chk2Click
          WordWrap = True
        end
        object chk3: TsCheckBox
          Left = 280
          Top = 4
          Width = 46
          Height = 17
          Caption = 'chk3'
          Checked = True
          State = cbChecked
          TabOrder = 2
          OnClick = chk3Click
          WordWrap = True
        end
        object chk4: TsCheckBox
          Left = 420
          Top = 4
          Width = 46
          Height = 17
          Caption = 'chk4'
          Checked = True
          State = cbChecked
          TabOrder = 3
          OnClick = chk4Click
          WordWrap = True
        end
        object chk5: TsCheckBox
          Left = 560
          Top = 4
          Width = 46
          Height = 17
          Caption = 'chk5'
          Checked = True
          State = cbChecked
          TabOrder = 4
          OnClick = chk5Click
          WordWrap = True
        end
      end
    end
  end
  object Tree: TsTreeView
    Left = 0
    Top = 0
    Width = 163
    Height = 780
    Align = alLeft
    Indent = 19
    ReadOnly = True
    TabOrder = 1
    OnChange = TreeChange
    OnExpanding = TreeExpanding
    Items.NodeData = {
      03020000002A0000000000000000000000FFFFFFFFFFFFFFFF00000000000000
      0001000000010654006500730074006F0031002E0000000000000000000000FF
      FFFFFFFFFFFFFF000000000000000000000000010854006500730074006F0020
      0031003200260000000000000000000000FFFFFFFFFFFFFFFF00000000000000
      000100000001041A044004430433042C0000000000000000000000FFFFFFFFFF
      FFFFFF00000000000000000000000001071A04400443043304200031003000}
  end
  object DSData: TDataSource
    AutoEdit = False
    DataSet = qData
    Left = 336
    Top = 192
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
        'ess as varchar(100)) ='#39#39') )'
      'ORDER BY ph.ph_date_insert, pl_orderby'
      ' ')
    Active = True
    Left = 235
    Top = 192
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'node'
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'treeid'
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'company'
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'CITY'
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'business'
        Value = nil
      end>
  end
  object qData: TUniQuery
    Connection = FormMain.ZC
    SQL.Strings = (
      'SELECT pl_id, pl_headerid, pl.pl_treeid, pl_price,'
      'cast(:node as varchar(200)) as pl_parent,'
      
        '(select pt_value from prices_tree pt where pt.pt_id = pl.pl_tree' +
        'id) pt_value,'
      'cm.cm_name, cm.cm_id, cm_city, cm_business,  cm_hyperlink,'
      'pl_value1, pl_value2, pl_value3,'
      'pl_value4, pl_value5, pl_value6,'
      'pl_value7, pl_value8, pl_value9,'
      'pl_orderby, pl_date_update, tl_color, pl_isclosed'
      'FROM price_lines pl, price_headers ph , company cm'
      'left join TRUSTLEVEL tl on tl.tl_id = cm.cm_trust'
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
      'and tl.tl_isclosed = 0'
      'and upper(cm_name) like '#39'%'#39'||:company||'#39'%'#39
      
        'and (upper(cm_business) like '#39'%'#39'||:business||'#39'%'#39' or (cast(:busin' +
        'ess as varchar(100)) ='#39#39') )'
      'ORDER BY ph.ph_date_insert, pl_orderby')
    Active = True
    Left = 451
    Top = 200
    ParamData = <
      item
        DataType = ftString
        Name = 'node'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftInteger
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
        Name = 'business'
        ParamType = ptInput
        Value = nil
      end>
  end
end
