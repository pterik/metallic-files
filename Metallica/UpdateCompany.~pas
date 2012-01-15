unit UpdateCompany;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, DBCtrlsEh, DBLookupEh, DBGridEh;

type
  TFormUpdateCompany = class(TForm)
    Label1: TLabel;
    EditCompany: TEdit;
    Label2: TLabel;
    Label4: TLabel;
    MEChars: TMaskEdit;
    Label5: TLabel;
    BitBtnCancel: TBitBtn;
    LabelisClosed: TLabel;
    EditComment: TMemo;
    BitBtnSave: TBitBtn;
    QCompany: TZQuery;
    QCompanyCM_ID: TIntegerField;
    QCompanyCM_NAME: TStringField;
    QCompanyCM_COMMENT: TStringField;
    QCompanyCM_ISCLOSED: TIntegerField;
    Label6: TLabel;
    Label7: TLabel;
    Label3: TLabel;
    EditCity: TEdit;
    QCompanyCM_CITY: TStringField;
    QCompanyCM_TRUST: TSmallintField;
    Label8: TLabel;
    CBTrustLevel: TComboBox;
    DSTrust: TDataSource;
    QTrustLevel: TZReadOnlyQuery;
    QTrustLevelTL_ID: TIntegerField;
    QTrustLevelTL_LEVEL: TIntegerField;
    QTrustLevelTL_COLOR: TIntegerField;
    QTrustLevelTL_NAME: TStringField;
    procedure BitBtnCancelClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtnSaveClick(Sender: TObject);
  private
   F_CompanyId:integer;
  public
    procedure SetPosition(L, T: integer);
    procedure SetCompany(CompanyID:integer);
  end;

var
  FormUpdateCompany: TFormUpdateCompany;

implementation

uses Companies, DataModule, MainForm, CommonUnit;

{$R *.dfm}

procedure TFormUpdateCompany.SetPosition(L,T:integer);
begin
Left:=L+ShiftLeft;
Top:=T+ShiftTop;
end;

procedure TFormUpdateCompany.SetCompany(CompanyID:integer);
begin
MEChars.Text:=IntToStr(FormMain.SearchChars);
F_CompanyID:=CompanyID;
QCompany.Close;
QCompany.ParamByName('COMPANYID').AsInteger:=F_CompanyID;
QCompany.Open;
EditCompany.Text:=QCompany['CM_NAME'];
EditCity.Text:=QCompany['CM_CITY'];
EditComment.Text:=QCompany['CM_COMMENT'];
case QCompany['CM_ISCLOSED'] of    //
  0: LabelIsClosed.Caption:='Компания открытая, сотрудничаем с ней';
  1: LabelIsClosed.Caption:='Компания закрытая, неактивная';
  else LabelIsClosed.Caption:='';
end;    // case
QTrustlevel.Close;
QTrustlevel.Open;
QTrustlevel.First;
CBTrustlevel.Clear;
CBTrustlevel.Text:=QTrustlevel['TL_NAME'];
while not QTrustlevel.eof do
begin
  CBTrustLevel.Items.Add(QTrustlevel['TL_NAME']);
  if QTrustlevel['TL_ID']=QCompany['CM_TRUST'] then CBTrustLevel.Text:=QTrustlevel['TL_NAME'];
  QTrustLevel.Next;
end;
end;

procedure TFormUpdateCompany.BitBtnSaveClick(Sender: TObject);
var SCompanyName, SimilarCompanies:string;
SimilarCompanyID, Found, Trustlevel:integer;
begin
ModalResult:=mrOk;
if length(EditCompany.Text)<3 then
  begin
  MessageDlg('Название компании слишком маленькое, увеличьте его. При необходимости добавьте пробелы ',mtError,[mbOK],0);
  exit;
  end;
SCompanyName:=ANSIUpperCase(EditCompany.Text);
SimilarCompanies:=DM.CompanySearchLikeName(SCompanyName, FormMain.SearchChars, true, Found);
SimilarCompanyID:=DM.CompanySearchExactName(SCompanyName);
//Found>1 если найдены компании с похожими именами
//SimilarCompanyID<>F_CompanyID если есть запись с таким точно именем.
if (SimilarCompanyID<> F_CompanyID) and (SimilarCompanyID<>0) then
   begin
   if MessageDlg('Компания с таким точно именем уже существует'+chr(13)+chr(10)+'Подтвердить сохранение?',mtConfirmation,[mbYes,mbNo],0)=mrNo then exit;
   end;

if Found>1 then
   if MessageDlg('Компания с похожими именами уже существуют'+chr(13)+chr(10)
   +SimilarCompanies+chr(13)+chr(10)
   +'Подтвердить сохранение?',mtConfirmation,[mbYes,mbNo],0)=mrNo then exit;
TrustLevel:=0;
qTrustlevel.Close;
qTrustlevel.Open;
qTrustlevel.First;
while not QTrustlevel.eof do
begin
  if QTrustlevel['TL_NAME']=CBTrustLevel.Text then
    begin
    TrustLevel:=QTrustlevel['TL_ID'];
    break;
    end;
  QTrustlevel.Next;
end;    // while
DM.CompanyUpdate(F_CompanyID,EditCompany.Text,EditCity.Text,TrustLevel, DeleteLastReturn(EditComment.text));
MessageDlg('Название успешно обновлено',mtInformation,[mbOK],0);
FocusControl(EditCompany);
end;

procedure TFormUpdateCompany.BitBtnCancelClick(Sender: TObject);
begin
FocusControl(EditCompany);
end;

procedure TFormUpdateCompany.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
case Key of    //
  VK_Escape: BitBtnCancel.Click;
  VK_F2: BitBtnSave.Click;
end;    // case
end;

end.
