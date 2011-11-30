unit ShowPrice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, Grids, DBGrids, DBGridEh, DataModule,  MdiChild, ExtCtrls;

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
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CBFilterExit(Sender: TObject);
    procedure ButtonFilterClearClick(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CBFieldsSelect(Sender: TObject);
    procedure BitBtnInsertClick(Sender: TObject);
    procedure GridTitleClick(Column: TColumnEh);
    procedure GridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure btnPrevFilterClick(Sender: TObject);
  private
    MyNode:TNodeValue;
    L_Colors:integer;
    F_CBFieldsName, F_CBFieldsTitle, F_FieldToqDataFL, F_FilterToQDataFL :string;
    QDataPrevFilter, Panel1PrevCaption :string;
    F_ColumnName, F_ColumnTitle:string;
    F_LastSorted:string;
    procedure RefreshPrices;
    procedure RefreshQDataFL;
  public
    procedure SetTree(TreeID: integer);
    procedure AddFilterToQData(SFilter:string);
    procedure AddFieldToqDataFL(SField:string);
    procedure AddCBFields;
    procedure ClearFilterOnQData;
    procedure ClearFilterOnQDataFL;
  end;

var
  FormPriceShow: TFormPriceShow;

implementation

uses MainForm, ShowCompany, CommonUnit;

{$R *.dfm}

{ TFormPriceShow }

procedure TFormPriceShow.SetTree(TreeID:integer);
begin
MyNode.ID:=Treeid;
ClearFilterOnQData;
ClearFilteronQDataFL;
RefreshPrices;
AddCBFields;
Panel1.Caption:='';
BtnPrevFilter.Enabled:=true;
end;

procedure TFormPriceShow.RefreshPrices;
begin
qData.Close;
qData.ParamByName('TREEID').AsInteger:=MyNode.ID;
if MyNode.ParentID=0
then qData.ParamByName('NODE').Value:=MyNode.Value
else qData.ParamByName('NODE').Value:=MyNode.ParentValue;
qData.Open;
DM.RepaintGrid(Grid, MyNode.ID);
end;

procedure TFormPriceShow.FormCreate(Sender: TObject);
begin
MyNode:=TNodeValue.Create;
end;

procedure TFormPriceShow.FormDestroy(Sender: TObject);
begin
MyNode.Destroy;
end;

procedure TFormPriceShow.CBFilterExit(Sender: TObject);
begin
BitBtnInsert.Click;
end;

procedure TFormPriceShow.ButtonFilterClearClick(Sender: TObject);
begin
ClearFilterOnQData;
ClearFilteronQDataFL;
RefreshPrices;
AddCBFields;
Panel1.Caption:='';
Panel1PrevCaption:='';
BtnPrevFilter.Enabled:=true;
QDataPrevFilter:='';
end;

procedure TFormPriceShow.AddFilterToQData(SFilter: string);
begin
qData.Filtered:=false;
qDataPrevFilter:=qData.Filter;
qData.Filter:=qData.Filter+' '+SFilter;
qData.Filtered:=true;
end;

procedure TFormPriceShow.RefreshQDataFL;
begin
qDataFl.Close;
qDataFl.SQL.Text:='select distinct '+
F_FieldToqDataFL + ' as res from ('+
' SELECT pl_id, pl_headerid, pl.pl_treeid, pl_price, '+
' cast(:node as varchar(200)) as pl_parent, '+
' (select pt_value from prices_tree pt where pt.pt_id = pl.pl_treeid) pt_value, '+
' cm.cm_name, cm.cm_id, cm_city, pl_value1, pl_value2, pl_value3, '+
' pl_value4, pl_value5, pl_value6, pl_value7, pl_value8, pl_value9, '+
' pl_orderby, pl_date_update, pl_isclosed '+
' FROM price_lines pl, price_headers ph , company cm '+
' WHERE ((pl.pl_treeid = :treeid) '+
' OR (pl.pl_treeid IN ( SELECT pt_id FROM prices_tree '+
'    WHERE pt_parentid =:treeid and pt_isclosed =0)))'+
' AND ph.ph_id = pl.pl_headerid AND cm.cm_id = ph.ph_companyid '+
' AND cm.cm_isclosed = 0 AND ph.ph_isclosed = 0 AND pl.pl_isclosed = 0'
+ F_FilterToQDataFL+')';
qDataFl.ParamByName('TREEID').AsInteger:=MyNode.ID;
if MyNode.ParentID=0
then qDataFl.ParamByName('NODE').Value:=MyNode.Value
else qDataFl.ParamByName('NODE').Value:=MyNode.ParentValue;
qDataFL.Open;
qDataFL.First;
CBFilter.Clear;
while not QDataFL.EOF do
  begin
  if not VarIsNull(qDataFL['RES'])
  then
    begin
    CBFilter.Items.Add(qDataFL['RES']);
    end;
  qDataFL.Next;
  end;
end;

procedure TFormPriceShow.FormPaint(Sender: TObject);
begin
  inherited;
//Grid.Width:=FormPriceShow.ClientWidth-10;
end;

procedure TFormPriceShow.AddCBFields;
var
  I: Integer;
begin
CBFields.Clear;
CBFields.Text:=Grid.Columns[0].Title.Caption;
for I := 0 to Grid.Columns.Count - 1 do
  begin
  if Grid.Columns[i].Title.Caption = 'Раздел' then continue;
  if Grid.Columns[i].Title.Caption = 'Подраздел' then continue;
  CBFields.Items.Add(Grid.Columns[i].Title.Caption);
  end;
CBFields.Text:='';
CBFilter.Clear;
F_FieldToqDataFL:='1';
end;

procedure TFormPriceShow.ClearFilterOnQData;
begin
qData.Filter:='1=1';
qData.Filtered:=true;
end;

procedure TFormPriceShow.ClearFilterOnQDataFL;
begin
F_FilterToQDataFL:='and 1=1';
//F_Filter_PrevState:='';
end;

procedure TFormPriceShow.AddFieldToqDataFL(SField: string);
begin
F_FieldToqDataFL:=SField;
end;

procedure TFormPriceShow.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
case Key of
  VK_F2: BitBtnInsert.Click;
  VK_F3: ButtonFilterClear.Click;
  VK_F4: If BtnPrevFilter.Enabled then BtnPrevFilter.Click;
end;
end;

procedure TFormPriceShow.CBFieldsSelect(Sender: TObject);
var i:integer;
begin
F_CBFieldsTitle:=CBFields.Text;
for I := 0 to Grid.Columns.Count - 1 do
  begin
  if F_CBFieldsTitle=Grid.Columns[i].Title.Caption then
    begin
    F_CBFieldsName:=Grid.Columns[i].FieldName;
    break;
    end;
  end;
AddFieldToqDataFL(F_CBFieldsName);
RefreshQDataFL;

end;

procedure TFormPriceShow.BitBtnInsertClick(Sender: TObject);
begin
if (CBFilter.Text<>'') and (F_CBFieldsName<>'') then
  begin
  BtnPrevFilter.Enabled:=True;
  AddFilterToQData(' and '+F_CBFieldsName+' = '''+CBFilter.Text+'''');
  Panel1PrevCaption:=Panel1.Caption;
  Panel1.Caption:=Panel1.Caption+ F_CBFieldsTitle+' = '+CBFilter.Text+', ';
  CBFields.Clear;
  CBFilter.Clear;
  AddCBFields;
  end;
end;

procedure TFormPriceShow.GridTitleClick(Column: TColumnEh);
begin
  inherited;
if F_LastSorted=Column.FieldName then
  begin
  QData.SortedFields:=Column.FieldName;
  QData.SortType:=stDescending;
  end
else
  begin
  QData.SortedFields:=Column.FieldName;
  QData.SortType:=stAscending;
  end;
F_LastSorted:=Column.FieldName;
end;

procedure TFormPriceShow.GridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  inherited;
if VarisNull(qData['TL_Color'])
then TDBGridEh(Sender).Canvas.Brush.Color:=clWhite
else TDBGridEh(Sender).Canvas.Brush.Color:=qData['TL_Color'];
	// Восстанавливаем выделение текущей позиции курсора
	IF  gdSelected   IN State Then
  Begin
		TDBGridEh(Sender).Canvas.Brush.Color:= clHighLight;
		TDBGridEh(Sender).Canvas.Font.Color := clHighLightText;
	End;
	// Просим GRID перерисоваться самому
	TDBGridEh(Sender).DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TFormPriceShow.btnPrevFilterClick(Sender: TObject);
begin
BtnPrevFilter.Enabled:=False;
qData.Filter:=qDataPrevFilter;
AddFilterToQData('');
Panel1.Caption:=Panel1PrevCaption;
end;

end.
