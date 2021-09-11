unit NewPriceRow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, Grids, DBGrids, DBGridEh, ComCtrls, Mask, DBCtrlsEh,
  ZAbstractTable,
  //DBTables,
  DataModule, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh,
  EhLibVCL, GridsEh, DBAxisGridsEh;

type
  TFormNewPriceRow = class(TForm)
    GridView: TDBGridEh;
    qDataView: TZReadOnlyQuery;
    DSData: TDataSource;
    qDisplay: TZReadOnlyQuery;
    qDisplayGS_FIELD: TStringField;
    qDisplayGS_HEADER: TStringField;
    qDisplayGS_SHOW: TSmallintField;
    qDisplayGS_SIZE: TIntegerField;
    qDisplayGS_DISPLAYFORMAT: TStringField;
    EditCompany: TEdit;
    LabelComp: TLabel;
    LabelCity: TLabel;
    EditAddress: TEdit;
    QCompany: TZQuery;
    QCompanyCOMPANYID: TIntegerField;
    QCompanyCM_NAME: TStringField;
    QCompanyCM_COMMENT: TStringField;
    BitBtnCancel: TBitBtn;
    BitBtnSave: TBitBtn;
    Label1: TLabel;
    EditNodeValue: TEdit;
    ZTableEdit: TZTable;
    DSEdit: TDataSource;
    GridTable: TDBGridEh;
    Label2: TLabel;
    Label3: TLabel;
    qDataViewPL_ID: TIntegerField;
    qDataViewPL_HEADERID: TIntegerField;
    qDataViewPL_TREEID: TIntegerField;
    qDataViewPL_PRICE: TFloatField;
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
    QCompanyCM_CITY: TStringField;
    EditCity: TEdit;
    Label4: TLabel;
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtnSaveClick(Sender: TObject);
    procedure BitBtnCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    MyNode:TNodeValue;
    F_CompanyID:integer;
    F_LineID:integer;
    procedure RefreshView;
    procedure RefreshTable;
  public
    procedure SetPosition(L, T: integer);
    procedure SetNewPriceRow(CompanyID,TreeID, LineId:integer);
  end;

var
  FormNewPriceRow: TFormNewPriceRow;

implementation

uses MainForm, CommonUnit;

{$R *.dfm}

{ TFormPriceShow }

procedure TFormNewPriceRow.SetPosition(L,T:integer);
begin
Left:=L+ShiftLeft;
Top:=T+ShiftTop;
end;

procedure TFormNewPriceRow.SetNewPriceRow(CompanyID, TreeID, LineID:integer);
begin
MyNode.ID:=TreeID;
F_LineID:=LineID;
F_CompanyID:=CompanyID;
qCompany.Close;
QCompany.ParamByName('COMPANYID').AsInteger:=CompanyID;
qCompany.Open;
EditCompany.Text:=QCompany['CM_NAME'];
EditCity.Text:=QCompany['CM_CITY'];
EditAddress.Text:=DeleteReturns(QCompany['CM_COMMENT']);
EditNodeValue.Text:=MyNode.Value;
RefreshView;
RefreshTable;
end;

procedure TFormNewPriceRow.RefreshView;
begin
qDataView.Close;
qDataView.ParamByName('line_id').AsInteger:=F_LineID;
qDataView.Open;
if MyNode.ParentID<>0
then  DM.RepaintGrid(GridView, MyNode.ParentID,[Fields, FTree, FCompany])
else DM.RepaintGrid(GridView, MyNode.ID,[Fields, FTree, FCompany]);
end;

procedure TFormNewPriceRow.RefreshTable;
begin
ZTableEdit.Close;
ZTableEdit.Filter:='PL_ID ='+IntToStr(F_LineID);
ZTableEdit.Filtered:=true;
ZTableEdit.Open;
if MyNode.ParentID<>0
then  DM.RepaintGrid(GridTable, MyNode.ParentID,[Fields, FTree, FCompany])
else DM.RepaintGrid(GridTable, MyNode.ID,[Fields, FTree, FCompany]);
end;

procedure TFormNewPriceRow.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
case Key of    //
  VK_F9: begin FocusControl(BitBtnSave); BitBtnSave.Click; end;
end;    // case

end;

procedure TFormNewPriceRow.BitBtnSaveClick(Sender: TObject);
begin
ZTableEdit.Edit;
ZTableEdit['PL_DATE_UPDATE']:=Now();
ZTableEdit.CommitUpdates;
ModalResult:=mrOk;
end;

procedure TFormNewPriceRow.BitBtnCancelClick(Sender: TObject);
begin
ZTableEdit.CancelUpdates;
end;

procedure TFormNewPriceRow.FormCreate(Sender: TObject);
begin
MyNode:=TNodeValue.Create;
end;

procedure TFormNewPriceRow.FormDestroy(Sender: TObject);
begin
MyNode.Destroy;
end;

end.
