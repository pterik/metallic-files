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
    mmiNewTree: TMenuItem;
    mmiNewRow: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    ile1: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N8: TMenuItem;
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
    procedure mmiNewTreeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ApplicationEvents1Exception(Sender: TObject; E: Exception);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure mmiNewRowClick(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure ile1Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    F_EnteredLogin: string;
    F_EntereduserFullName: string;
    F_EnteredUSerID: Integer;
    FMainWindowClientCoordinates: TRect;
    procedure SetMainWindowClientCoordinates(const Value: TRect);
  public
    ConfirmClose: Boolean;
    CityCode: string;
    SearchChars: Integer;
    property MainWindowClientCoordinates: TRect
      read FMainWindowClientCoordinates write SetMainWindowClientCoordinates;
    procedure SetMainForm(const U_ID: Integer; Login, UserFullName: string);
    function ReadEnteredUserID: Integer;
    function ReadEnteredLogin: string;
    function ReadEnteredUserFullName: string;
  end;

var
  FormMain: TFormMain;

implementation

{$R *.DFM}

uses
  About, CommonUnit, Variants, system.UITypes;

procedure TFormMain.FormCreate(Sender: TObject);
begin
  ConfirmClose:= True;
end;

function TFormMain.ReadEnteredUserID: Integer;
begin
  Result:= F_EnteredUserID;
end;

procedure TFormMain.SetMainForm(const U_ID: Integer; Login, UserFullname: string);
var
  S: string;
begin
  F_EnteredUserID:= U_ID;
  F_EnteredLogin:= Login;
  F_EnteredUserFullName:= UserFullName;
  try
    QViewUsers.Close;
    QViewUsers.ParamByName('U_ID').AsInteger:= U_ID;
    QViewUsers.Open;
    FormMain.Caption:= '�������� �������, ��������� ' + QViewUsers['U_FIO'];
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
  mmiNewTree.Click;
end;

procedure TFormMain.ApplicationEvents1Exception(Sender: TObject;
  E: Exception);
begin
  MessageDlg('�������� ������ ���������: ' + Chr(10) + Chr(13) + E.message + Chr(10) +
    Chr(13) +
    '���������� �������� ��������� � ��������� � ������������� (������ "� ���������")',
    mtError, [mbOK], 0);
end;

function TFormMain.ReadEnteredLogin: string;
begin
  Result:= F_EnteredLogin;
end;

function TFormMain.ReadEnteredUserFullName: string;
begin
  Result:= F_EnteredUserFullName;
end;

procedure TFormMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if qViewUsers.Active then qViewUsers.Close;

if ZC.Connected then ZC.Close;
end;

procedure TFormMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if ConfirmClose then
    if MessageDlg('������� ���������?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
      CanClose:= False
    else WriteRegisterStr(F_EnteredLogin, RegisterBranchMetallica, 'LASTDBUSER');
end;

procedure TFormMain.FormDestroy(Sender: TObject);
var
  I: Integer;
begin
  for I:= 0 to ZC.ComponentCount - 1 do
  begin
    ZC.Components[I].Free;
  end; 
if FormMain.ZC.Connected then FormMain.ZC.Disconnect;
end;

procedure TFormMain.mmiNewTreeClick(Sender: TObject);
var
  TreeShow: TFormTree;
begin
  TreeShow:= TFormTree.Create(Application);
  TreeShow.Caption:= '��� �������';
  TreeShow.SetTree;
end;

procedure TFormMain.mmiNewRowClick(Sender: TObject);
var
  CompanyShow: TFormCompaniesShow;
begin
  CompanyShow:= TFormCompaniesShow.Create(Application);
  CompanyShow.SetCompany(-1);
  CompanyShow.Caption:= '��� ����������';
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

procedure TFormMain.N8Click(Sender: TObject);
begin
  Close;
end;

procedure TFormMain.N7Click(Sender: TObject);
begin
  if not DM.LoadRegister then begin
    MessageDlg('�� ���� ���������� ��������� ��� ����������� � ��', mtError, [mbOK], 0);
    Exit;
  end;
  ZC.Database:= DM.F_Database;
  ZC.ProviderName:= DM.F_Protocol;
  ZC.Server:= DM.F_HostName;
  ZC.UserName:= DM.F_User;
  ZC.Password:= DM.F_Password;
  ZC.LoginPrompt:= False;
  try
    FormMain.ZC.Connect;
  except on E: Exception do begin
      MessageDlg('�������� ������. ��������� ������� - ����������� ����.' + Chr(10) +
        Chr(13)
        + E.message, mtError, [mbOK], 0);
      Exit;
    end;
  end;
  MessageDlg('����������� ��������� �������', mtConfirmation, [mbOK], 0);
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

procedure TFormMain.N3Click(Sender: TObject);
begin
  Application.CreateForm(TFormAbout, FormAbout);
  FormAbout.SetPosition(Self.Left, Self.Top);
  FormAbout.SetAbout;
  FormAbout.Show;
end;

end.
