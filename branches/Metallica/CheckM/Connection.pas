unit Connection;

interface

uses
	Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
	Dialogs, StdCtrls, Buttons, ExtCtrls, DB, ZAbstractRODataset,
	ZAbstractDataset, ZDataset, ZConnection, Mask, DBCtrlsEh, DBLookupEh,
	IdBaseComponent, IdComponent, IdRawBase, IdRawClient, IdIcmpClient,
  IdTCPConnection, IdTCPClient, IdWhois, IdIPWatch, ZAbstractConnection;

// const IniName='database.ini';
 const RegisterBranchMetallica='SOFTWARE\PterikSoft\Metallica';
       ParameterVersion=1;

type
	TFormConnection = class(TForm)
		Panel1: TPanel;
		Label1: TLabel;
		lblProtocol: TLabel;
		lblHostName: TLabel;
		edtHostName: TEdit;
		lblDatabase: TLabel;
		edtDatabase: TEdit;
		lblUserName: TLabel;
    edtUser: TEdit;
		lblPassword: TLabel;
		edtPassword: TEdit;
    QDual: TZQuery;
    ZC: TZConnection;
    BitBtnClose: TBitBtn;
    BitBtnSave: TBitBtn;
    MemoInfo: TMemo;
    IdIcmpClient: TIdIcmpClient;
    BitBtnPing: TBitBtn;
    BitBtnConnect: TBitBtn;
    CBProtocol: TComboBox;
    Label2: TLabel;
    ButtonSetDB: TButton;
    OpenDB: TOpenDialog;
    StaticText1: TStaticText;
    IdIPWatch1: TIdIPWatch;
    CheckBox1: TCheckBox;
    BitBtnExport: TBitBtn;
    Label3: TLabel;
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
		F_ParametersCorrect:integer;// хранит набор параметров
		F_Chipered:integer;         // шифрование пароля
		F_IsServer:integer;         // 1 если комп является сервером
		F_Connected:boolean;        // произошло ли соединение
		F_Pinged:boolean;           // пингуется ли имя
		procedure LoadRegister;
	public
		procedure ConnectToDatabase;
		procedure CheckServerName;
	end;

var
	FormConnection: TFormConnection;

implementation

{$R *.dfm}
uses CommonUnit, Export;

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
ConnectToDatabase;
end;

procedure TFormConnection.ConnectToDatabase;
//var FIni:TextFile;
begin
//Определение доступности компьютера по сети
IdIcmpClient.Host:=EdtHostName.Text;
try
IdIcmpClient.Ping('Hello',0);
except on E:Exception do
	begin
	MemoInfo.Lines.Add('Имя компьютера '+edtHostName.Text+' не опознано, проблемы сети');
	F_Connected:=false;
	F_Pinged:=false;
	exit;
	end;
end;
F_Pinged:=true;
ZC.Disconnect;
ZC.Database:=EdtDatabase.Text;
ZC.Protocol:=CBProtocol.Text;
ZC.HostName:=EdtHostName.Text;
ZC.User:=EdtUser.Text;
ZC.Password:=EdtPassword.Text;
ZC.LoginPrompt:=false;
try
ZC.Connect;
except on E:Exception do
	begin
	MemoInfo.Lines.Add('Ошибка: '+E.Message);
	MemoInfo.Lines.Add('ОШИБКА при попытке соединения к базе данных');
	if F_Pinged then MemoInfo.Lines.Add('Возможно, ошибка в имени пользователя и пароле. Обратитесь к файлу помощи.');
	F_Connected:=false;
	if (pos('FDB',UpperCase(edtDatabase.Text))<>0) and (pos('FIREBIRD',UpperCase(cbProtocol.Text))=0)
		then MemoInfo.Lines.Add('Расширение файла БД и выбранный протокол несовместимы, это также может быть причиной ошибки соединения. Подробная информация в файле помощи.');
	if (pos('FIREBIRDD',UpperCase(cbProtocol.Text))>0)
		then MemoInfo.Lines.Add('Выбранный Вами протокол firebirdD-2.0 ТОЛЬКО для dedicated серверов, рекомендуемый протокол - firebird-2.0 (одно d)');
		exit;
	end;
end;
F_Connected:=true;
F_Pinged:=true;
CheckServerName;
MemoInfo.Lines.Add('----------------------------------------');
MemoInfo.Lines.Add('Соединение с базой данных прошло успешно');
MemoInfo.Lines.Add('----------------------------------------');
end;

procedure TFormConnection.BitBtnEnterClick(Sender: TObject);
begin
if ZC.Connected=false then
	begin
		MemoInfo.Lines.Add('Нет подключения к базе данных');
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
var S:string;
K:integer;
KAccess:LongWord;
Res, ReadBranch:boolean;
begin
Res:=true;
//Сначала читаем только ветку есть ли она
ReadBranch:=ReadOnlyBranch(RegisterBranchMetallica, KAccess);
if not ReadBranch then
	begin
	F_ParametersCorrect:=-1;
	EdtHostName.Text:='';
	EdtDatabase.Text:='';
	CBProtocol.Text:='';
	F_Chipered:=0;
	EdtUser.Text:='';
	EdtPassword.Text:='';
	//case KAccess of
	//KEY_ALL_ACCESS					: S:='KEY_ALL_ACCESS	combination of KEY_READ, KEY_WRITE, and KEY_CREATE_LINK';
	//KEY_READ                : S:='KEY_READ	combination of KEY_QUERY_VALUE, KEY_ENUMERATE_SUB_KEYS, and KEY_NOTIFY';
	//KEY_WRITE               : S:='KEY_WRITE	combination of KEY_SET_VALUE and KEY_CREATE_SUB_KEY';
	//KEY_QUERY_VALUE         : S:='KEY_QUERY_VALUE	grants permission to query subkey data';
	//KEY_ENUMERATE_SUB_KEYS  : S:='KEY_ENUMERATE_SUB_KEYS	grants permission to enumerate subkeys.';
	//KEY_NOTIFY              : S:='KEY_NOTIFY	grants ability to receive change notifications';
	//KEY_SET_VALUE           : S:='KEY_SET_VALUE	grants permission to set subkey data.';
	//KEY_CREATE_SUB_KEY      : S:='KEY_CREATE_SUB_KEY	grants permission to create subkeys';
	//KEY_CREATE_LINK         : S:='KEY_CREATE_LINK	grants permission to create symbolic links';
	//end;
	end
else
	begin
	try
	//F_ParametersCorrect=0 если данные неверные, >0 если верные в зависимости от версии параметров
	// Все версии параметров фиксируются в техдокументации
	Res:=Res and ReadRegisterDWORD(K,RegisterBranchMetallica,'SETPARAM');
	F_ParametersCorrect:=K;
	Res:=Res and ReadRegisterStr(S,RegisterBranchMetallica,'HOSTNAME');
	EdtHostName.Text:=S;
	Res:=Res and ReadRegisterStr(S,RegisterBranchMetallica,'DATABASE');
	EdtDatabase.Text:=S;
	Res:=Res and ReadRegisterStr(S,RegisterBranchMetallica,'PROTOCOL');
	CBProtocol.Text:=S;
	//0 если пароли не шифруются, >0 если шифруются в зависимости от вида шифрования
	Res:=Res and ReadRegisterDWORD(K,RegisterBranchMetallica,'CHIPERED');
	F_Chipered:=K;
	{ TODO : Дописать расшифрование (чтение) пароля по XOR }
	Res:=Res and ReadRegisterStr(S,RegisterBranchMetallica,'USERNAME');
	EdtUser.Text:=S;
	Res:=Res and ReadRegisterStr(S,RegisterBranchMetallica,'PASSWORD');
	EdtPassword.Text:=S;
	finally
	if not Res then
		begin
		F_ParametersCorrect:=-1;
		end;
	end;
end;//else
if F_ParametersCorrect>0 then MemoInfo.Lines.Add('Данные о подключении прочитаны из реестра ');
if F_ParametersCorrect=0 then MemoInfo.Lines.Add('Информация о Базе Данных невера. Укажите правильное расположение БД и нажмите "Соединение"');
if F_ParametersCorrect=-1 then MemoInfo.Lines.Add('Укажите расположение БД и нажмите "Соединение". После успешного соединения нажмите "Сохранить", параметры будут записаны в реестр');
end;

procedure TFormConnection.BitBtnCloseClick(Sender: TObject);
begin
if F_ParametersCorrect>0 then
	if MessageDlg('Новые данные не сохранены. Завершить работу программы?',mtConfirmation,[mbYes,mbNo],0)=mrNo then exit;
end;

procedure TFormConnection.BitBtnSaveClick(Sender: TObject);
var 
Res:boolean;
begin
if (EdtHostName.Text='') and (EdtDatabase.Text='') then
	begin
	MessageDlg('Не указаны имя хоста и название базы данных, кнопка "Соединение" станет доступна когда Вы их укажете',mtInformation,[mbOK],0);
	exit;
	end;
F_ParametersCorrect:=ParameterVersion;
if not F_Connected or not F_Pinged then
	begin
	F_ParametersCorrect:=0;
	if MessageDlg('Вы не нажали кнопку "Соединение", указанное подключение может быть неверым. Продолжать?',mtConfirmation,[mbYes,mbNo],0)=mrNo then exit;
	end;
Res:=true;
try
Res:=WriteRegisterStr(EdtHostName.Text,RegisterBranchMetallica,'HOSTNAME');
Res:=Res and WriteRegisterDWORD(F_IsServer,RegisterBranchMetallica,'ISSERVER');
Res:=Res and WriteRegisterStr(EdtDatabase.Text,RegisterBranchMetallica,'DATABASE');
Res:=Res and WriteRegisterStr(CBProtocol.Text,RegisterBranchMetallica,'PROTOCOL');
// 0 если пароли не шифруются, >0 если шифруются в зависимости от вида шифрования
{ TODO : Дописать шифрование пароля по XOR, обработать если пароль не указан}
Res:=Res and WriteRegisterDWORD(0,RegisterBranchMetallica,'CHIPERED');
Res:=Res and WriteRegisterStr(EdtUser.Text,RegisterBranchMetallica,'USERNAME');
Res:=Res and WriteRegisterStr(EdtPassword.Text,RegisterBranchMetallica,'PASSWORD');
// 0 если данные неверные, >0 если верные в зависимости от версии параметров
// Все версии параметров фиксируются в техдокументации
Res:=Res and WriteRegisterDWORD(F_ParametersCorrect,RegisterBranchMetallica,'SETPARAM');
finally
if not Res then
	begin
	MessageDlg('Ошибка: Недостаточно прав для внесения записей в реестр или сбой работы программы. За разъяснениями обратитесь к документации или нажмите F1.',mtError,[mbOK],0);
	WriteRegisterDWORD(0,RegisterBranchMetallica,'SETPARAM');
	end
	else
		begin
		MemoInfo.Lines.Add('Параметры записаны в реестр');
		if F_ParametersCorrect=0 then MemoInfo.Lines.Add('и помечены как неверные');

		end;
end;
end;

procedure TFormConnection.BitBtnPingClick(Sender: TObject);
begin
IdIcmpClient.Host:=EdtHostName.Text;
try
IdIcmpClient.Ping('Hello',0);
except on E:Exception do
  begin
  MemoInfo.Lines.Add('Имя компьютера '+edtHostName.Text+' не опознано, возможны проблемы сети');
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
    MemoInfo.Lines.Add('Компьютер '+edtHostName.Text+' ответил, связь с ним есть');
    end;
  rsError:
    begin
    F_Pinged:=false;
    MemoInfo.Lines.Add('Ошибка rsError при подаче ping');
    end;
  rsTimeOut:
    begin
    F_Pinged:=false;
    MemoInfo.Lines.Add('Компьтер '+edtHostName.Text+' не ответил в течении 1000 мс, проблемы сети');
    end;
  rsErrorUnreachable:
    begin
    F_Pinged:=false;
    MemoInfo.Lines.Add('Ошибка rsErrorUnreachable при подаче ping');
    end;
  rsErrorTTLExceeded:
    begin
    F_Pinged:=false;
    MemoInfo.Lines.Add('Ошибка rsErrorTTLExceeded при подаче ping');
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
then MessageDlg('Указание пути к базе данных в диалоговом окне работает только на сервере.'+chr(13)+chr(10)+'Нажмите кнопку "Соединение" для проверки введенного пути.',mtInformation,[mbOK],0);
OpenDB.InitialDir:=ExtractFilePath(EdtDatabase.Text);
if OpenDB.Execute then
	begin
  EdtDataBase.Text:=OpenDB.FileName;
	end;

end;

procedure TFormConnection.CheckBox1Click(Sender: TObject);
begin
CheckBox1.Checked:=(F_IsServer=1);
end;

procedure TFormConnection.CheckServerName;
begin

if not IdIPWatch1.Active then IdIPWatch1.Active:=true;
//if   (UpperCase(IdIPWatch1.LocalName)=UpperCase(EdtHostName.Text))
if  (UpperCase(ReadComputerName)=UpperCase(EdtHostName.Text))
	 or(UpperCase(edtHostName.Text)='LOCALHOST')
	 or(pos('127.',UpperCase(edtHostName.Text))<>0)
	 or((UpperCase(edtHostName.Text)=IdIPWatch1.CurrentIP) and (IdIPWatch1.CurrentIP<>''))
then F_IsServer:=1 else F_IsServer:=0;
CheckBox1.Checked:=(F_IsServer=1);
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
