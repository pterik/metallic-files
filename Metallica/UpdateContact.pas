unit UpdateContact;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZDataset, StdCtrls, Buttons, Mask,
  DBCtrlsEh, DBLookupEh, ComCtrls, ZAbstractDataset, DBGridEh;

type
  TFormUpdateContact = class(TForm)
    Label1: TLabel;
    StaticText2: TStaticText;
    MemoComment: TMemo;
    StaticText3: TStaticText;
    EContacter: TEdit;
    QManager: TZReadOnlyQuery;
    QManagerU_ID: TIntegerField;
    QManagerU_FIO: TStringField;
    QManagerU_ISBOSS: TIntegerField;
    QManagerU_FIO_PLUS_BOSS: TStringField;
    QOwner: TZReadOnlyQuery;
    QOwnerU_ID: TIntegerField;
    QOwnerU_FIO: TStringField;
    QOwnerU_ISBOSS: TIntegerField;
    QOwnerU_FIO_PLUS_BOSS: TStringField;
    DSManager: TDataSource;
    DSOwner: TDataSource;
    QPeriod: TZReadOnlyQuery;
    QPeriodPR_ID: TIntegerField;
    QPeriodPR_COMMENT: TStringField;
    QPeriodPR_NAME: TStringField;
    DSPeriod: TDataSource;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    DBPeriod: TDBLookupComboboxEh;
    StaticText4: TStaticText;
    DT: TDateTimePicker;
    LabelParameter: TLabel;
    StaticText5: TStaticText;
    MemoJobComment: TMemo;
    Label4: TLabel;
    DBOwner: TDBLookupComboboxEh;
    Label3: TLabel;
    DBManager: TDBLookupComboboxEh;
    Label2: TLabel;
    DBJobType: TDBLookupComboboxEh;
    QJobtype: TZReadOnlyQuery;
    QJobtypeJT_ID: TIntegerField;
    QJobtypeJT_NAME: TStringField;
    DSJobtype: TDataSource;
    STDate: TStaticText;
    DSContact: TDataSource;
    DBCompanies: TDBLookupComboboxEh;
    QContact: TZReadOnlyQuery;
    QContactCN_ID: TIntegerField;
    QContactCN_COMPANY: TIntegerField;
    QContactCN_CONTACTER: TStringField;
    QContactCN_COMMENT: TStringField;
    QContactCN_PERIODICITY: TIntegerField;
    QContactCN_NEXT_JOB_DATE: TDateField;
    QContactCN_LAST_JOB_DATE: TDateField;
    QContactCN_JOBCOMMENT: TStringField;
    QContactCN_JOBTYPE: TIntegerField;
    QContactCN_MANAGER: TIntegerField;
    QContactCN_OWNER: TIntegerField;
    QContactCN_COMMENT_CLOSE: TStringField;
    QCompanies: TZQuery;
    DSCompanies: TDataSource;
    QCompaniesCM_NAME: TStringField;
    QCompaniesCM_COMMENT: TStringField;
    QCompaniesCM_ISCLOSED: TIntegerField;
    QCompaniesCM_ID: TIntegerField;
    BitBtnCancel: TBitBtn;
    BitBtnSave: TBitBtn;
    QOwnerU_ISCLOSED: TSmallintField;
    QManagerU_ISCLOSED: TSmallintField;
    procedure QManagerCalcFields(DataSet: TDataSet);
    procedure QOwnerCalcFields(DataSet: TDataSet);
    procedure DBPeriodExit(Sender: TObject);
    procedure DTExit(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtnSaveClick(Sender: TObject);
    procedure BitBtnCancelClick(Sender: TObject);
  private
    F_ContactID:integer;
    procedure OpenManager(U_ID: integer);
    procedure OpenOwner(U_ID: integer);
    procedure OpenPeriodicity(P: integer);
    procedure SetPeriodParameter;
    procedure OpenJobType(Jobtype: integer);
    procedure OpenCompany(CompanyID: integer);
  public
    procedure SetPosition(L, T: integer);
    procedure SetUpdatedContact(ContactID:integer; isChangeManager, isChangeOwner:boolean);
  end;

var
  FormUpdateContact: TFormUpdateContact;

implementation
uses DataModule, CommonUnit;

{$R *.dfm}

procedure TFormUpdateContact.SetPosition(L,T:integer);
begin
Left:=L+ShiftLeft;
Top:=T+ShiftTop;
end;

procedure TFormUpdateContact.SetUpdatedContact(ContactID:integer; isChangeManager, isChangeOwner:boolean);
begin
QContact.Close;
QContact.ParamByName('CN_ID').AsInteger:=ContactID;
QContact.Open;
F_ContactID:=ContactID;
OpenManager(QContact['CN_MANAGER']);
DBManager.Enabled:=isChangeManager;
OpenOwner(QContact['CN_OWNER']);
DBOwner.Enabled:=isChangeOwner;
OpenCompany(QContact['CN_COMPANY']);
if varIsNull(QContact['CN_CONTACTER']) then EContacter.Text:='' else EContacter.Text:=QContact['CN_CONTACTER'];
if varIsNull(QContact['CN_COMMENT']) then MemoComment.Text:='' else MemoComment.Text:=QContact['CN_COMMENT'];
if varIsNull(QContact['CN_JOBCOMMENT']) then MemoJobComment.Text:='' else MemoJobComment.Text:=QContact['CN_JOBCOMMENT'];
if VarIsNull(QContact['CN_NEXT_JOB_DATE']) then
  begin
  STDate.Caption:='Дата не определена';
  STDate.Visible:=true;
  DT.Visible:=false;
  end
else
  begin
  STDate.Visible:=false;
  DT.Visible:=true;
  DT.Date:=QContact['CN_NEXT_JOB_DATE'];
  SetPeriodParameter;
  end;
OpenJobType(QContact['CN_JOBTYPE']);
OpenPeriodicity(QContact['CN_PERIODICITY']);
end;

procedure TFormUpdateContact.OpenManager(U_ID:integer);
begin
if not QManager.Active then QManager.Open;
QManager.First;
while not QManager.EOF do
  begin
  if QManager['U_ID']=U_ID then break;
  QManager.Next;
  end;    // while
DBManager.Text:=QManager['U_FIO_PLUS_BOSS'];
end;

procedure TFormUpdateContact.OpenOwner(U_ID:integer);
begin
if not QOwner.Active then QOwner.Open;
QOwner.First;
while not QOwner.EOF do
  begin
  if QOwner['U_ID']=U_ID then break;
  QOwner.Next;
  end;    // while
DBOwner.Text:=QOwner['U_FIO_PLUS_BOSS'];
end;

procedure TFormUpdateContact.OpenPeriodicity(P:integer);
begin
if not QPeriod.Active then Qperiod.Open;
QPeriod.First;
while not QPeriod.EOF do
  begin
  if Qperiod['PR_ID']=P then break;
  Qperiod.Next;
  end;    // while
DBperiod.Text:=Qperiod['PR_COMMENT'];
LabelParameter.Caption:='';
end;

procedure TFormUpdateContact.OpenCompany(CompanyID:integer);
begin
if not QCompanies.Active then QCompanies.Open;
QCompanies.First;
while not QCompanies.EOF do
  begin
  if QCompanies['CM_ID']=CompanyID then break;
  QCompanies.Next;
  end;    // while
DBCompanies.Text:=QCompanies['CM_NAME'];
end;

procedure TFormUpdateContact.QManagerCalcFields(DataSet: TDataSet);
begin
if varIsNull(QManager['U_ISBOSS']) then QManager['U_FIO_PLUS_BOSS']:=''
else
  begin
  if QManager['U_ISBOSS']= 1 then QManager['U_FIO_PLUS_BOSS']:=QManager['U_FIO']+' BOSS';
  if QManager['U_ISBOSS']= 0 then QManager['U_FIO_PLUS_BOSS']:=QManager['U_FIO'];
  end;
end;

procedure TFormUpdateContact.QOwnerCalcFields(DataSet: TDataSet);
begin
if varIsNull(QOwner['U_ISBOSS']) then QOwner['U_FIO_PLUS_BOSS']:=''
else
  begin
  if QOwner['U_ISBOSS']= 1 then QOwner['U_FIO_PLUS_BOSS']:=QOwner['U_FIO']+' BOSS';
  if QOwner['U_ISBOSS']= 0 then QOwner['U_FIO_PLUS_BOSS']:=QOwner['U_FIO'];
  end;
end;

procedure TFormUpdateContact.SetPeriodParameter;
var Year, Month, Day, DOW: Word;
begin
LabelParameter.Caption:='Выставление заданий не определено';
DecodeDateFully(DT.Date,Year, Month, Day, DOW);
if QPeriod['PR_NAME']='WEEKLY' then
  begin
  LabelParameter.Caption:='Выставление заданий '+DetectDay(DT.Date)+', каждую неделю';
  end;
if QPeriod['PR_NAME']='MONTHLY' then
  begin
  LabelParameter.Caption:='Выставление заданий '+IntToStr(Day)+' день месяца';
  end;
if QPeriod['PR_NAME']='QUATERLY' then
  begin
  LabelParameter.Caption:='Выставление заданий ежеквартально, следующая дата '+DateToStr(DT.Date);
  end;
if QPeriod['PR_NAME']='YEARLY' then
  begin
  LabelParameter.Caption:='Выставление заданий '+IntToStr(Day)+'.'+IntToStr(Month)+' каждого года';
  end;
if QPeriod['PR_NAME']='ONCE' then
  begin
  LabelParameter.Caption:='Выставление заданий однократно, следующая дата '+DateToStr(DT.Date);
  end;
end;

procedure TFormUpdateContact.OpenJobType(Jobtype:integer);
begin
if not QJobType.Active then QJobType.Open;
QJobType.First;
while not QJobType.EOF do
  begin
  if QJobType['JT_ID']=JobType then break;
  QJobtype.Next;
  end;    // while
DBJobType.Text:=QJobType['JT_NAME'];
end;

procedure TFormUpdateContact.DBPeriodExit(Sender: TObject);
begin
SetPeriodParameter;
end;

procedure TFormUpdateContact.DTExit(Sender: TObject);
begin
SetPeriodParameter;
end;

procedure TFormUpdateContact.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
case Key of
  VK_Escape: BitBtnCancel.Click;
  VK_F2:     BitBtnSave.Click;
end;
end;

procedure TFormUpdateContact.BitBtnSaveClick(Sender: TObject);
var Res:boolean;
begin
if DT.Date<=Now() then
  begin
  MessageDlg('Устанавливайте задания завтра или более позднюю дату. Вы можете использовать другой месяц',mtWarning,[mbOK],0);
  ModalResult:=mrNone;
  exit;
  end;
if length(MemoComment.text)<10 then
  begin
  MessageDlg('Увеличьте текст подробного комментария, он должен быть больше 10 символов',mtWarning,[mbOK],0);
  ModalResult:=mrNone;
  exit;
  end;
if length(MemoJobComment.text)<10 then
  begin
  MessageDlg('Увеличьте текст создаваемого задания, он должен быть больше 10 символов',mtWarning,[mbOK],0);
  ModalResult:=mrNone;
  exit;
  end;
if QManager['U_ISCLOSED']=1 then
  begin
  MessageDlg('Невозможно указать пользователя '+QManager['U_FIO_PLUS_BOSS']+' как исполнителя, он уже удален (не работает)',mtWarning,[mbOK],0);
  ModalResult:=mrNone;
  exit;
  end;
if QOwner['U_ISCLOSED']=1 then
  begin
  MessageDlg('Невозможно указать пользователя '+QOwner['U_FIO_PLUS_BOSS']+' как контролёра, он уже удален (не работает)',mtWarning,[mbOK],0);
  ModalResult:=mrNone;
  exit;
  end;
{ TODO : Возможно, эта доработка не нужна. Если задание уже выставлено и не закрыто, выдать предупреждение, удалить его и следать update обязательства}
Res:=DM.ContactUpdate(F_ContactID,QManager['U_ID'], QOwner['U_ID'], QCompanies['CM_ID'], QPeriod['PR_ID'],
          EContacter.Text, MemoComment.Text, DateToStr(DT.Date), MemoJobComment.Text, QJobType['JT_ID']);
if not Res
then
  begin
  MessageDlg('Возможно, обязательство не сохранено. '+DM.GetErrorByCode(1018),mtError,[mbOK],0);
  ModalResult:=mrNone;
  exit;
	end;
FocusControl(EContacter);
end;

procedure TFormUpdateContact.BitBtnCancelClick(Sender: TObject);
begin
FocusControl(EContacter);
end;

end.
