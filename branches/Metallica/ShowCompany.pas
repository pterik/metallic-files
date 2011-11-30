unit ShowCompany;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, Grids, DBGrids, DBGridEh;

type
  TFormCompaniesShow = class(TForm)
    CBActive: TCheckBox;
    BitBtnClose: TBitBtn;
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
    QCompanyCM_CITY: TStringField;
    QCompanyTL_LEVEL: TIntegerField;
    QCompanyTL_COLOR: TIntegerField;
    QCompanyTL_NAME: TStringField;
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
    procedure RefreshPhones;
    procedure RefreshCompanies;
  public
    procedure SetPosition(L, T: integer);
    procedure SetCompany(CompanyID:integer);
  end;

var
  FormCompaniesShow: TFormCompaniesShow;

implementation

uses MainForm, NewCompany, DataModule, UpdateCompany, CommonUnit;

{$R *.dfm}

{ TFormCompanies }

procedure TFormCompaniesShow.SetPosition(L,T:integer);
begin
Left:=L+ShiftLeft;
Top:=T+ShiftTop;
end;

procedure TFormCompaniesShow.SetCompany(CompanyID:integer);
begin
F_CompanyID:=CompanyID;
CBActive.Checked:=true;
RefreshCompanies;
RefreshPhones;
{ TODO :
�������� ��� demo - ������, ����������� � ����������
�������� �� 50 ��� 100 ��� ���������� ������}
//if DM.CompanyMaxID>50 then FormMain.IsDemoLimit:=true;
//if DM.CompanyMaxID>100 then FormMain.IsBigDemoLimit:=true;
end;

procedure TFormCompaniesShow.QCompanyCalcFields(DataSet: TDataSet);
begin
if QCompany['CM_ISCLOSED']=1  then QCompany['SISCLOSED']:='���';
if QCompany['CM_ISCLOSED']=0  then QCompany['SISCLOSED']:='��';
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
  //���������� � �������� ������ � ������� ��� �������� ������
  end;
if not VarIsNull(QPhones['PH_ISCLOSED'])
then
  begin
  if QPhones['PH_ISCLOSED']= 0  then QPhones['SISCLOSED']:='���';
  if QPhones['PH_ISCLOSED']= 1  then QPhones['SISCLOSED']:='��';
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
QCompany.SortedFields:=Column.FieldName;
end;

procedure TFormCompaniesShow.DBGridCompaniesDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
	if (Column.FieldName='TL_NAME')
	then  TDBGridEh(Sender).Canvas.Brush.Color:=qCompany['TL_Color'];
	// ��������������� ��������� ������� ������� �������
	IF  gdSelected   IN State Then
  Begin
		TDBGridEh(Sender).Canvas.Brush.Color:= clHighLight;
		TDBGridEh(Sender).Canvas.Font.Color := clHighLightText;
	End;
	// ������ GRID �������������� ������
	TDBGridEh(Sender).DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

end.
