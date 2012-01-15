unit ShowCompany;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, Grids, DBGrids, DBGridEh, MdiChild, ShowTree, ExtCtrls;

type
  TFormCompaniesShow = class(TFormMdiChild)
    QCompany: TZQuery;
    DSCompanies: TDataSource;
    QCompanySISCLOSED: TStringField;
    QPhones: TZQuery;
    DSPhones: TDataSource;
    QPhonesPH_COMMENT: TStringField;
    QPhonesPH_DATEBEGIN: TDateField;
    QPhonesUSERNAME: TStringField;
    QCompanyCM_NAME: TStringField;
    QCompanyCM_COMMENT: TStringField;
    QCompanyCM_ISCLOSED: TIntegerField;
    QPhonesPH_ID: TLargeintField;
    QPhonesPH_STR: TStringField;
    QPhonesWHO_WHERE: TStringField;
    DBGridCompanies: TDBGridEh;
    DBGridPhones: TDBGridEh;
    QPhonesPH_ISCLOSED: TSmallintField;
    QPhonesSISCLOSED: TStringField;
    QCompanyCM_OWNER: TIntegerField;
    QCompanyCM_TRUNC_COMMENT: TStringField;
    QCompanyCOMPANYID: TIntegerField;
    Panel1: TPanel;
    CBActive: TCheckBox;
    QCompanyTL_NAME: TStringField;
    QCompanyTL_COLOR: TIntegerField;
    procedure QCompanyCalcFields(DataSet: TDataSet);
    procedure QPhonesCalcFields(DataSet: TDataSet);
    procedure CBActiveClick(Sender: TObject);
    procedure QCompanyAfterScroll(DataSet: TDataSet);
    procedure DBGridCompaniesTitleClick(Column: TColumnEh);
    procedure DBGridCompaniesDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumnEh;
      State: TGridDrawState);
  private
    F_CompanyID:integer;
    F_LastSorted:string;
    procedure RefreshPhones;
    procedure RefreshCompanies;
  public
    procedure SetCompany(CompanyID:integer);
  end;

var
  FormCompaniesShow: TFormCompaniesShow;

implementation

uses MainForm, DataModule, CommonUnit;

{$R *.dfm}

{ TFormCompanies }

procedure TFormCompaniesShow.SetCompany(CompanyID:integer);
begin
F_CompanyID:=CompanyID;
CBActive.Checked:=true;
RefreshCompanies;
RefreshPhones;
end;

procedure TFormCompaniesShow.QCompanyCalcFields(DataSet: TDataSet);
begin
if QCompany['CM_ISCLOSED']=1  then QCompany['SISCLOSED']:='НЕТ';
if QCompany['CM_ISCLOSED']=0  then QCompany['SISCLOSED']:='ДА';
QCompany['CM_TRUNC_COMMENT']:=DeleteReturns(QCompany['CM_COMMENT']);
end;

procedure TFormCompaniesShow.QPhonesCalcFields(DataSet: TDataSet);
begin
if not VarIsNull(QPhones['PH_DATEBEGIN'])
 then QPhones['WHO_WHERE']:=DateToStr(QPhones['PH_DATEBEGIN']);
if not VarIsNull(QPhones['USERNAME'])
 then QPhones['WHO_WHERE']:=QPhones['WHO_WHERE']+' '+QPhones['USERNAME'];
if VarIsNull(QPhones['PH_ID']) then QPhones['PH_STR']:=''
else
  begin
  QPhones['PH_STR']:=ParsePhoneByNumber(QPhones['PH_ID']);
  //Добавление к телефону скобок и рисочек для удобства чтения
  end;
if not VarIsNull(QPhones['PH_ISCLOSED'])
then
  begin
  if QPhones['PH_ISCLOSED']= 0  then QPhones['SISCLOSED']:='НЕТ';
  if QPhones['PH_ISCLOSED']= 1  then QPhones['SISCLOSED']:='ДА';
  end;

end;

procedure TFormCompaniesShow.RefreshPhones;
var CompanyID:integer;
begin
if VarIsNull(QCompany['COMPANYID'])
then CompanyID:=-1
else CompanyID:=QCompany['COMPANYID'];
QPhones.Close;
QPhones.ParamByName('COMPANYID').AsInteger:=CompanyID;
QPhones.Open;
end;

procedure TFormCompaniesShow.RefreshCompanies;
var B:TBookmark;
begin
B:=QCompany.GetBookmark;
QCompany.Close;
if CBActive.Checked
then QCompany.ParamByName('COMPANYID').AsInteger:=F_CompanyID
else QCompany.ParamByName('COMPANYID').AsInteger:=-1;
QCompany.Open;
if QCompany.BookmarkValid(B) then QCompany.GotoBookmark(B);
QCompany.FreeBookmark(B);
end;

procedure TFormCompaniesShow.CBActiveClick(Sender: TObject);
begin
RefreshCompanies;
RefreshPhones;
end;

procedure TFormCompaniesShow.QCompanyAfterScroll(DataSet: TDataSet);
begin
RefreshPhones;
end;

procedure TFormCompaniesShow.DBGridCompaniesTitleClick(Column: TColumnEh);
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

procedure TFormCompaniesShow.DBGridCompaniesDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  inherited;
	if (Column.FieldName='TL_NAME')
	then  TDBGridEh(Sender).Canvas.Brush.Color:=qCompany['TL_Color'];
	// Восстанавливаем выделение текущей позиции курсора
	IF  gdSelected   IN State Then
  Begin
		TDBGridEh(Sender).Canvas.Brush.Color:= clHighLight;
		TDBGridEh(Sender).Canvas.Font.Color := clHighLightText;
	End;
	// Просим GRID перерисоваться самому
	TDBGridEh(Sender).DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

end.
