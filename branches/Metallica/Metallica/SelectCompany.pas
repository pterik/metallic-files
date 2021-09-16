unit SelectCompany;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, Grids, DBGrids, DBGridEh;

type
  TFormSelectCompany = class(TForm)
    QCompany: TZQuery;
    DSCompanies: TDataSource;
    QCompanyCM_NAME: TStringField;
    QCompanyCM_COMMENT: TStringField;
    DBGridCompanies: TDBGridEh;
    QCompanyCM_TRUNC_COMMENT: TStringField;
    QCompanyCOMPANYID: TIntegerField;
    BitBtnCancel: TBitBtn;
    Label1: TLabel;
    qPriceHeader: TZReadOnlyQuery;
    qPriceHeaderPH_ID: TIntegerField;
    QNewHeader: TZQuery;
    QCompanyCM_CITY: TStringField;
    QCompanyMAXPH_ID: TIntegerField;
    QCompanyPH_ISFINISHED: TSmallintField;
    QCompanySISFINISHED: TStringField;
    procedure QCompanyCalcFields(DataSet: TDataSet);
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

procedure TFormSelectCompany.QCompanyCalcFields(DataSet: TDataSet);
begin
if VarIsNull(QCompany['COMPANYID']) then exit;
if QCompany['PH_ISFINISHED']=1  then QCompany['SISFINISHED']:='��';
if QCompany['PH_ISFINISHED']=0  then QCompany['SISFINISHED']:='���';
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
  qNewHeader.Close;
  qNewHeader.ParamByName('COMPANYID').AsInteger:=qCompany['COMPANYID'];
//  qNewHeader.ParamByName('DATE_INSERT').AsString:=DateToStr(Now(), FormMain.DateSettings);
  qNewHeader.ParamByName('DATE_INSERT').AsDate:=Now();
  qNewHeader.ExecSQL;
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
  QCompany.SortedFields:=Column.FieldName;
  QCompany.SortType:=stDescending;
  end
else
  begin
  QCompany.SortedFields:=Column.FieldName;
  QCompany.SortType:=stAscending;
  end;
F_LastSorted:=Column.FieldName;
end;

end.