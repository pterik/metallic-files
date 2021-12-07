unit NewPriceList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Buttons, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, 
  Grids, DBGrids, DBGridEh, ComCtrls, Mask, DBCtrlsEh, DataModule;

type
  TFormNewPriceList = class(TForm)
    BitBtnClose: TsBitBtn;
    Grid: TDBGridEh;
    qDataView: TZReadOnlyQuery;
    qDataViewPL_ID: TIntegerField;
    qDataViewPL_HEADERID: TIntegerField;
    qDataViewPL_TREEID: TIntegerField;
    qDataViewCM_NAME: TStringField;
    qDataViewCM_ID: TIntegerField;
    qDataViewPL_VALUE1: TStringField;
    qDataViewPL_VALUE2: TStringField;
    qDataViewPL_VALUE3: TStringField;
    qDataViewPL_VALUE4: TStringField;
    qDataViewPL_VALUE5: TStringField;
    qDataViewPL_VALUE6: TStringField;
    qDataViewPL_VALUE7: TStringField;
    qDataViewPL_VALUE8: TStringField;
    qDataViewPL_VALUE9: TStringField;
    qDataViewPL_ORDERBY: TIntegerField;
    qDataViewPL_DATE_UPDATE: TDateTimeField;
    qDataViewPL_ISCLOSED: TSmallintField;
    DSData: TDataSource;
    qDataViewPL_PRICE: TFloatField;
    Tree: TsTreeView;
    EditCompany: TsEdit;
    LabelComp: TsLabel;
    LabelCity: TsLabel;
    EditCity: TsEdit;
    QCompany: TZQuery;
    QCompanyCOMPANYID: TIntegerField;
    QCompanyCM_NAME: TStringField;
    QCompanyCM_COMMENT: TStringField;
    DBPrice: TDBEditEh;
    EditNewPrice: TsEdit;
    BitBtnNewTree: TsBitBtn;
    BitBtnUpdate: TsBitBtn;
    BitBtnNewRow: TsBitBtn;
    qRowInsert: TZQuery;
    qRowMaxOrder: TZReadOnlyQuery;
    qRowMaxOrderMAXPOS: TLargeintField;
    qRowExists: TZQuery;
    qRowExistsCNTR: TIntegerField;
    qPriceUpdate: TZQuery;
    IntegerField1: TIntegerField;
    BitBtnSave: TsBitBtn;
    StaticTextX: TStaticText;
    BitBtnStore: TsBitBtn;
    QCompanyCM_CITY: TStringField;
    BitBtnDelete: TsBitBtn;
    qRowUpdate: TZQuery;
    qDataViewPL_NODE: TStringField;
    qPLisFinished: TZQuery;
    IntegerField2: TIntegerField;
    qDataViewCM_CITY: TStringField;
    ButtonLeft: TsButton;
    ButtonRight: TsButton;
    procedure TreeChange(Sender: TObject; Node: TTreeNode);
    procedure TreeExpanding(Sender: TObject; Node: TTreeNode;
      var AllowExpansion: Boolean);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtnUpdateClick(Sender: TObject);
    procedure BitBtnNewTreeClick(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BitBtnNewRowClick(Sender: TObject);
    procedure DSDataDataChange(Sender: TObject; Field: TField);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtnStoreClick(Sender: TObject);
    procedure BitBtnSaveClick(Sender: TObject);
    procedure GridTitleClick(Column: TColumnEh);
    procedure BitBtnDeleteClick(Sender: TObject);
    procedure BitBtnCloseClick(Sender: TObject);
    procedure GridCellClick(Column: TColumnEh);
    procedure ButtonLeftClick(Sender: TObject);
    procedure ButtonRightClick(Sender: TObject);
  private
    F_CompanyID, F_LineID, F_HeaderID:integer;
    F_CurrentField:string;
    F_CurrentFieldNumber:integer;
    F_ShiftState:boolean;
    MyNode:TNodeValue;
    F_EditPrices:integer;
    procedure RefreshPrices;
    function RowMaxOrderby(HeaderID, TreeID: integer): integer;
    function isRowExists(HeaderID, TreeID: integer): boolean;
    procedure GetNewRowPrice;
    procedure UpdateGrid;
  public
    SelectedTreeID:integer;
    procedure SetPosition(L, T: integer);
    procedure SetNewPriceList(CompanyID, HeaderID: integer);
    procedure SavePrice(Line_ID:integer);
  end;

var
  FormNewPriceList: TFormNewPriceList;

implementation

uses MainForm, ShowCompany, CommonUnit, NewItem, NewPriceRow, SelectTree,
  UpdateHeader;

{$R *.dfm}

{ TFormPriceShow }

procedure TFormNewPriceList.SetPosition(L,T:integer);
begin
Left:=L+ShiftLeft;
Top:=T+ShiftTop;
end;

procedure TFormNewPriceList.SetNewPriceList(CompanyID, HeaderID:integer);
begin
F_ShiftState:=false;
F_CompanyID:=CompanyID;
qCompany.Close;
QCompany.ParamByName('COMPANYID').AsInteger:=CompanyID;
qCompany.Open;
EditCompany.Text:=QCompany['CM_NAME'];
EditCity.Text:=QCompany['CM_CITY'];
F_HeaderID:=HeaderID;
DM.TreeFulFill(Tree, false, F_HeaderID);
qPLisFinished.Close;
QPLisFinished.ParamByName('HEADERID').AsInteger:=F_HeaderID;
QPLisFinished.ParamByName('FINISHED').AsInteger:=0;
QPLIsFinished.ExecSQL;
RefreshPrices;
end;

procedure TFormNewPriceList.RefreshPrices;
var i:integer;
begin
Grid.Visible:=false;
qDataView.Close;
qDataView.ParamByName('COMPANYID').AsInteger:=F_CompanyID;
qDataView.ParamByName('TREEID').AsInteger:=MyNode.ID;
qDataView.Open;
if MyNode.ParentID<>0
then
  begin
  DM.RepaintGrid(Grid, MyNode.ParentID,[Fields, FTree, FCompany]);
  end
else
  begin
  DM.RepaintGrid(Grid, MyNode.ID, [Fields, FTree, FCompany]);
  end;
end;

procedure TFormNewPriceList.TreeExpanding(Sender: TObject; Node: TTreeNode;
  var AllowExpansion: Boolean);
begin
MyNode.ID:=Integer(Node.Data);
RefreshPrices;
end;

procedure TFormNewPriceList.TreeChange(Sender: TObject; Node: TTreeNode);
begin
MyNode.ID:=Integer(Tree.Selected.Data);
RefreshPrices;
end;

procedure TFormNewPriceList.BitBtnUpdateClick(Sender: TObject);
begin
if Tree.SelectionCount=0 then
  begin
  MessageDlg('Выберите подстроку в рубрикаторе',mtWarning, [mbOK],0);
  FocusControl(Tree);
  exit;
  end;
if MyNode.ParentID=0 then
  begin
  MessageDlg('Выберите подстроку рбрикатора, а не основную строку',mtWarning, [mbOK],0);
  exit;
  end;
if VarIsNull(qDataView['PL_ID']) then
  begin
  MessageDlg('Ошибка программы, сообщите разработчику',mtError, [mbOK],0);
  exit;
  end;
if FormNewPriceRow=nil then  Application.CreateForm(TFormNewPriceRow, FormNewPriceRow);
FormNewPriceRow.SetPosition(Self.Left,Self.Top);
F_LIneID:=qDataView['PL_ID'];
FormNewPriceRow.SetNewPriceRow(F_CompanyID, MyNode.ID, F_LineID);
FormNewPriceRow.ShowModal;
RefreshPrices;
end;

procedure TFormNewPriceList.BitBtnNewTreeClick(Sender: TObject);
var BookMarkTree:integer;
  I: Integer;
begin
if Tree.SelectionCount<>0
then MyNode.ID:=Integer(Tree.Selected.Data)
else MyNode.ID:=0;
BookMarkTree:=MyNode.ID;
SelectedTreeID:=0;
if FormSelectTree=nil then  Application.CreateForm(TFormSelectTree, FormSelectTree);
FormSelectTree.SetPosition(Self.Left,Self.Top);
FormSelectTree.SetNewTree(MyNode.ID, MyNode.ParentID);
FormSelectTree.ShowModal;
MyNode.ID:=SelectedTreeID;
if SelectedTreeID<>0 then
  begin
  if isRowExists(F_HeaderID, MyNode.ID) then
    begin
//    MessageDlg('Подстрока уже внесена в прайс',mtWarning, [mbOK],0);
    exit;
    end;
  QRowInsert.Close;
  QRowInsert.ParamByName('HEADERID').AsInteger:=F_HeaderID;
  QRowInsert.ParamByName('TREEID').AsInteger:=MyNode.ID;
  QRowInsert.ParamByName('ORDERBY').AsInteger:=RowMaxOrderby(F_HeaderID, MyNode.ID);
  QRowInsert.ExecSQL;
  end;
//Tree.Items.Clear;
//ExpandLevel(nil);
DM.TreeFulFill(Tree, false, F_HeaderID);
MyNode.ID:=BookMarkTree;
for I := 0 to Tree.Items.Count - 1 do
  if    (integer(Tree.Items[i].Data)=MyNode.ID)
     or (integer(Tree.Items[i].Data)=MyNode.ParentID)
  then Tree.Items[i].Expand(true);
Tree.ClearSelection;
for I := 0 to Tree.Items.Count - 1 do
  if integer(Tree.Items[i].Data)=MyNode.ID
    then Tree.Select(Tree.Items[i]);
RefreshPrices;
end;

{function TFormNewPriceList.TreeMaxOrderby(NodeID:integer):integer;
begin
qTreeMaxOrderby.Close;
qTreeMaxOrderby.ParamByName('PARENTID').AsInteger:=NodeID;
qTreeMaxOrderby.Open;
if varIsNull(qTreeMaxOrderby['MAXPOS'])
  then Result:=1
  else Result:=qTreeMaxOrderby['MAXPOS'];
end;
}

function TFormNewPriceList.RowMaxOrderby(HeaderID, TreeID:integer):integer;
begin
qRowMaxOrder.Close;
qRowMaxOrder.ParamByName('HEADERID').AsInteger:=HeaderID;
qRowMaxOrder.ParamByName('TREEID').AsInteger:=TreeID;
qRowMaxOrder.Open;
if varIsNull(qRowMaxOrder['MAXPOS'])
then Result:=1
else Result:=qRowMaxOrder['MAXPOS'];
end;

function TFormNewPriceList.isRowExists(HeaderID, TreeID:integer):boolean;
begin
qRowExists.Close;
qRowExists.ParamByName('HEADERID').AsInteger:=HeaderID;
qRowExists.ParamByName('TREEID').AsInteger:=TreeID;
qRowExists.Open;
if varIsNull(qRowExists['CNTR'])
then Result:=false
else Result:=(qRowExists['CNTR']>0);
end;

procedure TFormNewPriceList.GridDblClick(Sender: TObject);
begin
BitBtnUpdate.OnClick(Sender);
end;

procedure TFormNewPriceList.FormCreate(Sender: TObject);
begin
MyNode:=TNodeValue.Create;
end;

procedure TFormNewPriceList.FormDestroy(Sender: TObject);
begin
MyNode.Destroy;
end;

procedure TFormNewPriceList.BitBtnNewRowClick(Sender: TObject);
begin
if Tree.SelectionCount=0 then
  begin
  MessageDlg('Выберите подстроку рубрикатора',mtWarning, [mbOK],0);
  FocusControl(Tree);
  exit;
  end;
if MyNode.ParentID=0 then
  begin
  MessageDlg('Выберите подстроку рубрикатора, а не основную строку',mtWarning, [mbOK],0);
  exit;
  end;
QRowInsert.Close;
QRowInsert.ParamByName('HEADERID').AsInteger:=F_HeaderID;
QRowInsert.ParamByName('TREEID').AsInteger:=MyNode.ID;
QRowInsert.ParamByName('ORDERBY').AsInteger:=RowMaxOrderby(F_HeaderID, MyNode.ID);
QRowInsert.ExecSQL;
RefreshPrices;
end;

procedure TFormNewPriceList.SavePrice(Line_ID: integer);
begin
if EditNewPrice.Text=DBPrice.Text then exit;
if trim(EditNewPrice.Text)='' then
  begin
  EditNewPrice.Text:=DBPrice.Text;
  FocusControl(EditNewPrice);
  exit;
  end;
try
StrToFloat(EditNewPrice.Text);
except on E: EConvertError do
  begin
  MessageDlg('Для указания дробной части числа используйте запятую',mtError, [mbCancel],0);
  EditNewPrice.Text:=DBPrice.Text;
  FocusControl(EditNewPrice);
  exit;
  end;
end;
qPriceUpdate.Close;
QPriceUpdate.ParamByName('ID').AsInteger:=Line_ID;
QPriceUpdate.ParamByName('PRICE').AsFloat:=StrToFloat(EditNewPrice.Text);
QPriceUpdate.ParamByName('CDATE').AsDate:=Now();
qPriceUpdate.ExecSQL;
end;
procedure TFormNewPriceList.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
F_ShiftState:= (ssShift in Shift);
end;

procedure TFormNewPriceList.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
F_ShiftState:= (ssShift in Shift);
case Key of    //
  VK_Insert: BitBtnNewRow.OnClick(Sender);
	VK_Down: if EditNewPrice.Focused  then
              begin
              SavePrice(qDataView['PL_ID']);
              QDataView.Next;
              UpdateGrid;
              GetNewRowPrice;
              EditNewPrice.SelectAll;
              end;
	VK_Up:   if EditNewPrice.Focused then
              begin
              SavePrice(qDataView['PL_ID']);
              QDataVIew.Prior;
              UpdateGrid;
              GetNewRowPrice;
              EditNewPrice.SelectAll;
              end;
	VK_F4: BitBtnUpdate.OnClick(Sender);
end;
end;

procedure TFormNewPriceList.GetNewRowPrice;
begin
EditNewPrice.Text:=DBPrice.Text;
end;


procedure TFormNewPriceList.UpdateGrid;
var B:TBookmark;
begin
B:=QDataView.GetBookmark;
qDataView.Refresh;
if QDataView.BookmarkValid(B) then
  begin
  QDataView.GotoBookmark(B);
  QDataView.FreeBookmark(B);
  end;
end;

procedure TFormNewPriceList.DSDataDataChange(Sender: TObject;
  Field: TField);
begin
GetNewRowPrice;
end;

procedure TFormNewPriceList.BitBtnStoreClick(Sender: TObject);
begin
if Tree.SelectionCount=0 then
  begin
  MessageDlg('Выберите (под)строку рубрикатора',mtWarning, [mbOK],0);
  FocusControl(Tree);
  exit;
  end;
if F_ShiftState then
  begin
  DM.SaveGlobalHeader(Grid);
  MessageDlg('Сохранены настройки для всех рубрик',mtInformation, [mbOK],0);
  end
else
  begin
  if MyNode.ParentID<>0
  then DM.SaveHeader(Grid, MyNode.ParentID)
  else DM.SaveHeader(Grid, MyNode.ID);
  MessageDlg('Сохранены настройки для подрубрики',mtInformation, [mbOK],0);
  end;
end;

procedure TFormNewPriceList.BitBtnSaveClick(Sender: TObject);
begin
if VarIsNull(qDataView['PL_ID']) then
  begin
  MessageDlg('Нет цены для изменения. Укажите непустую позицию из рубрикатора, ',mtError,[mbOK],0);
  exit;
  end;
SavePrice(qDataView['PL_ID']);
UpdateGrid;
MessageDlg('Цена сохранена. Она автоматически сохраняется '+chr(10)+chr(13)+'при нажатии стрелок "вверх" и "вниз" в синем квадрате',mtInformation, [mbOK],0);
end;

procedure TFormNewPriceList.GridTitleClick(Column: TColumnEh);
var NodeID:integer;
begin
if Tree.SelectionCount=0 then
  begin
  MessageDlg('Выберите строку или подстроку рубрикатора',mtWarning, [mbOK],0);
  FocusControl(Tree);
  exit;
  end;
if F_ShiftState then
  begin
  if FormUpdateHeader=nil then  Application.CreateForm(TFormUpdateHeader, FormUpdateHeader);
  FormUpdateHeader.SetPosition(Self.Left,Self.Top);
  if MyNode.ParentID<>0
  then begin NodeID:=MyNode.ParentID; end
  else begin NodeID:=MyNode.ID; end;
  FormUpdateHeader.SetUpdateHeader(Column.Title.Caption, Column.FieldName,
               Column.DisplayFormat, Column.Width, Column.Index, NodeID);
  FormUpdateHeader.ShowModal;
  end;
//qDataView.SortedFields:=Column.FieldName;
RefreshPrices;
end;

procedure TFormNewPriceList.BitBtnDeleteClick(Sender: TObject);
begin
if Tree.SelectionCount=0 then
  begin
  MessageDlg('Выберите подраздел в рубрикаторе. Если хотите удалить весь раздел, перейдите в окно рубрикатора',mtWarning, [mbOK],0);
  FocusControl(Tree);
  exit;
  end;
if VarIsNull(qDataView['PL_ID']) then
  begin
  MessageDlg('Выберите удаляемую строку',mtError, [mbOK],0);
  exit;
  end;
QRowUpdate.Close;
QRowUpdate.ParamByName('ID').AsInteger:=qDataView['PL_ID'];
QRowUpdate.ParamByName('CDATE').AsDate:=Now();
QRowUpdate.ExecSQL;
RefreshPrices;
end;

procedure TFormNewPriceList.BitBtnCloseClick(Sender: TObject);
begin
if MessageDlg('Прайс-лист уже заполнен?',mtConfirmation,[mbYes,mbNo],0)=mrYes
then
  begin
  qPLisFinished.Close;
  QPLisFinished.ParamByName('HEADERID').AsInteger:=F_HeaderID;
  QPLisFinished.ParamByName('FINISHED').AsInteger:=1;
  QPLIsFinished.ExecSQL;
  end;
end;

procedure TFormNewPriceList.GridCellClick(Column: TColumnEh);
begin
F_CurrentFieldNumber:=Column.Index;// FieldName;
end;

procedure TFormNewPriceList.ButtonLeftClick(Sender: TObject);
var Prev_FieldName, Prev_Title, Prev_format:string;
I, Prev_Width:integer;
begin
I:=F_CurrentFieldNumber;
if I=0 then exit;

Grid.Enabled:=false;
try
Prev_FieldName:=Grid.Columns[i].FieldName;
Prev_Width:=Grid.Columns[i].Width;
Prev_Title:=Grid.Columns[i].Title.Caption;
Prev_Format:=Grid.Columns[i].DisplayFormat;

Grid.Columns[i].FieldName:=Grid.Columns[i-1].FieldName;
Grid.Columns[i].Width:=Grid.Columns[i-1].Width;
Grid.Columns[i].Visible:=true;
Grid.Columns[i].Title.Caption:=Grid.Columns[i-1].Title.Caption;
Grid.Columns[i].DisplayFormat:=Grid.Columns[i-1].DisplayFormat;

Grid.Columns[i-1].FieldName:=Prev_FieldName;
Grid.Columns[i-1].Width:=Prev_Width;
Grid.Columns[i-1].Visible:=true;
Grid.Columns[i-1].Title.Caption:=Prev_Title;
Grid.Columns[i-1].DisplayFormat:=Prev_Format;
dec(F_CurrentFieldNumber);
finally
Grid.Enabled:=true;
end;
end;

procedure TFormNewPriceList.ButtonRightClick(Sender: TObject);
var Prev_FieldName, Prev_Title, Prev_format:string;
I, Prev_Width:integer;
begin
I:=F_CurrentFieldNumber;
if i>=Grid.Columns.Count-1 then exit;

Grid.Enabled:=false;
try
Prev_FieldName:=Grid.Columns[i].FieldName;
Prev_Width:=Grid.Columns[i].Width;
Prev_Title:=Grid.Columns[i].Title.Caption;
Prev_Format:=Grid.Columns[i].DisplayFormat;

Grid.Columns[i].FieldName:=Grid.Columns[i+1].FieldName;
Grid.Columns[i].Width:=Grid.Columns[i+1].Width;
Grid.Columns[i].Visible:=true;
Grid.Columns[i].Title.Caption:=Grid.Columns[i+1].Title.Caption;
Grid.Columns[i].DisplayFormat:=Grid.Columns[i+1].DisplayFormat;

Grid.Columns[i+1].FieldName:=Prev_FieldName;
Grid.Columns[i+1].Width:=Prev_Width;
Grid.Columns[i+1].Visible:=true;
Grid.Columns[i+1].Title.Caption:=Prev_Title;
Grid.Columns[i+1].DisplayFormat:=Prev_Format;
inc(F_CurrentFieldNumber);
finally
Grid.Enabled:=true;
end;

end;

end.