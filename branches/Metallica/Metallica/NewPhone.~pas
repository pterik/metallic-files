unit NewPhone;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, Mask;

type
  TFormNewPhone = class(TForm)
    BitBtnCancel: TBitBtn;
    Label1: TLabel;
    MEditPref1: TMaskEdit;
    MEditPhone1: TMaskEdit;
    DT: TDateTimePicker;
    StaticText1: TStaticText;
    EditCompany: TEdit;
    Label2: TLabel;
    EditContacter: TEdit;
    StaticText2: TStaticText;
    BitBtnSave: TBitBtn;
    procedure BitBtnSaveClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtnCancelClick(Sender: TObject);
  private
  F_CompanyID:integer;
  public
    procedure SetPosition(L, T: integer);
    procedure SetNewPhone(CompanyID:integer; CompanyName, Contacter:string);
  end;

var
  FormNewPhone: TFormNewPhone;

implementation

uses DataModule, CommonUnit, MainForm, EnterUser;

{$R *.dfm}
procedure TFormNewPhone.SetPosition(L,T:integer);
begin
Left:=L+ShiftLeft;
Top:=T+ShiftTop;
end;


procedure TFormNewPhone.BitBtnSaveClick(Sender: TObject);
var Phone:int64;
S, SPhone, SMessage:string;
Res:boolean;
begin
if length(MEditPref1.Text)<>2 then
  begin
  MessageDlg(S+' укажите две цифры для междугороднего кода или номера оператора',mtInformation,[mbOK],0);
  ModalResult:=mrNone;
  exit;
  end;
S:=MEditPhone1.Text;
if (S='') or (S='   -  -  ') then
  begin
  MessageDlg(S+' укажите цифры для номера телефона',mtInformation,[mbOK],0);
  ModalResult:=mrNone;
  exit;
  end;
SPhone:='('+MEditPref1.Text+')'+S;
Phone:=FindPhoneOnce(SPhone);
if Phone=0  then
  begin
  MessageDlg(Sphone+' неверно указан номер телефона, обратите внимание на код города',mtError,[mbOK],0);
  ModalResult:=mrNone;
  exit;
  end;
SMessage:='';
if DM.PhoneSearch(Phone)>0
then
  begin
  SMessage:='Телефон ('+MEditPref1.Text+')'+MEditPhone1.Text+' уже внесен в БД. Он опять помечен как активный.';
  Res:=DM.PhoneUpdateDate(Phone,DateToStr(DT.Date));
	end;
if DM.PhoneSearch(Phone)= 0
then Res:=DM.PhoneInsert(Phone,EditContacter.Text,DateToStr(DT.Date))
else
		if EditContacter.Text='' then Res:=DM.PhoneUpdateDate(Phone,DateToStr(DT.Date))
		else Res:=DM.PhoneUpdateDateComment(Phone,EditContacter.Text, DateToStr(DT.Date));
Res:=Res and DM.PhoneCompanyInsertorUpdate(Phone, FormMain.ReadEnteredUserID, F_CompanyID, DateToStr(DT.Date));
if not Res
then
  begin
  MessageDlg(DM.GetErrorByCode(1001),mtError,[mbOK],0);
  ModalResult:=mrNone;
  exit;
  end;
SMessage:=SMessage+chr(10)+chr(13)+'Телефон успешно зарегистрирован';
MessageDlg(SMessage,mtInformation,[mbOK],0);
FocusControl(EditCompany);
end;

procedure TFormNewPhone.SetNewPhone(CompanyID:integer; CompanyName, Contacter:string);
begin
F_CompanyID:=CompanyID;
MEditPref1.Text:=FormMain.CityCode;
EditCompany.Text:=CompanyName;
EditContacter.Text:=Contacter;
MEditPhone1.Clear;
DT.Date:=Now();
end;

procedure TFormNewPhone.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
case Key of    //
  VK_Escape: BitBtnCancel.Click;
  VK_F2: BitBtnSave.Click;
end;    // case
end;

procedure TFormNewPhone.BitBtnCancelClick(Sender: TObject);
begin
FocusControl(EditCompany);
end;

end.
