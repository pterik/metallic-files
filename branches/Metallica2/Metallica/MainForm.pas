unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, DB, ComCtrls, ExtCtrls,
  AppEvnts, Mask, DBCtrlsEh, DBGridEh, DBLookupEh, ADODB, DataModule, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh,
  DBAccess, Uni, sBitBtn, sTreeView, sEdit, sLabel, MemDS, UniProvider,
  InterBaseUniProvider, sSkinProvider, sSkinManager, DASQLMonitor, UniSQLMonitor;

type
  TFormMain = class(TForm)
    BitBtnClose: TsBitBtn;
    BitBtnAbout: TsBitBtn;
    BitBtnCompanies: TsBitBtn;
    BitBtnUsers: TsBitBtn;
    EditMyName: TsEdit;
    BitBtnForBoss: TsBitBtn;
    Tree: TsTreeView;
    Grid: TDBGridEh;
    BitBtnNewPrice: TsBitBtn;
    edtCompany: TsEdit;
    edtBusiness: TsEdit;
    ZC: TUniConnection;
    QViewUsers: TUniQuery;
    qData: TUniQuery;
    DSData: TUniDataSource;
    QViewUsersU_LOGIN: TStringField;
    QViewUsersU_FIO: TStringField;
    QViewUsersU_COMMENT: TStringField;
    QViewUsersU_ID: TIntegerField;
    QViewUsersU_ISCLOSED: TSmallintField;
    QViewUsersU_ISBOSS: TIntegerField;
    QViewUsersU_EDIT_PRICES: TSmallintField;
    QViewUsersU_FIO_PLUS_BOSS: TStringField;
    qDataPL_ID: TIntegerField;
    qDataPL_HEADERID: TIntegerField;
    qDataPL_TREEID: TIntegerField;
    qDataPL_PRICE: TFloatField;
    qDataPL_PARENT: TStringField;
    qDataPT_VALUE: TStringField;
    qDataCM_NAME: TStringField;
    qDataCM_ID: TIntegerField;
    qDataCM_CITY: TStringField;
    qDataCM_BUSINESS: TStringField;
    qDataPL_VALUE1: TStringField;
    qDataPL_VALUE2: TStringField;
    qDataPL_VALUE3: TStringField;
    qDataPL_VALUE4: TStringField;
    qDataPL_VALUE5: TStringField;
    qDataPL_VALUE6: TStringField;
    qDataPL_VALUE7: TStringField;
    qDataPL_VALUE8: TStringField;
    qDataPL_VALUE9: TStringField;
    qDataPL_ORDERBY: TIntegerField;
    qDataPL_DATE_UPDATE: TDateTimeField;
    qDataTL_COLOR: TIntegerField;
    qDataPL_ISCLOSED: TSmallintField;
    InterBaseUniProvider1: TInterBaseUniProvider;
    sLabel1: TsLabel;
    sLabel2: TsLabel;
    sLabel3: TsLabel;
    UniSQLMonitor1: TUniSQLMonitor;
    sSkinProvider1: TsSkinProvider;
    sSkinManager1: TsSkinManager;
    qUsers: TUniQuery;
    sBitBtn1: TsBitBtn;
    UniTransaction1: TUniTransaction;
    procedure BitBtnAboutClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BitBtnUsersClick(Sender: TObject);
    procedure ApplicationEvents1Exception(Sender: TObject; E: Exception);
    procedure BitBtnCompaniesClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtnForBossClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure TreeChange(Sender: TObject; Node: TTreeNode);
    procedure TreeExpanding(Sender: TObject; Node: TTreeNode;
      var AllowExpansion: Boolean);
    procedure GridCellClick(Column: TColumnEh);
    procedure GridDblClick(Sender: TObject);
    procedure GridEnter(Sender: TObject);
    procedure BitBtnNewPriceClick(Sender: TObject);
    procedure GridTitleClick(Column: TColumnEh);
    procedure GridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure edtCompanyExit(Sender: TObject);
    procedure edtBusinessExit(Sender: TObject);
    procedure QViewUsersCalcFields(DataSet: TDataSet);
    procedure BitBtnCloseClick(Sender: TObject);
    procedure sBitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    F_Ctrl: Boolean;
    //F_AppPassword : string;
    F_AppUser, F_AppUserFullName, F_APPLastUser:string;
		//F_HostName, F_Database, F_DBUser, F_DBPassword, F_ProviderName:string;
	  F_EditPrices: Integer;
    F_FieldName1, F_FieldName2: string;
    F_LastSorted: string;
    procedure RefreshPrices;
    function ConnectToDatabase: boolean;
  public
    AppUserIsBoss: Boolean;
    AppUSerID: Integer;
    MyNode: TNodeValue;
    SelectedCompanyID: Integer;
    SelectedPriceHeaderID: Integer;
    SelectedCompanyName: string;
    ConfirmClose: Boolean;
    CityCode: string;
    SearchChars: Integer;
    CommonManagerID, CommonOwnerID: Integer;
    procedure SetMainForm(L_User_ID: Integer; const L_User_Login, L_UserFullName: string; L_Boss: boolean);
  end;

var
  FormMain: TFormMain;

implementation

{$R *.dfm}

uses
  DateUtils, About, Users, CommonUnit,
  Companies, SQL, ForBOSS, ShowCompany, ShowPrice,
  SelectCompany, NewPriceList, DbUtilsEh, System.UITypes, System.INIFiles;

procedure TFormMain.BitBtnAboutClick(Sender: TObject);
begin
  if not F_Ctrl then
  begin
    if FormAbout = nil then
      Application.CreateForm(TFormAbout, FormAbout);
    FormAbout.SetPosition(Self.Left, Self.Top);
    FormAbout.SetAbout;
    FormAbout.ShowModal;
  end
  else
  begin
    if FormSQL = nil then
      Application.CreateForm(TFormSQL, FormSQL);
    FormSQL.ShowModal;
  end;
end;

procedure TFormMain.FormCreate(Sender: TObject);
begin
{Как запускаем формы
Сначала отображаем MainForm
Затем отображаем DBErrorExit
Потом отображаем EnterUser
Делаем проверку на подключение к базе данных.
Если подключение успешное, то делаем запрашиваем ввода пароля и делаем проверку, верно ли он указан.
Если подключение неуспешное, то закрываем EnterUser и отображаем DBErrorExt
Если подключение успешное, то закрываем Enteruser и не отображаем DBErrorExt
Если пароль введен успешно, то закрываем EnterUser, не отображаем DBErrorExit и возвращаемся в MainForm
}
  if not ConnectToDatabase then halt(1);
  if DM=nil then Application.CreateForm(TDM, DM);
	NullStrictConvert := false;
  ConfirmClose:= True;
  Left := (Screen.Width - Width) div 2;
  Top := (Screen.Height - Height) div 2;
  F_Ctrl := False;
  edtCompany.Clear;
  edtBusiness.Clear;
  ConfirmClose := True;
  MyNode := TNodeValue.Create;
  BorderIcons:=[biSystemMenu,biMinimize,biMaximize];
  SetMainForm(AppUserID, F_AppUser, F_AppUserFullname, AppUserIsBoss);
//  if FormEnterUser=nil then Application.CreateForm(TFormEnterUser, FormEnterUser);
  //FormMain.Hide;
//  FormEnterUser.ShowModal;
  //FormMain.Show;
end;

procedure TFormMain.SetMainForm(L_User_ID: Integer; const L_User_Login, L_UserFullname: string; L_Boss:boolean);
var
  S: string;
begin
  F_FieldName1 := '';
  F_FieldName2 := '';
  DM.TreeFulFill(Tree, True, 0);
  AppUserIsBoss := L_Boss;
	AppUserID := L_User_ID;
  F_AppUser := L_User_Login;
  F_AppUserFullName := L_UserFullName;
  try
    QViewUsers.Close;
    QViewUsers.ParamByName('U_ID').AsInteger := L_User_ID;
    QViewUsers.Open;
    EditMyname.Text := QViewUsers['U_FIO_PLUS_BOSS'];
    F_EditPrices := QViewUsers['U_EDIT_PRICES'];
  except on E: Exception do
    begin
      MessageDlg(DM.GetErrorByCode(1013), mtError, [mbOK], 0);
      //Error 1013:MainForm:QViewUsers.Open
    end;
  end;
  if AppUserISBOSS then
  begin
    BitBtnForBoss.Enabled := True;
    BitBtnUsers.Enabled := True;
  end
  else
  begin
    BitBtnForBoss.Enabled := False;
    BitBtnUsers.Enabled := False;
  end;
  if F_EditPrices = 1 then
  begin
    BitBtnNewPrice.Enabled := True;
  end
  else
  begin
    BitBtnNewPrice.Enabled := False;
  end;
  try
    CityCode := DM.ReadSettings('CITY_CODE', '44');
  except on E: Exception do
      CityCode := '44';
  end;
  S := DM.ReadSettings('DIGITS_WHILE_SEARCH', '4');
  try
    SearchChars := StrToInt(S);
  except on E: EConvertError do
      SearchChars := 4;
  end;
  try
    CommonManagerId := StrToInt(DM.ReadSettings('COMMON_MANAGER_ID', '0'));
  except on E: Exception do
      CommonManagerID := 0;
  end;
  try
    CommonOwnerID := StrToInt(DM.ReadSettings('COMMON_OWNER_ID', '0'));
  except on E: Exception do
      CommonOwnerId := 0;
  end;
  F_LastSorted := 'ORDERBY';
  RefreshPrices;
end;

procedure TFormMain.FormDestroy(Sender: TObject);
begin
  MyNode.Destroy;
  if ZC.Connected then ZC.Close;
end;

procedure TFormMain.BitBtnUsersClick(Sender: TObject);
begin
  if FormUsers = nil then Application.CreateForm(TFormUsers, FormUsers);
  FormUsers.SetPosition(Self.Left, Self.Top);
  FormUsers.SetUsers;
  FormUsers.ShowModal;
end;

procedure TFormMain.ApplicationEvents1Exception(Sender: TObject;
  E: Exception);
begin
  MessageDlg('Возникла ошибка программы: ' + Chr(10) + Chr(13) + E.message +
    Chr(10) +
    Chr(13) +
    'Пожалуйста закройте программу и свяжитесь с разработчиком (кнопка "О программе")',
    mtError, [mbOK], 0);
end;

procedure TFormMain.BitBtnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TFormMain.BitBtnCompaniesClick(Sender: TObject);
//var Limit:integer;
begin
  { TODO : Проверка для demo - версии }
  //if IsDemoLimit  then Limit:=100  else limit:=99;
  //if IsBigDemoLimit then Limit:=1000;

  if AppUserIsBoss then
  begin
    if FormCompanies = nil then
      Application.CreateForm(TFormCompanies, FormCompanies);
    FormCompanies.SetPosition(Self.Left, Self.Top);
    FormCompanies.SetCompanies;
    FormCompanies.ShowModal;
  end
  else
  begin
    if varIsNull(qData['CM_ID']) then
    begin
      MessageDlg('Выберите строку прайса', mtWarning, [mbOK], 0);
      Exit;
    end;
    if FormCompaniesShow = nil then
      Application.CreateForm(TFormCompaniesShow, FormCompaniesShow);
    FormCompaniesShow.SetPosition(Self.Left, Self.Top);
    FormCompaniesShow.SetCompany(qData['CM_ID']);
    FormCompaniesShow.ShowModal;
  end;
  { TODO : Проверка для demo - версии }
  //if Limit=100
  //then
  //  MessageDlg('Срок действия демонстрационной программы истёк, Вы должны отказаться от её использования',mtError,[mbOk],0);
  //if Limit=1000
  //then
  //  begin
  //  MessageDlg('Срок действия демонстрационной программы истёк, Вы должны отказаться от её использования',mtError,[mbOk],0);
  //  halt(1);
  //  end;
end;

procedure TFormMain.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if not (ssCtrl in Shift) then
    F_Ctrl := False;
  case Key of //
    VK_F5: ;
    //  VK_F5: BitBtnPhone.Click;
    //  VK_F6: BitBtnCalendar.Click;
    //  VK_F9: BitBtnRefresh.Click;
  end; // case
end;

procedure TFormMain.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ssCtrl in Shift then
    F_Ctrl := True;
end;

procedure TFormMain.BitBtnForBossClick(Sender: TObject);
begin
  if not AppUserIsBoss then
  begin
    MessageDlg('У Вас нет прав для просмотра, зайдите под логином BOSSa',
      mtError, [mbOK],
      0);
    Exit;
  end;
  if FormForBoss = nil then
    Application.CreateForm(TFormForBoss, FormForBoss);
  FormForBoss.SetPosition(Self.Left, Self.Top);
  FormForBoss.ShowModal;
  DM.TreeFulFill(Tree, True, 0);
  RefreshPrices;
end;

procedure TFormMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if qViewUsers.Active then qViewUsers.Close;
if ZC.Connected then ZC.Close;
end;

procedure TFormMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if ConfirmClose then
    if MessageDlg('Закрыть программу?', mtConfirmation, [mbYes, mbNo], 0) = mrNo
      then CanClose := False
      else CanClose:=true;
    //else
      //WriteRegisterStr(F_EnteredLogin, RegisterBranchMetallica, 'LASTDBUSER');
end;

procedure TFormMain.TreeChange(Sender: TObject; Node: TTreeNode);
begin
  MyNode.Id := Integer(Tree.Selected.Data);
  edtCompany.Clear;
  edtBusiness.Clear;
  RefreshPrices;
end;

procedure TFormMain.TreeExpanding(Sender: TObject; Node: TTreeNode;
  var AllowExpansion: Boolean);
begin
  MyNode.Id := Integer(Node.Data);
  RefreshPrices;
end;

procedure TFormMain.GridCellClick(Column: TColumnEh);
begin
  F_FieldName2 := F_FieldName1;
  F_FieldName1 := Column.FieldName;
end;

procedure TFormMain.GridDblClick(Sender: TObject);
begin
  if (F_FieldName1 = 'CM_NAME') and (F_FieldName2 = 'CM_NAME') then
  begin
    if varIsNull(qData['CM_ID']) then
      Exit;
    if FormCompaniesShow = nil then
      Application.CreateForm(TFormCompaniesShow, FormCompaniesShow);
    FormCompaniesShow.SetPosition(Self.Left, Self.Top);
    FormCompaniesShow.SetCompany(qData['CM_ID']);
    FormCompaniesShow.ShowModal;
  end
  else
  begin
    if varIsNull(qData['CM_ID']) then
      Exit;
    if FormPriceShow = nil then
      Application.CreateForm(TFormPriceShow, FormPriceShow);
    FormPriceShow.SetPosition(Self.Left, Self.Top);
    FormPriceShow.SetTree(qData['PL_TREEID'], MyNode.Value);
    FormPriceShow.ShowModal;
  end;

end;

procedure TFormMain.GridEnter(Sender: TObject);
begin
  F_FieldName1 := 'CM_NAME';
end;

procedure TFormMain.RefreshPrices;
begin
  qData.Close;
  if Trim(edtCompany.Text) = ''
  then qData.ParamByName('Company').Value := ''
  else qData.ParamByName('Company').AsString := AnsiUppercase(Trim(edtCompany.Text));
  if Trim(edtBusiness.Text)=''
  then qData.ParamByName('Business').Value:=''
  else qData.ParamByName('Business').AsString := AnsiUpperCase(Trim(edtBusiness.Text));
  qData.ParamByName('TREEID').AsInteger := MyNode.Id;
  if MyNode.ParentID = 0 then
    qData.ParamByName('NODE').Value := MyNode.Value
  else
    qData.ParamByName('NODE').Value := MyNode.ParentValue;
  qData.Open;
  if MyNode.ParentID <> 0 then
    DM.RepaintGrid(Grid, MyNode.ParentID, [Fields, FTree, FCompany])
  else
    DM.RepaintGrid(Grid, MyNode.Id, [Fields, FTree, FCompany]);

end;

procedure TFormMain.sBitBtn1Click(Sender: TObject);
begin
edtCompany.Clear;
edtBusiness.Clear;
RefreshPrices;
end;

procedure TFormMain.BitBtnNewPriceClick(Sender: TObject);
begin
  SelectedCompanyID := 0;
  if FormSelectCompany = nil then
    Application.CreateForm(TFormSelectCompany, FormSelectCompany);
  FormSelectCompany.SetPosition(Self.Left, Self.Top);
  FormSelectCompany.SetCompanies;
  FormSelectCompany.ShowModal;
  if SelectedCompanyID <> 0 then
  begin
    if FormNewPriceList = nil then
      Application.CreateForm(TFormNewPriceList, FormNewPriceList);
    FormNewPriceList.SetPosition(Self.Left, Self.Top);
    FormNewPriceList.SetNewPriceList(SelectedCompanyID, SelectedPriceHeaderID);
    FormNewPriceList.ShowModal;
  end;
  RefreshPrices;
end;

procedure TFormMain.GridTitleClick(Column: TColumnEh);
begin
  if F_LastSorted = Column.FieldName then
  begin
    //qData.SortedFields := Column.FieldName;
    //qData.SortType := stDescending;
    qData.IndexFieldNames := Column.FieldName+' DESC';
  end
  else
  begin
    //qData.SortedFields := Column.FieldName;
    //qData.SortType := stAscending;
    qData.IndexFieldNames := Column.FieldName+' ASC';
  end;
  F_LastSorted := Column.FieldName;
end;

procedure TFormMain.QViewUsersCalcFields(DataSet: TDataSet);
begin
  if QViewUsers['U_ISBOSS'] = 1 then
    QViewUsers['U_FIO_PLUS_BOSS'] := QViewUsers['U_FIO'] + ' BOSS';
  if QViewUsers['U_ISBOSS'] = 0 then
    QViewUsers['U_FIO_PLUS_BOSS'] := QViewUsers['U_FIO'];
  if QViewUsers['U_ISCLOSED'] = 1 then
    QViewUsers['U_FIO_PLUS_BOSS'] := QViewUsers['U_FIO_PLUS_BOSS'] + ' уволен';
end;

procedure TFormMain.GridDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
  if VarisNull(qData['TL_Color']) then
    TDBGridEh(Sender).Canvas.Brush.Color := clWhite
  else
    TDBGridEh(Sender).Canvas.Brush.Color := qData['TL_Color'];
  // Восстанавливаем выделение текущей позиции курсора
  if gdSelected in State then
  begin
    TDBGridEh(Sender).Canvas.Brush.Color := clHighLight;
    TDBGridEh(Sender).Canvas.Font.Color := clHighLightText;
  end;
  // Просим GRID перерисоваться самому
  TDBGridEh(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFormMain.edtCompanyExit(Sender: TObject);
begin
  RefreshPrices;
end;

procedure TFormMain.edtBusinessExit(Sender: TObject);
begin
  RefreshPrices;
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
AppUserISBOSS:=true;
AppUSerID:=1;
//QUsers.Close;
//QUsers.ParamByName('U_LOGIN').ASstring:=F_AppLastUser;
//QUsers.Open;

//sComboBox.Text:=QUsers['U_LOGIN'];
//EFIO.Text:=QUsers['U_FIO'];
//if VarIsNull(QUsers['U_PASSWORD']) then F_AppPassword:='' else F_AppPassword:=AnsiUpperCase(trim(QUsers['U_PASSWORD']));
//while not qUsers.EOF do
//  begin
//    sComboBox.Items.Add(QUsers['U_LOGIN']);
//    qUsers.next;
//  end;
Result:=true;
end;

end.

