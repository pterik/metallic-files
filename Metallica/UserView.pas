unit UserView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset;

type
  TFormUserUpdate = class(TForm)
    BitBtnCancel: TBitBtn;
    Label1: TLabel;
    EditFIO: TEdit;
    QUpdateUser: TZQuery;
    Label2: TLabel;
    EditLogin: TEdit;
    Label3: TLabel;
    EditPWD: TEdit;
    Label4: TLabel;
    EditComment: TEdit;
    BitBtnSave: TBitBtn;
    procedure BitBtnCancelClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtnSaveClick(Sender: TObject);
	private
		F_UserID:integer;
	public
    procedure SetPosition(L, T: integer);
		procedure SetUserName(UsID: integer; usLogin, UsFIO, usPWD, usComment: variant);
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

procedure TFormUserUpdate.BitBtnCancelClick(Sender: TObject);
begin
Close;
end;

procedure TFormUserUpdate.SetUserName(UsID: integer; usLogin, UsFIO, usPWD, usComment: Variant);
begin
F_UserID:=UsID;
EditLogin.Text:=usLogin;
EditFIO.Text:=UsFIO;
EditPWD.Text:=usPWD;
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
	MessageDlg('Ошибка, фамилия пользователя не указана',mtWarning,[mbOK],0);
	exit;
	end;
if not FormMain.ReadEnteredUserIsBoss then
	begin
	MessageDlg('Только BOSS может изменить данные по другому пользователю',mtWarning,[mbOK],0);
	exit;
	end;
QUpdateUser.Close;
QUpdateUser.ParamByName('U_ID').AsInteger:=F_UserID;
QUpdateUser.ParamByName('U_FIO').AsString:=EditFIO.Text;
QUpdateUser.ParamByName('U_PASSWORD').AsString:=AnsiUppercase(EditPWD.Text);
QUpdateUser.ParamByName('U_COMMENT').AsString:=EditComment.Text;
QUpdateUser.ExecSQL;
FormUsers.QViewFormUsers.Refresh;
FocusControl(EditFIO);
end;

end.
