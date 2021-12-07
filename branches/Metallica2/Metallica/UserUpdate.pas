unit UserUpdate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Buttons, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TFormUserUpdate = class(TForm)
    BitBtnCancel: TsBitBtn;
    Label1: TsLabel;
    EditFIO: TsEdit;
    QUpdateUser: TZQuery;
    Label2: TsLabel;
    EditLogin: TsEdit;
    Label3: TsLabel;
    EditPWD: TsEdit;
    Label4: TsLabel;
    EditComment: TsEdit;
    BitBtnSave: TsBitBtn;
    CBEditPrices: TsCheckBox;
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
		procedure BitBtnSaveClick(Sender: TObject);
    procedure BitBtnCancelClick(Sender: TObject);
	private
		F_UserID:integer;
	public
    procedure SetPosition(L, T: integer);
		procedure SetUserName(UsID: integer; usLogin, UsFIO, usPWD, usComment, usEditPrices: variant);
	end;

var
	FormUserUpdate: TFormUserUpdate;

implementation

uses MainForm, Users, DataModule;

{$R *.dfm}

procedure TFormuserUpdate.SetPosition(L,T:integer);
begin
Left:=L+ShiftLeft;
Top:=T+ShiftTop;
end;

procedure TFormUserUpdate.SetUserName(UsID: integer; usLogin, UsFIO, usPWD, usComment, usEditPrices: Variant);
begin
F_UserID:=UsID;
EditLogin.Text:=usLogin;
EditFIO.Text:=UsFIO;
EditPWD.Text:=usPWD;
CBEditPrices.Checked:=(usEditPrices=1);
if VarIsNull(usComment)
	then EditComment.Text:=''
  else EditComment.Text:=usComment;
end;

procedure TFormUserUpdate.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
case Key of    //
  VK_Escape: BitBtnCancel.Click;
  VK_F2: BitBtnSave.Click;
end;    // case
end;

procedure TFormUserUpdate.BitBtnSaveClick(Sender: TObject);
begin
if length(trim(EditFIO.Text))=0 then
	begin
	MessageDlg('������, ������� ������������ �� �������',mtWarning,[mbOK],0);
	exit;
	end;
if not FormMain.ReadEnteredUserIsBoss then
	begin
	MessageDlg('������ BOSS ����� �������� ������ �� ������� ������������',mtWarning,[mbOK],0);
	exit;
	end;
QUpdateUser.Close;
QUpdateUser.ParamByName('U_ID').AsInteger:=F_UserID;
QUpdateUser.ParamByName('U_FIO').AsString:=EditFIO.Text;
QUpdateUser.ParamByName('U_PASSWORD').AsString:=AnsiUppercase(EditPWD.Text);
QUpdateUser.ParamByName('U_COMMENT').AsString:=EditComment.Text;
if CBEditPrices.Checked
then QUpdateUser.ParamByName('U_EDIT_PRICES').AsInteger:=1
else QUpdateUser.ParamByName('U_EDIT_PRICES').AsInteger:=0;
QUpdateUser.ExecSQL;
FocusControl(EditFIO);
end;

procedure TFormUserUpdate.BitBtnCancelClick(Sender: TObject);
begin
FocusControl(EditFIO);
end;

end.