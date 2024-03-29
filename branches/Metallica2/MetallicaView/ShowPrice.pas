unit ShowPrice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Buttons, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, 
  Grids, DBGrids, DBGridEh, DataModule, MdiChild, ExtCtrls, CommonUnit, 
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh, sTreeView,
  sCheckBox, sButton, sBitBtn, sComboBox, sLabel, sPanel, MemDS, DBAccess, Uni,
  Vcl.Mask, sMaskEdit, sCustomComboEdit;

type
  TFormPriceShow = class(TFormMDIChild)
    Grid: TDBGridEh;
    DSData: TDataSource;
    pnlFilters: TsPanel;
    pnlButtons: TsPanel;
    Label1: TsLabel;
    CBFields: TsComboBox;
    BitBtnInsert: TsBitBtn;
    Label2: TsLabel;
    CBFilter: TsComboBox;
    ButtonFilterClear: TsButton;
    pnlTop: TsPanel;
    chk1: TsCheckBox;
    chk2: TsCheckBox;
    chk3: TsCheckBox;
    chk4: TsCheckBox;
    chk5: TsCheckBox;
    qData: TUniQuery;
    qDataFl: TUniQuery;
    qDataPL_ID: TIntegerField;
    qDataPL_HEADERID: TIntegerField;
    qDataPL_TREEID: TIntegerField;
    qDataPL_PRICE: TFloatField;
    qDataPL_PARENT: TStringField;
    qDataPT_VALUE: TStringField;
    qDataCM_NAME: TStringField;
    qDataCM_ID: TIntegerField;
    qDataCM_CITY: TStringField;
    qDataCM_BUSINESS: TStringField;
    qDataCM_HYPERLINK: TStringField;
    qDataTL_COLOR: TIntegerField;
    qDataPL_VALUE1: TStringField;
    qDataPL_VALUE2: TStringField;
    qDataPL_VALUE3: TStringField;
    qDataPL_VALUE4: TStringField;
    qDataPL_VALUE5: TStringField;
    qDataPL_VALUE6: TStringField;
    qDataPL_VALUE7: TStringField;
    qDataPL_VALUE8: TStringField;
    qDataPL_VALUE9: TStringField;
    qDataPL_ORDERBY: TIntegerField;
    qDataPL_DATE_UPDATE: TDateTimeField;
    qDataPL_ISCLOSED: TSmallintField;
    qDataFlPL_ID: TIntegerField;
    qDataFlPL_HEADERID: TIntegerField;
    qDataFlPL_TREEID: TIntegerField;
    qDataFlPL_PRICE: TFloatField;
    qDataFlPL_PARENT: TStringField;
    qDataFlPT_VALUE: TStringField;
    qDataFlCM_NAME: TStringField;
    qDataFlCM_ID: TIntegerField;
    qDataFlCM_CITY: TStringField;
    qDataFlPL_VALUE1: TStringField;
    qDataFlPL_VALUE2: TStringField;
    qDataFlPL_VALUE3: TStringField;
    qDataFlPL_VALUE4: TStringField;
    qDataFlPL_VALUE5: TStringField;
    qDataFlPL_VALUE6: TStringField;
    qDataFlPL_VALUE7: TStringField;
    qDataFlPL_VALUE8: TStringField;
    qDataFlPL_VALUE9: TStringField;
    qDataFlPL_ORDERBY: TIntegerField;
    qDataFlPL_DATE_UPDATE: TDateTimeField;
    qDataFlPL_ISCLOSED: TSmallintField;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ButtonFilterClearClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CBFieldsSelect(Sender: TObject);
    procedure BitBtnInsertClick(Sender: TObject);
    procedure GridTitleClick(Column: TColumnEh);
    procedure GridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure GridDblClick(Sender: TObject);
    procedure GridCellClick(Column: TColumnEh);
    procedure chk5Click(Sender: TObject);
    procedure chk4Click(Sender: TObject);
    procedure chk3Click(Sender: TObject);
    procedure chk2Click(Sender: TObject);
    procedure chk1Click(Sender: TObject);
    procedure GridKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure pnlFiltersResize(Sender: TObject);
  private
    MyNode: TNodeValue;
    F_CBFieldsName, F_CBFieldsTitle:string;
    F_FieldName:string;
    F_LastSorted: string;
    procedure RefreshQData;
    procedure RefreshQDataFL;
    procedure RefreshCBFields;
    procedure RefreshCaptions;
  public
    Filter:TFilter;
    procedure SetTree(TreeID: Integer);
  end;

var
  FormPriceShow: TFormPriceShow;

implementation

{$R *.dfm}

uses
  MainForm, ShowCompany, ChangePrice;

{ TFormPriceShow }

procedure TFormPriceShow.FormCreate(Sender: TObject);
begin
  MyNode:= TNodeValue.Create;
end;

procedure TFormPriceShow.FormDestroy(Sender: TObject);
begin
  MyNode.Destroy;
end;

procedure TFormPriceShow.SetTree(TreeID: Integer);
begin
  MyNode.Id:= TreeID;
  DM.RepaintGrid(Grid, MyNode.ID);
  Filter.ClearAll;
  RefreshQData;
  RefreshCBFields;
  CBFilter.Clear;
end;

procedure TFormPriceShow.RefreshQData;
begin
RefreshCaptions;
qData.Close;
qData.SQL.Text:='SELECT pl_id, pl_headerid, pl.pl_treeid, pl_price, '+
' cast(:node as varchar(200)) as pl_parent, '+
' (select pt_value from prices_tree pt '+
'  where pt.pt_id = pl.pl_treeid '+
'  and pt_isclosed =0) pt_value, '+
' cm.cm_name, cm.cm_id, cm_city,  cm_business, cm_hyperlink,  tl_color, '+
' pl_value1, pl_value2, pl_value3, pl_value4, pl_value5, pl_value6, '+
' pl_value7, pl_value8, pl_value9, pl_orderby, pl_date_update, pl_isclosed '+
' FROM price_lines pl, price_headers ph , company cm '+
' left join TRUSTLEVEL tl on tl.tl_id = cm.cm_trust '+
' WHERE ((pl.pl_treeid = :treeid) '+
' OR (pl.pl_treeid IN '+
'    (SELECT pt_id FROM prices_tree WHERE pt_parentid =:treeid and pt_isclosed =0) '+
'     )) '+
' AND ph.ph_id = pl.pl_headerid AND cm.cm_id = ph.ph_companyid '+
' AND cm.cm_isclosed = 0 AND ph.ph_isclosed = 0 AND pl.pl_isclosed = 0 '+
' AND upper(cm_name) like ''%''||:company||''%'' '+
' and (upper(cm_city) like upper(''%''||:CITY||''%'') or (cast(:CITY as varchar(100))  = '''')) '+
' AND (upper(cm_business) like ''%''||:business||''%'' or (cast(:business as varchar(100)) ='''') )';
qData.SQL.Add(Filter.Query);
qData.ParamByName('Company').AsString:= AnsiUpperCase(Filter.CompanyLike);
qData.ParamByName('City').AsString:= AnsiUpperCase(Filter.City);
qData.ParamByName('Business').AsString:= AnsiUppercase(Filter.Business);
qData.ParamByName('TREEID').AsInteger:= MyNode.Id;
if MyNode.ParentID = 0 then  qData.ParamByName('NODE').Value:= MyNode.Value
else  qData.ParamByName('NODE').Value:= MyNode.ParentValue;
qData.Open;
if MyNode.ParentID <> 0 then DM.RepaintGrid(Grid, MyNode.ParentID)
else DM.RepaintGrid(Grid, MyNode.Id);
end;

procedure TFormPriceShow.ButtonFilterClearClick(Sender: TObject);
begin
  Filter.ClearAll;
  RefreshQData;
  RefreshCBFields;
  CBFilter.Clear;
end;

procedure TFormPriceShow.RefreshQDataFL;
var FieldsName:string;
begin
if F_CBFieldsName='' then FieldsName:= '1' else FieldsName:=F_CBFieldsName;
qDataFl.Close;
qDataFl.SQL.Text:= 'select distinct ' +
  FieldsName + ' as res from (' +
  ' SELECT pl_id, pl_headerid, pl.pl_treeid, pl_price, ' +
  ' cast(:node as varchar(200)) as pl_parent, ' +
  ' (select pt_value from prices_tree pt where pt.pt_id = pl.pl_treeid) pt_value, ' +
  ' cm.cm_name, cm.cm_id, cm_city, cm_business, cm_hyperlink, pl_value1, pl_value2, pl_value3, ' +
  ' pl_value4, pl_value5, pl_value6, pl_value7, pl_value8, pl_value9, ' +
  ' pl_orderby, pl_date_update, pl_isclosed ' +
  ' FROM price_lines pl, price_headers ph , company cm ' +
  ' WHERE ((pl.pl_treeid = :treeid) ' +
  ' OR (pl.pl_treeid IN ( SELECT pt_id FROM prices_tree ' +
  '    WHERE pt_parentid =:treeid and pt_isclosed =0)))' +
  ' AND ph.ph_id = pl.pl_headerid AND cm.cm_id = ph.ph_companyid ' +
  ' AND cm.cm_isclosed = 0 AND ph.ph_isclosed = 0 AND pl.pl_isclosed = 0 '+
  ' and upper(cm_name) like ''%''||:company||''%'' '+
  ' and (upper(cm_city) like upper(''%''||:CITY||''%'') or (cast(:CITY as varchar(100))  = '''')) '+
  ' and (upper(cm_business) like ''%''||:business||''%'' or (cast(:business as varchar(100)) ='''') ) ';
qDataFl.SQL.Add(Filter.Query);
qDataFl.SQL.Add(')');
qDataFL.ParamByName('Company').AsString:= AnsiUpperCase(Filter.CompanyLike);
qDataFL.ParamByName('City').AsString:= AnsiUpperCase(Filter.City);
qDataFL.ParamByName('Business').AsString:= AnsiUppercase(Filter.Business);
qDataFL.ParamByName('TREEID').AsInteger:= MyNode.Id;
if MyNode.ParentID = 0 then  qDataFL.ParamByName('NODE').Value:= MyNode.Value
else  qDataFL.ParamByName('NODE').Value:= MyNode.ParentValue;
qDataFL.Open;
qDataFL.First;
CBFilter.Clear;
  while not QDataFL.EOF do
  begin
    if not VarIsNull(qDataFL['RES']) then
    begin
      CBFilter.Items.Add(qDataFL['RES']);
    end;
    qDataFL.Next;
  end;
end;

procedure TFormPriceShow.RefreshCBFields;
var
  I: Integer;
begin
CBFields.Clear;
CBFields.Text:= Grid.Columns[0].Title.Caption;
  for I:= 0 to Grid.Columns.Count - 1 do
  begin
    if Grid.Columns[I].Title.Caption = '������' then
      Continue;
    if Grid.Columns[I].Title.Caption = '���������' then
      Continue;
    CBFields.Items.Add(Grid.Columns[I].Title.Caption);
  end;
CBFields.Text:= '';
CBFilter.Clear;
end;

procedure TFormPriceShow.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F2: BitBtnInsert.Click;
    VK_F3: ButtonFilterClear.Click;
  end;
end;

procedure TFormPriceShow.CBFieldsSelect(Sender: TObject);
var
  I: Integer;
begin
  F_CBFieldsTitle:= CBFields.Text;
  for I:= 0 to Grid.Columns.Count - 1 do
  begin
    if F_CBFieldsTitle = Grid.Columns[I].Title.Caption then
    begin
      F_CBFieldsName:= Grid.Columns[I].FieldName;
      Break;
    end;
  end;
  RefreshQDataFL;
end;

procedure TFormPriceShow.BitBtnInsertClick(Sender: TObject);
begin
if Filter.Counter=5 then
  begin
  MessageDlg('���������� �������� ���������� �����',mtWarning, [mbOK],0);
  Exit;
  end;
  if (CBFilter.Text <> '') and (F_CBFieldsName <> '') then
  begin
  if CBFields.Text='���������' then
      begin
      Filter.CompanyLike:=AnsiUpperCase(CBFilter.Text);
      Filter.AddFilter(F_CBFieldsName, CBFields.Text,CBFilter.Text);
      end
  else
  if CBFields.Text='��� ������������' then
      begin
      Filter.Business:=AnsiUpperCase(CBFilter.Text);
      Filter.AddFilter(F_CBFieldsName, CBFields.Text,CBFilter.Text);
      end
  else
      begin
      Filter.AddFilter(F_CBFieldsName, CBFields.Text,CBFilter.Text);
      end;
  RefreshQData;
  RefreshCBFields;
  CBFilter.Clear;
  end;
end;

procedure TFormPriceShow.GridTitleClick(Column: TColumnEh);
begin
  inherited;
  if F_LastSorted = Column.FieldName then
  begin
    //QData.SortedFields:= Column.FieldName;
    //QData.SortType:= stDescending;
    QData.IndexFieldNames:= Column.FieldName+ ' DESC' ;
  end
  else begin
    //QData.SortedFields:= Column.FieldName;
    //QData.SortType:= stAscending;
    QData.IndexFieldNames:= Column.FieldName+ ' ASC' ;
  end;
  F_LastSorted:= Column.FieldName;
end;

procedure TFormPriceShow.GridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  inherited;
  if VarisNull(qData['TL_Color']) then
    TDBGridEh(Sender).Canvas.Brush.Color:= clWhite
  else
    TDBGridEh(Sender).Canvas.Brush.Color:= qData['TL_Color'];
  // ��������������� ��������� ������� ������� �������
  if gdSelected in State then
  begin
    TDBGridEh(Sender).Canvas.Brush.Color:= clHighLight;
    TDBGridEh(Sender).Canvas.Font.Color:= clHighLightText;
  end;
  // ������ GRID �������������� ������
  TDBGridEh(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, TGridDrawState(State));
end;

procedure TFormPriceShow.GridDblClick(Sender: TObject);
var
  LCompanyShow: TFormCompaniesShow;
  LFormPriceChange:TFormPriceChange;
  link:string;
//  BK:TbookmarkStr;
  BK:TBookmark;
begin
if varIsNull(qData['CM_ID']) then Exit;
if (F_FieldName = 'CM_NAME') then
    begin
    LCompanyShow:= TFormCompaniesShow.Create(Application);
    LCompanyShow.SetCompany(qData['CM_ID']);
    LCompanyShow.Caption:= '�������� ' + qData['CM_NAME'];
    Exit;
    end;
if (F_FieldName = 'CM_HYPERLINK') and not VarIsNull(QData['CM_HYPERLINK']) then
  begin
    link:= QData.Fields.FieldByName('CM_HYPERLINK').AsString;
    ShellOpen(Application.Handle, link);
    Exit;
  end;
if (F_FieldName = 'PL_PRICE') and not VarIsNull(QData['PL_ID']) then
  begin
    LFormPriceChange:= TFormPriceChange.Create(Application);
    LFormPriceChange.SetNewPrice(qData['PL_ID'], qData['PL_TREEID']);
    LFormPriceChange.ShowModal;
    BK:=QData.BookMark;
    RefreshQData;
    qData.Bookmark:=BK;
    Exit;
  end;
end;

procedure TFormPriceShow.GridCellClick(Column: TColumnEh);
begin
  inherited;
  F_FieldName:= Column.FieldName;
end;

procedure TFormPriceShow.chk5Click(Sender: TObject);
begin
  inherited;
  Filter.RemoveFilter(5);
  RefreshQData;
  RefreshCBFields;
  CBFilter.Clear;
end;

procedure TFormPriceShow.chk4Click(Sender: TObject);
begin
  inherited;
  Filter.RemoveFilter(4);
  RefreshQData;
  RefreshCBFields;
  CBFilter.Clear;
end;

procedure TFormPriceShow.chk3Click(Sender: TObject);
begin
  inherited;
  Filter.RemoveFilter(3);
  RefreshQData;
  RefreshCBFields;
  CBFilter.Clear;
end;

procedure TFormPriceShow.chk2Click(Sender: TObject);
begin
  inherited;
  Filter.RemoveFilter(2);
  RefreshQData;
  RefreshCBFields;
  CBFilter.Clear;
end;

procedure TFormPriceShow.chk1Click(Sender: TObject);
begin
  inherited;
  Filter.RemoveFilter(1);
  RefreshQData;
  RefreshCBFields;
  CBFilter.Clear;
end;

procedure TFormPriceShow.RefreshCaptions;
begin
Chk1.Caption:=Filter.Caption(1);
Chk1.Visible:=(Chk1.Caption<>'');
Chk2.Caption:=Filter.Caption(2);
Chk2.Visible:=(Chk2.Caption<>'');
Chk3.Caption:=Filter.Caption(3);
Chk3.Visible:=(Chk3.Caption<>'');
Chk4.Caption:=Filter.Caption(4);
Chk4.Visible:=(Chk4.Caption<>'');
Chk5.Caption:=Filter.Caption(5);
Chk5.Visible:=(Chk5.Caption<>'');
end;

procedure TFormPriceShow.GridKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  LFormPriceChange:TFormPriceChange;
  BK:Tbookmark;
begin
  inherited;
  case Key of
  VK_Insert: if not VarIsNull(QData['PL_ID']) then
    begin
    LFormPriceChange:= TFormPriceChange.Create(Application);
    LFormPriceChange.SetNewPrice(QData['PL_ID'], QData['PL_TREEID']);
    LFormPriceChange.ShowModal;
    BK:=QData.BookMark;
    RefreshQData;
    qData.Bookmark:=BK;
    end;
  end;
end;

procedure TFormPriceShow.pnlFiltersResize(Sender: TObject);
var Chk_Width:Integer;
begin
  inherited;
  Chk_Width:=(pnlFilters.Width-10) div 5;
  chk1.Width:= Chk_Width -2 ;
  chk2.Width:= Chk_Width -2 ;
  chk3.Width:= Chk_Width -2 ;
  chk4.Width:= Chk_Width -2 ;
  chk5.Width:= Chk_Width -2 ;
  chk1.Left:=2+Chk_Width*0;
  chk2.Left:=2+Chk_width*1;
  chk3.Left:=2+Chk_width*2;
  chk4.Left:=2+Chk_width*3;
  chk5.Left:=2+Chk_width*4;
end;

end.
