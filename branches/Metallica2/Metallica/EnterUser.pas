unit EnterUser;

interface

uses
  	Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  	Dialogs, StdCtrls, Buttons, ExtCtrls, DB, ZAbstractRODataset, 	ZAbstractDataset, 
  ZDataset, ZConnection, Mask, DBCtrlsEh, DBLookupEh, DBGridEh, MemDS, DBAccess, Uni,
  sEdit, sBitBtn, sLabel;

type
	TFormEnterUser = class(TForm)
		Label3: TsLabel;
		BitBtnCancel: TsBitBtn;
		BitBtnEnter: TsBitBtn;
    QUsers2: TZQuery;
    EPWD: TsEdit;
    Label2: TsLabel;
    Label4: TsLabel;
    DBUsers: TDBLookupComboboxEh;
    DSUsers: TDataSource;
    EFIO: TsEdit;
    QUsers: TUniQuery;
    QUsers2U_ID: TIntegerField;
    QUsers2U_LOGIN: TStringField;
    QUsers2U_PASSWORD: TStringField;
    QUsers2U_ISBOSS: TIntegerField;
    QUsers2U_FIO: TStringField;
    QUsers2U_COMMENT: TStringField;
    QUsers2U_EDIT_OWN_JOBS: TSmallintField;
    QUsers2U_EDIT_PRICES: TSmallintField;
    QUsers2U_ISCLOSED: TSmallintField;
		procedure BitBtnConnectClick(Sender: TObject);
		procedure BitBtnCancelClick(Sender: TObject);
		procedure BitBtnEnterClick(Sender: TObject);
		procedure FormCreate(Sender: TObject);
    procedure DBUsersChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
	private
    F_HostName, F_Database, F_Protocol, F_User, F_Password, F_LastUser:string;
    F_ValidUser:boolean;
		function LoadByRegister:boolean;
	public
		procedure ConnectToDatabase;
	end;

var
	FormEnterUser: TFormEnterUser;

implementation

uses DataModule, MainForm, CommonUnit, System.Win.Registry;

{$R *.dfm}

procedure TFormEnterUser.BitBtnConnectClick(Sender: TObject);
begin
ConnectToDatabase;
end;

procedure TFormEnterUser.ConnectToDatabase;
begin
if not LoadByRegister then
	begin
	BitBtnEnter.Enabled:=false;
	exit;
	end;
ShowMessage(F_Database);
exit;
FormMain.ZC.Database:=F_Database;
FormMain.ZC.ProviderName:='Interbase';
FormMain.ZC.Server:=F_HostName;
FormMain.ZC.UserName:=F_User;
FormMain.ZC.Password:=F_Password;
FormMain.ZC.LoginPrompt:=false;
try
FormMain.ZC.Connect;
except on E:Exception do
	begin
	MessageDlg('�������� ������. ��������� ������� - ���������� ����� '+chr(10)+chr(13)+E.Message,mtError,[mbOK],0);
  BitBtnEnter.Enabled:=false;
  exit;
	end;
end;
QUsers.Close;
QUsers.ParamByName('U_LOGIN').Asstring:=F_LastUser;
QUsers.Open;
QUsers.First;
DBUsers.Text:=QUsers['U_LOGIN'];
FormMain.Visible:=false;
FormEnterUser.ShowModal;
end;

procedure TFormEnterUser.BitBtnCancelClick(Sender: TObject);
begin
if not (FormMain=nil) then
  begin
  FormMain.ConfirmClose:=false;
  FormMain.Close;
  end;
Close;
end;

procedure TFormEnterUser.BitBtnEnterClick(Sender: TObject);
var IsValidPassword:boolean;
Password:string;
begin
if FormMain.ZC.Connected=false then
	begin
		MessageDlg('��� ����������� � ���� ������',mtError,[mbOK],0);
		exit;
	end;
if VarIsNull(QUsers['U_PASSWORD']) then Password:='' else Password:=AnsiUpperCase(trim(QUsers['U_PASSWORD']));
IsValidPassword:=(AnsiUpperCase(trim(EPWD.Text))=AnsiUpperCase(Password));
//��� ����� �������� ��� ������ �������, �������� =
if not IsValidPassword then
    begin
    MessageDlg('������ �������� ������',mtWarning,[mbOK],0);
    EPWD.Clear;
    ModalResult:=mrNone;
    FocusControl(EPwd);
    end;
if IsValidPassword then
	begin
	//������������ ��������� ��� ������
//if FormClock=nil then Application.CreateForm(TFormClock, FormClock);
//  FormClock.SetPosition(Self.Left,Self.Top);
//  FormClock.SetClock;
//  FormClock.Show;
  FormMain.SetMainForm(QUsers['U_ID'],QUsers['U_LOGIN'],QUsers['U_FIO'],QUsers['U_ISBOSS']);
//  FormClock.StopClock;
//  FormClock.Close;
	FormMain.Show;
  F_ValidUser:=true;
	FormEnterUser.Close;
	end;
end;

procedure TFormEnterUser.FormCreate(Sender: TObject);
begin
Left:=(Screen.Width-Width) div 2;
Top:=(Screen.Height-Height) div 2;
FormEnterUser.F_ValidUser:=false;
end;

function TFormEnterUser.LoadByRegister:boolean;
var
//KAccess:LongWord;
reg : TRegistry;
Res:boolean;
//ReadBranch:boolean;
ParametersCorrect:integer; // ������ ����� ����������
openResult:boolean;
Chipered:integer;          // ���������� ������
begin
Result:=true;
//������� ������ ������ ����� ���� �� ���
//ReadBranch:=RegisterRecordExists(RegisterBranchMetallica);
//ReadBranch:=ReadOnlyBranch(RegisterBranchMetallica, KAccess);
	reg := TRegistry.Create(KEY_READ);
	reg.RootKey := HKEY_CURRENT_USER;
	openResult := reg.OpenKey('SOFTWARE\PterikSoft\Metallica',False);
  F_HostName:=reg.ReadString('HOSTNAME');
//ReadBranch:=ReadOnlyBranch(RegisterBranchCalendar, KAccess);
if not openResult then
	begin
	MessageDlg('���������� � ������������ ���� ������ �����������. ���������� �������� ��������� CheckCom.exe, �������� ���������� ��������������',mtError,[mbOK],0);
	Result:=false;
	exit;
	end;
	Res:=true;
	try
	//F_ParametersCorrect=0 ���� ������ ��������, >0 ���� ������ � ����������� �� ������ ����������
	// ��� ������ ���������� ����������� � ���������������
//	Res:=Res and ReadRegisterDWORD(ParametersCorrect,RegisterBranchMetallica,'SETPARAM');
//	Res:=Res and ReadRegisterStr(F_HostName,RegisterBranchMetallica,'HOSTNAME');
//	Res:=Res and ReadRegisterStr(F_Database,RegisterBranchMetallica,'DATABASE');
//	Res:=Res and ReadRegisterStr(F_Protocol,RegisterBranchMetallica,'PROTOCOL');
	//0 ���� ������ �� ���������, >0 ���� ��������� � ����������� �� ���� ����������
//	Res:=Res and ReadRegisterDWORD(Chipered,RegisterBranchMetallica,'CHIPERED');
	{ TODO : �������� ������������� (������) ������ �� XOR }
//	Res:=Res and ReadRegisterStr(F_User,RegisterBranchMetallica,'USERNAME');
//	Res:=Res and ReadRegisterStr(F_Password,RegisterBranchMetallica,'PASSWORD');
//	Res:=Res and ReadRegisterStr(F_LastUser,RegisterBranchMetallica,'LASTDBUSER');
  reg := TRegistry.Create(KEY_READ);
	reg.RootKey := HKEY_CURRENT_USER;
  F_HostName:=reg.ReadString('HOSTNAME');
	F_Database:=reg.ReadString('DATABASE');
	F_Protocol:=reg.ReadString('PROTOCOL');
//  if reg.ReadInteger('ISSERVER')=0 then F_IsServer:=false;
//  if reg.ReadInteger('ISSERVER')=1 then F_IsServer:=true;
//	Chipered:=reg.ReadInteger('CHIPERED');
	F_User:=reg.ReadString('USERNAME');
	F_Password:=reg.ReadString('PASSWORD');
	//F_ParametersCorrect:=reg.ReadInteger('SETPARAM');
	F_LastUser:=reg.ReadString('LASTDBUSER');
	finally
	reg.CloseKey();
	reg.Free;
	if not Res then
  	begin
	  if MessageDlg('���������� � ������� � ������������ ���� ������ �������, �������� �� ���� ���������� ��������������'+chr(13)+chr(10)+
             '�� �������� ��������� CheckCom.exe � �������� ������'+chr(13)+chr(10)+
             '�������� ���� � ������ ���������. ����������?',mtWarning,[mbYes,mbNo],0)=mrYes
    then Result:=true
    else
      begin
      Result:=false;
      end;
  	end;
	end;
end;

procedure TFormEnterUser.DBUsersChange(Sender: TObject);
begin
if not VarIsNull(QUsers['U_FIO']) then EFIO.Text:=QUsers['U_FIO'];
end;

procedure TFormEnterUser.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
if not F_ValidUser then halt(2);
end;

end.
