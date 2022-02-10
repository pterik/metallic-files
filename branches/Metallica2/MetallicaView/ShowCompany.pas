unit ShowCompany;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Buttons, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, 
  Grids, DBGrids, DBGridEh, MdiChild, ShowTree, ExtCtrls, CommonUnit, 
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh,
  sButton, sComboBox, sLabel, sBitBtn, sCheckBox, sPanel, sTreeView, MemDS,
  DBAccess, Uni, Vcl.Mask, sMaskEdit, sCustomComboEdit;

type
  TFormCompaniesShow = class(TFormMdiChild)
    DSCompanies: TDataSource;
    DSPhones: TDataSource;
    Grid: TDBGridEh;
    DBGridPhones: TDBGridEh;
    Panel1: TsPanel;
    CBActive: TsCheckBox;
    pnlRight: TsPanel;
    pnlTop: TsPanel;
    pnlClient: TsPanel;
    btnShowPrice: TsBitBtn;
    pnlLeft: TsPanel;
    pnlLeftTop: TsPanel;
    Panel2: TsPanel;
    Label1: TsLabel;
    Label2: TsLabel;
    cbFields: TsComboBox;
    btnFilterAdd: TsBitBtn;
    cbFilter: TsComboBox;
    btnFilterClear: TsButton;
    pnlDisplayFilter: TsPanel;
    chk1: TsCheckBox;
    chk2: TsCheckBox;
    chk3: TsCheckBox;
    chk4: TsCheckBox;
    QCompany: TUniQuery;
    QPhones: TUniQuery;
    qCompanyFL: TUniQuery;
    QCompanyCOMPANYID: TIntegerField;
    QCompanyCM_NAME: TStringField;
    QCompanyCM_COMMENT: TStringField;
    QCompanyCM_ISCLOSED: TIntegerField;
    QCompanyCM_HYPERLINK: TStringField;
    QCompanyCM_BUSINESS: TStringField;
    QCompanyCM_OWNER: TIntegerField;
    QCompanyCM_CITY: TStringField;
    QCompanyTL_COLOR: TIntegerField;
    QCompanyTL_NAME: TStringField;
    QCompanySISCLOSED: TStringField;
    QCompanyCM_TRUNC_COMMENT: TStringField;
    QPhonesPH_ID: TFloatField;
    QPhonesPH_COMMENT: TStringField;
    QPhonesPH_ISCLOSED: TSmallintField;
    QPhonesPH_DATEBEGIN: TDateField;
    QPhonesUSERNAME: TStringField;
    QPhonesPH_STR: TStringField;
    QPhonesSISCLOSED: TStringField;
    QPhonesWHO_WHERE: TStringField;
    qCompanyFLRES: TStringField;
    procedure QCompanyCalcFields(DataSet: TDataSet);
    procedure CBActiveClick(Sender: TObject);
    procedure GridTitleClick(Column: TColumnEh);
    procedure GridDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumnEh;
      State: TGridDrawState);
    procedure btnShowPriceClick(Sender: TObject);
    procedure btnFilterAddClick(Sender: TObject);
    procedure btnFilterClearClick(Sender: TObject);
    procedure cbFieldsSelect(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure GridCellClick(Column: TColumnEh);
    procedure chk1Click(Sender: TObject);
    procedure chk2Click(Sender: TObject);
    procedure chk3Click(Sender: TObject);
    procedure chk4Click(Sender: TObject);
    procedure QPhonesCalcFields(DataSet: TDataSet);
    procedure QCompanyAfterScroll(DataSet: TDataSet);
    procedure DBGridPhonesDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
  private
    F_CompanyID: Integer;
    F_CBFieldsName:string;
    F_FieldName:string;
    F_LastSorted: string;
    F_CBFieldsTitle:string;
    Filter:TFilter;
    procedure RefreshPhones;
    procedure RefreshQCompany;
    procedure RefreshQCompanyFL;
    procedure RefreshCBFields;
    procedure RefreshCaptions;
  public
    procedure SetCompany(CompanyID: Integer);
  end;

var
  FormCompaniesShow: TFormCompaniesShow;

implementation

{$R *.dfm}

uses
  MainForm, DataModule;

{ TFormCompanies }

procedure TFormCompaniesShow.SetCompany(CompanyID: Integer);
begin
  F_CompanyID := CompanyID;
  Filter.ClearAll;
//  if F_CompanyID <>-1 then CBActive.Checked := True else CBActive.Checked:=False;
  RefreshQCompany;
  RefreshPhones;
  RefreshCBFields;
  CBFilter.Clear;
end;

procedure TFormCompaniesShow.QCompanyAfterScroll(DataSet: TDataSet);
begin
  inherited;
  RefreshPhones;
end;

procedure TFormCompaniesShow.QCompanyCalcFields(DataSet: TDataSet);
begin
  if QCompany['CM_ISCLOSED'] = 1 then QCompany['SISCLOSED'] := '���';
  if QCompany['CM_ISCLOSED'] = 0 then QCompany['SISCLOSED'] := '��';
  QCompany['CM_TRUNC_COMMENT'] := DeleteReturns(QCompany['CM_COMMENT']);
end;


procedure TFormCompaniesShow.QPhonesCalcFields(DataSet: TDataSet);
begin
  if not VarIsNull(QPhones['PH_DATEBEGIN']) then  QPhones['WHO_WHERE'] := DateToStr(QPhones['PH_DATEBEGIN']);
  if not VarIsNull(QPhones['USERNAME']) then QPhones['WHO_WHERE'] := QPhones['WHO_WHERE'] + ' ' + QPhones['USERNAME'];
  if VarIsNull(QPhones['PH_ID'])
    then QPhones['PH_STR'] := ''
  else
    begin
    QPhones['PH_STR'] := ParsePhoneByNumber(QPhones['PH_ID']);
    //���������� � �������� ������ � ������� ��� �������� ������
    end;
  if not VarIsNull(QPhones['PH_ISCLOSED']) then
  begin
    if QPhones['PH_ISCLOSED'] = 0 then
      QPhones['SISCLOSED'] := '���';
    if QPhones['PH_ISCLOSED'] = 1 then
      QPhones['SISCLOSED'] := '��';
  end;
end;

procedure TFormCompaniesShow.RefreshPhones;
begin
QPhones.Close;
if VarIsNull(QCompany['COMPANYID'])
  then QPhones.ParamByName('COMPANYID').AsInteger := -1
  else QPhones.ParamByName('COMPANYID').AsInteger := QCompany['COMPANYID'];
QPhones.Open;
end;

procedure TFormCompaniesShow.CBActiveClick(Sender: TObject);
begin
  RefreshQCompany;
  RefreshPhones;
end;

procedure TFormCompaniesShow.GridTitleClick(Column: TColumnEh);
begin
  if F_LastSorted = Column.FieldName then
  begin
    //QCompany.SortedFields := Column.FieldName;
    //QCompany.SortType := stDescending;
    QCompany.IndexFieldNames:= Column.FieldName+ ' DESC' ;
    //DataSet1.IndexFieldNames := 'LastName ASC CIS; DateDue DESC';
  end
  else
  begin
    //QCompany.SortedFields := Column.FieldName;
    //QCompany.SortType := stAscending;
    QCompany.IndexFieldNames:= Column.FieldName+ ' ASC' ;
  end;
  F_LastSorted := Column.FieldName;
end;

procedure TFormCompaniesShow.GridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  inherited;
  if (Column.FieldName = 'TL_NAME') and not VarIsNull(qCompany['TL_Color']) then
    TDBGridEh(Sender).Canvas.Brush.Color := qCompany['TL_Color'];
  // ��������������� ��������� ������� ������� �������
  if gdSelected in State then
  begin
    TDBGridEh(Sender).Canvas.Brush.Color := clHighLight;
    TDBGridEh(Sender).Canvas.Font.Color := clHighLightText;
  end;
  // ������ GRID �������������� ������
  TDBGridEh(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, TGridDrawState(State));
end;

procedure TFormCompaniesShow.cbFieldsSelect(Sender: TObject);
var I: Integer;
begin
  F_CBFieldsTitle:= CBFields.Text;
  for I:= 0 to Grid.Columns.Count - 1 do
  begin
    if F_CBFieldsTitle = Grid.Columns[I].Title.Caption then
    begin
      F_CBFieldsName:= Grid.Columns[I].FieldName;
      Break;
    end;
  end;
  RefreshQCompanyFL;
end;

procedure TFormCompaniesShow.btnFilterAddClick(Sender: TObject);
begin
if Filter.Counter>4 then
  begin
  MessageDlg('���������� �������� ���������� ��������',mtWarning, [mbOK],0);
  Exit;
  end;
  if (CBFilter.Text <> '') and (F_CBFieldsName <> '') then
  begin
  if CBFields.Text='���������' then
      begin
      Filter.CompanyLike:=AnsiUpperCase(CBFilter.Text);
      Filter.AddFilter(F_CBFieldsName, CBFields.Text,CBFilter.Text);
      end
  else
  if CBFields.Text='��� ������������' then
      begin
      Filter.Business:=AnsiUpperCase(CBFilter.Text);
      Filter.AddFilter(F_CBFieldsName, CBFields.Text,CBFilter.Text);
      end
  else
      begin
      Filter.AddFilter(F_CBFieldsName, CBFields.Text,CBFilter.Text);
      end;
  RefreshQCompany;
  RefreshCBFields;
  CBFilter.Clear;
  end;
end;

procedure TFormCompaniesShow.btnFilterClearClick(Sender: TObject);
begin
  Filter.ClearAll;
  RefreshQCompany;
  RefreshCBFields;
  CBFilter.Clear;
end;

procedure TFormCompaniesShow.btnShowPriceClick(Sender: TObject);
var
  link: string;
begin
  if VarIsNull(QCompany['COMPANYID']) then
  begin
    MessageDlg('������� ��������', mtWarning, [mbOK], 0);
    Exit;
  end;
  if not VarIsNull(QCompany['CM_HYPERLINK']) then
  begin
    link := QCompany.Fields.FieldByName('CM_HYPERLINK').AsString;
    ShellOpen(Application.Handle, link);
  end;
end;

procedure TFormCompaniesShow.GridDblClick(Sender: TObject);
var link:string;
begin
if (F_FieldName = 'CM_HYPERLINK') and not VarIsNull(QCompany['CM_HYPERLINK']) then
  begin
    link:= QCompany.Fields.FieldByName('CM_HYPERLINK').AsString;
    ShellOpen(Application.Handle, link);
    Exit;
  end;
end;

procedure TFormCompaniesShow.GridCellClick(Column: TColumnEh);
begin
  inherited;
F_FieldName:=Column.FieldName;
end;

procedure TFormCompaniesShow.RefreshCBFields;
var  I: Integer;
begin
CBFields.Clear;
CBFields.Text:= Grid.Columns[0].Title.Caption;
for I:= 0 to Grid.Columns.Count - 1 do
  begin
  if Grid.Columns[I].Title.Caption = '�����'
    then Continue;
  CBFields.Items.Add(Grid.Columns[I].Title.Caption);
  end;
CBFields.Text:= '';
CBFilter.Clear;

end;

procedure TFormCompaniesShow.RefreshQCompany;
var B: TBookmark;
begin
RefreshCaptions;
B := QCompany.GetBookmark;
qCompany.Close;
qCompany.SQL.Text:='SELECT cm_id as COMPANYID, cm_name, cm_comment, cm_isclosed, '+
' cm_hyperlink, cm_business, cm_owner, cm_city, tl_color, tl_name FROM company c '+
' left join TRUSTLEVEL tl on tl.tl_id = c.cm_trust ' +
' WHERE (CM_ISCLOSED = 0) and ((cm_id = :COMPANYID) or (:COMPANYID=-1)) '+
' and upper(cm_name) like ''%''||:company||''%'' '+
' and (upper(cm_city) like upper(''%''||:CITY||''%'') or (cast(:CITY as varchar(100))  = '''')) '+
' and (upper(cm_business) like upper(''%''||:BUSINESS||''%'') or (cast(:BUSINESS as varchar(100))  = '''')) ';
qCompany.SQL.Add(Filter.Query);
if CBActive.Checked
  then  qCompany.ParamByName('COMPANYID').Value:= F_CompanyID
  else  qCompany.ParamByName('COMPANYID').Value:= -1;
qCompany.ParamByName('CITY').AsString:= AnsiUpperCase(Filter.City);
qCompany.ParamByName('COMPANY').AsString:= AnsiUpperCase(Filter.CompanyLike);
qCompany.ParamByName('BUSINESS').AsString:= AnsiUppercase(Filter.Business);
qCompany.Open;
if QCompany.BookmarkValid(B) then  QCompany.GotoBookmark(B);
QCompany.FreeBookmark(B);
end;

procedure TFormCompaniesShow.RefreshQCompanyFL;
var FieldsName:string;
begin
if F_CBFieldsName='' then FieldsName:= '1' else FieldsName:=F_CBFieldsName;
qCompanyFl.Close;
qCompanyFL.SQL.Text:='select distinct ' + FieldsName + ' as res from (' +
'SELECT cm_id as COMPANYID, cm_name, cm_comment, cm_isclosed, '+
' cm_hyperlink, cm_business, cm_city, tl_color, tl_name FROM company c '+
' left join TRUSTLEVEL tl on tl.tl_id = c.cm_trust ' +
' WHERE (CM_ISCLOSED = 0) and ((cm_id = :COMPANYID) or (:COMPANYID=-1)) '+
' and upper(cm_name) like ''%''||:company||''%'' '+
' and (upper(cm_city) like upper(''%''||:CITY||''%'') or (cast(:CITY as varchar(100))  = '''')) '+
' and (upper(cm_business) like upper(''%''||:BUSINESS||''%'') or (cast(:BUSINESS as varchar(100))  = '''')) ';
qCompanyFL.SQL.Add(Filter.Query);
qCompanyFL.SQL.Add(')');
if CBActive.Checked then  qCompanyFL.ParamByName('COMPANYID').Value:= F_CompanyID
else  qCompanyFL.ParamByName('COMPANYID').Value:= -1;
qCompanyFL.ParamByName('CITY').AsString:= AnsiUpperCase(Filter.City);
qCompanyFL.ParamByName('COMPANY').AsString:= AnsiUpperCase(Filter.CompanyLike);
qCompanyFL.ParamByName('BUSINESS').AsString:= AnsiUppercase(Filter.Business);
qCompanyFL.Open;
qCompanyFL.First;
CBFilter.Clear;
  while not QCompanyFL.EOF do
  begin
    if not VarIsNull(qCompanyFL['RES']) then
    begin
      CBFilter.Items.Add(qCompanyFL['RES']);
    end;
    qCompanyFL.Next;
  end;

end;

procedure TFormCompaniesShow.chk1Click(Sender: TObject);
begin
  inherited;
  Filter.RemoveFilter(1);
  RefreshQCompany;
  RefreshCBFields;
  CBFilter.Clear;
end;

procedure TFormCompaniesShow.chk2Click(Sender: TObject);
begin
  inherited;
  Filter.RemoveFilter(2);
  RefreshQCompany;
  RefreshCBFields;
  CBFilter.Clear;
end;

procedure TFormCompaniesShow.chk3Click(Sender: TObject);
begin
  inherited;
  Filter.RemoveFilter(3);
  RefreshQCompany;
  RefreshCBFields;
  CBFilter.Clear;
end;

procedure TFormCompaniesShow.chk4Click(Sender: TObject);
begin
  inherited;
  Filter.RemoveFilter(4);
  RefreshQCompany;
  RefreshCBFields;
  CBFilter.Clear;
end;

procedure TFormCompaniesShow.DBGridPhonesDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  inherited;
  if QPhones['PH_ISCLOSED']=0 then
    TDBGridEh(Sender).Canvas.Brush.Color:= clWhite
  else
    TDBGridEh(Sender).Canvas.Brush.Color:= clFuchsia;
  // ��������������� ��������� ������� ������� �������
  if gdSelected in State then
  begin
    TDBGridEh(Sender).Canvas.Brush.Color:= clHighLight;
    TDBGridEh(Sender).Canvas.Font.Color:= clHighLightText;
  end;
  // ������ GRID �������������� ������
  TDBGridEh(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, TGridDrawState(State));
end;

procedure TFormCompaniesShow.RefreshCaptions;
begin
Chk1.Caption:=Filter.Caption(1);
Chk1.Visible:=(Chk1.Caption<>'');
Chk2.Caption:=Filter.Caption(2);
Chk2.Visible:=(Chk2.Caption<>'');
Chk3.Caption:=Filter.Caption(3);
Chk3.Visible:=(Chk3.Caption<>'');
Chk4.Caption:=Filter.Caption(4);
Chk4.Visible:=(Chk4.Caption<>'');
end;


end.