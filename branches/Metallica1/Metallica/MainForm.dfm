object FormMain: TFormMain
  Left = 491
  Top = 226
  Caption = #1055#1088#1072#1081#1089'-'#1083#1080#1089#1090#1099
  ClientHeight = 617
  ClientWidth = 934
  Color = clBtnFace
  Constraints.MinHeight = 460
  Constraints.MinWidth = 600
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'Default'
  Font.Style = []
  Icon.Data = {
    0000010001001010100000000000280100001600000028000000100000002000
    00000100040000000000C0000000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333
    33333333333300000000000000000FF7FF7FF7FF7FF009F79F79F7FF7FF00777
    7777777777700FF7FF7FF7FF7FF009F79F79F79F79F007777777777777700FF7
    FF7FF7FF7FF009F79F79F79F79F007777777777777700FFFFF7FF7FF7FF00FFF
    FF79F79F79F00000000000000000CCCCCC8888CCCCCCCCCCCCCCCCCCCCCC0000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000}
  KeyPreview = True
  OldCreateOrder = True
  Visible = True
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnKeyUp = FormKeyUp
  DesignSize = (
    934
    617)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 71
    Height = 16
    Caption = #1057#1086#1090#1088#1091#1076#1085#1080#1082
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lbl1: TLabel
    Left = 264
    Top = 8
    Width = 80
    Height = 16
    Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lbl2: TLabel
    Left = 520
    Top = 8
    Width = 119
    Height = 16
    Caption = #1042#1080#1076' '#1076#1077#1103#1090#1077#1083#1100#1085#1086#1089#1090#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object BitBtnClose: TBitBtn
    Left = 810
    Top = 589
    Width = 110
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1047#1072#1082#1088#1099#1090#1100
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
    TabOrder = 6
    OnClick = BitBtnCloseClick
  end
  object BitBtnAbout: TBitBtn
    Left = 825
    Top = 2
    Width = 105
    Height = 25
    Anchors = [akTop, akRight]
    Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
    Kind = bkHelp
    NumGlyphs = 2
    TabOrder = 7
    TabStop = False
    OnClick = BitBtnAboutClick
  end
  object BitBtnCompanies: TBitBtn
    Left = 564
    Top = 589
    Width = 110
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082#1080
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
    TabOrder = 4
    OnClick = BitBtnCompaniesClick
  end
  object BitBtnUsers: TBitBtn
    Left = 686
    Top = 589
    Width = 110
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1080
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      0400000000008000000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
      888800000000000000080FFFFFFFFFFFFF080F000F0000000F080F000F000000
      0F080F000F0000000F080F000F0000000F080F000F0000000F080F000F000000
      0F080F000F0000000F080F7FFFFFFFFFFF080F000F0000000F080F000F000000
      0F080F00070000000F080FFFFFFFFFFFFF080000000000000008}
    TabOrder = 5
    OnClick = BitBtnUsersClick
  end
  object EditMyName: TEdit
    Left = 88
    Top = 4
    Width = 169
    Height = 24
    TabStop = False
    Color = cl3DLight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
    Text = 'EditMyName'
  end
  object BitBtnForBoss: TBitBtn
    Left = 420
    Top = 589
    Width = 130
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1058#1086#1083#1100#1082#1086' '#1076#1083#1103' BOSSa'
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
      5000555555555555577755555555555550B0555555555555F7F7555555555550
      00B05555555555577757555555555550B3B05555555555F7F557555555555000
      3B0555555555577755755555555500B3B0555555555577555755555555550B3B
      055555FFFF5F7F5575555700050003B05555577775777557555570BBB00B3B05
      555577555775557555550BBBBBB3B05555557F555555575555550BBBBBBB0555
      55557F55FF557F5555550BB003BB075555557F577F5575F5555577B003BBB055
      555575F7755557F5555550BB33BBB0555555575F555557F555555507BBBB0755
      55555575FFFF7755555555570000755555555557777775555555}
    NumGlyphs = 2
    TabOrder = 3
    OnClick = BitBtnForBossClick
  end
  object Tree: TTreeView
    Left = 8
    Top = 32
    Width = 170
    Height = 548
    Anchors = [akLeft, akTop, akBottom]
    Indent = 19
    ReadOnly = True
    TabOrder = 8
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
  object Grid: TDBGridEh
    Left = 184
    Top = 32
    Width = 755
    Height = 548
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DSData
    DynProps = <>
    FooterParams.Color = clWindow
    GridLineParams.VertEmptySpaceStyle = dessNonEh
    IndicatorOptions = []
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghDblClickOptimizeColWidth, dghDialogFind, dghColumnResize, dghColumnMove]
    ReadOnly = True
    RowSizingAllowed = True
    SortLocal = True
    TabOrder = 9
    TitleParams.MultiTitle = True
    VertScrollBar.VisibleMode = sbNeverShowEh
    OnCellClick = GridCellClick
    OnDblClick = GridDblClick
    OnDrawColumnCell = GridDrawColumnCell
    OnEnter = GridEnter
    OnTitleClick = GridTitleClick
    Columns = <
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'CM_NAME'
        Footers = <>
        Title.Caption = 'CM_NAME1'
        Width = 100
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'CM_CITY'
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
  object BitBtnNewPrice: TBitBtn
    Left = 12
    Top = 587
    Width = 101
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1053#1086#1074#1099#1081' '#1087#1088#1072#1081#1089
    Glyph.Data = {
      36050000424D3605000000000000360400002800000010000000100000000100
      0800000000000001000000000000000000000001000000010000000000003232
      3200FFFFFF000E0E0E0000501900E2E2E200E1E1E100E0E0E000DFDFDF00DEDE
      DE00DDDDDD00DCDCDC003DB90000B1FFB100DBDBDB0034F5670000B93D00DADA
      DA002FF26400D9D9D900D8D8D8008EFF8E0029EF610025ED5F0082F99600D7D7
      D7002DF163002AF061001BE0550012D34D00D6D6D6000FCE4A0021EB5B00D5D5
      D500D4D4D4001BE85800D3D3D30015E55500D2D2D200D1D1D100D0D0D0000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000282828282801
      0101010101010101010128282828280102020202020202020201282828280303
      0308212224262728020128282803101010041E2122242627020128282803251D
      100414191E222426020128030303231D10040404192122240201031F1F1F201C
      10101010041E21220201030D1A1B1A1C1C1D1D100414191E0201030C0D0D1516
      17181810041314190201280303030D12100404040B1113140201282828030D0F
      100408090A0B0E110201282828030C0D0C040708090A0B0E0201282828280303
      0405060708090A0B020128282828280102020202020202020201282828282801
      0101010101010101010128282828282828282828282828282828}
    TabOrder = 10
    OnClick = BitBtnNewPriceClick
  end
  object edtCompany: TEdit
    Left = 352
    Top = 4
    Width = 153
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnExit = edtCompanyExit
  end
  object edtBusiness: TEdit
    Left = 640
    Top = 4
    Width = 169
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnExit = edtBusinessExit
  end
  object ZC: TZConnection
    ControlsCodePage = cCP_UTF16
    Catalog = ''
    TransactIsolationLevel = tiReadCommitted
    HostName = ''
    Port = 0
    Database = 'C:\Projects\Metallica\Database\DATABASE.FDB'
    User = 'SYSDBA'
    Password = 'masterkey'
    Protocol = 'firebird-2.1'
    Left = 56
    Top = 176
  end
  object QViewUsers: TZQuery
    Connection = ZC
    OnCalcFields = QViewUsersCalcFields
    SQL.Strings = (
      'SELECT '
      'U_LOGIN,U_FIO,U_COMMENT, U_ID, '
      'U_ISCLOSED, U_ISBOSS, U_EDIT_PRICES'
      'FROM USERS U'
      'where U_ID=:U_ID')
    Params = <
      item
        DataType = ftInteger
        Name = 'U_ID'
        ParamType = ptUnknown
        Value = 4
      end>
    WhereMode = wmWhereAll
    Options = []
    Left = 272
    Top = 160
    ParamData = <
      item
        DataType = ftInteger
        Name = 'U_ID'
        ParamType = ptUnknown
        Value = 4
      end>
    object QViewUsersU_LOGIN: TStringField
      FieldName = 'U_LOGIN'
      Size = 30
    end
    object QViewUsersU_FIO: TStringField
      FieldName = 'U_FIO'
      Size = 50
    end
    object QViewUsersU_COMMENT: TStringField
      FieldName = 'U_COMMENT'
      Size = 50
    end
    object QViewUsersU_ID: TIntegerField
      FieldName = 'U_ID'
      Required = True
    end
    object QViewUsersU_ISCLOSED: TSmallintField
      FieldName = 'U_ISCLOSED'
      Required = True
    end
    object QViewUsersU_ISBOSS: TIntegerField
      FieldName = 'U_ISBOSS'
    end
    object QViewUsersU_FIO_PLUS_BOSS: TStringField
      FieldKind = fkCalculated
      FieldName = 'U_FIO_PLUS_BOSS'
      Size = 50
      Calculated = True
    end
    object QViewUsersU_EDIT_PRICES: TSmallintField
      FieldName = 'U_EDIT_PRICES'
      Required = True
    end
  end
  object DSData: TDataSource
    DataSet = qData
    Left = 488
    Top = 368
  end
  object qData: TZReadOnlyQuery
    Connection = ZC
    SQL.Strings = (
      'SELECT pl_id, pl_headerid, pl.pl_treeid, pl_price,'
      'cast(:node as varchar(200)) as pl_parent,'
      
        '(select pt_value from prices_tree pt where pt.pt_id = pl.pl_tree' +
        'id'
      'and pt_isclosed =0) pt_value,'
      'cm.cm_name, cm.cm_id,  cm.cm_city, cm.cm_business,'
      'pl_value1, pl_value2, pl_value3,'
      'pl_value4, pl_value5, pl_value6,'
      'pl_value7, pl_value8, pl_value9,'
      'pl_orderby, pl_date_update,'
      'tl_color, '
      'pl_isclosed'
      'FROM price_lines pl, price_headers ph , company cm'
      'left join TRUSTLEVEL tl on tl.tl_id = cm.cm_trust'
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
      
        'and ((upper(cm_name COLLATE WIN1251) like '#39'%'#39'||upper(:company)||' +
        #39'%'#39') or (cast(:company as varchar(100)) ='#39#39') )'
      
        'and ((UPPER(cm_business COLLATE WIN1251) like '#39'%'#39'||upper(:busine' +
        'ss)||'#39'%'#39' ) or (cast(:business as varchar(100)) ='#39#39') )'
      'ORDER BY ph.ph_date_insert, pl_orderby '
      ' ')
    Params = <
      item
        DataType = ftString
        Name = 'node'
        ParamType = ptInput
        Size = 100
        Value = ''
      end
      item
        DataType = ftInteger
        Name = 'treeid'
        ParamType = ptInput
        Size = 6
        Value = 174
      end
      item
        DataType = ftString
        Name = 'company'
        ParamType = ptInput
        Size = 100
        Value = ''
      end
      item
        DataType = ftString
        Name = 'business'
        ParamType = ptInput
        Size = 100
      end>
    Left = 536
    Top = 368
    ParamData = <
      item
        DataType = ftString
        Name = 'node'
        ParamType = ptInput
        Size = 100
        Value = ''
      end
      item
        DataType = ftInteger
        Name = 'treeid'
        ParamType = ptInput
        Size = 6
        Value = 174
      end
      item
        DataType = ftString
        Name = 'company'
        ParamType = ptInput
        Size = 100
        Value = ''
      end
      item
        DataType = ftString
        Name = 'business'
        ParamType = ptInput
        Size = 100
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
      Size = 100
    end
    object qDataCM_ID: TIntegerField
      FieldName = 'CM_ID'
      Required = True
    end
    object qDataCM_BUSINESS: TStringField
      FieldName = 'CM_BUSINESS'
      Required = True
      Size = 100
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
end
