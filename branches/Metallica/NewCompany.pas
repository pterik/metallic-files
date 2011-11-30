unit NewCompany;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DBCtrls, DB, Grids, DBGrids, Mask,
  ZAbstractRODataset, ZDataset, DBCtrlsEh, DBLookupEh, DBGridEh;

type
  TFormNewCompany = class(TForm)
    BitBtnCancel: TBitBtn;
    EditCompany: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    MEChars: TMaskEdit;
    Label5: TLabel;
    Label6: TLabel;
    QCompanyNameType: TZReadOnlyQuery;
    DSCompanyNameType: TDataSource;
    QCompanyNameTypeCNT_ID: TIntegerField;
    QCompanyNameTypeCNT_NAME: TStringField;
    CBCompanyNameType: TComboBox;
    MemoComment: TMemo;
    Label7: TLabel;
    Label8: TLabel;
    BitBtnSave: TBitBtn;
    Label3: TLabel;
    EditCity: TEdit;
    Label9: TLabel;
    QTrustLevel: TZReadOnlyQuery;
    QTrustLevelTL_ID: TIntegerField;
    DSTrust: TDataSource;
    CBTrustLevel: TComboBox;
    QTrustLevelTL_LEVEL: TIntegerField;
    QTrustLevelTL_COLOR: TIntegerField;
    QTrustLevelTL_NAME: TStringField;
    procedure BitBtnCancelClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtnSaveClick(Sender: TObject);
  private
  F_LastOperType:string;
  public
    procedure SetPosition(L, T: integer);
    procedure SetNewCompany(const IsChangeOwner:boolean);
  end;

var
  FormNewCompany: TFormNewCompany;

implementation

uses DataModule, MainForm, Companies, CommonUnit;

{$R *.dfm}
const isReloadList:boolean=true;
{ TFormCompany }
procedure TFormNewCompany.SetPosition(L,T:integer);
begin
Left:=L+ShiftLeft;
Top:=T+ShiftTop;
end;

procedure TFormNewCompany.SetNewCompany(const IsChangeOwner:boolean);
begin
EditCompany.Clear;
EditCity.Clear;
MemoComment.Clear;
MEChars.Text:=IntToStr(FormMain.SearchChars);
if (F_LastOperType='') or (F_LastOperType='INS') then
  begin
  QCompanyNameType.Close;
  QCompanyNameType.Open;
  QCompanyNameType.First;
  CBCompanyNameType.Clear;
  while not QCompanyNameType.eof do
    begin
    CBCompanyNameType.Items.Add(QCompanyNameType['CNT_NAME']);
    QCompanyNameType.Next;
    end;
  end;
CBCompanyNameType.Text:='';
QTrustlevel.Close;
QTrustlevel.Open;
QTrustlevel.First;
CBTrustlevel.Clear;
CBTrustlevel.Text:=QTrustlevel['TL_NAME'];
while not QTrustlevel.eof do
begin
  CBTrustLevel.Items.Add(QTrustlevel['TL_NAME']);
  QTrustLevel.Next;
end;
end;

procedure TFormNewCompany.BitBtnCancelClick(Sender: TObject);
begin
FocusControl(EditCompany);
end;

procedure TFormNewCompany.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
case Key of    //
  VK_F2: BitBtnSave.Click;
  VK_Escape: BitBtnCancel.Click;
end;    // case
end;

procedure TFormNewCompany.BitBtnSaveClick(Sender: TObject);
var SToScreenText, CompanyNamePlusNT:string;
Found, TrustLevel:integer;
begin
if length(EditCompany.Text)<3 then
  begin
  MessageDlg('Название компании слишком маленькое, увеличьте его. При необходимости добавьте пробелы ',mtError,[mbOK],0);
  ModalResult:=mrNone;
  exit;
  end;
//Для поиска имени
SToScreenText:=DM.CompanySearchLikeName(ANSIUpperCase(EditCompany.Text),FormMain.SearchChars,false, Found);
//Для вставки в БД
if trim(CBCompanyNameType.Text)=''
then CompanyNamePlusNT:=EditCompany.Text
else CompanyNamePlusNT:=EditCompany.Text+', '+CBCompanyNameType.Text;
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
if Found>0
  then
  begin
  if MessageDlg(SToScreenText+chr(13)+chr(10)+'Подтвердите сохранение',mtConfirmation,[mbYes,mbNo],0)=mrNo then
    begin
    ModalResult:=mrNone;
    exit;
    end;
  DM.CompanyInsert(CompanyNamePlusNT,EditCity.Text, TrustLevel, MemoComment.text+chr(13)+chr(10)+'Найдены похожие названия');
  DM.CompanyNTInsertOrUpdate(CBCompanyNameType.Text, F_LastOperType);
  //F_LastOperType='INS' определяет, что список CBCompanyNameType нужно передернуть
  //По умолчанию эта строка пустая
  end
else
  begin
  DM.CompanyInsert(CompanyNamePlusNT,EditCity.Text, TrustLevel, DeleteLastReturn(MemoComment.Text));
  DM.CompanyNTInsertOrUpdate(CBCompanyNameType.Text,F_LastOperType);
  MessageDlg('Название успешно сохранено',mtInformation,[mbOK],0);
  end;
FocusControl(EditCompany);
end;

end.
