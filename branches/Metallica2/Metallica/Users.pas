unit Users;

interface

uses
  	Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  	Dialogs, StdCtrls, Buttons, Grids, DBGrids, DB, ZAbstractRODataset, 
  ZAbstractDataset, ZDataset, DBGridEh, sBitBtn, sCheckBox, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh,
  DBAccess, Uni, MemDS, sSkinProvider, sSkinManager;

type
	TFormUsers = class(TForm)
		BitBtnInsert: TsBitBtn;
		BitBtnUpdate: TsBitBtn;
		BitBtnDelete: TsBitBtn;
		BitBtnClose: TsBitBtn;
    BitBtnRights: TsBitBtn;
    CBOnlyWorkers: TsCheckBox;
    DBUsers: TDBGridEh;
    QUsersWOMe: TUniQuery;
    DSUsers: TUniDataSource;
    QUserTitles: TUniQuery;
    QViewFormUsers: TUniQuery;
    QInsertGrant: TUniSQL;
    QMoveCon_Own: TUniSQL;
    QGrantBoss: TUniSQL;
    QMoveCom: TUniSQL;
    QDeleteGrantV: TUniSQL;
    QMoveCon_Man: TUniSQL;
    QViewFormUsersU_ID: TIntegerField;
    QViewFormUsersU_LOGIN: TStringField;
    QViewFormUsersU_PASSWORD: TStringField;
    QViewFormUsersU_ISBOSS: TIntegerField;
    QViewFormUsersU_FIO: TStringField;
    QViewFormUsersU_COMMENT: TStringField;
    QViewFormUsersU_EDIT_OWN_JOBS: TSmallintField;
    QViewFormUsersU_EDIT_PRICES: TSmallintField;
    QViewFormUsersU_ISCLOSED: TSmallintField;
    QViewFormUsersSISBOSS: TStringField;
    QViewFormUsersSISCLOSED: TStringField;
    QViewFormUsersSIS_EDIT_PRICES: TStringField;
    QUserTitlesID: TIntegerField;
    sSkinManager1: TsSkinManager;
    sSkinProvider1: TsSkinProvider;
		procedure BitBtnInsertClick(Sender: TObject);
		procedure BitBtnUpdateClick(Sender: TObject);
		procedure BitBtnDeleteClick(Sender: TObject);
    procedure BitBtnRightsClick(Sender: TObject);
    procedure QViewFormUsers2CalcFields(DataSet: TDataSet);
    procedure CBOnlyWorkersClick(Sender: TObject);
    procedure DBUsersDblClick(Sender: TObject);
    procedure DBUsersTitleClick(Column: TColumnEh);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
	private
    procedure RefreshViewFormUsers;
		{ Private declarations }
	public
    procedure SetPosition(L, T: integer);
    procedure SetUsers;
  end;

var
  FormUsers: TFormUsers;

implementation

uses MainForm, UserInsert, UserUpdate, EnterUser, DataModule, System.UITypes;

{$R *.dfm}
procedure TFormUsers.SetPosition(L,T:integer);
begin
Left:=L+ShiftLeft;
Top:=T+ShiftTop;
end;

procedure TFormUsers.BitBtnInsertClick(Sender: TObject);
begin
if FormUserInsert=nil then Application.CreateForm(TFormUserInsert, FormUserInsert);
FormUserInsert.SetPosition(Self.Left,Self.Top);
FormUserInsert.SetUser;
FormUserInsert.ShowModal;
RefreshViewFormUsers;
end;

procedure TFormUsers.BitBtnUpdateClick(Sender: TObject);
begin
if FormUserUpdate=nil then Application.CreateForm(TFormUserUpdate, FormUserUpdate);
FormUserUpdate.SetPosition(Self.Left,Self.Top);
if not FormMain.ReadEnteredUserISBOSS then exit;
FormUserUpdate.SetUserName(QViewFormUsers['U_ID'],QViewFormUsers['U_LOGIN'],
                           QViewFormUsers['U_FIO'],QViewFormUsers['U_PASSWORD'],
							  					 QViewFormUsers['U_COMMENT'], QViewFormUsers['U_EDIT_PRICES']
													 );
FormUserUpdate.ShowModal;
RefreshViewFormUsers;
end;


procedure TFormUsers.BitBtnDeleteClick(Sender: TObject);
const EOL=chr(13)+chr(10);
begin
if VarIsNull(QViewFormUsers['U_ID']) then
	begin
	MessageDlg('Пожалуйста выберите пользователя из списка',mtInformation,[mbOK],0);
	exit;
	end;
if Pos('BOSS',UpperCase(QViewFormUsers['U_LOGIN']))>0 then
	begin
	MessageDlg('Запрещается изменять пользователя BOSS',mtWarning,[mbOK],0);
	exit;
	end;
if QViewFormUsers['U_ISCLOSED']=1 then
	begin
	MessageDlg('Пользователь уже отмечен как уволенный',mtInformation,[mbOK],0);
	exit;
	end;
if not FormMain.ReadEnteredUserISBOSS then
		begin
		MessageDlg('Вы не можете уволить пользователя, войдите в программу как BOSS',mtError,[mbOK],0);
		exit;
		end;
try
if VarIsNull(QViewFormUsers['U_ID']) then exit;
if MessageDlg('Подтвердите увольнение пользователя "'+QViewFormUsers['U_LOGIN'],mtConfirmation,[mbYes,mbNo],0)=mrYes then
	begin
		DM.UserClosebyID(QViewFormUsers['U_ID']);
      DM.UserCloseAllViews(QViewFormUsers['U_ID']);
        //Error 1014:UserCloseAllViews
	end;
except on E:Exception do
	begin
  MessageDlg(DM.GetErrorByCode(1008),mtError,[mbOK],0);
  //Error 1008:UserClose
	end;
end;
RefreshViewFormUsers;
end;

procedure TFormUsers.BitBtnRightsClick(Sender: TObject);
var SetBossR:integer;
begin
if VarIsNull(QViewFormUsers['U_ID']) then
	begin
	MessageDlg('Пожалуйста выберите пользователя из списка',mtInformation,[mbOK],0);
	exit;
	end;
if not FormMain.ReadEnteredUserISBOSS then
	begin
	MessageDlg('Вы не имеете прав BOSS и не можете выдавать права',mtInformation,[mbOK],0);
	exit;
	end;
if QViewFormUsers['U_ISCLOSED']=1 then
	begin
	MessageDlg('Данный пользователь уволен, невозможно выдать ему права',mtInformation,[mbOK],0);
	exit;
	end;
if Pos('BOSS',UpperCase(QViewFormUsers['U_LOGIN']))>0 then
	begin
	MessageDlg('Запрещается изменять права у пользователя BOSS',mtWarning,[mbOK],0);
	exit;
	end;
if QViewFormUsers['U_ISBOSS']=1
	then
		begin
		if MessageDlg('Вы хотите забрать права у пользователя '+QViewFormUsers['U_LOGIN']+'?',mtConfirmation,[mbYes,mbNo],0)=mrNo then exit;
		SetBossR:=0;
		QGrantBoss.ParamByName('U_ID').AsInteger:=QViewFormUsers['U_ID'];
		QGrantBoss.ParamByName('U_ISBOSS').AsInteger:=SetBossR;
		QGrantBoss.Execute;
		QDeleteGrantV.ParamByName('UB_VIEWERID').AsInteger:=QViewFormUsers['U_ID'];
		QDeleteGrantV.Execute;
		end
	else
		begin
		SetBossR:=1;
		if MessageDlg('Вы хотите выдать права пользователю '+QViewFormUsers['U_LOGIN']+'?',mtConfirmation,[mbYes,mbNo],0)=mrNo then exit;
		QGrantBoss.ParamByName('U_ID').AsInteger:=QViewFormUsers['U_ID'];
		QGrantBoss.ParamByName('U_ISBOSS').AsInteger:=SetBossR;
		QGrantBoss.Execute;
		QUsersWOMe.Close;
		QUsersWOMe.ParamByName('U_ID').AsInteger:=QViewFormUsers['U_ID'];
		QUsersWOMe.Open;
		while not QUsersWOMe.EOF do
			begin
			QInsertGrant.ParamByName('UB_USERID').AsInteger:=QUsersWOMe['U_ID'];
			QInsertGrant.ParamByName('UB_VIEWERID').AsInteger:=QViewFormUsers['U_ID'];
			QInsertGrant.Execute;
			QUsersWOMe.Next;
			end;
		end;
RefreshViewFormUSers;
end;

procedure TFormUsers.QViewFormUsers2CalcFields(DataSet: TDataSet);
begin
if QViewFormUsers['U_ISBOSS']=1 then QViewFormUsers['SISBOSS']:='ДА';
if QViewFormUsers['U_ISBOSS']=0 then QViewFormUsers['SISBOSS']:='НЕТ';
if QViewFormUsers['U_ISCLOSED']=0 then QViewFormUsers['SISCLOSED']:='ДА';
if QViewFormUsers['U_ISCLOSED']=1 then QViewFormUsers['SISCLOSED']:='НЕТ';
if QViewFormUsers['U_EDIT_PRICES']=0 then QViewFormUsers['SIS_EDIT_PRICES']:='НЕТ';
if QViewFormUsers['U_EDIT_PRICES']=1 then QViewFormUsers['SIS_EDIT_PRICES']:='ДА';
end;

procedure TFormUsers.CBOnlyWorkersClick(Sender: TObject);
begin
RefreshViewFormUsers;
end;

procedure TFormUsers.RefreshViewFormUsers;
var B:TBookmark;
begin
B:=QViewFormUsers.GetBookmark;
QViewFormUsers.Close;
if CBOnlyWorkers.Checked
  then QViewFormUsers.ParamByName('U_ISCLOSED').AsInteger:=0
  else QViewFormUsers.ParamByName('U_ISCLOSED').AsInteger:=-1;
QViewFormUsers.Open;
if QViewFormUsers.BookmarkValid(B) then QViewFormUsers.GotoBookmark(B);
QViewFormUsers.FreeBookmark(B);
end;

procedure TFormUsers.SetUsers;
begin
if FormMain.ReadEnteredUserISBOSS
	then
		begin
		BitBtnInsert.Enabled:=true;
		BitBtnUpdate.Enabled:=true;
		BitBtnDelete.Enabled:=true;
		BitBtnRights.Enabled:=true;
		end
else
		begin
		BitBtnInsert.Enabled:=false;
		BitBtnUpdate.Enabled:=false;
		BitBtnDelete.Enabled:=false;
		BitBtnRights.Enabled:=false;
		end;
RefreshViewFormUsers;
end;

procedure TFormUsers.DBUsersDblClick(Sender: TObject);
begin
BitBtnUpdate.Click;
end;

procedure TFormUsers.DBUsersTitleClick(Column: TColumnEh);
begin
QViewFormUsers.IndexFieldNames:=Column.FieldName;
end;

procedure TFormUsers.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
case Key of    //
	VK_F3: BitBtnInsert.Click;
	VK_F4: BitBtnUpdate.Click;
end;    // case

end;

end.
