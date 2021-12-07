unit UserInsert;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Buttons, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TFormUserInsert = class(TForm)
    Label1: TsLabel;
    EditLogin: TsEdit;
    BitBtnCancel: TsBitBtn;
		QMaxUserID: TZQuery;
		QInsertUser: TZQuery;
    QBOSSES: TZQuery;
    QInsertBOSS: TZQuery;
    Label2: TsLabel;
    EditPWD: TsEdit;
    Label3: TsLabel;
    EditFIO: TsEdit;
    Label4: TsLabel;
    EditComment: TsEdit;
    QBOSSESU_LOGIN: TStringField;
    QBOSSESU_PASSWORD: TStringField;
    QBOSSESU_FIO: TStringField;
    QBOSSESU_COMMENT: TStringField;
    QBOSSESU_ID: TIntegerField;
    QBOSSESU_ISBOSS: TIntegerField;
    QBOSSESU_ISCLOSED: TSmallintField;
    BitBtnSave: TsBitBtn;
    CBEditPrices: TsCheckBox;
		procedure BitBtnCancelClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtnSaveClick(Sender: TObject);
	private
	public
    procedure SetPosition(L, T: integer);
		procedure SetUser;
	end;

var
  FormUserInsert: TFormUserInsert;

implementation

uses MainForm, Users, DataModule;

{$R *.dfm}

procedure TFormuserInsert.SetPosition(L,T:integer);
begin
Left:=L+ShiftLeft;
Top:=T+ShiftTop;
end;

procedure TFormUserInsert.BitBtnCancelClick(Sender: TObject);
begin
Close;
end;

procedure TFormUserInsert.SetUser;
begin
EditLOGIN.Clear;
EditPWD.Clear;
EditFIO.Clear;
EditComment.Clear;
CBEditPrices.Checked:=false;
end;

procedure TFormUserInsert.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
case Key of    //
  VK_Escape: BitBtnCancel.Click;
  VK_F2: BitBtnSave.Click;
end;    // case
end;

procedure TFormUserInsert.BitBtnSaveClick(Sender: TObject);
var Max:integer;
Comment:string;
begin
if length(trim(EditFIO.Text))=0 then
	begin
	MessageDlg('Логин пользователя не указан, заполните поле',mtInformation,[mbOK],0);
  ModalResult:=mrNone;
	exit;
	end;
QMaxUserID.Close;
QMaxUSerID.Open;
if VarIsNull(QMaxUserID['MAXID']) then Max:=0 else Max:=QMaxUserID['MAXID'];
QInsertUser.Close;
QInsertUSer.ParamByName('U_ID').AsInteger:=Max+1;
QInsertUser.ParamByName('U_LOGIN').AsString:=EditLogin.Text;
QInsertUser.ParamByName('U_FIO').AsString:=EditFIO.Text;
QInsertUser.ParamByName('U_PASSWORD').AsString:=AnsiUppercase(EditPWD.Text);
if length(EditComment.Text)= 0 then Comment:=' ' else Comment:=EditComment.Text;
// В Firebird обнаружил баг при операции || c Null полем, исправлем его символом пробела
QInsertUser.ParamByName('U_COMMENT').AsString:=Comment;
if CBEDitPrices.Checked
	then QInsertUser.ParamByName('U_EDIT_PRICES').AsInteger:=1
	else QInsertUser.ParamByName('U_EDIT_PRICES').AsInteger:=0;
QInsertUSer.ExecSQL;
if not QBosses.Active then QBosses.Open;
QBosses.First;
while not QBosses.EOF do
	begin
	QInsertBoss.Close;
	QInsertBoss.ParamByName('UB_USERID').AsInteger:=Max+1;
	QInsertBoss.ParamByName('UB_VIEWERID').AsInteger:=QBosses['U_ID'];
	QInsertBoss.ExecSQL;
	QBosses.Next;
	end;
FocusControl(EditFIO);
end;

end.