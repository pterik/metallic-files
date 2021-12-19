unit ShowPrice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Buttons, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, 
  Grids, DBGrids, DBGridEh, DataModule, Mask, DBCtrlsEh, DBLookupEh, sLabel, sEdit, sCheckBox, sMaskEdit, sComboBox, sMemo, sDialogs, sSpeedButton,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL,
  GridsEh, DBAxisGridsEh, sBitBtn, DBAccess, Uni, MemDS, sSkinProvider,
  sSkinManager;

type
  TFormPriceShow = class(TForm)
    BitBtnClose: TsBitBtn;
    Grid: TDBGridEh;
    BitBtnCompanies: TsBitBtn;
    qData: TUniQuery;
    DSData: TUniDataSource;
    sSkinManager1: TsSkinManager;
    sSkinProvider1: TsSkinProvider;
    procedure GridCellClick(Column: TColumnEh);
    procedure GridDblClick(Sender: TObject);
    procedure BitBtnCompaniesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure GridTitleClick(Column: TColumnEh);
  private
    MyNode: TNodeValue;
    F_FieldName1, F_FieldName2: string;
    F_LastSorted: string;
    procedure RefreshPrices;
  public
    procedure SetPosition(L, T: Integer);
    procedure SetTree(TreeID: Integer; NodeValue: string);
  end;

var
  FormPriceShow: TFormPriceShow;

implementation

{$R *.dfm}

uses
  MainForm, ShowCompany, CommonUnit;

{ TFormPriceShow }

procedure TFormPriceShow.SetPosition(L, T: Integer);
begin
  Left:= L + ShiftLeft;
  Top:= T + ShiftTop;
end;

procedure TFormPriceShow.SetTree(TreeID: Integer; NodeValue: string);
begin
  MyNode.Id:= Treeid;
  ;
  RefreshPrices;
  { TODO :
  Проверка для demo - версии, ограничение в количестве
  компаний до 50 или 100 для эксренного выхода}
  //if DM.CompanyMaxID>50 then FormMain.IsDemoLimit:=true;
  //if DM.CompanyMaxID>100 then FormMain.IsBigDemoLimit:=true;
end;

procedure TFormPriceShow.RefreshPrices;
begin
  qData.Close;
  qData.ParamByName('TREEID').AsInteger:= MyNode.Id;
  if MyNode.ParentID = 0 then
    qData.ParamByName('NODE').Value:= MyNode.Value
  else
    qData.ParamByName('NODE').Value:= MyNode.ParentValue;
  qData.Open;
  DM.RepaintGrid(Grid, MyNode.Id, [Fields, FTree, FCompany]);
end;

procedure TFormPriceShow.GridCellClick(Column: TColumnEh);
begin
  F_FieldName2:= F_FieldName1;
  F_FieldName1:= Column.FieldName;
end;

procedure TFormPriceShow.GridDblClick(Sender: TObject);
begin
  if varIsNull(qData['CM_ID']) then
    Exit;
  if FormCompaniesShow = nil then
    Application.CreateForm(TFormCompaniesShow, FormCompaniesShow);
  FormCompaniesShow.SetPosition(Self.Left, Self.Top);
  FormCompaniesShow.SetCompany(qData['CM_ID']);
  FormCompaniesShow.ShowModal;
end;

procedure TFormPriceShow.BitBtnCompaniesClick(Sender: TObject);
begin
  Grid.OnDblClick(Sender);
end;

procedure TFormPriceShow.FormCreate(Sender: TObject);
begin
  MyNode:= TNodeValue.Create;
end;

procedure TFormPriceShow.FormDestroy(Sender: TObject);
begin
  MyNode.Destroy;
end;

procedure TFormPriceShow.GridTitleClick(Column: TColumnEh);
begin
  if F_LastSorted = Column.FieldName then begin
    //QData.SortedFields:= Column.FieldName;
    //QData.SortType:= stDescending;
    QData.IndexFieldNames:= Column.FieldName+' DESC';
  end
  else begin
    //QData.SortedFields:= Column.FieldName;
    //QData.SortType:= stAscending;
    QData.IndexFieldNames:= Column.FieldName+' AC';
  end;
  F_LastSorted:= Column.FieldName;
end;

end.

