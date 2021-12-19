unit UserInsert;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, sBitBtn,
  sEdit, sLabel, Data.DB, MemDS, DBAccess, Uni, sSkinProvider, sSkinManager,
  sCheckBox, ZAbstractRODataset, ZAbstractDataset, ZDataset;
type
  TFormUserInsert = class(TForm)
    sLabel1: TsLabel;
    EditLogin: TsEdit;
    QMaxUserID: TUniQuery;
    sSkinManager1: TsSkinManager;
    sSkinProvider1: TsSkinProvider;
    QMaxUserIDMAXID: TIntegerField;
    QInsertUser: TUniSQL;
    sLabel2: TsLabel;
    sLabel3: TsLabel;
    sLabel4: TsLabel;
    BitBtnCancel: TsBitBtn;
    BitBtnSave: TsBitBtn;
    EditPWD: TsEdit;
    EditFIO: TsEdit;
    EditComment: TsEdit;
    CBEditPrices: TsCheckBox;
    QBOSSES: TUniQuery;
    QBOSSESU_ID: TIntegerField;
    QBOSSESU_LOGIN: TStringField;
    QBOSSESU_PASSWORD: TStringField;
    QBOSSESU_ISBOSS: TIntegerField;
    QBOSSESU_FIO: TStringField;
    QBOSSESU_COMMENT: TStringField;
    QBOSSESU_EDIT_OWN_JOBS: TSmallintField;
    QBOSSESU_EDIT_PRICES: TSmallintField;
    QBOSSESU_ISCLOSED: TSmallintField;
    QInsertBOSS: TUniSQL;
    procedure BitBtnCancelClick(Sender: TObject);
    procedure BitBtnCancelKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtnSaveClick(Sender: TObject);
  private
    { Private declarations }
  public
  procedure SetPosition(L, T: integer);
	procedure SetUser;
  end;

var
  FormUserInsert: TFormUserInsert;

implementation

uses MainForm, Users, DataModule, System.UITypes;

{$R *.dfm}

{ TFormNewUser }

procedure TFormUserInsert.BitBtnCancelClick(Sender: TObject);
begin
Close;
end;

procedure TFormUserInsert.BitBtnCancelKeyUp(Sender: TObject; var Key: Word;
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
QInsertUSer.Execute;
if not QBosses.Active then QBosses.Open;
QBosses.First;
while not QBosses.EOF do
	begin
	QInsertBoss.ParamByName('UB_USERID').AsInteger:=Max+1;
	QInsertBoss.ParamByName('UB_VIEWERID').AsInteger:=QBosses['U_ID'];
	QInsertBoss.Execute;
	QBosses.Next;
	end;
FocusControl(EditFIO);
end;

procedure TFormUserInsert.SetPosition(L, T: integer);
begin
Left:=L+ShiftLeft;
Top:=T+ShiftTop;
end;

procedure TFormUserInsert.SetUser;
begin
EditLOGIN.Clear;
EditPWD.Clear;
EditFIO.Clear;
EditComment.Clear;
CBEditPrices.Checked:=false;
end;

end.
