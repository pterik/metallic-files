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
    pnlRight: TPanel;
    pnlTop: TPanel;
    pnlClient: TPanel;
    QCompanyCM_HYPERLINK: TStringField;
    btnShowPrice: TBitBtn;
    pnlLeft: TPanel;
    pnlLeftTop: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    cbxFilterField: TComboBox;
    btnFilterAdd: TBitBtn;
    cbxFilterValue: TComboBox;
    btnFilterClear: TButton;
    pnlDisplayFilter: TPanel;
    qFilter: TZReadOnlyQuery;
    procedure QCompanyCalcFields(DataSet: TDataSet);
    procedure QPhonesCalcFields(DataSet: TDataSet);
    procedure CBActiveClick(Sender: TObject);
    procedure QCompanyAfterScroll(DataSet: TDataSet);
    procedure DBGridCompaniesTitleClick(Column: TColumnEh);
    procedure DBGridCompaniesDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumnEh;
      State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnShowPriceClick(Sender: TObject);
    procedure btnFilterAddClick(Sender: TObject);
    procedure btnFilterClearClick(Sender: TObject);
    procedure cbxFilterFieldSelect(Sender: TObject);
    procedure DBGridCompaniesDblClick(Sender: TObject);
    procedure DBGridCompaniesCellClick(Column: TColumnEh);
  private
    F_CompanyID: Integer;
    F_FieldName:string;
    F_LastSorted: string;
    FFilter: TStringList;
    procedure RefreshPhones;
    procedure RefreshCompanies;
    procedure ApplyFilter;
    procedure RefreshFilterFields;
    procedure RefreshFilterValues;
  public
    procedure SetCompany(CompanyID: Integer);
  end;

var
  FormCompaniesShow: TFormCompaniesShow;

implementation

{$R *.dfm}

uses
  MainForm, DataModule, CommonUnit;

{ TFormCompanies }

procedure TFormCompaniesShow.SetCompany(CompanyID: Integer);
begin
  F_CompanyID := CompanyID;
  CBActive.Checked := True;
  RefreshCompanies;
  RefreshPhones;
  RefreshFilterFields;
end;

procedure TFormCompaniesShow.QCompanyCalcFields(DataSet: TDataSet);
begin
  if QCompany['CM_ISCLOSED'] = 1 then
    QCompany['SISCLOSED'] := 'НЕТ';
  if QCompany['CM_ISCLOSED'] = 0 then
    QCompany['SISCLOSED'] := 'ДА';
  QCompany['CM_TRUNC_COMMENT'] := DeleteReturns(QCompany['CM_COMMENT']);
end;

procedure TFormCompaniesShow.QPhonesCalcFields(DataSet: TDataSet);
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

procedure TFormCompaniesShow.RefreshPhones;
var
  CompanyID: Integer;
begin
  if VarIsNull(QCompany['COMPANYID']) then
    CompanyID := -1
  else
    CompanyID := QCompany['COMPANYID'];
  QPhones.Close;
  QPhones.ParamByName('COMPANYID').AsInteger := CompanyID;
  QPhones.Open;
end;

procedure TFormCompaniesShow.RefreshCompanies;
var
  B: TBookmark;
begin
  B := QCompany.GetBookmark;
  QCompany.Close;
  if CBActive.Checked then
    QCompany.ParamByName('COMPANYID').AsInteger := F_CompanyID
  else
    QCompany.ParamByName('COMPANYID').AsInteger := -1;
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
  if F_LastSorted = Column.FieldName then
  begin
    QCompany.SortedFields := Column.FieldName;
    QCompany.SortType := stDescending;
  end
  else
  begin
    QCompany.SortedFields := Column.FieldName;
    QCompany.SortType := stAscending;
  end;
  F_LastSorted := Column.FieldName;
end;

procedure TFormCompaniesShow.DBGridCompaniesDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  inherited;
  if (Column.FieldName = 'TL_NAME') then
    TDBGridEh(Sender).Canvas.Brush.Color := qCompany['TL_Color'];
  // Восстанавливаем выделение текущей позиции курсора
  if gdSelected in State then
  begin
    TDBGridEh(Sender).Canvas.Brush.Color := clHighLight;
    TDBGridEh(Sender).Canvas.Font.Color := clHighLightText;
  end;
  // Просим GRID перерисоваться самому
  TDBGridEh(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFormCompaniesShow.FormCreate(Sender: TObject);
begin
  FFilter := TStringList.Create;
end;

procedure TFormCompaniesShow.FormDestroy(Sender: TObject);
begin
  FFilter.Free;
end;

procedure TFormCompaniesShow.RefreshFilterFields;
var
  I: Integer;
begin
  FFilter.Clear;
  cbxFilterField.Clear;
  with DBGridCompanies do
  begin
    for I := 0 to Columns.Count - 1 do
    begin
      if Columns[I].Field.FieldKind <> fkData then
        Continue;
      if Columns[I].FieldName = 'CM_HYPERLINK' then
        Continue;
      cbxFilterField.Items.AddObject(Columns[I].Title.Caption, Columns[I]);
    end;
  end;
  cbxFilterField.Text := '';
end;

procedure TFormCompaniesShow.RefreshFilterValues;
var
  Save, FieldName, AFilter: string;
begin
  cbxFilterValue.Clear;
  with qFilter, cbxFilterField do
  begin
    if ItemIndex < 0 then
      Exit;

    FieldName := TDBGridColumnEh(Items.Objects[ItemIndex]).FieldName;
    Save := SQL.Text;
    try
      SQL.Text := StringReplace(SQL.Text, '/*FIELD*/', FieldName, []);

      AFilter := QCompany.Filter;
      if AFilter <> '' then
        AFilter := 'AND ' + AFilter;
      SQL.Text := StringReplace(SQL.Text, '/*FILTER*/', AFilter, []);

      Params.Assign(QCompany.Params);
      Open;
      try
        First;
        while not Eof do
        begin
          if not VarIsNull(FieldValues[FieldName]) then
            cbxFilterValue.AddItem(FieldValues[FieldName], nil);
          Next;
        end;
      finally
        Close;
      end;
    finally
      SQL.Text := Save;
    end;
  end;
end;

procedure TFormCompaniesShow.cbxFilterFieldSelect(Sender: TObject);
begin
  RefreshFilterValues;
end;

procedure TFormCompaniesShow.btnFilterAddClick(Sender: TObject);
begin
  if (cbxFilterField.ItemIndex >= 0) and (cbxFilterValue.Text <> '') then
    with cbxFilterField do
    begin
      FFilter.AddObject(cbxFilterValue.Text, Items.Objects[ItemIndex]);
      Items.Delete(ItemIndex);
      Refresh;
      ApplyFilter;
      RefreshFilterValues;
    end;
end;

procedure TFormCompaniesShow.btnFilterClearClick(Sender: TObject);

  procedure OrderedInsertField(Column: TDBGridColumnEh);
  var
    LIndex: Integer;
  begin
    LIndex := 0;
    with cbxFilterField.Items do
    begin
      while LIndex < Count - 1 do
      begin
        if Column.Index < TDBGridColumnEh(Objects[LIndex]).Index then
          Break;
        Inc(LIndex);
      end;
      InsertObject(LIndex, Column.Title.Caption, Column);
    end;
  end;

var
  I: Integer;
begin
  if FFilter.Count > 0 then
  begin
    for I := 0 to FFilter.Count - 1 do
      OrderedInsertField(TDBGridColumnEh(FFilter.Objects[I]));
    FFilter.Clear;
    ApplyFilter;
    RefreshFilterValues;
  end;
end;

procedure TFormCompaniesShow.ApplyFilter;
var
  I: Integer;
  Filter, Display: string;
begin
  Filter := '';
  Display := '';
  with FFilter do
    for I := 0 to Count - 1 do
    begin
      if I > 0 then
      begin
        Filter := Filter + ' AND ';
        Display := Display + ', ';
      end;
      with TDBGridColumnEh(Objects[I]) do
      begin
        Filter := Filter + ' (' + FieldName + '=''' + Strings[I] + ''')';
        Display := Display + Title.Caption + '=' + Strings[I];
      end;
    end;
  pnlDisplayFilter.Caption := Display;
  QCompany.Filter := Filter;
  QCompany.Filtered := True;
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
    link := QCompany.Fields.FieldByName('CM_HYPERLINK').AsString;
    ShellOpen(Application.Handle, link);
  end;
end;

procedure TFormCompaniesShow.DBGridCompaniesDblClick(Sender: TObject);
var link:string;
begin
if VarIsNull(QCompany['COMPANYID']) then
  begin
    MessageDlg('Укажите компанию', mtWarning, [mbOK], 0);
    Exit;
  end;
if (F_FieldName = 'CM_HYPERLINK') and not VarIsNull(QCompany['CM_HYPERLINK']) then
  begin
    link:= QCompany.Fields.FieldByName('CM_HYPERLINK').AsString;
    ShellOpen(Application.Handle, link);
    Exit;
  end;
end;

procedure TFormCompaniesShow.DBGridCompaniesCellClick(Column: TColumnEh);
begin
  inherited;
F_FieldName:=Column.FieldName;
end;

end.

