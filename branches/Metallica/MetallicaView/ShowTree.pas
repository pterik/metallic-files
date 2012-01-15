unit ShowTree;

interface

uses
  Windows, Classes, Graphics, Forms, Controls, Grids, DBGridEh, ComCtrls,
  DB, ZAbstractRODataset, ZDataset, DataModule, StdCtrls, MDIChild, Buttons,
  Mask, DBCtrlsEh, ExtCtrls;

type
  TFormTree = class(TFormMDIChild)
    Tree: TTreeView;
    Grid: TDBGridEh;
    DSData: TDataSource;
    qData: TZReadOnlyQuery;
    qDataPL_ID: TIntegerField;
    qDataPL_HEADERID: TIntegerField;
    qDataPL_TREEID: TIntegerField;
    qDataCM_NAME: TStringField;
    qDataCM_ID: TIntegerField;
    qDataPL_PRICE: TFloatField;
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
    qDataPL_PARENT: TStringField;
    qDataPT_VALUE: TStringField;
    qDataCM_CITY: TStringField;
    qDataFl: TZReadOnlyQuery;
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    CBFields: TComboBox;
    BitBtnInsert: TBitBtn;
    Label2: TLabel;
    CBFilter: TComboBox;
    ButtonFilterClear: TButton;
    qDataTL_COLOR: TIntegerField;
    pnlRight: TPanel;
    pnlTop: TPanel;
    btnPrevFilter: TButton;
    qDataCM_BUSINESS: TStringField;
    strngfldDataCM_HYPERLINK: TStringField;
    procedure TreeChange(Sender: TObject; Node: TTreeNode);
    procedure TreeExpanding(Sender: TObject; Node: TTreeNode;
      var AllowExpansion: Boolean);
    procedure GridCellClick(Column: TColumnEh);
    procedure GridDblClick(Sender: TObject);
    procedure GridEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure GridTitleClick(Column: TColumnEh);
    procedure ButtonFilterClearClick(Sender: TObject);
    procedure CBFieldsSelect(Sender: TObject);
    procedure BitBtnInsertClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure btnPrevFilterClick(Sender: TObject);
  private
    F_FieldName1, F_FieldName2: string;
    F_Column1Name, F_Column1Title: string;
    F_CBFieldsName, F_CBFieldsTitle, F_FieldToqDataFL: string;
    F_FilterToQDataFL, F_Prev_FilterToQDataFL:string;
    F_QDataPrevFilter:string;
    F_LastSorted: string;
    F_CompanyLike, F_Prev_CompanyLike, F_Business, F_Prev_Business: string;
    F_Panel1PrevCaption:string;
    procedure RefreshPrices;
    procedure AddFieldToqDataFL(const SField: string);
    procedure RefreshQDataFL;
    procedure ClearFilters;
    procedure RefreshCBFields;
    procedure ClearCBFilter;
    procedure RollbackCompanyLike;
    procedure ClearCompanyLike;
    procedure RollbackBusiness;
    procedure ClearBusiness;
    procedure RollbackCaption;
    procedure ClearCaption;
    procedure SetCompanyLike(Value:string);
    function  GetCompanyLike:string;
    procedure SetBusiness(Value:string);
    function  GetBusiness:string;
    procedure AddCaption(Value:string);
    procedure AddFilter(Value:string);
    procedure RollbackFilter;
    procedure ClearFilter;
    procedure AddFilterFL(Value:string);
    procedure RollbackFilterFL;
    procedure ClearFilterFL;
  public
    MyNode: TNodeValue;
    F_ColumnName, F_ColumnTitle: string;
    property CompanyLike:string read GetCompanyLike write SetCompanyLike;
    property Business:string read GetBusiness write SetBusiness;
    property Caption:string write AddCaption;
    property Filter:string write AddFilter;
    property FilterFL:string write AddFilterFL;
    procedure SetTree;
  end;

implementation

uses
  SysUtils, ShowCompany, Variants, Dialogs, ShowPrice, MainForm;

{$R *.DFM}

procedure TFormTree.TreeChange(Sender: TObject; Node: TTreeNode);
var
  NextParent, LastParent: Integer;
begin
  if MyNode.ParentID = 0 then LastParent:= MyNode.Id else LastParent:= MyNode.ParentID;
  MyNode.Id:= Integer(Tree.Selected.Data);
  if MyNode.ParentID = 0 then NextParent:= MyNode.Id else NextParent:= MyNode.ParentID;
  if NextParent <> LastParent then
    begin
    ButtonFilterClear.Click;
    end
  else
    begin
    RefreshPrices;
    RefreshCBFields;
    ClearCBFilter;
    end;
end;

procedure TFormTree.TreeExpanding(Sender: TObject; Node: TTreeNode;
  var AllowExpansion: Boolean);
begin
  MyNode.Id:= Integer(Node.Data);
  RefreshPrices;
end;

procedure TFormTree.GridCellClick(Column: TColumnEh);
begin
  F_FieldName2:= F_FieldName1;
  F_FieldName1:= Column.FieldName;
end;

procedure TFormTree.GridDblClick(Sender: TObject);
var
  LCompanyShow: TFormCompaniesShow;
  LFormPriceShow: TFormPriceShow;
begin
  if (F_FieldName1 = 'CM_NAME') and (F_FieldName2 = 'CM_NAME') then
    begin
    if varIsNull(qData['CM_ID']) then
      Exit;
    LCompanyShow:= TFormCompaniesShow.Create(Application);
    LCompanyShow.SetCompany(qData['CM_ID']);
    LCompanyShow.Caption:= 'Компания ' + qData['CM_NAME'];
    end
  else
    begin
    if varIsNull(qData['CM_ID']) then Exit;
    LFormPriceShow:= TFormPriceShow.Create(Application);
    LFormPriceShow.SetTree(qData['PL_TREEID']);
    LFormPriceShow.Caption:= 'Рубрика ' + MyNode.Value;
    end;
end;

procedure TFormTree.GridEnter(Sender: TObject);
begin
  F_FieldName1:= 'CM_NAME';
end;

procedure TFormTree.RefreshPrices;
begin
  qData.Close;
  qData.ParamByName('Company').AsString:= CompanyLike;
  qData.ParamByName('TREEID').AsInteger:= MyNode.Id;
  qData.ParamByName('Business').AsString:= AnsiUppercase(Business);
  if MyNode.ParentID = 0 then
    qData.ParamByName('NODE').Value:= MyNode.Value
  else
    qData.ParamByName('NODE').Value:= MyNode.ParentValue;
  qData.Open;
  if MyNode.ParentID <> 0 then
    DM.RepaintGrid(Grid, MyNode.ParentID)
  else
    DM.RepaintGrid(Grid, MyNode.Id)
end;

procedure TFormTree.FormCreate(Sender: TObject);
begin
  MyNode:= TNodeValue.Create;
end;

procedure TFormTree.FormDestroy(Sender: TObject);
begin
  MyNode.Free;
end;

procedure TFormTree.SetTree;
begin
  F_FieldName1:= '';
  F_FieldName2:= '';
  F_Column1Name:= '';
  F_Column1Title:= '';
  ClearCompanyLike;
  ClearBusiness;
  ClearFilter;
  ClearCaption;
  DM.TreeFulFill(Tree, True, 0);
  ClearFilterFL;
  RefreshPrices;
  RefreshCBFields;
  ClearCBFilter;
end;

procedure TFormTree.GridTitleClick(Column: TColumnEh);
begin
  //qData.SortedFields:=Column.FieldName;
  if F_LastSorted = Column.FieldName then
  begin
    QData.SortedFields:= Column.FieldName;
    QData.SortType:= stDescending;
  end
  else
  begin
    QData.SortedFields:= Column.FieldName;
    QData.SortType:= stAscending;
  end;
  F_LastSorted:= Column.FieldName;

  if VarIsNull(qData['PL_ID']) then
    Exit;
  F_ColumnName:= Column.FieldName;
  F_ColumnTitle:= Column.Title.Caption;
end;

procedure TFormTree.ButtonFilterClearClick(Sender: TObject);
begin
  ClearCompanyLike;
  ClearBusiness;
  ClearFilter;
  ClearFilterFL;
  RefreshPrices;
  RefreshCBFields;
  ClearCBFilter;
  ClearCaption;
  BtnPrevFilter.Enabled:=true;
end;

procedure TFormTree.ClearFilterFL;
begin
  F_FilterToQDataFL:= 'and 1=1';
  F_Prev_FilterToQDataFL:=F_FilterToQDataFL;
end;

procedure TFormTree.AddFieldToqDataFL(const SField: string);
begin
  F_FieldToqDataFL:= SField;
end;

procedure TFormTree.RefreshCBFields;
var
  I: Integer;
begin
  CBFields.Clear;
  CBFields.Text:= Grid.Columns[0].Title.Caption;
  for I:= 0 to Grid.Columns.Count - 1 do
  begin
    if Grid.Columns[I].Title.Caption = 'Раздел' then
      Continue;
    if Grid.Columns[I].Title.Caption = 'Подраздел' then
      Continue;
    CBFields.Items.Add(Grid.Columns[I].Title.Caption);
  end;
  CBFields.Text:= '';
  F_FieldToqDataFL:= '1';
end;

procedure TFormTree.RefreshQDataFL;
begin
  qDataFl.Close;
  qDataFl.SQL.Text:= 'select distinct ' +
    F_FieldToqDataFL + ' as res from (' +
    ' SELECT pl_id, pl_headerid, pl.pl_treeid, pl_price, ' +
    ' cast(:node as varchar(200)) as pl_parent, ' +
    ' (select pt_value from prices_tree pt where pt.pt_id = pl.pl_treeid) pt_value, ' +
    ' cm.cm_name, cm.cm_id, cm_city, cm_business, cm_hyperlink,  pl_value1, pl_value2, pl_value3, ' +
    ' pl_value4, pl_value5, pl_value6, pl_value7, pl_value8, pl_value9, ' +
    ' pl_orderby, pl_date_update, pl_isclosed ' +
    ' FROM price_lines pl, price_headers ph , company cm ' +
    ' WHERE ((pl.pl_treeid = :treeid) ' +
    ' OR (pl.pl_treeid IN ( SELECT pt_id FROM prices_tree ' +
    '    WHERE pt_parentid =:treeid and pt_isclosed =0)))' +
    ' AND ph.ph_id = pl.pl_headerid AND cm.cm_id = ph.ph_companyid ' +
    ' AND cm.cm_isclosed = 0 AND ph.ph_isclosed = 0 AND pl.pl_isclosed = 0 '
    + F_FilterToQDataFL + ' ) ';
  qDataFl.ParamByName('TREEID').AsInteger:= MyNode.Id;
  if MyNode.ParentID = 0 then
    qDataFl.ParamByName('NODE').Value:= MyNode.Value
  else
    qDataFl.ParamByName('NODE').Value:= MyNode.ParentValue;
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

procedure TFormTree.AddFilterFL(Value: string);
begin
  F_Prev_FilterToQDataFL:=F_FilterToqDataFL;
  F_FilterToqDataFL:= Value;
end;

procedure TFormTree.RollbackFilterFL;
begin
  F_FilterToqDataFL:= F_Prev_FilterToQDataFL;
end;

procedure TFormTree.CBFieldsSelect(Sender: TObject);
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
  AddFieldToqDataFL(F_CBFieldsName);
  RefreshQDataFL;
end;

procedure TFormTree.BitBtnInsertClick(Sender: TObject);
begin
  if (CBFilter.Text <> '') and (F_CBFieldsName <> '') then
  begin
    BtnPrevFilter.Enabled:=True;
    if CBFields.Text='Поставщик' then
      begin
      AddCaption(F_CBFieldsTitle + ' like ' + CBFilter.Text + ', ');
      CompanyLike:=AnsiUpperCase(CBFilter.Text);
      AddFilter('');
      AddFilterFL(' and upper(' + F_CBFieldsName + ') like upper(''%' + CompanyLike + '%'')');
      end
    else
    if CBFields.Text='Вид деятельности' then
      begin
      Business:=AnsiUpperCase(CBFilter.Text);
      AddCaption(F_CBFieldsTitle + ' like ' + Business + ', ');
      AddFilter('');
      AddFilterFL(' and (upper(cm_business) like ''%''||:business||''%'' or (cast(:business as varchar(100)) ='''') )');
      end
    else
      begin
      AddCaption(F_CBFieldsTitle + ' = ' + CBFilter.Text + ', ');
      AddFilter(' and ' + F_CBFieldsName + ' = ''' + CBFilter.Text + '''');
      AddFilterFL(' and ' + F_CBFieldsName + ' = ' + '''' + CBFilter.Text + '''');
      end;
    RefreshPrices;
    RefreshCBFields;
    ClearCBFilter;
  end;
end;

procedure TFormTree.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F2: BitBtnInsert.Click;
    VK_F3: ButtonFilterClear.Click;
    VK_F4: If BtnPrevFilter.Enabled then BtnPrevFilter.Click;
  end;

end;

procedure TFormTree.ClearFilters;
begin
  CBFields.Clear;
  CBFilter.Clear;
  CBFields.Visible:= True;
  CBFilter.Visible:= True;
end;

procedure TFormTree.ClearCBFilter;
begin
  CBFilter.Clear;
end;

procedure TFormTree.GridDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
  inherited;
  if VarisNull(qData['TL_Color']) then
    TDBGridEh(Sender).Canvas.Brush.Color:= clWhite
  else
    TDBGridEh(Sender).Canvas.Brush.Color:= qData['TL_Color'];
  // Восстанавливаем выделение текущей позиции курсора
  if gdSelected in State then
  begin
    TDBGridEh(Sender).Canvas.Brush.Color:= clHighLight;
    TDBGridEh(Sender).Canvas.Font.Color:= clHighLightText;
  end;
  // Просим GRID перерисоваться самому
  TDBGridEh(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFormTree.BtnPrevFilterClick(Sender: TObject);
begin
inherited;
BtnPrevFilter.Enabled:=False;
RollbackCompanyLike;
RollbackBusiness;
RollbackCaption;
RollbackFilter;
RollbackFilterFL;
RefreshPrices;
RefreshCBFields;
ClearCBFilter;
end;

procedure TFormTree.ClearCompanyLike;
begin
F_CompanyLike:='';
F_Prev_CompanyLike:='';
end;

procedure TFormTree.RollbackCompanyLike;
begin
F_CompanyLike:=F_Prev_CompanyLike;
end;

procedure TFormTree.SetCompanyLike(value: string);
begin
F_Prev_CompanyLike:=F_CompanyLike;
F_CompanyLike:=AnsiUpperCase(Value);
end;

procedure TFormTree.ClearCaption;
begin
Panel1.Caption:='';
end;

procedure TFormTree.RollbackCaption;
begin
Panel1.Caption:=F_Panel1PrevCaption;
end;

procedure TFormTree.AddCaption(Value: string);
begin
F_Panel1PrevCaption:=Panel1.Caption;
Panel1.Caption:=Panel1.Caption+Value;
end;

function TFormTree.GetCompanyLike: string;
begin
Result:=F_CompanyLike;
end;

function TFormTree.GetBusiness: string;
begin
Result:=F_Business;
end;

procedure TFormTree.SetBusiness(Value: string);
begin
F_Prev_Business:=F_Business;
F_Business:=Value;
end;

procedure TFormTree.RollbackBusiness;
begin
F_Business:=F_Prev_Business;
end;

procedure TFormTree.ClearBusiness;
begin
F_Business:='';
F_Prev_Business:='';
end;

procedure TFormTree.ClearFilter;
begin
qData.Filtered:= False;
qData.Filter:= '1=1';
qData.Filtered:= True;
end;

procedure TFormTree.RollbackFilter;
begin
qData.Filtered:= False;
qData.Filter:= F_qDataPrevFilter;
qData.Filtered:= True;
end;

procedure TFormTree.AddFilter(Value: string);
begin
F_qDataPrevFilter:=qData.Filter;
qData.Filtered:= False;
qData.Filter:= qData.Filter + ' ' + Value;
qData.Filtered:= True;
end;

end.

