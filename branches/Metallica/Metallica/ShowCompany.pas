unit ShowCompany;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, Grids, DBGrids, DBGridEh, ExtCtrls, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh;

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
    QCompanyCM_HYPERLINK: TStringField;
    btnShowPrice: TBitBtn;
    lbl1: TLabel;
    edtCompany: TEdit;
    lbl2: TLabel;
    edtBusiness: TEdit;
    lbl3: TLabel;
    edtCity: TEdit;
    procedure QCompanyCalcFields(DataSet: TDataSet);
    procedure QPhonesCalcFields(DataSet: TDataSet);
    procedure CBActiveClick(Sender: TObject);
    procedure QCompanyAfterScroll(DataSet: TDataSet);
    procedure DBGridCompaniesTitleClick(Column: TColumnEh);
    procedure DBGridCompaniesDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumnEh;
      State: TGridDrawState);
    procedure btnShowPriceClick(Sender: TObject);
    procedure edtCompanyExit(Sender: TObject);
    procedure edtBusinessExit(Sender: TObject);
    procedure edtCityExit(Sender: TObject);
  private
    F_CompanyID: Integer;
    procedure RefreshPhones;
    procedure RefreshCompanies;
  public
    procedure SetPosition(L, T: Integer);
    procedure SetCompany(CompanyID: Integer);
  end;

var
  FormCompaniesShow: TFormCompaniesShow;

implementation

{$R *.dfm}

uses
  MainForm, NewCompany, DataModule, UpdateCompany, CommonUnit;

{ TFormCompanies }

procedure TFormCompaniesShow.SetPosition(L, T: Integer);
begin
  Left:= L + ShiftLeft;
  Top:= T + ShiftTop;
end;

procedure TFormCompaniesShow.SetCompany(CompanyID: Integer);
begin
  F_CompanyID:= CompanyID;
  CBActive.Checked:= True;
  edtCompany.Clear;
  edtBusiness.Clear;
  edtCity.Clear;
  RefreshCompanies;
  RefreshPhones;
  { TODO :
  Проверка для demo - версии, ограничение в количестве
  компаний до 50 или 100 для эксренного выхода}
  //if DM.CompanyMaxID>50 then FormMain.IsDemoLimit:=true;
  //if DM.CompanyMaxID>100 then FormMain.IsBigDemoLimit:=true;
end;

procedure TFormCompaniesShow.QCompanyCalcFields(DataSet: TDataSet);
begin
  if QCompany['CM_ISCLOSED'] = 1 then
    QCompany['SISCLOSED']:= 'НЕТ';
  if QCompany['CM_ISCLOSED'] = 0 then
    QCompany['SISCLOSED']:= 'ДА';
  QCompany['CM_TRUNC_COMMENT']:= DeleteReturns(QCompany['CM_COMMENT']);
end;

procedure TFormCompaniesShow.QPhonesCalcFields(DataSet: TDataSet);
begin
  if not VarIsNull(QPhones['PH_DATEBEGIN']) then
    QPhones['WHO_WHERE']:= DateToStr(QPhones['PH_DATEBEGIN']);
  if not VarIsNull(QPhones['USERNAME']) then
    QPhones['WHO_WHERE']:= QPhones['WHO_WHERE'] + ' ' + QPhones['USERNAME'];
  if VarIsNull(QPhones['PH_ID']) then
    QPhones['PH_STR']:= ''
  else begin
    QPhones['PH_STR']:= ParsePhoneByNumber(QPhones['PH_ID']);
    //Добавление к телефону скобок и рисочек для удобства чтения
  end;
  if not VarIsNull(QPhones['PH_ISCLOSED']) then begin
    if QPhones['PH_ISCLOSED'] = 0 then
      QPhones['SISCLOSED']:= 'НЕТ';
    if QPhones['PH_ISCLOSED'] = 1 then
      QPhones['SISCLOSED']:= 'ДА';
  end;

end;

procedure TFormCompaniesShow.RefreshPhones;
var
  CompanyID: Integer;
begin
  if VarIsNull(QCompany['COMPANYID']) then
    CompanyID:= -1
  else
    CompanyID:= QCompany['COMPANYID'];
  QPhones.Close;
  QPhones.ParamByName('COMPANYID').AsInteger:= CompanyID;
  QPhones.Open;
end;

procedure TFormCompaniesShow.RefreshCompanies;
var
  B: TBookmark;
begin
  B:= QCompany.GetBookmark;
  QCompany.Close;
  if CBActive.Checked
  then QCompany.ParamByName('COMPANYID').AsInteger:= F_CompanyID
  else QCompany.ParamByName('COMPANYID').AsInteger:= -1;
  if Trim(edtCity.Text) = ''
  then qCompany.ParamByName('City').Value := ''
  else qCompany.ParamByName('City').AsString := AnsiUppercase(Trim(edtCity.Text));
  if Trim(edtCompany.Text) = ''
  then qCompany.ParamByName('Company').Value := ''
  else qCompany.ParamByName('Company').AsString := AnsiUppercase(Trim(edtCompany.Text));
  if Trim(edtBusiness.Text)=''
  then qCompany.ParamByName('Business').Value:=''
  else qCompany.ParamByName('Business').AsString := AnsiUpperCase(Trim(edtBusiness.Text));
  QCompany.Open;
  if QCompany.BookmarkValid(B) then
    QCompany.GotoBookmark(B);
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
  QCompany.SortedFields:= Column.FieldName;
end;

procedure TFormCompaniesShow.DBGridCompaniesDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  if (Column.FieldName = 'TL_NAME') then
    if not VarIsNull(QCompany['TL_Color']) then
      TDBGridEh(Sender).Canvas.Brush.Color:= qCompany['TL_Color'];
  // Восстанавливаем выделение текущей позиции курсора
  if gdSelected in State then
  begin
    TDBGridEh(Sender).Canvas.Brush.Color:= clHighLight;
    TDBGridEh(Sender).Canvas.Font.Color:= clHighLightText;
  end;
  // Просим GRID перерисоваться самому
  //State = (gdSelected, gdFocused, gdCurrent, gdFixed, gdRowSelected, gdHotTrack, gdPressed)
  TDBGridEh(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFormCompaniesShow.btnShowPriceClick(Sender: TObject);
var
  link: string;
begin
  if VarIsNull(QCompany['COMPANYID']) then
  begin
    MessageDlg('Укажите компанию', mtWarning, [mbOK], 0);
    Exit;
  end;
  if not VarIsNull(QCompany['CM_HYPERLINK']) then
  begin
    link:= QCompany.Fields.FieldByName('CM_HYPERLINK').AsString;
    ShellOpen(Application.Handle, link);
  end;
end;

procedure TFormCompaniesShow.edtCompanyExit(Sender: TObject);
begin
  RefreshCompanies;
  RefreshPhones;
end;

procedure TFormCompaniesShow.edtBusinessExit(Sender: TObject);
begin
  RefreshCompanies;
  RefreshPhones;
end;

procedure TFormCompaniesShow.edtCityExit(Sender: TObject);
begin
  RefreshCompanies;
  RefreshPhones;
end;

end.

