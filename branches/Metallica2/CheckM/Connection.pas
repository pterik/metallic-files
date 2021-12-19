unit Connection;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, Mask, DBCtrlsEh, DBLookupEh, 	IdBaseComponent,
  IdComponent, IdRawBase, IdRawClient, IdIcmpClient, IdTCPConnection, IdTCPClient,
  IdWhois, IdIPWatch, ZAbstractConnection, DBAccess, Uni, MemDS, UniProvider, InterBaseUniProvider,
  sDialogs, sCheckBox, sButton, sComboBox, sBitBtn, sMemo, sEdit, sLabel, sPanel,
  sMaskEdit, sCustomComboEdit, sSkinProvider, sSkinManager;

// const IniName='database.ini';
 const RegisterBranchMetallica='SOFTWARE\PterikSoft\Metallica';
       ParameterVersion=2;

type
	TFormConnection = class(TForm)
		Panel1: TsPanel;
		Label1: TsLabel;
		lblProtocol: TsLabel;
		lblHostName: TsLabel;
		edtHostName: TsEdit;
		lblDatabase: TsLabel;
		edtDatabase: TsEdit;
		lblUserName: TsLabel;
    edtUser: TsEdit;
		lblPassword: TsLabel;
		edtPassword: TsEdit;
    BitBtnClose: TsBitBtn;
    BitBtnSave: TsBitBtn;
    MemoInfo: TsMemo;
    IdIcmpClient: TIdIcmpClient;
    BitBtnPing: TsBitBtn;
    BitBtnConnect: TsBitBtn;
    CBProtocol: TsComboBox;
    Label2: TsLabel;
    ButtonSetDB: TsButton;
    OpenDB: TsOpenDialog;
    StaticText1: TStaticText;
    IdIPWatch1: TIdIPWatch;
    CheckBox1: TsCheckBox;
    BitBtnExport: TsBitBtn;
    Label3: TsLabel;
    ZC: TUniConnection;
    InterBaseUniProvider1: TInterBaseUniProvider;
    sSkinManager1: TsSkinManager;
    sSkinProvider1: TsSkinProvider;
		procedure BitBtnConnectClick(Sender: TObject);
		procedure BitBtnEnterClick(Sender: TObject);
		procedure FormCreate(Sender: TObject);
		procedure BitBtnCloseClick(Sender: TObject);
		procedure BitBtnSaveClick(Sender: TObject);
		procedure BitBtnPingClick(Sender: TObject);
		procedure IdIcmpClientReply(ASender: TComponent;
			const AReplyStatus: TReplyStatus);
		procedure FormKeyUp(Sender: TObject; var Key: Word;
			Shift: TShiftState);
		procedure EdtProtocolChange(Sender: TObject);
		procedure edtHostNameChange(Sender: TObject);
		procedure edtDatabaseChange(Sender: TObject);
		procedure edtUserChange(Sender: TObject);
		procedure edtPasswordChange(Sender: TObject);
		procedure ButtonSetDBClick(Sender: TObject);
		procedure CheckBox1Click(Sender: TObject);
    procedure BitBtnExportClick(Sender: TObject);
	private
		F_ParametersCorrect:integer;// ������ ����� ����������
		F_Chipered:integer;         // ���������� ������
		F_IsServer:boolean;         // 1 ���� ���� �������� ��������
		F_Connected:boolean;        // ��������� �� ����������
		F_Pinged:boolean;           // ��������� �� ���
		procedure LoadRegister;
	public
		procedure CheckServerName;
	end;

var
	FormConnection: TFormConnection;

implementation

{$R *.dfm}
uses CommonUnit, Export, System.Win.Registry, System.UITypes;

Function ReadComputerName:string;
var
i:DWORD;
p:PChar;
begin
i:=255;
GetMem(p, i);
GetComputerName(p, i);
Result:=String(p);
FreeMem(p);
end;

procedure TFormConnection.BitBtnConnectClick(Sender: TObject);
begin
//����������� ����������� ���������� �� ����
IdIcmpClient.Host:=EdtHostName.Text;
try
IdIcmpClient.Ping('Hello',0);
except on E:Exception do
	begin
	MemoInfo.Lines.Add('��� ���������� '+edtHostName.Text+' �� ��������, �������� ����');
	F_Connected:=false;
	F_Pinged:=false;
	exit;
	end;
end;
F_Pinged:=true;
//ZC.Disconnect;
//ZC.Database:=EdtDatabase.Text;
//ZC.Protocol:=CBProtocol.Text;
//ZC.HostName:=EdtHostName.Text;
//ZC.User:=EdtUser.Text;
//ZC.Password:=EdtPassword.Text;
//ZC.LoginPrompt:=false;
ZC.Disconnect;
ZC.Database:=trim(EdtDatabase.Text);
//UniConnection.Protocol:=CBProtocol.Text;
ZC.ProviderName:='InterBase';
ZC.Server:=trim(EdtHostName.Text);
ZC.UserName:=trim(EdtUser.Text);
ZC.Password:=trim(EdtPassword.Text);
ZC.LoginPrompt:=false;
try
ZC.Connect;
except on E:Exception do
	begin
	MemoInfo.Lines.Add('������: '+E.Message);
	MemoInfo.Lines.Add('������ ��� ������� ���������� � ���� ������');
	if F_Pinged then MemoInfo.Lines.Add('��������, ������ � ����� ������������ � ������. ���������� � ����� ������.');
	F_Connected:=false;
	if (pos('FDB',UpperCase(edtDatabase.Text))<>0) and (pos('FIREBIRD',UpperCase(cbProtocol.Text))=0)
		then MemoInfo.Lines.Add('���������� ����� �� � ��������� �������� ������������, ��� ����� ����� ���� �������� ������ ����������. ��������� ���������� � ����� ������.');
	if (pos('FIREBIRDD',UpperCase(cbProtocol.Text))>0)
		then MemoInfo.Lines.Add('��������� ���� �������� firebirdD-2.0 ������ ��� dedicated ��������, ������������� �������� - firebird-2.0 (���� d)');
		exit;
	end;
end;
F_Connected:=true;
F_Pinged:=true;
CheckServerName;
MemoInfo.Lines.Add('----------------------------------------');
MemoInfo.Lines.Add('���������� � ����� ������ ������ �������');
MemoInfo.Lines.Add('----------------------------------------');
end;

procedure TFormConnection.BitBtnEnterClick(Sender: TObject);
begin
//if ZC.Connected=false then
if ZC.Connected=false then
	begin
		MemoInfo.Lines.Add('��� ����������� � ���� ������');
		exit;
	end;
end;

procedure TFormConnection.FormCreate(Sender: TObject);

begin
Left:=(Screen.Width-Width) div 2;
Top:=(Screen.Height-Height) div 2;
F_ParametersCorrect:=0;
F_Chipered:=0;
LoadRegister;
F_Connected:=false;
F_Pinged:=false;
CheckServerName;
if (EdtHostName.Text='') and (EdtDatabase.Text='') then  BitBtnConnect.Enabled:=false;
end;

procedure TFormConnection.LoadRegister;
var
S:string;
K:integer;
openResult:boolean;
KAccess:LongWord;
Res:boolean;
ReadBranch:boolean;
//reg : TRegistry;
begin
Res:=true;
//������� ������ ������ ����� ���� �� ���

if RegisterRecordExists('SOFTWARE\PterikSoft') and ReadOnlyBranch(RegisterBranchMetallica, KAccess) then
	begin
	try
	//F_ParametersCorrect=0 ���� ������ �������� =1 ���� ������ ������ � ����������� �� ������ ����������
	Res:=Res and ReadRegisterDWORD(K,RegisterBranchMetallica,'SETPARAM');
	F_ParametersCorrect:=K;
	Res:=Res and ReadRegisterStr(S,RegisterBranchMetallica,'HOSTNAME');
	EdtHostName.Text:=S;
	Res:=Res and ReadRegisterStr(S,RegisterBranchMetallica,'DATABASE');
	EdtDatabase.Text:=S;
	Res:=Res and ReadRegisterStr(S,RegisterBranchMetallica,'PROTOCOL');
	CBProtocol.Text:=S;
	//0 ���� ������ �� ���������, >0 ���� ��������� � ����������� �� ���� ����������
	Res:=Res and ReadRegisterDWORD(K,RegisterBranchMetallica,'CHIPERED');
	F_Chipered:=K;
	{ TODO : �������� ������������� (������) ������ �� XOR }
	Res:=Res and ReadRegisterStr(S,RegisterBranchMetallica,'USERNAME');
	EdtUser.Text:=S;
	Res:=Res and ReadRegisterStr(S,RegisterBranchMetallica,'PASSWORD');
	EdtPassword.Text:=S;
	except on E:Exception do
		F_ParametersCorrect:=-1;
	end;
end
else
	begin
	F_ParametersCorrect:=-1;
	EdtHostName.Text:='';
	EdtDatabase.Text:='';
	CBProtocol.Text:='';
	F_Chipered:=0;
	EdtUser.Text:='';
	EdtPassword.Text:='';
	end;
if not Res then
  begin
  MemoInfo.Lines.Add('������ � ����������� �� ������� ��������� �� ������� Windows');
  exit;
  end;

if F_ParametersCorrect>0 then MemoInfo.Lines.Add('������ � ����������� ��������� �� ������� ');
if F_ParametersCorrect=0 then MemoInfo.Lines.Add('���������� � ���� ������ ������. ������� ���������� ������������ �� � ������� "����������"');
if F_ParametersCorrect=-1 then MemoInfo.Lines.Add('������� ������������ �� � ������� "����������". ����� ��������� ���������� ������� "���������", ��������� ����� �������� � ������');
end;

procedure TFormConnection.BitBtnCloseClick(Sender: TObject);
begin
if F_ParametersCorrect>0 then
	if MessageDlg('����� ������ �� ���������. ��������� ������ ���������?',mtConfirmation,[mbYes,mbNo],0)=mrNo then exit;
end;

procedure TFormConnection.BitBtnSaveClick(Sender: TObject);
var 
Res:boolean;
reg : TRegistry;
openResult:boolean;
F_IsServer:integer;
begin
if (EdtHostName.Text='') and (EdtDatabase.Text='') then
	begin
	MessageDlg('�� ������� ��� ����� � �������� ���� ������, ������ "����������" ������ �������� ����� �� �� �������',mtInformation,[mbOK],0);
	exit;
	end;
F_ParametersCorrect:=ParameterVersion;
if not F_Connected or not F_Pinged then
	begin
	F_ParametersCorrect:=0;
	if MessageDlg('�� �� ������ ������ "����������", ��������� ����������� ����� ���� �������. ����������?',mtConfirmation,[mbYes,mbNo],0)=mrNo then exit;
	end;
//��������� ���������� �� ����� � �������, ���� � �� ����������
//��� ������ �������� ����� �� ��������� � ���������������.
reg := TRegistry.Create(KEY_WRITE);
reg.RootKey := HKEY_CURRENT_USER;
if (not reg.KeyExists('SOFTWARE\PterikSoft')) then
	begin
	reg.Access := KEY_WRITE;
	openResult := reg.OpenKey('SOFTWARE\PterikSoft\Metallica',True);
	if not openResult then
  	  begin
      MessageDlg('������ ��� ������ � �������� SOFTWARE\PterikSoft\Metallica. ���������� � ������������ ��������� .',mtError, mbOKCancel, 0);
      Exit();
    end;
  end;

//Res:=true;
try
//reg.WriteString('HOSTNAME', Uppercase(trim(EdtHostName.Text)));
//if F_IsServer then reg.WriteString('ISSERVER', '1') else reg.WriteString('ISSERVER', '0');
//reg.WriteString('DATABASE', Uppercase(trim(EdtDatabase.Text)));
//reg.WriteString('PROTOCOL', CBProtocol.Text);
//reg.WriteInteger('CHIPERED', 0);
//reg.WriteString('USERNAME', Uppercase(trim(EdtUser.Text)));
//reg.WriteString('PASSWORD', trim(EdtPassword.Text));
//reg.WriteInteger('SETPARAM', F_ParametersCorrect);
Res:=WriteRegisterStr(EdtHostName.Text,RegisterBranchMetallica,'HOSTNAME');
Res:=Res and WriteRegisterDWORD(F_IsServer,RegisterBranchMetallica,'ISSERVER');
Res:=Res and WriteRegisterStr(EdtDatabase.Text,RegisterBranchMetallica,'DATABASE');
Res:=Res and WriteRegisterStr(CBProtocol.Text,RegisterBranchMetallica,'PROTOCOL');
// 0 ���� ������ �� ���������, >0 ���� ��������� � ����������� �� ���� ����������
{ TODO : �������� ���������� ������ �� XOR, ���������� ���� ������ �� ������}
Res:=Res and WriteRegisterDWORD(0,RegisterBranchMetallica,'CHIPERED');
Res:=Res and WriteRegisterStr(EdtUser.Text,RegisterBranchMetallica,'USERNAME');
Res:=Res and WriteRegisterStr(EdtPassword.Text,RegisterBranchMetallica,'PASSWORD');
// 0 ���� ������ ��������, >0 ���� ������ � ����������� �� ������ ����������
// ��� ������ ���������� ����������� � ���������������
Res:=Res and WriteRegisterDWORD(F_ParametersCorrect,RegisterBranchMetallica,'SETPARAM');
except
on E:Exception do
	begin
	MessageDlg('������: ������������ ���� ��� �������� ������� � ������ ��� ���� ������ ���������. �� ������������� ���������� � ������������ ��� ������� F1.',mtError,[mbOK],0);
	WriteRegisterDWORD(0,RegisterBranchMetallica,'SETPARAM');
	end
end;
if F_ParametersCorrect=0
	then MemoInfo.Lines.Add('��������� �������� � ������ � �������� ��� ��������')
	else MemoInfo.Lines.Add('��������� �������� � ������');
reg.CloseKey();
reg.Free;
end;

procedure TFormConnection.BitBtnPingClick(Sender: TObject);
begin
IdIcmpClient.Host:=EdtHostName.Text;
try
IdIcmpClient.Ping('Hello',0);
except on E:Exception do
  begin
  MemoInfo.Lines.Add('��� ���������� '+edtHostName.Text+' �� ��������, �������� �������� ����');
  F_Pinged:=false;
  end;
end;
CheckServerName;
end;

procedure TFormConnection.IdIcmpClientReply(ASender: TComponent;
  const AReplyStatus: TReplyStatus);
begin
case AReplyStatus.ReplyStatusType of
  rsEcho:
    begin
    F_Pinged:=true;
    MemoInfo.Lines.Add('��������� '+edtHostName.Text+' �������, ����� � ��� ����');
    end;
  rsError:
    begin
    F_Pinged:=false;
    MemoInfo.Lines.Add('������ rsError ��� ������ ping');
    end;
  rsTimeOut:
    begin
    F_Pinged:=false;
    MemoInfo.Lines.Add('�������� '+edtHostName.Text+' �� ������� � ������� 1000 ��, �������� ����');
    end;
  rsErrorUnreachable:
    begin
    F_Pinged:=false;
    MemoInfo.Lines.Add('������ rsErrorUnreachable ��� ������ ping');
    end;
  rsErrorTTLExceeded:
    begin
    F_Pinged:=false;
    MemoInfo.Lines.Add('������ rsErrorTTLExceeded ��� ������ ping');
    end;
end;
end;

procedure TFormConnection.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
case Key of    //
  VK_F2: BitBtnSave.Click;
end;    // case
end;

procedure TFormConnection.EdtProtocolChange(Sender: TObject);
begin
F_Connected:=false;
end;

procedure TFormConnection.edtHostNameChange(Sender: TObject);
begin
F_Pinged:=false;
if not BitBtnConnect.Enabled then BitBtnConnect.Enabled:=true;
end;

procedure TFormConnection.edtDatabaseChange(Sender: TObject);
begin
F_Connected:=False;
if not BitBtnConnect.Enabled then BitBtnConnect.Enabled:=true;
end;

procedure TFormConnection.edtUserChange(Sender: TObject);
begin
F_Connected:=False;
end;

procedure TFormConnection.edtPasswordChange(Sender: TObject);
begin
F_Connected:=False;
end;

procedure TFormConnection.ButtonSetDBClick(Sender: TObject);
begin
if not( (UpperCase(edtHostName.Text)='LOCALHOST') or (pos('127.',UpperCase(edtHostName.Text))<>0)  )
then MessageDlg('�������� ���� � ���� ������ � ���������� ���� �������� ������ �� �������.'+chr(13)+chr(10)+'������� ������ "����������" ��� �������� ���������� ����.',mtInformation,[mbOK],0);
OpenDB.InitialDir:=ExtractFilePath(EdtDatabase.Text);
if OpenDB.Execute then
	begin
  EdtDataBase.Text:=OpenDB.FileName;
	end;

end;

procedure TFormConnection.CheckBox1Click(Sender: TObject);
begin
CheckBox1.Checked:=F_IsServer;
end;

procedure TFormConnection.CheckServerName;
begin

if not IdIPWatch1.Active then IdIPWatch1.Active:=true;
//if   (UpperCase(IdIPWatch1.LocalName)=UpperCase(EdtHostName.Text))
if  (UpperCase(ReadComputerName)=UpperCase(EdtHostName.Text))
	 or(UpperCase(edtHostName.Text)='LOCALHOST')
	 or(pos('127.',UpperCase(edtHostName.Text))<>0)
	 or((UpperCase(edtHostName.Text)=IdIPWatch1.CurrentIP) and (IdIPWatch1.CurrentIP<>''))
then F_IsServer:=true else F_IsServer:=false;
CheckBox1.Checked:=F_IsServer;
end;

procedure TFormConnection.BitBtnExportClick(Sender: TObject);
begin
if FormExport=nil then Application.CreateForm(TFormExport, FormExport);
FormExport.SetPosition(Self.Left,Self.Top);
FormExport.HostName:=edtHostName.Text;
FormExport.Protocol:=CBProtocol.Text;
FormExport.Database:=edtDatabase.Text;
FormExport.UserName:=edtUser.Text;
FormExport.SetForm;
FormExport.ShowModal;
if FormExport.Operation='LOAD' then
  begin
  edtHostName.Text:=FormExport.HostName;
  CBProtocol.Text:=FormExport.Protocol;
  edtDatabase.Text:=FormExport.Database;
  edtUser.Text:=FormExport.UserName;
	F_ParametersCorrect:=0;
  CheckServerName;
  F_Pinged:=false;
  F_Connected:=false;
  end;

end;

end.
