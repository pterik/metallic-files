unit EnterUser;

interface

uses
  	Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  	Dialogs, StdCtrls, Buttons, ExtCtrls, DB, ZAbstractRODataset, 	ZAbstractDataset, 
  ZDataset, ZConnection, Mask, DBCtrlsEh, DBLookupEh, DBGridEh, MemDS, DBAccess, Uni,
  sEdit, sBitBtn, sLabel, sSkinProvider, sSkinManager, sMemo, sMaskEdit,
  sCustomComboEdit, sComboBox, DASQLMonitor, UniSQLMonitor, UniProvider,
  InterBaseUniProvider, Vcl.DBCtrls, sDBComboBox, acDBComboBoxEx,
  sDBLookupComboBox, acDBComboEdit;

type
	TFormEnterUser = class(TForm)
		Label3: TsLabel;
		BitBtnEnter: TsBitBtn;
    EPWD: TsEdit;
    Label2: TsLabel;
    Label4: TsLabel;
    QUsers: TUniQuery;
    DSUsers: TUniDataSource;
    sSkinManager1: TsSkinManager;
    sSkinProvider1: TsSkinProvider;
    BitBtnCancel: TsBitBtn;
    ZCEnter: TUniConnection;
    InterBaseUniProvider1: TInterBaseUniProvider;
    UniSQLMonitor1: TUniSQLMonitor;
    QUsersU_ID: TIntegerField;
    QUsersU_LOGIN: TStringField;
    QUsersU_PASSWORD: TStringField;
    QUsersU_ISBOSS: TIntegerField;
    QUsersU_FIO: TStringField;
    QUsersU_COMMENT: TStringField;
    QUsersU_EDIT_OWN_JOBS: TSmallintField;
    QUsersU_EDIT_PRICES: TSmallintField;
    QUsersU_ISCLOSED: TSmallintField;
    EFIO: TsEdit;
    sComboBox: TsComboBox;
    Memo1: TMemo;
		procedure BitBtnCancelClick(Sender: TObject);
		procedure BitBtnEnterClick(Sender: TObject);
		procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sComboBoxChange(Sender: TObject);
	private
    F_HostName, F_Database, F_DBUser, F_DBPassword, F_ProviderName, F_AppLastUser:string;
    F_AppPassword, F_AppUser:string;
		function LoadByRegister:boolean;
    function LoadByIniFile: boolean;
	public
    ErrorConnectionMessage:string;
		function ConnectToDatabase:boolean;
	end;

var
	FormEnterUser: TFormEnterUser;

implementation

uses System.UITypes, System.Win.Registry, System.INIFiles, DataModule, MainForm, CommonUnit;

{$R *.dfm}

function TFormEnterUser.ConnectToDatabase:boolean;
begin
if not LoadByRegister then
	begin
  //ValidSettings:=false;
  Result:=false;
  exit;
	end;
ZCEnter.Database:=F_Database;
ZCEnter.ProviderName:=F_ProviderName;
ZCEnter.Server:=F_HostName;
ZCEnter.UserName:=F_DBUser;
ZCEnter.Password:=F_DBPassword;
ZCEnter.LoginPrompt:=false;
try
ZCEnter.Connect;
except on E:Exception do
	begin
  Result:=false;
  exit;
  end;
end;
if ZCEnter.Connected then FormMain.SetDBCredentials(F_HostName,F_ProviderName, F_Database, F_DBUser,F_DBPassword);
QUsers.Close;
QUsers.ParamByName('U_LOGIN').Asstring:=F_AppLastUser;
QUsers.Open;
sComboBox.Text:=QUsers['U_LOGIN'];
EFIO.Text:=QUsers['U_FIO'];
if VarIsNull(QUsers['U_PASSWORD']) then F_AppPassword:='' else F_AppPassword:=AnsiUpperCase(trim(QUsers['U_PASSWORD']));
while not qUsers.EOF do
  begin
    sComboBox.Items.Add(QUsers['U_LOGIN']);
    qUsers.next;
  end;
Result:=true;
end;

procedure TFormEnterUser.BitBtnCancelClick(Sender: TObject);
begin
ZCEnter.Connected:=false;
//if not (FormMain=nil) then
//  begin
//  FormMain.ConfirmClose:=false;
  //FormMain.Close;
//  end;
//Close;
end;

procedure TFormEnterUser.BitBtnEnterClick(Sender: TObject);
begin
Memo1.Lines.Add(AnsiUpperCase(trim(EPWD.Text)));
Memo1.Lines.Add(AnsiUpperCase(F_AppPassword));
if not (AnsiUpperCase(trim(EPWD.Text))=AnsiUpperCase(F_AppPassword)) then
    begin
    MessageDlg('Введен неверный пароль',mtWarning,[mbOK],0);
    EPWD.Clear;
    FocusControl(EPwd);
    exit;
    end;
//FormMain.SetMainForm(QUsers['U_ID'],QUsers['U_LOGIN'],QUsers['U_FIO'],QUsers['U_ISBOSS']);
//FormMain.Visible:=true;
end;

procedure TFormEnterUser.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if ZCEnter.Connected then ZCEnter.Close;
end;

procedure TFormEnterUser.FormCreate(Sender: TObject);
begin
Left:=(Screen.Width-Width) div 2;
Top:=(Screen.Height-Height) div 2;
end;


function TFormEnterUser.LoadByIniFile:boolean;
var Ini: TIniFile;
begin
if FileExists(ExtractFilePath(ParamStr(0))+'\database.ini') then
  begin
  Ini := TIniFile.Create(ExtractFilePath(ParamStr(0))+'\database.ini');
	F_HostName:=Ini.ReadString( 'Connect Parameters', 'HOSTNAME', 'localhost' );
	F_Database:=Ini.ReadString( 'Connect Parameters','DATABASE', 'c:\Projects\Metallica\Database\DATABASE.FDB');
	F_DBUser:=Ini.ReadString( 'Connect Parameters','USERNAME', 'SYSDBA');
 	F_ProviderName:=Ini.ReadString( 'Connect Parameters','PROTOCOL', 'interbase');
	F_DBPassword:=Ini.ReadString( 'Connect Parameters','PASSWORD','masterkey');
  F_AppLastUser:='BOSS';
  Result:=true;
  end
else Result:=false;
end;

function TFormEnterUser.LoadByRegister:boolean;
begin
Result:=true;
begin
	try
	//Result:=Result and ReadRegisterDWORD(F_ParametersCorrect,RegisterBranchMetallica,'SETPARAM');
	Result:=Result and ReadRegisterStr(F_HostName,RegisterBranchMetallica,'HOSTNAME');
	Result:=Result and ReadRegisterStr(F_Database,RegisterBranchMetallica,'DATABASE');
	Result:=Result and ReadRegisterStr(F_ProviderName,RegisterBranchMetallica,'PROTOCOL');
	//0 если пароли не шифруются, >0 если шифруются в зависимости от вида шифрования
	//Result:=Result and ReadRegisterDWORD(K,RegisterBranchMetallica,'CHIPERED');
//F_Chipered:=K;
	{ TODO : Дописать расшифрование (чтение) пароля по XOR }
	Result:=Result and ReadRegisterStr(F_DBUser,RegisterBranchMetallica,'USERNAME');
	Result:=Result and ReadRegisterStr(F_DBPassword,RegisterBranchMetallica,'PASSWORD');
  ReadRegisterStr(F_AppLastUser,RegisterBranchMetallica,'LASTDBUSER');
	except on E:Exception do
    begin
    Result:=false;
    end;
	end;
end;
end;

procedure TFormEnterUser.sComboBoxChange(Sender: TObject);
begin
Memo1.Lines.Add('User='+sComboBox.Text);
QUsers.Close;
QUsers.ParamByName('U_LOGIN').Asstring:=sComboBox.Text;
QUsers.Open;
if VarIsNull(QUsers['U_FIO']) then EFIO.Text:='' else EFIO.Text:=QUsers['U_FIO'];
if VarIsNull(QUsers['U_PASSWORD']) then F_AppPassword:='' else F_AppPassword:=AnsiUpperCase(trim(QUsers['U_PASSWORD']));
end;

end.
