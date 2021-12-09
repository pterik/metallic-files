unit Companies;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Buttons, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, 
  Grids, DBGrids, DBGridEh, Mask, DBCtrlsEh, DBLookupEh, ExtCtrls, ImgList, 
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, 
  DBAxisGridsEh, MemDS, DBAccess, Uni, sBitBtn, sLabel, sEdit, sCheckBox;

type
  TFormCompanies = class(TForm)
    CBActive: TsCheckBox;
    BitBtnInsert: TsBitBtn;
    BitBtnUpdate: TsBitBtn;
    BitBtnDelete: TsBitBtn;
    BitBtnClose: TsBitBtn;
    QCompanies2: TZQuery;
    DSCompanies2: TDataSource;
    QCompanies2SISCLOSED: TStringField;
    QPhones2: TZQuery;
    DSPhones2: TDataSource;
    QPhones2PH_COMMENT: TStringField;
    QPhones2PH_DATEBEGIN: TDateField;
    QPhones2USERNAME: TStringField;
    QPhones2PH_ID: TLargeintField;
    QPhones2PH_STR: TStringField;
    QPhones2WHO_WHERE: TStringField;
    DBGridCompanies: TDBGridEh;
    DBGridPhones: TDBGridEh;
    QPhones2PH_ISCLOSED: TSmallintField;
    QPhones2SISCLOSED: TStringField;
    QCompanies2CM_TRUNC_COMMENT: TStringField;
    BitBtnNewPhone: TsBitBtn;
    BitBtnClosePhone: TsBitBtn;
    QCompanies2COMPANYID: TIntegerField;
    QCompanies2CM_NAME: TStringField;
    QCompanies2CM_HYPERLINK: TStringField;
    QCompanies2CM_COMMENT: TStringField;
    QCompanies2CM_ISCLOSED: TIntegerField;
    QCompanies2CM_OWNER: TIntegerField;
    QCompanies2CM_CITY: TStringField;
    QCompanies2TL_LEVEL: TIntegerField;
    QCompanies2TL_COLOR: TIntegerField;
    QCompanies2TL_NAME: TStringField;
    btnShowPrice: TsBitBtn;
    strngfldQCompaniesCM_BUSINESS: TStringField;
    lbl1: TsLabel;
    edtCompany: TsEdit;
    lbl2: TsLabel;
    edtBusiness: TsEdit;
    lbl3: TsLabel;
    edtCity: TsEdit;
    QCompanies: TUniQuery;
    QPhones: TUniQuery;
    DSCompanies: TUniDataSource;
    DSPhones: TUniDataSource;
    procedure QCompanies2CalcFields(DataSet: TDataSet);
    procedure QPhones2CalcFields(DataSet: TDataSet);
    procedure BitBtnInsertClick(Sender: TObject);
    procedure BitBtnDeleteClick(Sender: TObject);
    procedure CBActiveClick(Sender: TObject);
    procedure BitBtnUpdateClick(Sender: TObject);
    procedure DBUsersDblClick(Sender: TObject);
    procedure DBGridCompaniesDblClick(Sender: TObject);
    procedure QCompanies2AfterScroll(DataSet: TDataSet);
    procedure DBGridCompaniesTitleClick(Column: TColumnEh);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtnNewPhoneClick(Sender: TObject);
    procedure BitBtnClosePhoneClick(Sender: TObject);
    procedure DBGridCompaniesDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumnEh;
      State: TGridDrawState);
    procedure btnShowPriceClick(Sender: TObject);
    procedure edtCompanyExit(Sender: TObject);
    procedure edtBusinessExit(Sender: TObject);
    procedure edtCityExit(Sender: TObject);
  private
    F_LastSorted: string;
    F_FieldName:string;
    procedure RefreshPhones;
    procedure RefreshCompanies;
  public
    procedure SetPosition(L, T: Integer);
    procedure SetCompanies;
  end;

var
  FormCompanies: TFormCompanies;

implementation

{$R *.dfm}

uses
  MainForm, NewCompany, DataModule, UpdateCompany, CommonUnit, NewPhone,
  DbUtilsEh;

{ TFormCompanies }

procedure TFormCompanies.SetPosition(L, T: Integer);
begin
  Left := L + ShiftLeft;
  Top := T + ShiftTop;
end;

procedure TFormCompanies.SetCompanies;
begin
  F_FieldName:='CM_NAME';
  edtCompany.Clear;
  edtBusiness.Clear;
  edtCity.Clear;
  RefreshCompanies;
  RefreshPhones;
  //  RefreshFilterFields;
    { TODO :
    Проверка для demo - версии, ограничение в количестве
    компаний до 50 или 100 для эксренного выхода}
    //if DM.CompanyMaxID>50 then FormMain.IsDemoLimit:=true;
    //if DM.CompanyMaxID>100 then FormMain.IsBigDemoLimit:=true;
end;

procedure TFormCompanies.QCompanies2CalcFields(DataSet: TDataSet);
begin
  //  if VarIsNull(DataSet['COMPANYID']) then
  //    Exit;
  if DataSet.Fields.FindField('SISCLOSED') <> nil then
  begin
    if DataSet['CM_ISCLOSED'] = 1 then
      DataSet['SISCLOSED'] := 'ДА';
    if DataSet['CM_ISCLOSED'] = 0 then
      DataSet['SISCLOSED'] := 'НЕТ';
  end;
  if DataSet.Fields.FindField('CM_COMMENT') <> nil then
  begin
    DataSet['CM_TRUNC_COMMENT'] := DeleteReturns(DataSet['CM_COMMENT']);
  end;
end;

procedure TFormCompanies.QPhones2CalcFields(DataSet: TDataSet);
begin
  if not VarIsNull(QPhones['PH_DATEBEGIN']) then
    QPhones['WHO_WHERE'] := DateToStr(QPhones['PH_DATEBEGIN']);
  if not VarIsNull(QPhones['USERNAME']) then
    QPhones['WHO_WHERE'] := QPhones['WHO_WHERE'] + ' ' + QPhones['USERNAME'];
  if VarIsNull(QPhones['PH_ID']) then
    QPhones['PH_STR'] := ''
  else
  begin
    QPhones['PH_STR'] := ParsePhoneByNumber(QPhones['PH_ID']);
    //Добавление к телефону скобок и рисочек для удобства чтения
  end;
  if not VarIsNull(QPhones['PH_ISCLOSED']) then
  begin
    if QPhones['PH_ISCLOSED'] = 0 then
      QPhones['SISCLOSED'] := 'НЕТ';
    if QPhones['PH_ISCLOSED'] = 1 then
      QPhones['SISCLOSED'] := 'ДА';
  end;

end;

procedure TFormCompanies.RefreshPhones;
var
  CompanyID: Integer;
begin
  if VarIsNull(QCompanies['COMPANYID']) then
    CompanyID := 0
  else
    CompanyID := QCompanies['COMPANYID'];
  QPhones.Close;
  QPhones.ParamByName('COMPANYID').AsInteger := CompanyID;
  QPhones.Open;
end;

procedure TFormCompanies.BitBtnInsertClick(Sender: TObject);
var
  IsChangeOwner: Boolean;
begin
  isChangeOwner := FormMain.ReadEnteredUserISBOSS;
  if FormMain.ReadEnteredUserID = FormMain.CommonOwnerID then
    isChangeOwner := True;
  if FormNewCompany = nil then
    Application.CreateForm(TFormNewCompany, FormNewCompany);
  FormNewCompany.SetPosition(Self.Left, Self.Top);
  FormNewCompany.SetNewCompany(isChangeOwner);
  FormNewCompany.ShowModal;
  RefreshCompanies;
end;

procedure TFormCompanies.BitBtnDeleteClick(Sender: TObject);
//var isMustClose:boolean;
begin
  if VarIsNull(QCompanies['COMPANYID']) then
  begin
    MessageDlg('Укажите компанию', mtWarning, [mbOK], 0);
    Exit;
  end;
  {Запрос на удаление джобов и конактов. Помечаем компанию как неактивную}
  if QCompanies['CM_ISCLOSED'] = 1 then
  begin
    MessageDlg('Компания уже помечена как закрытая', mtInformation, [mbOK], 0);
    Exit;
  end;
  try
    if MessageDlg('Пометить компанию "' + QCompanies['CM_NAME'] +
      '" как закрытую? С ней не связаны открытые задания или контакты',
      mtConfirmation,
      [mbYes, mbNo], 0) = mrYes
    then DM.CompanyCloseByID(QCompanies['COMPANYID']);
  except on E: Exception do
    begin
      MessageDlg(DM.GetErrorByCode(1011), mtError, [mbOK], 0);
      //Error 1011:CompanyClose
    end;
  end; //except
  RefreshCompanies;
  RefreshPhones;
end;

procedure TFormCompanies.RefreshCompanies;
var
  B: TBookmark;
begin
  B := QCompanies.GetBookmark;
  QCompanies.Close;
  if CBActive.Checked then
    QCompanies.ParamByName('ISCLOSED').AsInteger := 0
  else
    QCompanies.ParamByName('ISCLOSED').AsInteger := -1;
  QCompanies.ParamByName('COMPANYID').AsInteger := -1;
  if Trim(edtCompany.Text) = ''
  then qCompanies.ParamByName('Company').Value := ''
  else qCompanies.ParamByName('Company').AsString := AnsiUppercase(Trim(edtCompany.Text));
  if Trim(edtCity.Text) = ''
  then qCompanies.ParamByName('City').Value := ''
  else qCompanies.ParamByName('City').AsString := AnsiUppercase(Trim(edtCity.Text));
  if Trim(edtBusiness.Text)=''
  then qCompanies.ParamByName('Business').Value:=''
  else qCompanies.ParamByName('Business').AsString := AnsiUpperCase(Trim(edtBusiness.Text));
  QCompanies.Open;
  if QCompanies.BookmarkValid(B) then
    QCompanies.GotoBookmark(B);
  QCompanies.FreeBookmark(B);

end;

procedure TFormCompanies.CBActiveClick(Sender: TObject);
begin
  RefreshCompanies;
  RefreshPhones;
end;

procedure TFormCompanies.BitBtnUpdateClick(Sender: TObject);
var
  JustView: Boolean;
begin
  if VarIsNull(QCompanies['COMPANYID']) then
  begin
    MessageDlg('Укажите компанию', mtWarning, [mbOK], 0);
    Exit;
  end;
  if FormUpdateCompany = nil then
    Application.CreateForm(TFormUpdateCompany, FormUpdateCompany);
  FormUpdateCompany.SetPosition(Self.Left, Self.Top);
  //JustView:=not FormMain.ReadEnteredUserISBOSS;
  //if QCompanies['CM_OWNER']=FormMain.ReadEnteredUserID then JustView:=false;
  JustView := False;
  //Эта строка обозначает что владелец компании может редактировать всё, в т.ч. и указать нового владельца
  FormUpdateCompany.SetCompany(QCompanies['COMPANYID']);
  FormUpdateCompany.ShowModal;
  RefreshCompanies;
end;

procedure TFormCompanies.DBUsersDblClick(Sender: TObject);
begin
  BitBtnUpdate.Click;
end;

procedure TFormCompanies.DBGridCompaniesDblClick(Sender: TObject);
begin
  BitBtnUpdate.Click;
end;

procedure TFormCompanies.QCompanies2AfterScroll(DataSet: TDataSet);
begin
  RefreshPhones;
end;

procedure TFormCompanies.DBGridCompaniesTitleClick(Column: TColumnEh);
begin
  if F_LastSorted = Column.FieldName then
  begin
    //QCompanies.SortedFields := Column.FieldName;
    //QCompanies.SortType := stDescending;
    QCompanies.IndexFieldNames:=Column.FieldName+' DESC';
  end
  else
  begin
    //QCompanies.SortedFields := Column.FieldName;
    //QCompanies.SortType := stAscending;
    QCompanies.IndexFieldNames:=Column.FieldName+' ASC';
  end;
  F_LastSorted := Column.FieldName;
end;

procedure TFormCompanies.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of //
    VK_F3: BitBtnInsert.Click;
    VK_F4: BitBtnUpdate.Click;
    VK_F5: BitBtnNewPhone.Click;
  end; // case
end;

procedure TFormCompanies.BitBtnNewPhoneClick(Sender: TObject);
begin
  if VarIsNull(QCompanies['COMPANYID']) then
  begin
    MessageDlg('Укажите компанию', mtWarning, [mbOK], 0);
    Exit;
  end;
  if FormNewPhone = nil then
    Application.CreateForm(TFormNewPhone, FormNewPhone);
  FormNewPhone.SetPosition(Self.Left, Self.Top);
  FormNewPhone.SetNewPhone(QCompanies['COMPANYID'], QCompanies['CM_NAME'], '');
  FormNewPhone.ShowModal;
  RefreshPhones;
end;

procedure TFormCompanies.BitBtnClosePhoneClick(Sender: TObject);
begin
  if VarIsNull(QPhones['PH_ID']) then
  begin
    MessageDlg('Выберите телефон из списка, чтобы его удалить (пометить как неактивный)',
      mtWarning, [mbOK], 0);
    Exit;
  end;
  if DM.PhoneDelete(QPhones['PH_ID'], DateToStr(Now()),
    FormMain.ReadEnteredUserID) then
    MessageDlg('Телефон ' + QPhones['PH_STR'] + ' помечен как удаленный',
      mtInformation,
      [mbOK], 0)
  else
    MessageDlg(DM.GetErrorByCode(1017), mtError, [mbOK], 0);
  RefreshPhones;
end;

procedure TFormCompanies.DBGridCompaniesDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  if (Column.FieldName = 'TL_NAME') then
    if not VarIsNull(qCompanies.FieldValues['TL_Color']) then
      TDBGridEh(Sender).Canvas.Brush.Color :=
        qCompanies.FieldValues['TL_Color'];

  // Восстанавливаем выделение текущей позиции курсора
  if gdSelected in State then
  begin
    TDBGridEh(Sender).Canvas.Brush.Color := clHighLight;
    TDBGridEh(Sender).Canvas.Font.Color := clHighLightText;
  end;
  // Просим GRID перерисоваться самому
  TDBGridEh(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFormCompanies.btnShowPriceClick(Sender: TObject);
var
  link: string;
begin
  if VarIsNull(QCompanies['COMPANYID']) then
  begin
    MessageDlg('Укажите компанию', mtWarning, [mbOK], 0);
    Exit;
  end;
  if not VarIsNull(QCompanies['CM_HYPERLINK']) then
  begin
    link := QCompanies.Fields.FieldByName('CM_HYPERLINK').AsString;
    ShellOpen(Application.Handle, link);
  end;
end;

procedure TFormCompanies.edtCompanyExit(Sender: TObject);
begin
  RefreshCompanies;
  RefreshPhones;
end;

procedure TFormCompanies.edtBusinessExit(Sender: TObject);
begin
  RefreshCompanies;
  RefreshPhones;
end;

procedure TFormCompanies.edtCityExit(Sender: TObject);
begin
  RefreshCompanies;
  RefreshPhones;
end;

end.

