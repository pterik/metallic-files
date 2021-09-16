unit EnterUser;

interface

uses
	Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
	Dialogs, StdCtrls, Buttons, ExtCtrls, DB, ZAbstractRODataset,
	ZAbstractDataset, ZDataset, ZConnection, Mask, DBCtrlsEh, DBLookupEh,
  DBGridEh;

type
	TFormEnterUser = class(TForm)
		Label3: TLabel;
		BitBtnCancel: TBitBtn;
		BitBtnEnter: TBitBtn;
		QUsers: TZQuery;
    EPWD: TEdit;
    Label2: TLabel;
    Label4: TLabel;
    DBUsers: TDBLookupComboboxEh;
    DSUsers: TDataSource;
    EFIO: TEdit;
		procedure BitBtnConnectClick(Sender: TObject);
		procedure BitBtnCancelClick(Sender: TObject);
		procedure BitBtnEnterClick(Sender: TObject);
		procedure FormCreate(Sender: TObject);
    procedure DBUsersChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
	private
    F_ValidUser:boolean;
	public
		procedure ConnectToDatabase;
	end;

var
	FormEnterUser: TFormEnterUser;

implementation

uses DataModule, MainForm, CommonUnit, System.UITypes;

{$R *.dfm}

procedure TFormEnterUser.BitBtnConnectClick(Sender: TObject);
begin
ConnectToDatabase;
end;

procedure TFormEnterUser.ConnectToDatabase;
begin
if not DM.LoadRegister then
	begin
	BitBtnEnter.Enabled:=false;
	exit;
	end;
FormMain.ZC.Database:=DM.F_Database;
FormMain.ZC.Protocol:=DM.F_Protocol;
FormMain.ZC.HostName:=DM.F_HostName;
FormMain.ZC.User:=DM.F_User;
FormMain.ZC.Password:=DM.F_Password;
FormMain.ZC.LoginPrompt:=false;
try
FormMain.ZC.Connect;
except on E:Exception do
	begin
	MessageDlg('�������� ������. ��������� ������� - ����������� ����.'+chr(10)+chr(13) +E.Message,mtError,[mbOK],0);
  BitBtnEnter.Enabled:=false;
  exit;
	end;
end;
QUsers.Close;
QUsers.ParamByName('U_LOGIN').Asstring:=DM.F_LastUser;
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
  FormMain.SetMainForm(QUsers['U_ID'],QUsers['U_LOGIN'],QUsers['U_FIO']);
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

{function TFormEnterUser.LoadRegister:boolean;
var
//KAccess:LongWord;
Res, ReadBranch:boolean;
ParametersCorrect:integer; // ������ ����� ����������
Chipered:integer;          // ���������� ������
begin
Result:=true;
//������� ������ ������ ����� ���� �� ���
ReadBranch:=RegisterRecordExists(RegisterBranchMetallica);
//ReadBranch:=ReadOnlyBranch(RegisterBranchCalendar, KAccess);
if not ReadBranch then
	begin
	MessageDlg('���������� � ������������ ���� ������ �����������. ���������� �������� ��������� CheckCom.exe, �������� ���������� ��������������',mtError,[mbOK],0);
	Result:=false;
	exit;
	end;
Res:=true;
try
	//F_ParametersCorrect=0 ���� ������ ��������, >0 ���� ������ � ����������� �� ������ ����������
	// ��� ������ ���������� ����������� � ���������������
	Res:=Res and ReadRegisterDWORD(ParametersCorrect,RegisterBranchMetallica,'SETPARAM');
	Res:=Res and ReadRegisterStr(F_HostName,RegisterBranchMetallica,'HOSTNAME');
	Res:=Res and ReadRegisterStr(F_Database,RegisterBranchMetallica,'DATABASE');
	Res:=Res and ReadRegisterStr(F_Protocol,RegisterBranchMetallica,'PROTOCOL');
	//0 ���� ������ �� ���������, >0 ���� ��������� � ����������� �� ���� ����������
	Res:=Res and ReadRegisterDWORD(Chipered,RegisterBranchMetallica,'CHIPERED');
	Res:=Res and ReadRegisterStr(F_User,RegisterBranchMetallica,'USERNAME');
	Res:=Res and ReadRegisterStr(F_Password,RegisterBranchMetallica,'PASSWORD');
	Res:=Res and ReadRegisterStr(F_LastUser,RegisterBranchMetallica,'LASTDBUSER');
finally
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
}
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
