unit SelectCompany;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Buttons, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, 
  Grids, DBGrids, DBGridEh, sLabel, sEdit, sCheckBox, sMaskEdit, sComboBox, sMemo, sDialogs, sSpeedButton,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, sBitBtn,
  EhLibVCL, GridsEh, DBAxisGridsEh, DBAccess, Uni, MemDS, sSkinProvider,
  sSkinManager;

type
  TFormSelectCompany = class(TForm)
    DBGridCompanies: TDBGridEh;
    BitBtnCancel: TsBitBtn;
    Label1: TsLabel;
    QCompany: TUniQuery;
    qPriceHeader: TUniQuery;
    QNewHeader: TUniSQL;
    DSCompanies: TUniDataSource;
    QCompanyCOMPANYID: TIntegerField;
    QCompanyCM_NAME: TStringField;
    QCompanyCM_CITY: TStringField;
    QCompanyCM_COMMENT: TStringField;
    QCompanyMAXPH_ID: TIntegerField;
    QCompanyPH_ISFINISHED: TSmallintField;
    QCompanyCM_TRUNC_COMMENT: TStringField;
    QCompanySISFINISHED: TStringField;
    qPriceHeaderPH_ID: TIntegerField;
    sSkinManager1: TsSkinManager;
    sSkinProvider1: TsSkinProvider;
    procedure QCompany2CalcFields(DataSet: TDataSet);
    procedure BitBtnCancelClick(Sender: TObject);
    procedure DBGridCompaniesDblClick(Sender: TObject);
    procedure DBGridCompaniesTitleClick(Column: TColumnEh);
  private
  F_LastSorted:string;
  public
    procedure SetPosition(L, T: integer);
    procedure SetCompanies;
  end;

var
  FormSelectCompany: TFormSelectCompany;

implementation

uses MainForm, NewCompany, DataModule, UpdateCompany, CommonUnit;

{$R *.dfm}

{ TFormCompanies }

procedure TFormSelectCompany.SetPosition(L,T:integer);
begin
Left:=L+ShiftLeft;
Top:=T+ShiftTop;
end;

procedure TFormSelectCompany.SetCompanies;
begin
FormMain.SelectedCompanyID:=0;
FormMain.SelectedCompanyName:='';
QCompany.Close;
QCompany.Open;
DBGridCompanies.Focused;
end;

procedure TFormSelectCompany.QCompany2CalcFields(DataSet: TDataSet);
begin
if VarIsNull(QCompany['COMPANYID']) then exit;
if QCompany['PH_ISFINISHED']=1  then QCompany['SISFINISHED']:='дю';
if QCompany['PH_ISFINISHED']=0  then QCompany['SISFINISHED']:='мер';
QCompany['CM_TRUNC_COMMENT']:=DeleteReturns(QCompany['CM_COMMENT']);
end;

procedure TFormSelectCompany.BitBtnCancelClick(Sender: TObject);
begin
FormMain.SelectedCompanyID:=0;
FormMain.SelectedCompanyName:='';
end;

procedure TFormSelectCompany.DBGridCompaniesDblClick(Sender: TObject);
begin
ModalResult:=mrOK;
if VarIsNull(qCompany['COMPANYID']) then
  begin
  ModalResult:=mrNone;
  exit;
  end;
FormMain.SelectedCompanyID:=qCompany['COMPANYID'];
FormMain.SelectedCompanyName:=qCompany['CM_NAME'];
qPriceHeader.Close;
qPriceHeader.ParamByName('COMPANYID').AsInteger:=qCompany['COMPANYID'];
qPriceHeader.Open;
if VarIsNull(qPriceHeader['PH_ID']) then
  begin
  qNewHeader.ParamByName('COMPANYID').AsInteger:=qCompany['COMPANYID'];
//  qNewHeader.ParamByName('DATE_INSERT').AsString:=DateToStr(Now(), FormMain.DateSettings);
  qNewHeader.ParamByName('DATE_INSERT').AsDate:=Now();
  qNewHeader.Execute;
  qPriceHeader.Close;
  qPriceHeader.ParamByName('COMPANYID').AsInteger:=qCompany['COMPANYID'];
  qPriceHeader.Open;
  end;
FormMain.SelectedPriceHeaderID:=qPriceHeader['PH_ID'];
Close;
end;

procedure TFormSelectCompany.DBGridCompaniesTitleClick(Column: TColumnEh);
begin
if F_LastSorted=Column.FieldName then
  begin
  //QCompany.SortedFields:=Column.FieldName;
  //QCompany.SortType:=stDescending;
  QCompany.IndexFieldNames:=Column.FieldName+' DESC';
  end
else
  begin
  //QCompany.SortedFields:=Column.FieldName;
  //QCompany.SortType:=stAscending;
  QCompany.IndexFieldNames:=Column.FieldName+' ASC';
  end;
F_LastSorted:=Column.FieldName;
end;

end.
