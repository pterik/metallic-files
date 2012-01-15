unit ShowPrice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, Grids, DBGrids, DBGridEh, DataModule, MdiChild, ExtCtrls;

type
  TFormPriceShow = class(TFormMdiChild)
    Grid: TDBGridEh;
    qData: TZReadOnlyQuery;
    qDataPL_ID: TIntegerField;
    qDataPL_HEADERID: TIntegerField;
    qDataPL_TREEID: TIntegerField;
    qDataCM_NAME: TStringField;
    qDataCM_ID: TIntegerField;
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
    DSData: TDataSource;
    qDataPL_PRICE: TFloatField;
    qDataPL_PARENT: TStringField;
    qDataPT_VALUE: TStringField;
    qDataFl: TZReadOnlyQuery;
    qDataCM_CITY: TStringField;
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    CBFields: TComboBox;
    BitBtnInsert: TBitBtn;
    Label2: TLabel;
    CBFilter: TComboBox;
    ButtonFilterClear: TButton;
    qDataTL_COLOR: TIntegerField;
    btnPrevFilter: TButton;
    pnlTop: TPanel;
    strngfldDataCM_BUSINESS: TStringField;
    strngfldDataCM_HYPERLINK: TStringField;
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
    procedure pnlTopResize(Sender: TObject);
    procedure btnPrevFilterClick(Sender: TObject);
  private
    MyNode: TNodeValue;
    F_CBFieldsName, F_CBFieldsTitle, F_FieldToqDataFL:string;
//    QDataPrevFilter, Panel1PrevCaption: string;
    F_FilterToQDataFL, F_Prev_FilterToQDataFL:string;
    F_QDataPrevFilter:string;
    F_CompanyLike, F_Prev_CompanyLike, F_Business, F_Prev_Business: string;
    F_Panel1PrevCaption:string;
    F_LastSorted: string;
    procedure RefreshPrices;
    procedure RefreshQDataFL;
//    procedure AddFilterToqDataFL(const SFilter: string);
    procedure ClearCBFilter;
    procedure RefreshCBFields;
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
    procedure AddFieldToqDataFL(const SField: string);
    procedure AddFilterToqDataFL(const SFilter: string);

  public
    procedure SetTree(TreeID: Integer);
//    procedure AddFilterToQData(SFilter: string);
//    procedure AddFieldToqDataFL(const SField: string);
//    procedure ClearFilterOnQData;
//    procedure ClearFilterOnQDataFL;

    property CompanyLike:string read GetCompanyLike write SetCompanyLike;
    property Business:string read GetBusiness write SetBusiness;
    property Caption:string write AddCaption;
    property Filter:string write AddFilter;
    property FilterFL:string write AddFilterFL;
  end;

var
  FormPriceShow: TFormPriceShow;

implementation

{$R *.dfm}

uses
  MainForm, ShowCompany, CommonUnit;

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
  ClearFilter;
  ClearFilterFL;
  ClearCaption;
  ClearCompanyLike;
  ClearBusiness;
  ClearFilter;
  ClearCaption;
  ClearFilterFL;
  RefreshCBFields;
  RefreshPrices;
  BtnPrevFilter.Enabled:= True;
  ClearCBFilter;
end;

procedure TFormPriceShow.RefreshPrices;
begin
//  qData.Close;
//  qData.ParamByName('Company').AsString:= CompanyLike;
//  qData.ParamByName('NODE').Value:= MyNode.Value;
//  qData.ParamByName('Business').AsString:= AnsiUppercase(Business);
//  qData.ParamByName('TREEID').AsInteger:= MyNode.Id;
//  qData.Open;
//  DM.RepaintGrid(Grid, MyNode.Id);

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

procedure TFormPriceShow.ButtonFilterClearClick(Sender: TObject);
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

procedure TFormPriceShow.RefreshQDataFL;
begin
  qDataFl.Close;
  qDataFl.SQL.Text:= 'select distinct ' +
    F_FieldToqDataFL + ' as res from (' +
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
    ' AND cm.cm_isclosed = 0 AND ph.ph_isclosed = 0 AND pl.pl_isclosed = 0'
    + F_FilterToQDataFL + ')';
  qDataFl.ParamByName('TREEID').AsInteger:= MyNode.Id;
  qDataFl.ParamByName('NODE').Value:= MyNode.Value;
  qDataFL.Open;
  qDataFL.First;
  ClearCBFilter;
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
    if Grid.Columns[I].Title.Caption = 'Раздел' then
      Continue;
    if Grid.Columns[I].Title.Caption = 'Подраздел' then
      Continue;
    CBFields.Items.Add(Grid.Columns[I].Title.Caption);
  end;
  CBFields.Text:= '';
  ClearCBFilter;
  F_FieldToqDataFL:= '1';
end;

procedure TFormPriceShow.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F2: BitBtnInsert.Click;
    VK_F3: ButtonFilterClear.Click;
    VK_F4: if BtnPrevFilter.Enabled then BtnPrevFilter.Click;
  end;
end;

procedure TFormPriceShow.AddFieldToqDataFL(const SField: string);
begin
  F_FieldToqDataFL:= SField;
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
  AddFieldToqDataFL(F_CBFieldsName);
  RefreshQDataFL;
end;

procedure TFormPriceShow.BitBtnInsertClick(Sender: TObject);
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

procedure TFormPriceShow.GridTitleClick(Column: TColumnEh);
begin
  inherited;
  if F_LastSorted = Column.FieldName then
  begin
    QData.SortedFields:= Column.FieldName;
    QData.SortType:= stDescending;
  end
  else begin
    QData.SortedFields:= Column.FieldName;
    QData.SortType:= stAscending;
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
  // Восстанавливаем выделение текущей позиции курсора
  if gdSelected in State then
  begin
    TDBGridEh(Sender).Canvas.Brush.Color:= clHighLight;
    TDBGridEh(Sender).Canvas.Font.Color:= clHighLightText;
  end;
  // Просим GRID перерисоваться самому
  TDBGridEh(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFormPriceShow.pnlTopResize(Sender: TObject);
var
  Spacing: Integer;
begin
  Spacing:= Panel2.Left;
  Panel1.Width:= pnlTop.Width - Panel1.Left - Spacing;
end;

procedure TFormPriceShow.AddFilterToqDataFL(const SFilter: string);
begin
  F_FilterToqDataFL:= SFilter;
end;

procedure TFormPriceShow.ClearCBFilter;
begin
  CBFilter.Clear;
end;

procedure TFormPriceShow.BtnPrevFilterClick(Sender: TObject);
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

procedure TFormPriceShow.ClearCompanyLike;
begin
F_CompanyLike:='';
F_Prev_CompanyLike:='';
end;

procedure TFormPriceShow.RollbackCompanyLike;
begin
F_CompanyLike:=F_Prev_CompanyLike;
end;

procedure TFormPriceShow.SetCompanyLike(value: string);
begin
F_Prev_CompanyLike:=F_CompanyLike;
F_CompanyLike:=AnsiUpperCase(Value);
end;

procedure TFormPriceShow.ClearCaption;
begin
Panel1.Caption:='';
end;

procedure TFormPriceShow.RollbackCaption;
begin
Panel1.Caption:=F_Panel1PrevCaption;
end;

procedure TFormPriceShow.AddCaption(Value: string);
begin
F_Panel1PrevCaption:=Panel1.Caption;
Panel1.Caption:=Panel1.Caption+Value;
end;

function TFormPriceShow.GetCompanyLike: string;
begin
Result:=F_CompanyLike;
end;

function TFormPriceShow.GetBusiness: string;
begin
Result:=F_Business;
end;

procedure TFormPriceShow.SetBusiness(Value: string);
begin
F_Prev_Business:=F_Business;
F_Business:=Value;
end;

procedure TFormPriceShow.RollbackBusiness;
begin
F_Business:=F_Prev_Business;
end;

procedure TFormPriceShow.ClearBusiness;
begin
F_Business:='';
F_Prev_Business:='';
end;

procedure TFormPriceShow.ClearFilter;
begin
qData.Filtered:= False;
qData.Filter:= '1=1';
qData.Filtered:= True;
end;

procedure TFormPriceShow.RollbackFilter;
begin
qData.Filtered:= False;
qData.Filter:= F_qDataPrevFilter;
qData.Filtered:= True;
end;

procedure TFormPriceShow.AddFilter(Value: string);
begin
F_qDataPrevFilter:=qData.Filter;
qData.Filtered:= False;
qData.Filter:= qData.Filter + ' ' + Value;
qData.Filtered:= True;
end;

procedure TFormPriceShow.AddFilterFL(Value: string);
begin
  F_Prev_FilterToQDataFL:=F_FilterToqDataFL;
  F_FilterToqDataFL:= Value;
end;

procedure TFormPriceShow.RollbackFilterFL;
begin
  F_FilterToqDataFL:= F_Prev_FilterToQDataFL;
end;

procedure TFormPriceShow.ClearFilterFL;
begin
  F_FilterToQDataFL:= 'and 1=1';
  F_Prev_FilterToQDataFL:=F_FilterToQDataFL;
end;

end.

