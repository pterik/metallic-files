unit MainForm;

interface

uses
  Windows, SysUtils, Classes, Graphics, Forms, Controls, Menus, StdCtrls, 
  Dialogs, Buttons, Messages, ExtCtrls, ComCtrls, DB, ZAbstractRODataset, ZDataset, 
  Grids, DBGridEh, ZAbstractDataset, ZConnection, AppEvnts, DataModule, 
  MdiChild, ShowTree, ShowCompany, ToolWin, ImgList, StdActns, ActnList,
  System.ImageList, System.Actions, ZAbstractConnection, sTreeView, sCheckBox, sButton,
  sBitBtn, sComboBox, sLabel, sPanel, DBAccess, Uni, UniDacVcl, UniProvider,
  InterBaseUniProvider, MemDS ;

type
  TFormMain = class(TForm)
    ApplicationEvents1: TApplicationEvents;
    mmMain: TMainMenu;
    mmWindow: TMenuItem;
    N4: TMenuItem;
    ile1: TMenuItem;
    N5: TMenuItem;
    ActionList1: TActionList;
    FileNew1: TAction;
    FileOpen1: TAction;
    FileClose1: TWindowClose;
    FileSave1: TAction;
    FileSaveAs1: TAction;
    FileExit1: TAction;
    EditCut1: TEditCut;
    EditCopy1: TEditCopy;
    EditPaste1: TEditPaste;
    WindowCascade1: TWindowCascade;
    WindowTileHorizontal1: TWindowTileHorizontal;
    WindowTileVertical1: TWindowTileVertical;
    WindowMinimizeAll1: TWindowMinimizeAll;
    WindowArrangeAll1: TWindowArrange;
    HelpAbout1: TAction;
    ImageList1: TImageList;
    ZC: TUniConnection;
    InterBaseUniProvider1: TInterBaseUniProvider;
    QViewUsers: TUniQuery;
    QViewUsersU_LOGIN: TStringField;
    QViewUsersU_FIO: TStringField;
    QViewUsersU_COMMENT: TStringField;
    QViewUsersU_ID: TIntegerField;
    QViewUsersU_ISCLOSED: TSmallintField;
    QViewUsersU_ISBOSS: TIntegerField;
    QViewUsersU_EDIT_PRICES: TSmallintField;
    N1: TMenuItem;
    N7: TMenuItem;
    N2: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure ApplicationEvents1Exception(Sender: TObject; E: Exception);
    procedure mmiNewRowClick(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure ile1Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
  private
    //F_AppPassword : string;
    F_AppUser, F_AppUserFullName, F_APPLastUser:string;
		//F_HostName, F_Database, F_DBUser, F_DBPassword, F_ProviderName:string;
//    F_EnteredLogin: string;
//    F_EntereduserFullName: string;
//    F_EnteredUSerID: Integer;
    FMainWindowClientCoordinates: TRect;
    procedure SetMainWindowClientCoordinates(const Value: TRect);
  public
    AppUSerID: Integer;
    ConfirmClose: Boolean;
    CityCode: string;
    SearchChars: Integer;
    property MainWindowClientCoordinates: TRect
      read FMainWindowClientCoordinates write SetMainWindowClientCoordinates;
    procedure SetMainForm(const L_ID: Integer; L_Login, L_UserFullName: string);
//    function ReadEnteredUserID: Integer;
//    function ReadEnteredLogin: string;
//    function ReadEnteredUserFullName: string;
    function ConnectToDatabase:boolean;
  end;

var
  FormMain: TFormMain;

implementation

{$R *.DFM}

uses
  About, CommonUnit, Variants, System.UITypes, System.INIFiles;

procedure TFormMain.FormCreate(Sender: TObject);
begin
	NullStrictConvert := false;
  ConfirmClose:= True;
  Left := (Screen.Width - Width) div 2;
  Top := (Screen.Height - Height) div 2;
  ConfirmClose := True;
  BorderIcons:=[biSystemMenu,biMinimize,biMaximize];
  ConfirmClose:= True;
	if DM=nil then Application.CreateForm(TDM, DM);
end;

procedure TFormMain.SetMainForm(const L_ID: Integer; L_Login, L_UserFullname: string);
var
  S: string;
begin
  AppUserID:= L_ID;
  F_AppUser:= L_Login;
  F_AppUserFullName:= L_UserFullName;
  try
    QViewUsers.Close;
    QViewUsers.ParamByName('U_ID').AsInteger:= L_ID;
    QViewUsers.Open;
    FormMain.Caption:= 'Просмотр прайсов, сотрудник ' + QViewUsers['U_FIO'];
  except on E: Exception do
  begin
    MessageDlg(DM.GetErrorByCode(1013), mtError, [mbOK], 0);
  end;
  end;
  try
    CityCode:= DM.ReadSettings('CITY_CODE', '44');
  except on E: Exception do
      CityCode:= '44';
  end;
  S:= DM.ReadSettings('DIGITS_WHILE_SEARCH', '4');
  try
    SearchChars:= StrToInt(S);
  except on E: EConvertError do
      SearchChars:= 4;
  end;
end;

procedure TFormMain.ApplicationEvents1Exception(Sender: TObject;
  E: Exception);
begin
  MessageDlg('Возникла ошибка программы: ' + Chr(10) + Chr(13) + E.message + Chr(10) +
    Chr(13) +
    'Пожалуйста закройте программу и свяжитесь с разработчиком (кнопка "О программе")',
    mtError, [mbOK], 0);
end;


procedure TFormMain.mmiNewRowClick(Sender: TObject);
var
  CompanyShow: TFormCompaniesShow;
begin
  CompanyShow:= TFormCompaniesShow.Create(Application);
  CompanyShow.SetCompany(-1);
  CompanyShow.Caption:= 'Все поставщики';
end;

procedure TFormMain.N4Click(Sender: TObject);
begin
  Cascade;
end;

procedure TFormMain.ile1Click(Sender: TObject);
begin
  Tile;
end;

procedure TFormMain.N5Click(Sender: TObject);
var
  I: Integer;
begin
  for I:= MdiChildCount - 1 downto 0 do
    MDIChildren[I].Close;
end;

procedure TFormMain.N7Click(Sender: TObject);
var
  CompanyShow: TFormCompaniesShow;
begin
  if not ConnectToDatabase then halt(1);
  SetMainForm(AppUserID, F_AppUser, F_AppUserFullname);
  CompanyShow:= TFormCompaniesShow.Create(Application);
  CompanyShow.SetCompany(-1);
  CompanyShow.Caption:= 'Все поставщики';
end;

//procedure TFormMain.AddToolBttn(Caption:string);
//var  I, Width: Integer;
//begin
//inc(ToolBtnCount);
//if ToolBtnCount>MaxToolBtnCntr then exit;
//ToolBtnArray[ToolBtnCount]:=TButton.Create(Application);
//ToolBtnArray[ToolBtnCount].Caption:=Caption;
//Width:=ToolBar1.Width div ToolBtnCount;
//if Width>150 then Width:=150;
//for I := 1 to ToolBtnCount do ToolBtnArray[i].Width:=Width;
//ToolBtnArray[ToolBtnCount].Parent := ToolBar1;
//ToolBtnArray[ToolBtnCount].Visible:=true;
//end;

procedure TFormMain.SetMainWindowClientCoordinates(const Value: TRect);
begin
  FMainWindowClientCoordinates:= Value;
end;

procedure TFormMain.N1Click(Sender: TObject);
var
  TreeShow: TFormTree;
begin
  if not ConnectToDatabase then halt(1);
  SetMainForm(AppUserID, F_AppUser, F_AppUserFullname);
  TreeShow:= TFormTree.Create(Application);
  TreeShow.Caption:= 'Все рубрики';
  TreeShow.SetTree;

end;

procedure TFormMain.N2Click(Sender: TObject);
begin
  Close;
end;

function TFormMain.ConnectToDatabase:boolean;
var Ini: TIniFile;
begin
if FileExists(ExtractFilePath(ParamStr(0))+'\database.ini') then
  begin
  Ini := TIniFile.Create(ExtractFilePath(ParamStr(0))+'\database.ini');
	ZC.Server:=Ini.ReadString( 'dbConnection', 'HOSTNAME', 'localhost' );
	ZC.Database:=Ini.ReadString( 'dbConnection','DATABASE', 'c:\Program Files (x86)\Metallica\DATABASE.FDB');
	ZC.UserName:=Ini.ReadString( 'dbConnection','USERNAME', 'SYSDBA');
 	ZC.ProviderName:=Ini.ReadString( 'dbConnection','PROTOCOL', 'interbase');
	ZC.Password:=Ini.ReadString( 'dbConnection','PASSWORD','masterkey');
	ZC.LoginPrompt:=false;
  F_AppLastUser:='BOSS';
  Result:=true;
  end
  else
	begin
  //ValidSettings:=false;
  Result:=false;
  exit;
	end;
try
ZC.Connect;
except on E:Exception do
	begin
  MessageDlg('Неожиданная ошибка при подключении к базе данных. Программа аварийно остановлена, обратитесь к разработчику.', mtError, [mbOK],0);
  Result:=false;
  exit;
  end;
end;
F_AppUser:='BOSS';
AppUSerID:=1;
end;

end.
