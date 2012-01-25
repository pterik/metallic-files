unit DataModule;

interface

uses
  SysUtils, Classes, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, DateUtils,
	Controls, ComCtrls, DBGridEh;
const ShiftLeft=30;
			ShiftTop=30;
      MaxToolBtnCntr=20;
			RegisterBranchMetallica='SOFTWARE\PterikSoft\Metallica';
			ParameterVersion=1;
type
  TNodeValue=class(TObject)
  private
    F_ID, F_ParentID:integer;
    F_Value, F_ParentValue:string;
    procedure Create;
    function GetID: integer;
    function GetParentValue: string;
    function GetValue: string;
    function GetParentID: integer;
    procedure SetID(const LID: integer);
  public
  property ID:integer Read GetID  Write SetID Default 0;
  property ParentID:integer Read GetParentID Default 0;
  property Value:string Read GetValue;
  property ParentValue:string Read GetParentValue;
  function Print:string;
  end;
  TDM = class(TDataModule)
    QIPhone: TZQuery;
    QFindPhone: TZQuery;
    QUPhoneDT_Com: TZQuery;
    QMaxCompany: TZQuery;
    QICompany: TZQuery;
    QSCompanyNames: TZQuery;
    QIPhoneCompany: TZQuery;
    QCntrPhoneCompany: TZQuery;
    QUsersOrdered: TZQuery;
    QUsersOrderedUSER_NAME: TStringField;
    QUContactsByOwner: TZQuery;
    QUUserbyID: TZQuery;
    QUCompanyByID: TZQuery;
    QUContactByComp: TZQuery;
    QUCompany: TZQuery;
    QDelJobsForBoss: TZQuery;
    QDelContactsViews: TZQuery;
    QDelUsersForBoss: TZQuery;
    QUsersOrderedORDERBY: TIntegerField;
    QUsersOrderedU_ID: TIntegerField;
    QIContact: TZQuery;
    QMaxContact: TZQuery;
    QDContact: TZQuery;
    QDPhone: TZQuery;
    QIComNT: TZQuery;
    QCntrComNT: TZQuery;
    QCntrComNTCNTR: TIntegerField;
    QFindComNT: TZQuery;
    IntegerField1: TIntegerField;
    QUComNT: TZQuery;
    IntegerField2: TIntegerField;
    QUContactByID: TZQuery;
    QUContactAuto: TZQuery;
    QShortcut: TZQuery;
    QSettings: TZQuery;
    QUSettings: TZQuery;
    QUPhoneDT: TZQuery;
    QUPhoneCompany: TZQuery;
    qFindParent: TZReadOnlyQuery;
    qFindParentPT_VALUE: TStringField;
    qFindParentPARENTID: TIntegerField;
    qFindParentPARENTVALUE: TStringField;
    qFindParentPT_ID: TIntegerField;
    qTreeParent: TZReadOnlyQuery;
    qTreeParentPT_ID: TIntegerField;
    qTreeParentPT_VALUE: TStringField;
    qTreeParentPT_DATE: TDateField;
    qTreeParentPT_ISCLOSED: TSmallintField;
    qTreeParentPT_ORDERBY: TIntegerField;
    qTreeChild: TZReadOnlyQuery;
    IntegerField9: TIntegerField;
    StringField3: TStringField;
    DateField3: TDateField;
    SmallintField1: TSmallintField;
    IntegerField10: TIntegerField;
    qTreeChildCNTR: TIntegerField;
    qTreeChildPT_PARENTID: TIntegerField;
    qHeaderGlobDelete: TZQuery;
    qHeaderGlobInsert: TZQuery;
    qHeaderDelete: TZQuery;
    qHeaderInsert: TZQuery;
    qDisplay: TZReadOnlyQuery;
    qDisplayGS_FIELD: TStringField;
    qDisplayGS_HEADER: TStringField;
    qDisplayGS_SHOW: TSmallintField;
    qDisplayGS_SIZE: TIntegerField;
    qDisplayGS_DISPLAYFORMAT: TStringField;
    qDisplayGS_TREEID: TIntegerField;
    qDisplayGS_ORDERBY: TIntegerField;
	private
		function  CompanyDeleteBadNames(S:string; NChars:integer):string;
		function  CompanyNTMaxID: integer;
		function  CompanyNTUpdate(CompanyNameType: string): boolean;
    procedure GetParent(const F_ID:integer; var F_ParentID:integer; var F_Value, F_ParentValue:string);
	public
		IsConnected:boolean;
    F_HostName, F_Database, F_Protocol, F_User, F_Password, F_LastUser:string;
    function  LoadRegister: boolean;
		function  GetErrorByCode(CodeID:integer):string;
		function  Sendkey(const Key: word; out SMessage: string): boolean;
		function  ReadSettings(Name, Default:string):string;
		function  WriteSettings(Name, Value: string): boolean;
    procedure SaveGlobalHeader(Grid: TDBGridEh);
    procedure SaveHeader(Grid: TDBGridEh;
      Treeid: integer);
    procedure SaveGlobalHeaderInForm(Field, Header,
      DisplayFormat: string; Size, OrderBy: integer; Show:boolean);
    procedure SaveHeaderInForm(Field, Header,
      DisplayFormat: string; TreeId, Size, OrderBy: integer; Show:boolean);
    procedure RepaintGrid(var Grid:TDBGridEh; Treeid:integer);
    //  ==========================================
    procedure TreeFulFill(Tree: TTreeView;isShowEmptyRows:boolean; HeaderID:integer);
//  ������� � ��������� ����� �������- ��� �������. ���������� �� ����� �������
		function  CompanyClosebyID(CompanyID: integer): boolean;
		function  CompanyInsert(CompanyName, City, SComment:string):integer;
		function  CompanyUpdate(CompanyID:integer; CompanyName, City, SComment: string): boolean;
		function  CompanyMaxID:integer;
		function  CompanySearchLikeName(CompanyName:string;NChars:integer;
												JustLike:boolean;var Found:integer):string;
		function  CompanySearchExactName(CompanyName: string): integer;
		function  CompanyNTInsert(CompanyNameType:string):boolean;
		function  CompanyNTInsertOrUpdate(CompanyNameType:string; out OpType:string):boolean;
		function  ContactsCloseByOwner(Ownerid:integer):boolean;
		function  ContactsCloseByCompany(Companyid: integer): boolean;
		function  ContactInsert(ManagerID, OwnerID, CompanyID, Periodicity: integer;
							Contacter, Comment, NextDate, JobComment: string; JobType:integer): boolean;
		function  ContactUpdate(ContactID, ManagerID, OwnerID, CompanyID, Periodicity: integer;
									Contacter, Comment, NextDate, JobComment: string; JobType:integer): boolean;
		function  ContactUpdateAuto(ContactID, LastJobID, ClosedBy: integer;
									 LastJobDate, NextJobDate: string; isClosed:boolean; CommentClose: string): boolean;
		function  ContactCloseByID(ContactID, ClosedByManager:integer; CommentClose: string):boolean;
		function  ContactMaxID:integer;
		function  PhoneSearch(Phone:int64):integer;
		function  PhoneInsert(Phone:int64; Comment,Date1:string):boolean;
		function  PhoneUpdateDate(Phone:int64; Date1:string):boolean;
		function  PhoneUpdateDateComment(Phone:int64;Comment,Date1:string):boolean;
		function  PhoneDelete(Phone:int64; Date1:string; Manager:integer):boolean;
		function  PhoneCompanyInsertorUpdate(PhoneID:int64;UserID, CompanyID:integer; SDT:string): boolean;
		function  PhoneCompanyInsert(PhoneID: int64; UserID, CompanyID: integer; SDT: string): boolean;
		function  PhoneCompanyUpdate(PhoneID: int64; UserID, CompanyID: integer; SDT: string): boolean;
		function  PhoneCompanyExists(Phone:int64;CompanyID:integer):boolean;
		function  UserCloseAllViews(UseriD:integer):boolean;
    function  UserClosebyID(UserID:integer):boolean;
    function  CalcNextDate(LastDate:TDate; PeriodType:string; out IsClosed:boolean):TDate;
  end;

var
  DM: TDM;

implementation

{$R *.dfm}
uses Dialogs, Variants, MainForm, CommonUnit;
{ TDM }

function TDM.GetErrorByCode(CodeID: integer): string;
var WhereError:string;
begin
//   GetErrorByCode(100X)
case CodeID of    //
  1001: WhereError:='SavePhones and SaveCompany';
  1002: WhereError:='SavePhonesCompanies';
  1003: WhereError:='SaveJob';
  1004: WhereError:='JobsClose';
  1005: WhereError:='ContactsClose';
  1006: WhereError:='JobsClose';
  1007: WhereError:='CompanyClose';
  1008: WhereError:='UserClose';
  1009: WhereError:='JobsCloseByCompany';
  1010: WhereError:='ContactsCloseByCompany';
  1011: WhereError:='CompanyClose';
  1012: WhereError:='SetCompany';
  1013: WhereError:='MainForm: QViewUsers.Open;';
  1014: WhereError:='UserCloseAllViews';
  1015: WhereError:='ContactInsert';
  1016: WhereError:='ContactCloseByID';
  1017: WhereError:='PhoneDelete';
  1018: WhereError:='UpdateContact';
  1019: WhereError:='InsertJob for AutoCreateJobs';
  1020: WhereError:='UpdateContact for AutoCreateJobs';
  1021: WhereError:='JobInsert';
  1022: WhereError:='CommonManager Update';
	1023: WhereError:='Delete User, Move jobs';
	1024: WhereError:='JobUpdate';
	1025: WhereError:='PhoneUpdate';
  1026: WhereError:='�������� ����� ����������'
else WhereError:=', ����� ������ ����������';
end;    // case
Result:='�������� ������ '+IntToStr(CodeID)+'  '+WhereError+' , ���������� � �����������';
end;


function TDM.CompanyDeleteBadNames(S: string; NChars:integer):string;
var DelStr:string;
begin
//������� ������� ��������� ���������������� ����� �� ������ S
// � ����� �������� NChars �������� � ��������� 
DelStr:='��';
while Pos(DelStr,S)>0 do Delete(S,Pos(DelStr,S),length(DelStr));
DelStr:='���';
while Pos(DelStr,S)>0 do Delete(S,Pos(DelStr,S),length(DelStr));
DelStr:='���';
while Pos(DelStr,S)>0 do Delete(S,Pos(DelStr,S),length(DelStr));
DelStr:='�������';
while Pos(DelStr,S)>0 do Delete(S,Pos(DelStr,S),length(DelStr));
DelStr:='������';
while Pos(DelStr,S)>0 do Delete(S,Pos(DelStr,S),length(DelStr));
DelStr:='�����';
while Pos(DelStr,S)>0 do Delete(S,Pos(DelStr,S),length(DelStr));
DelStr:='�'+chr(178)+'���';
while Pos(DelStr,S)>0 do Delete(S,Pos(DelStr,S),length(DelStr));
DelStr:='�'+chr(178)+'����'+chr(170)+'�����';
while Pos(DelStr,S)>0 do Delete(S,Pos(DelStr,S),length(DelStr));
Result:=copy(trim(S),1,NChars);
end;

function TDM.CompanyInsert(CompanyName, City, SComment: string): integer;
var Res:integer;
begin
try
Res:=CompanyMaxID+1;
QICompany.Close;
QICompany.ParamByName('CM_ID').AsInteger:=Res;
QICompany.ParamByName('CM_NAME').AsString:=ANSIUpperCase(CompanyName);
QICompany.ParamByName('CM_CITY').AsString:=City;
QICompany.ParamByName('CM_COMMENT').AsString:=SComment;
QICompany.ParamByName('CM_ISCLOSED').AsInteger:=0;
QICompany.ExecSQL;
except on E:Exception do
	begin
	Result:=0;
  exit;
	end;
end;
Result:=Res;
end;

function TDM.CompanyUpdate(CompanyID:integer; CompanyName, City, SComment: string): boolean;
begin
try
QUCompany.Close;
QUCompany.ParamByName('CM_ID').AsInteger:=CompanyID;
QUCompany.ParamByName('CM_NAME').AsString:=ANSIUpperCase(CompanyName);
QUCompany.ParamByName('CM_CITY').AsString:=ANSIUpperCase(City);
QUCompany.ParamByName('CM_COMMENT').AsString:=SComment;
QUCompany.ExecSQL;
except on E:Exception do
	begin
	Result:=false;
  exit;
	end;
end;
Result:=true;
end;

function TDM.CompanyMaxID: integer;
begin
// ���������� ������������ ID �������. ��������, � ���������� ���� ����� �����
// ����������� � ��������, �� ������� �� ��.
QMaxCompany.Close;
QMaxCompany.Open;
if VarIsNull(QMaxCompany['CNTR'])
then Result:=0
else Result:=QMaxCompany['CNTR'];
//��������� �� ������ NULL ��� ������ �������
end;

function TDM.CompanySearchLikeName(CompanyName:string;NChars:integer; JustLike:boolean;
                                   var Found:integer): string;
var SRes, Comp_NChars:string;
FlagExact, FlagSimilar:boolean;
begin
CompanyName:=trim(ANSIUpperCase(CompanyName));
// ������� ������ ��������� ������� � ����������� ��������, ���� ����� ����
// Found �������� ���������� ������� ��������, �� �� ����������� � ������ ��������
// ��������� ���� ��� ������ ������� � �������� ��� �����������
// �������� JUSTLIKE ������ ������ �� �������������� ������, ��. ����
SRes:='';
FlagExact:=false;
FlagSimilar:=false;
try
QSCompanyNames.Close;
QSCompanyNames.ParamByName('Param').AsString:=CompanyName;
QSCompanyNames.Open;
if not VarIsNull(QSCompanyNames['CM_NAME']) then FlagExact:=true;
while not QSCompanyNames.EOF do
begin
   if FlagExact then
    begin
    if not JustLike then SRes:='����������� ��������:'+chr(13)+chr(10);
    //���� ���� JustLike ������, ����� ����������� �������� � result ������ �� �������  
    FlagExact:=false;
    end;
   SRes:=SRes+QSCompanyNames['CM_NAME']+';'+chr(13)+chr(10);
   QSCompanyNames.Next;
end;    // while
Comp_NChars:=CompanyDeleteBadNames(CompanyName,NChars);
QSCompanyNames.Close;
QSCompanyNames.ParamByName('Param').AsString:='%'+Comp_NChars+'%';
QSCompanyNames.Open;
if not VarIsNull(QSCompanyNames['CM_NAME']) then FlagSimilar:=true;
Found:=0;
while not QSCompanyNames.EOF do
begin
   if FlagSimilar then
    begin
    SRes:=SRes+'������� ��������:'+chr(13)+chr(10);
    FlagSimilar:=false;
    end;
   if not (QSCompanyNames['CM_NAME']=CompanyName) then
      begin
      SRes:=SRes+QSCompanyNames['CM_NAME']+';'+chr(13)+chr(10);
      inc(Found);
      end;
   QSCompanyNames.Next;
end;    // while
if length(SRes)>0 then Delete(SRes,length(SRes)-1,2);
except on E:Exception do
	begin
	Result:='';
  exit;
	end;
end;
Result:=SRes;
end;

function TDM.CompanySearchExactName(CompanyName:string): integer;
begin
CompanyName:=trim(ANSIUpperCase(CompanyName));
// ������� ������ true ���� ����� ����� ��� ����������
try
QSCompanyNames.Close;
QSCompanyNames.ParamByName('Param').AsString:=CompanyName;
QSCompanyNames.Open;
if VarIsNull(QSCompanyNames['CM_ID']) then Result:=0 else Result := QSCompanyNames['CM_ID'];
except on E:Exception do
	begin
	Result:=0;
  exit;
	end;
end;
end;

function TDM.PhoneCompanyExists(Phone:int64;CompanyID:integer):boolean;
var R:integer;
begin
QCntrPhoneCompany.Close;
QCntrPhoneCompany.ParamByName('PC_PHID').AsInteger:=Phone;
QCntrPhoneCompany.ParamByName('PC_COMPANY').AsInteger:=CompanyID;
QCntrPhoneCompany.Open;
if VarIsNull(QCntrPhoneCompany['CNTR'])
then R:=0
else R:=QCntrPhoneCompany['CNTR'];
//��������� �� ������ NULL �� ����� ������
if R=0 then Result:=false else Result:=true;
end;

function TDM.PhoneCompanyInsertorUpdate(PhoneID:int64;UserID, CompanyID:integer; SDT:string): boolean;
begin
if PhoneCompanyExists(PhoneID,CompanyID)
then	Result:=PhoneCompanyUpdate(PhoneID, UserID, CompanyID, SDT)
else Result:=PhoneCompanyInsert(PhoneID, UserID, CompanyID, SDT);
end;

function TDM.PhoneCompanyInsert(PhoneID:int64;UserID, CompanyID:integer; SDT:string): boolean;
begin
try
QIPhoneCompany.Close;
QIPhoneCompany.ParamByName('PC_PHID').AsInteger:=PhoneID;
QIPhoneCompany.ParamByName('PC_UID').AsInteger:=UserID;
QIPhoneCompany.ParamByName('PC_COMPANY').AsInteger:=CompanyID;
QIPhoneCompany.ParamByName('PC_DATEUPDATE').AsDate:=StrToDate(SDT);
QIPhoneCompany.ExecSQL;
except on E:Exception do
	begin
	Result:=false;
	exit;
	end;
end;
Result:=true;
end;

function TDM.PhoneCompanyUpdate(PhoneID:int64;UserID, CompanyID:integer; SDT:string): boolean;
begin
try
QUPhoneCompany.Close;
QUPhoneCompany.ParamByName('PC_PHID').AsInteger:=PhoneID;
QUPhoneCompany.ParamByName('PC_COMPANY').AsInteger:=CompanyID;
QUPhoneCompany.ParamByName('PC_UID').AsInteger:=UserID;
QUPhoneCompany.ParamByName('PC_DATEUPDATE').AsDate:=StrToDate(SDT);
QUPhoneCompany.ExecSQL;
except on E:Exception do
	begin
	Result:=false;
	exit;
	end;
end;
Result:=true;
end;

function TDM.PhoneInsert(Phone:int64; Comment, Date1:string):boolean;
begin
try
qIPhone.Close;
qIPhone.ParamByName('PH_ID').AsInteger:=Phone;
qIPhone.ParamByName('PH_COMMENT').AsString:=Comment;
qIPhone.ParamByName('PH_DATEBEGIN').AsDate:=StrToDate(Date1);
qIPhone.ExecSQL;
except on E:Exception do
	begin
	Result:=false;
	exit;
	end;
end;
Result:=true;
end;

function TDM.PhoneSearch(Phone:int64):integer;
begin
qFindPhone.Close;
qFindPhone.ParamByName('PH_ID').AsInteger:=Phone;
//qFindPhone.ParamByName('PH_STR').AsString:=SPhone;
qFindPhone.Open;
if VarIsNull(qFindPhone['CNTR']) then Result:=0 else Result:=qFindPhone['CNTR'];
//��������� �� ���������� NULL ��� ����� ��������
end;

function TDM.PhoneUpdateDateComment(Phone:int64;Comment,Date1:string):boolean;
begin
//��� ������ ������� �������� ���������� ��� ��������
try
qUPhoneDT_Com.Close;
qUPhoneDT_Com.ParamByName('PH_DATEBEGIN').AsDate:=StrToDate(Date1);
qUPhoneDT_Com.ParamByName('PH_COMMENT').AsString:=Comment;
qUPhoneDT_Com.ParamByName('PH_ID').AsInteger:=Phone;
qUPhoneDT_Com.ExecSQL;
except on E:Exception do
	begin
	Result:=false;
	exit;
	end;
end;
Result:=true;
end;

function TDM.PhoneUpdateDate(Phone:int64; Date1:string):boolean;
begin
//��� ������ ������� �������� ���������� ��� ��������
try
qUPhoneDT.Close;
qUPhoneDT.ParamByName('PH_ID').AsInteger:=Phone;
qUPhoneDT.ParamByName('PH_DATEBEGIN').AsDate:=StrToDate(Date1);
qUPhoneDT.ExecSQL;
except on E:Exception do
	begin
	Result:=false;
	exit;
	end;
end;
Result:=true;
end;

function TDM.PhoneDelete(Phone: int64; Date1: string; Manager:integer): boolean;
begin
try
qDPhone.Close;
qDPhone.ParamByName('PH_ID').AsInteger:=Phone;
qDPhone.ParamByName('PH_DATEEND').AsDate:=StrToDate(Date1);
qDPhone.ParamByName('PH_CLOSEDBY').AsInteger:=Manager;
qDPhone.ExecSQL;
except on E:Exception do
	begin
	Result:=false;
  exit;
	end;
end;
Result:=true;
end;

function TDM.ContactsCloseByOwner(Ownerid: integer): boolean;
begin
try
QUContactsByOwner.Close;
QUContactsByOwner.ParamByName('CN_OWNER').AsInteger:=OwnerID;
QUContactsByOwner.ExecSQL;
except on E:Exception do
	begin
	Result:=false;
  exit;
	end;
end;
Result:=true;
end;

function TDM.ContactsCloseByCompany(Companyid: integer): boolean;
begin
try
QUContactByComp.Close;
QUContactByComp.ParamByName('CN_COMPANY').AsInteger:=CompanyID;
QUContactByComp.ExecSQL;
except on E:Exception do
	begin
	Result:=false;
  exit;
	end;
end;
Result:=true;
end;

function TDM.UserClosebyID(UserID: integer): boolean;
begin
try
QUUserbyID.Close;
QUUserbyID.ParamByName('U_ID').AsInteger:=UserID;
QUUserbyID.ExecSQL;
except on E:Exception do
	begin
	Result:=false;
  exit;
	end;
end;
Result:=true;
end;

function TDM.CompanyClosebyID(CompanyID: integer): boolean;
begin
//�������� �������� ��� ��������, ����������
try
QUCompanyByID.Close;
QUCompanyByID.ParamByName('CM_ID').AsInteger:=CompanyID;
QUCompanyByID.ExecSQL;
except on E:Exception do
	begin
	Result:=false;
  exit;
	end;
end;
Result:=true;
end;

function TDM.UserCloseAllViews(UseriD: integer): boolean;
begin
//������� �������� ����� �� �������� ��� ���� ��������� �������������
// ������� JobsForBoss, ContactsViews �� ���� VIEWERID
try
qDelJobsForBoss.Close;
qDelJobsForBoss.ParamByName('JB_VIEWERID').AsInteger:=UserID;
qDelJobsForBoss.ExecSQL;
qDelContactsViews.Close;
qDelContactsViews.ParamByName('CN_VIEWER').AsInteger:=UserID;
qDelContactsViews.ExecSQL;
QDelUsersForBoss.Close;
QDelUsersForBoss.ParamByName('UB_VIEWERID').AsInteger:=UserID;
QDelUsersForBoss.ExecSQL;
except on E:Exception do
	begin
	Result:=false;
  exit;
	end;
end;
Result:=true;
end;

function TDM.ContactCloseByID(ContactID, ClosedByManager:integer; CommentClose: string): boolean;
begin
try
QDContact.Close;
QDContact.ParamByName('CN_ID').AsInteger:=ContactID;
QDContact.ParamByName('CN_CLOSED_BY_MANAGER').AsInteger:=ClosedByManager; 
QDContact.ParamByName('CN_COMMENT_CLOSE').AsString:=CommentClose;
QDContact.ExecSQL;
except on E:Exception do
	begin
	Result:=false;
  exit;
	end;
end;
Result:=true;
end;

function TDM.ContactInsert(ManagerID, OwnerID, CompanyID, Periodicity: integer;
          Contacter, Comment, NextDate, JobComment: string; JobType:integer): boolean;
begin
try
QIContact.Close;
QIContact.ParamByName('CN_ID').AsInteger:=ContactMaxID+1;
QIContact.ParamByName('CN_OWNER').AsInteger:=OwnerID;
QIContact.ParamByName('CN_MANAGER').AsInteger:=ManagerID;
QIContact.ParamByName('CN_COMPANY').AsInteger:=CompanyID;
QIContact.ParamByName('CN_CONTACTER').AsString:=Contacter;
QIContact.ParamByName('CN_COMMENT').AsString:=Comment;
QIContact.ParamByName('CN_JOBTYPE').AsInteger:=JobType;
QIContact.ParamByName('CN_JOBCOMMENT').AsString:=JobComment;
QIContact.ParamByName('CN_PERIODICITY').AsInteger:=Periodicity;
//QIContact.ParamByName('CN_PARAMETER').AsString:=Parameter;
QIContact.ParamByName('CN_NEXT_JOB_DATE').AsDate:=StrToDate(NextDate);
QIContact.ExecSQL;
except on E:Exception do
	begin
	Result:=false;
  exit;
	end;
end;
Result:=true;
end;

function TDM.ContactUpdate(ContactID, ManagerID, OwnerID,CompanyID, Periodicity: integer;
           Contacter, Comment, NextDate, JobComment: string; JobType:integer): boolean;
begin
try
QUContactByID.Close;
QUContactByID.ParamByName('CN_ID').AsInteger:=ContactID;
QUContactByID.ParamByName('CN_OWNER').AsInteger:=OwnerID;
QUContactByID.ParamByName('CN_MANAGER').AsInteger:=ManagerID;
QUContactByID.ParamByName('CN_COMPANY').AsInteger:=CompanyID;
QUContactByID.ParamByName('CN_CONTACTER').AsString:=Contacter;
QUContactByID.ParamByName('CN_COMMENT').AsString:=Comment;
QUContactByID.ParamByName('CN_JOBTYPE').AsInteger:=JobType;
QUContactByID.ParamByName('CN_JOBCOMMENT').AsString:=JobComment;
QUContactByID.ParamByName('CN_PERIODICITY').AsInteger:=Periodicity;
//QUContactByID.ParamByName('CN_PARAMETER').AsString:=Parameter;
QUContactByID.ParamByName('CN_NEXT_JOB_DATE').AsDate:=StrToDate(NextDate);
QUContactByID.ExecSQL;
except on E:Exception do
	begin
	Result:=false;
  exit;
	end;
end;
Result:=true;
end;

function TDM.ContactUpdateAuto(ContactID, LastJobID, ClosedBy: integer;
                LastJobDate, NextJobDate: string; isClosed:boolean;CommentClose: string): boolean;
var DT:Variant;
begin
try
if isClosed then DT:=0 else DT:=StrToDate(NextJobDate);
QUContactAuto.Close;
QUContactAuto.ParamByName('CN_ID').AsInteger:=ContactID;
QUContactAuto.ParamByName('CN_LAST_JOB').AsInteger:=LastJobID;
QUContactAuto.ParamByName('CN_LAST_JOB_DATE').AsDate:=StrToDate(LastJobDate);
QUContactAuto.ParamByName('CN_NEXT_JOB_DATE').AsDate:=DT;
if IsClosed
  then QUContactAuto.ParamByName('CN_ISCLOSED').AsInteger:=1
  else QUContactAuto.ParamByName('CN_ISCLOSED').AsInteger:=0;
QUContactAuto.ExecSQL;
if IsClosed
then ContactCloseByID(ContactID, ClosedBy,CommentClose);
except on E:Exception do
	begin
	Result:=false;
  exit;
	end;
end;
Result:=true;
end;

function TDM.ContactMaxID: integer;
begin
QMaxContact.Close;
QMaxContact.Open;
if VarIsNull(QMaxContact['CNTR'])
then Result:=0
else Result:=QMaxContact['CNTR'];
end;

function TDM.CompanyNTInsert(CompanyNameType: string): boolean;
begin
try
QIComNT.Close;
QIComNT.ParamByName('CNT_ID').AsInteger:=CompanyNTMaxID+1;
QIComNT.ParamByName('CNT_NAME').Asstring:=AnsiUpperCase(CompanynameType);
QIComNT.ParamByName('CNT_CNTR').AsInteger:=1;
QIComNT.ExecSQL;
except on E:Exception do
	begin
	Result:=false;
  exit;
	end;
end;
Result:=true;
end;

function TDM.CompanyNTUpdate(CompanyNameType: string): boolean;
begin
try
//��� ������ ������� ��������� +1
QUComNT.Close;
QUComNT.ParamByName('CNT_ADD').AsInteger:=1;
QUComNT.ParamByName('CNT_NAME').Asstring:=AnsiUpperCase(CompanynameType);
QUComNT.ExecSQL;
except on E:Exception do
	begin
	Result:=false;
  exit;
	end;
end;
Result:=true;
end;

function TDM.CompanyNTInsertOrUpdate(CompanyNameType: string; out OpType:string): boolean;
var Res:integer;
begin
QFindComNT.Close;
QFindComNT.ParamByName('CNT_NAME').Asstring:=AnsiUpperCase(CompanynameType);
QFindComNT.Open;
if VarIsNull(QFindComNT['CNTR'])
then Res:=0
else Res:=QFindComNT['CNTR'];
if Res=0
then
  begin
  Result:=CompanyNTInsert(CompanyNameType);
  OpType:='INS';
  end
else
  begin
  Result:=CompanyNTUpdate(CompanyNameType);
  OpType:='UPD';
  end;

end;

function TDM.CompanyNTMaxID: integer;
begin
QCntrComNT.Close;
QCntrComNT.Open;
if VarIsNull(QCntrComNT['CNTR'])
then Result:=0
else Result:=QCntrComNT['CNTR'];
end;


function TDM.CalcNextDate(LastDate: TDate; PeriodType: string;
  out IsClosed: boolean): TDate;
var  TmpDate:TDate;
Year, Month, Day, DOW: Word;
begin
Result:=0;
isClosed:=false;
if PeriodType='ONCE' then
  begin
  isClosed:=true;
  Result:=0;
  end;
if PeriodType='WEEKLY' then Result:=LastDate+7;
if PeriodType='MONTHLY' then
  begin
  DecodeDateFully(LastDate,Year, Month, Day, DOW);
  Result:=LastDate+DaysInAMonth(Year, Month);
  end;
if PeriodType='QUATERLY' then
  begin
  //��������� � ���� ��� ������ ������
  DecodeDateFully(LastDate,Year, Month, Day, DOW);
  TmpDate:=LastDate+DaysInAMonth(Year, Month);
  DecodeDateFully(TmpDate,Year, Month, Day, DOW);
  TmpDate:=TmpDate+DaysInAMonth(Year, Month);
  DecodeDateFully(TmpDate,Year, Month, Day, DOW);
  Result:=TmpDate+DaysInAMonth(Year, Month);
  end;
if PeriodType='YEARLY' then
  begin
  DecodeDateFully(LastDate,Year, Month, Day, DOW);
  Result:=LastDate+DaysInAYear(Year);
  end;
end;

function TDM.Sendkey(const Key:word;out SMessage:string):boolean;
// ������� ������������ ������� ������� � ���������� ����� Shortcut
begin
SMessage:='';
QShortcut.Close;
QShortcut.ParamByName('CS_SHORTCUT').AsInteger:=key;
QShortcut.Open;
if not VarIsNull(QShortcut['CS_SHABLONE'])
then
  begin
  SMessage:=QShortcut['CS_SHABLONE'];
  Result:=true;
  end
else Result:=false;
end;

function TDM.ReadSettings(Name, Default:string): string;
begin
QSettings.Close;
QSettings.ParamByName('ST_NAME').AsString:=ANSIUpperCase(Name);
QSettings.Open;
if VarIsNull(QSettings['ST_VALUE']) then Result:=Default else Result:=QSettings['ST_VALUE'];
end;

function TDM.WriteSettings(Name, Value:string): boolean;
begin
try
QUSettings.Close;
QUSettings.ParamByName('ST_NAME').AsString:=ANSIUpperCase(Name);
QUSettings.ParamByName('ST_VALUE').AsString:=ANSIUpperCase(Value);
QUSettings.ExecSQL;
except on E:Exception do
	begin
	Result:=false;
	exit;
	end;
end;
Result:=true;
end;

procedure TDM.GetParent(const F_ID:integer; var F_ParentID: integer; var F_Value,
  F_ParentValue: string);
begin
qFindParent.Close;
qFindParent.ParamByName('ID').AsInteger:=F_ID;
qFindParent.Open;
if VarIsNull(QFindParent['PT_VALUE'])
then F_Value:=''
else F_Value:=QFindParent['PT_VALUE'];
if VarIsNull(QFindParent['PARENTID'])
then F_ParentID:=0
else F_ParentID:=QFindParent['PARENTID'];
if VarIsNull(QFindParent['PARENTVALUE'])
then F_ParentValue:=''
else F_ParentValue:=QFindParent['PARENTVALUE'];
end;

procedure TDM.TreeFulFill(Tree:TTreeView; isShowEmptyRows:boolean; HeaderID:integer);
Var i, j, ChildCntr   : Integer;
    ParentTreeNode, ChildTreeNode : TTreeNode;
    ShowTheRow:boolean;
Begin
// ���� IsShowEmptyRows = true, ������ ����� ������ 2, ��� ������� ��� �����
Tree.Items.Clear;
qTreeParent.Close;
qTreeParent.Open;
Tree.Items.BeginUpdate;
for i:=1 To qTreeParent.RecordCount Do
  begin
  ParentTreeNode:=Tree.Items.AddChildObject(nil ,
                      qTreeParent.FieldByName('PT_VALUE').AsString ,
                      Pointer(qTreeParent.FieldByName('PT_ID').AsInteger));
  ParentTreeNode.ImageIndex:=1;
  ParentTreeNode.SelectedIndex:=2;
  qTreeChild.Close;
  qTreeChild.ParamByName('PARENTID').AsInteger:=qTreeParent['PT_ID'];
  qTreeChild.ParamByName('HEADERID').AsInteger:=HeaderID;
  qTreeChild.Open;
  ChildCntr:=0;
  for j:=1 To qTreeChild.RecordCount do
    begin
    ShowTheRow:=isShowEmptyRows or (qTreeChild['CNTR']>0);
    if ShowTheRow then
      begin
      inc(ChildCntr);
      ChildTreeNode:=Tree.Items.AddChildObject(ParentTreeNode ,
                      qTreeChild.FieldByName('PT_VALUE').AsString ,
                      Pointer(qTreeChild.FieldByName('PT_ID').AsInteger));
      ChildTreeNode.ImageIndex:=1;
      ChildTreeNode.SelectedIndex:=2;
      end;
    qTreeChild.Next;
    end;
  qTreeParent.Next;
  end;
Tree.Items.EndUpdate;
end;

procedure TDM.SaveGlobalHeader(Grid:TDBGridEh);
var
  I: Integer;
begin
qHeaderGlobDelete.Close;
//qHeaderGlobDelete.ParamByName('FORM').AsString:=FormName;
qHeaderGlobDelete.ParamByName('FIELD').AsString:='';
qHeaderGlobDelete.ExecSQL;
for I := 0 to Grid.Columns.Count - 1 do    // Iterate
  begin
  qHeaderGlobInsert.Close;
//  qHeaderGlobInsert.ParamByName('FORM').AsString:=FormName;
  qHeaderGlobInsert.ParamByName('FIELD').AsString:=Grid.Columns[i].FieldName;
  if Grid.Columns[i].Width<=0
  then qHeaderGlobInsert.ParamByName('SIZE').AsInteger:=1
  else qHeaderGlobInsert.ParamByName('SIZE').AsInteger:=Grid.Columns[i].Width;
  if Grid.Columns[i].Visible
  then qHeaderGlobInsert.ParamByName('SHOW').AsInteger:=1
  else qHeaderGlobInsert.ParamByName('SHOW').AsInteger:=0;
  qHeaderGlobInsert.ParamByName('HEADER').AsString:=Grid.Columns[i].Title.Caption;
  if length(trim(Grid.Columns[i].DisplayFormat))>0
  then qHeaderGlobInsert.ParamByName('DISPLAYFORMAT').AsString:=Grid.Columns[i].DisplayFormat
  else qHeaderGlobInsert.ParamByName('DISPLAYFORMAT').AsString:='';
  qHeaderGlobInsert.ParamByName('ORDERBY').AsInteger:=i;
  qHeaderGlobInsert.ExecSQL;
  end;    // for
end;

procedure TDM.SaveHeader(Grid:TDBGridEh; Treeid:integer);
var
  I: Integer;
begin
qHeaderDelete.Close;
//qHeaderDelete.ParamByName('FORM').AsString:=FormName;
qHeaderDelete.ParamByName('FIELD').AsString:='';
qHeaderDelete.ParamByName('TREEID').AsInteger:=TreeID;
qHeaderDelete.ExecSQL;
for I := 0 to Grid.Columns.Count - 1 do    // Iterate
  begin
  qHeaderInsert.Close;
//  qHeaderInsert.ParamByName('FORM').AsString:=FormName;
  qHeaderInsert.ParamByName('TREEID').AsInteger:=TreeID;
  qHeaderInsert.ParamByName('FIELD').AsString:=Grid.Columns[i].FieldName;
  if Grid.Columns[i].Width<=0
  then qHeaderInsert.ParamByName('SIZE').AsInteger:=1
  else qHeaderInsert.ParamByName('SIZE').AsInteger:=Grid.Columns[i].Width;
  if Grid.Columns[i].Visible
  then qHeaderInsert.ParamByName('SHOW').AsInteger:=1
  else qHeaderInsert.ParamByName('SHOW').AsInteger:=0;
  qHeaderInsert.ParamByName('HEADER').AsString:=Grid.Columns[i].Title.Caption;
  if length(trim(Grid.Columns[i].DisplayFormat))>0
  then qHeaderInsert.ParamByName('DISPLAYFORMAT').AsString:=Grid.Columns[i].DisplayFormat
  else qHeaderInsert.ParamByName('DISPLAYFORMAT').AsString:='';
  qHeaderInsert.ParamByName('ORDERBY').AsInteger:=i;
  qHeaderInsert.ExecSQL;
  end;    // for
end;

procedure TDM.SaveGlobalHeaderInForm(Field, Header, DisplayFormat:string;
          Size, OrderBy:integer; Show:boolean);
begin
qHeaderGlobDelete.Close;
//qHeaderGlobDelete.ParamByName('FORM').AsString:=FormName;
qHeaderGlobDelete.ParamByName('FIELD').AsString:=Field;
qHeaderGlobDelete.ExecSQL;
qHeaderGlobInsert.Close;
//qHeaderGlobInsert.ParamByName('FORM').AsString:=FormName;
qHeaderGlobInsert.ParamByName('FIELD').AsString:=Field;
if Size<=0
then qHeaderGlobInsert.ParamByName('SIZE').AsInteger:=1
else qHeaderGlobInsert.ParamByName('SIZE').AsInteger:=Size;
if Show
then qHeaderGlobInsert.ParamByName('SHOW').AsInteger:=1
else qHeaderGlobInsert.ParamByName('SHOW').AsInteger:=0;
qHeaderGlobInsert.ParamByName('HEADER').AsString:=Header;
qHeaderGlobInsert.ParamByName('DISPLAYFORMAT').AsString:=DisplayFormat;
qHeaderGlobInsert.ParamByName('ORDERBY').AsInteger:=Orderby;
qHeaderGlobInsert.ExecSQL;
end;

procedure TDM.SaveHeaderInForm(Field, Header,
      DisplayFormat: string; TreeId, Size, OrderBy: integer; Show:boolean);
begin
qHeaderDelete.Close;
//qHeaderDelete.ParamByName('FORM').AsString:=FormName;
qHeaderDelete.ParamByName('FIELD').AsString:=Field;
qHeaderDelete.ParamByName('TreeID').AsInteger:=TreeID;
qHeaderDelete.ExecSQL;
qHeaderInsert.Close;
//qHeaderInsert.ParamByName('FORM').AsString:=FormName;
qHeaderInsert.ParamByName('FIELD').AsString:=Field;
if Size<=0
then qHeaderInsert.ParamByName('SIZE').AsInteger:=1
else qHeaderInsert.ParamByName('SIZE').AsInteger:=Size;
if Show
then qHeaderInsert.ParamByName('SHOW').AsInteger:=1
else qHeaderInsert.ParamByName('SHOW').AsInteger:=0;
qHeaderInsert.ParamByName('HEADER').AsString:=Header;
qHeaderInsert.ParamByName('TREEID').AsInteger:=TreeID;
qHeaderInsert.ParamByName('DISPLAYFORMAT').AsString:=DisplayFormat;
qHeaderInsert.ParamByName('ORDERBY').AsInteger:=Orderby;
qHeaderInsert.ExecSQL;
end;

procedure TDM.RepaintGrid(var Grid:TDBGridEh; Treeid:integer);
var i:integer;
begin
Grid.Visible:=false;
Grid.Columns.Clear;
qDisplay.Close;
//qDisplay.ParamByName('FORM').AsString:=FormName;
// �������� ���� � �� �� ������� ��� ������� � �����������
// ��� ����� ����� �������� ParentID � �� ID
qDisplay.ParamByName('TREEID').AsInteger:=TreeID;
qDisplay.Open;
i:=0;
while not QDisplay.Eof do
  begin
  Grid.Columns.Add;
  Grid.Columns[i].FieldName:=QDisplay['GS_FIELD'];
  Grid.Columns[i].Width:=QDisplay['GS_SIZE'];
  Grid.Columns[i].Visible:=(QDisplay['GS_SHOW']=1);
  Grid.Columns[i].Title.Caption:=QDisplay['GS_HEADER'];
  if not VarIsNull(QDisplay['GS_DISPLAYFORMAT'])
    then if length(trim(QDisplay['GS_DISPLAYFORMAT']))>0
      then Grid.Columns[i].DisplayFormat:=QDisplay['GS_DISPLAYFORMAT'];
  inc(i);
  QDisplay.Next;
  end;
Grid.Visible:=true;
end;

function TDM.LoadRegister:boolean;
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
	{ TODO : �������� ������������� (������) ������ �� XOR }
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

{ TNodeRec }

procedure TNodeValue.Create;
begin
inherited Create;
F_ID:=0;
F_Value:='';
F_ParentID:=0;
F_ParentValue:='';
end;

function TNodeValue.GetID: integer;
begin
Result:=F_ID;
end;


function TNodeValue.GetParentID: integer;
begin
Result:=F_ParentID;
end;

function TNodeValue.GetParentValue: string;
begin
Result:=F_ParentValue;
end;

function TNodeValue.GetValue: string;
begin
Result:=F_Value;
end;

function TNodeValue.Print: string;
begin
Result:=IntToStr(F_ID)+' '+F_Value+' ! '+IntToStr(F_ParentID)+' '+F_ParentValue;
end;

procedure TNodeValue.SetID(const LID: integer);
begin
F_ID:=LID;
DM.GetParent(F_ID, F_ParentID, F_Value, F_ParentValue);
end;

end.