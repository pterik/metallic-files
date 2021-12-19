unit DataModule;

interface

uses
  SysUtils, Classes, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, 
  DateUtils, Controls, ComCtrls, DBGridEh, sTreeView, sBitBtn, sLabel, sEdit, sCheckBox,
  MemDS, DBAccess, Uni, DASQLMonitor, UniSQLMonitor;
  
const
  ShiftLeft = 30;
  ShiftTop = 30;
  RegisterBranchMetallica = 'SOFTWARE\PterikSoft\Metallica';


  ParameterVersion = 1;

type
  GridParameters = set of (Fields, FTree, FCompany);
  
  TNodeValue = class(TObject)
  private
    F_ID, F_ParentID: Integer;
    F_Value, F_ParentValue: string;
    procedure Create;
    function GetID: Integer;
    function GetParentValue: string;
    function GetValue: string;
    function GetParentID: Integer;
    procedure SetID(const LID: Integer);
  public
    property Id: Integer read GetID write SetID default 0;
    property ParentID: Integer read GetParentID default 0;
    property Value: string read GetValue;
    property ParentValue: string read GetParentValue;
    function Print: string;
  end;
  
  TDM = class(TDataModule)
    QICompany: TUniSQL;
    QUCompany: TUniSQL;
    QMaxCompany: TUniQuery;
    QSCompanyNames: TUniQuery;
    QCntrPhoneCompany: TUniQuery;
    QIPhoneCompany: TUniSQL;
    QUPhoneCompany: TUniSQL;
    QFindComNT: TUniQuery;
    QCntrComNT: TUniQuery;
    QCntrComNTCNTR: TIntegerField;
    QSettings: TUniQuery;
    qHeaderDelete: TUniSQL;
    QUComNT: TUniSQL;
    qDisplay: TUniQuery;
    qTreeChild: TUniQuery;
    qTreeParent: TUniQuery;
    qFindParent: TUniQuery;
    QMaxContact: TUniQuery;
    QMaxContactCNTR: TIntegerField;
    QUContactByComp: TUniSQL;
    QUCompanyByID: TUniSQL;
    QUContactsByOwner: TUniSQL;
    QUContactAuto: TUniSQL;
    QUContactByID: TUniSQL;
    QDelUsersForBoss: TUniSQL;
    QDContact: TUniSQL;
    qDelJobsForBoss: TUniSQL;
    qDelContactsViews: TUniSQL;
    QShortcut: TUniQuery;
    QShortcutCS_SHABLONE: TStringField;
    qHeaderGlobInsert: TUniSQL;
    qHeaderGlobDelete: TUniSQL;
    QUSettings: TUniSQL;
    QUUserbyID: TUniSQL;
    QIComNT: TUniSQL;
    QIContact: TUniSQL;
    qHeaderInsert: TUniSQL;
    QFindPhone: TUniQuery;
    QDPhone: TUniSQL;
    QUPhoneDT: TUniSQL;
    QUPhoneDT_Com: TUniSQL;
    QIPhone: TUniSQL;
    qHdrGlobExists: TUniQuery;
    qHdrGlobInsert: TUniSQL;
    qHdrUpdate: TUniSQL;
    qHdrInsert: TUniSQL;
    qHdrExists: TUniQuery;
    qHdrGlobUpdate: TUniSQL;
    UniSQLMonitor1: TUniSQLMonitor;
  private
    function CompanyDeleteBadNames(S: string; NChars: Integer): string;
    function CompanyNTMaxID: Integer;
    function CompanyNTUpdate(CompanyNameType: string): Boolean;
    procedure GetParent(const F_ID: Integer; var F_ParentID: Integer; var F_Value,
      F_ParentValue: string);
  public
    IsConnected: Boolean;
    function GetErrorByCode(CodeID: Integer): string;
    function Sendkey(const Key: Word; out SMessage: string): Boolean;
    function ReadSettings(name, default: string): string;
    function WriteSettings(name, Value: string): Boolean;
    procedure SaveGlobalHeader(Grid: TDBGridEh);
    procedure SaveHeader(Grid: TDBGridEh;
      Treeid: Integer);
    procedure SaveGlobalHeaderInForm(Field, Header,
      DisplayFormat: string; Size, OrderBy: Integer);
    procedure SaveHeaderInForm(Field, Header,
      DisplayFormat: string; TreeId, Size, Show, OrderBy: Integer);
    procedure RepaintGrid(var Grid: TDBGridEh; Treeid: Integer; GridFields:
      GridParameters);
    //  ==========================================
    procedure TreeFulFill(Tree: TsTreeView; isShowEmptyRows: Boolean; HeaderID: Integer);
    //  Функции и процедуры имеют префикс- имя таблицы. Сортировка по имени функции
    function CompanyClosebyID(CompanyID: Integer): Boolean;
    function CompanyInsert(const CompanyName, City: string; TrustLevel: Integer;
      const SComment, PriceLink, Business: string): Integer;
    function CompanyUpdate(CompanyID: Integer; const CompanyName, City: string;
      TrustLevel: Integer; const SComment, PriceLink, Business: string): Boolean;
    function CompanyMaxID: Integer;
    function CompanySearchLikeName(CompanyName: string; NChars: Integer;
      JustLike: Boolean; var Found: Integer): string;
    function CompanySearchExactName(CompanyName: string): Integer;
    function CompanyNTInsert(CompanyNameType: string): Boolean;
    function CompanyNTInsertOrUpdate(CompanyNameType: string;
      out OpType: string): Boolean;
    function ContactsCloseByOwner(Ownerid: Integer): Boolean;
    function ContactsCloseByCompany(Companyid: Integer): Boolean;
    function ContactInsert(ManagerID, OwnerID, CompanyID, Periodicity: Integer;
      Contacter, Comment, NextDate, JobComment: string; JobType: Integer): Boolean;
    function ContactUpdate(ContactID, ManagerID, OwnerID, CompanyID, Periodicity: Integer;
      Contacter, Comment, NextDate, JobComment: string; JobType: Integer): Boolean;
    function ContactUpdateAuto(ContactID, LastJobID, ClosedBy: Integer;
      LastJobDate, NextJobDate: string; isClosed: Boolean; CommentClose: string): Boolean;
    function ContactCloseByID(ContactID, ClosedByManager: Integer;
      CommentClose: string): Boolean;
    function ContactMaxID: Integer;
    function PhoneSearch(Phone: Int64): Integer;
    function PhoneInsert(Phone: Int64; Comment, Date1: string): Boolean;
    function PhoneUpdateDate(Phone: Int64; Date1: string): Boolean;
    function PhoneUpdateDateComment(Phone: Int64; Comment, Date1: string): Boolean;
    function PhoneDelete(Phone: Int64; Date1: string; Manager: Integer): Boolean;
    function PhoneCompanyInsertorUpdate(PhoneID: Int64;
      UserID, CompanyID: Integer; SDT: string): Boolean;
    function PhoneCompanyInsert(PhoneID: Int64; UserID, CompanyID: Integer;
      SDT: string): Boolean;
    function PhoneCompanyUpdate(PhoneID: Int64; UserID, CompanyID: Integer;
      SDT: string): Boolean;
    function PhoneCompanyExists(Phone: Int64; CompanyID: Integer): Boolean;
    function UserCloseAllViews(UseriD: Integer): Boolean;
    function UserClosebyID(UserID: Integer): Boolean;
    function CalcNextDate(LastDate: TDate; PeriodType: string;
      out IsClosed: Boolean): TDate;
  end;
var
  DM: TDM;

implementation

{$R *.dfm}
uses Dialogs, Variants, MainForm, CommonUnit;
{ TDM }

function TDM.GetErrorByCode(CodeID: Integer): string;
var
  WhereError: string;
begin
  //   GetErrorByCode(100X)
  case CodeID of //
    1001: WhereError:= 'SavePhones and SaveCompany';
    1002: WhereError:= 'SavePhonesCompanies';
    1003: WhereError:= 'SaveJob';
    1004: WhereError:= 'JobsClose';
    1005: WhereError:= 'ContactsClose';
    1006: WhereError:= 'JobsClose';
    1007: WhereError:= 'CompanyClose';
    1008: WhereError:= 'UserClose';
    1009: WhereError:= 'JobsCloseByCompany';
    1010: WhereError:= 'ContactsCloseByCompany';
    1011: WhereError:= 'CompanyClose';
    1012: WhereError:= 'SetCompany';
    1013: WhereError:= 'MainForm: QViewUsers.Open;';
    1014: WhereError:= 'UserCloseAllViews';
    1015: WhereError:= 'ContactInsert';
    1016: WhereError:= 'ContactCloseByID';
    1017: WhereError:= 'PhoneDelete';
    1018: WhereError:= 'UpdateContact';
    1019: WhereError:= 'InsertJob for AutoCreateJobs';
    1020: WhereError:= 'UpdateContact for AutoCreateJobs';
    1021: WhereError:= 'JobInsert';
    1022: WhereError:= 'CommonManager Update';
    1023: WhereError:= 'Delete User, Move jobs';
    1024: WhereError:= 'JobUpdate';
    1025: WhereError:= 'PhoneUpdate';
    1026: WhereError:= 'Неверный номер поставщика'
    else
      WhereError:= ', адрес ошибки неизвестен';
  end; // case
  Result:= 'Возникла ошибка ' + IntToStr(CodeID) + '  ' + WhereError +
    ' , обратитесь к разрабочику';
end;

function TDM.CompanyDeleteBadNames(S: string; NChars: Integer): string;
var
  DelStr: string;
begin
  //Функция удаляет некоторые распространенные слова из строки S
  // и затем копирует NChars символов в результат
  DelStr:= 'ЧП';
  while Pos(DelStr, S) > 0 do
    Delete(S, Pos(DelStr, S), Length(DelStr));
  DelStr:= 'ЗАТ';
  while Pos(DelStr, S) > 0 do
    Delete(S, Pos(DelStr, S), Length(DelStr));
  DelStr:= 'ВАТ';
  while Pos(DelStr, S) > 0 do
    Delete(S, Pos(DelStr, S), Length(DelStr));
  DelStr:= 'КОНЦЕРН';
  while Pos(DelStr, S) > 0 do
    Delete(S, Pos(DelStr, S), Length(DelStr));
  DelStr:= 'КОМПАН';
  while Pos(DelStr, S) > 0 do
    Delete(S, Pos(DelStr, S), Length(DelStr));
  DelStr:= 'ФИРМА';
  while Pos(DelStr, S) > 0 do
    Delete(S, Pos(DelStr, S), Length(DelStr));
  DelStr:= 'Ф' + Chr(178) + 'РМА';
  while Pos(DelStr, S) > 0 do
    Delete(S, Pos(DelStr, S), Length(DelStr));
  DelStr:= 'П' + Chr(178) + 'ДПРИ' + Chr(170) + 'МСТВО';
  while Pos(DelStr, S) > 0 do
    Delete(S, Pos(DelStr, S), Length(DelStr));
  Result:= copy(Trim(S), 1, NChars);
end;

function TDM.CompanyInsert(const CompanyName, City: string;
  TrustLevel: Integer; const SComment, PriceLink, Business: string): Integer;
var
  Res: Integer;
begin
  try
    Res:= CompanyMaxID + 1;
    QICompany.ParamByName('CM_ID').AsInteger:= Res;
    QICompany.ParamByName('CM_NAME').AsString:= ANSIUpperCase(CompanyName);
    QICompany.ParamByName('CM_CITY').AsString:= City;
    QICompany.ParamByName('CM_OWNER').AsInteger:= 1;
    QICompany.ParamByName('CM_TRUST').AsInteger:= TrustLevel;
    QICompany.ParamByName('CM_COMMENT').AsString:= SComment;
    QICompany.ParamByName('CM_ISCLOSED').AsInteger:= 0;
    QICompany.ParamByName('CM_HYPERLINK').AsString:= PriceLink;
    QICompany.ParamByName('CM_BUSINESS').AsString:= Business;
    QICompany.Execute;
  except
    on E: Exception do begin
      Result:= 0;
      raise;
      Exit;
    end;
  end;
  Result:= Res;
end;

function TDM.CompanyUpdate(CompanyID: Integer; const CompanyName, City: string;
  TrustLevel: Integer; const SComment, PriceLink, Business: string): Boolean;
begin
  try
    QUCompany.ParamByName('CM_ID').AsInteger:= CompanyID;
    QUCompany.ParamByName('CM_NAME').AsString:= ANSIUpperCase(CompanyName);
    QUCompany.ParamByName('CM_CITY').AsString:= ANSIUpperCase(City);
    QUCompany.ParamByName('CM_TRUST').AsInteger:= TrustLevel;
    QUCompany.ParamByName('CM_COMMENT').AsString:= SComment;
    QUCompany.ParamByName('CM_HYPERLINK').AsString:= PriceLink;
    QUCompany.ParamByName('CM_BUSINESS').AsString:= Business;
    QUCompany.Execute;
  except
    on E: Exception do begin
      Result:= False;
      Exit;
    end;
  end;
  Result:= True;
end;

function TDM.CompanyMaxID: Integer;
begin
  // Определить максимальное ID таблицы. Возможно, в дальнейшем этот кусок можно
  // мигрировать в триггеры, всё зависит от БД.
  QMaxCompany.Close;
  QMaxCompany.Open;
  if VarIsNull(QMaxCompany['CNTR']) then
    Result:= 0
  else
    Result:= QMaxCompany['CNTR'];
  //Некоторые БД выдают NULL для такого запроса
end;

function TDM.CompanySearchLikeName(CompanyName: string; NChars: Integer; JustLike:
  Boolean;
  var Found: Integer): string;
var
  SRes, Comp_NChars: string;
  FlagExact, FlagSimilar: Boolean;
begin
  CompanyName:= Trim(ANSIUpperCase(CompanyName));
  // Функция выдает несколько похожих и совпадающие названия, если такие есть
  // Found выводить количество ПОХОЖИХ названий, но не совпадающих с именем компании
  // Поднимаем флаг при первом проходе и опускаем при последующих
  // Параметр JUSTLIKE влияет только на результирующую строку, см. ниже
  SRes:= '';
  FlagExact:= False;
  FlagSimilar:= False;
  try
    QSCompanyNames.Close;
    QSCompanyNames.ParamByName('Param').AsString:= CompanyName;
    QSCompanyNames.Open;
    if not VarIsNull(QSCompanyNames['CM_NAME']) then
      FlagExact:= True;
    while not QSCompanyNames.EOF do begin
      if FlagExact then begin
        if not JustLike then
          SRes:= 'Совпадающее название:' + Chr(13) + Chr(10);
        //Если флаг JustLike поднят, точно совпадающее название в result строку не выводим
        FlagExact:= False;
      end;
      SRes:= SRes + QSCompanyNames['CM_NAME'] + ';' + Chr(13) + Chr(10);
      QSCompanyNames.Next;
    end; // while
    Comp_NChars:= CompanyDeleteBadNames(CompanyName, NChars);
    QSCompanyNames.Close;
    QSCompanyNames.ParamByName('Param').AsString:= '%' + Comp_NChars + '%';
    QSCompanyNames.Open;
    if not VarIsNull(QSCompanyNames['CM_NAME']) then
      FlagSimilar:= True;
    Found:= 0;
    while not QSCompanyNames.EOF do begin
      if FlagSimilar then begin
        SRes:= SRes + 'Похожие названия:' + Chr(13) + Chr(10);
        FlagSimilar:= False;
      end;
      if not (QSCompanyNames['CM_NAME'] = CompanyName) then begin
        SRes:= SRes + QSCompanyNames['CM_NAME'] + ';' + Chr(13) + Chr(10);
        Inc(Found);
      end;
      QSCompanyNames.Next;
    end; // while
    if Length(SRes) > 0 then
      Delete(SRes, Length(SRes) - 1, 2);
  except on E: Exception do begin
      Result:= '';
      Exit;
    end;
  end;
  Result:= SRes;
end;

function TDM.CompanySearchExactName(CompanyName: string): Integer;
begin
  CompanyName:= Trim(ANSIUpperCase(CompanyName));
  // Функция выдает true если точно такое имя существует
  try
    QSCompanyNames.Close;
    QSCompanyNames.ParamByName('Param').AsString:= CompanyName;
    QSCompanyNames.Open;
    if VarIsNull(QSCompanyNames['CM_ID']) then
      Result:= 0
    else
      Result:= QSCompanyNames['CM_ID'];
  except on E: Exception do begin
      Result:= 0;
      Exit;
    end;
  end;
end;

function TDM.PhoneCompanyExists(Phone: Int64; CompanyID: Integer): Boolean;
var
  R: Integer;
begin
  QCntrPhoneCompany.Close;
  QCntrPhoneCompany.ParamByName('PC_PHID').AsInteger:= Phone;
  QCntrPhoneCompany.ParamByName('PC_COMPANY').AsInteger:= CompanyID;
  QCntrPhoneCompany.Open;
  if VarIsNull(QCntrPhoneCompany['CNTR']) then
    R:= 0
  else
    R:= QCntrPhoneCompany['CNTR'];
  //Некоторые БД выдают NULL на такой запрос
  if R = 0 then
    Result:= False
  else
    Result:= True;
end;

function TDM.PhoneCompanyInsertorUpdate(PhoneID: Int64; UserID, CompanyID: Integer; SDT:
  string): Boolean;
begin
  if PhoneCompanyExists(PhoneID, CompanyID) then
    Result:= PhoneCompanyUpdate(PhoneID, UserID, CompanyID, SDT)
  else
    Result:= PhoneCompanyInsert(PhoneID, UserID, CompanyID, SDT);
end;

function TDM.PhoneCompanyInsert(PhoneID: Int64; UserID, CompanyID: Integer; SDT: string):
  Boolean;
begin
  try
    QIPhoneCompany.ParamByName('PC_PHID').AsInteger:= PhoneID;
    QIPhoneCompany.ParamByName('PC_UID').AsInteger:= UserID;
    QIPhoneCompany.ParamByName('PC_COMPANY').AsInteger:= CompanyID;
    QIPhoneCompany.ParamByName('PC_DATEUPDATE').AsDate:= StrToDate(SDT);
    QIPhoneCompany.Execute;
  except on E: Exception do begin
      Result:= False;
      Exit;
    end;
  end;
  Result:= True;
end;

function TDM.PhoneCompanyUpdate(PhoneID: Int64; UserID, CompanyID: Integer; SDT: string):
  Boolean;
begin
  try
    QUPhoneCompany.ParamByName('PC_PHID').AsInteger:= PhoneID;
    QUPhoneCompany.ParamByName('PC_COMPANY').AsInteger:= CompanyID;
    QUPhoneCompany.ParamByName('PC_UID').AsInteger:= UserID;
    QUPhoneCompany.ParamByName('PC_DATEUPDATE').AsDate:= StrToDate(SDT);
    QUPhoneCompany.Execute;
  except on E: Exception do begin
      Result:= False;
      Exit;
    end;
  end;
  Result:= True;
end;

function TDM.PhoneInsert(Phone: Int64; Comment, Date1: string): Boolean;
begin
  try
    qIPhone.ParamByName('PH_ID').AsInteger:= Phone;
    qIPhone.ParamByName('PH_COMMENT').AsString:= Comment;
    qIPhone.ParamByName('PH_DATEBEGIN').AsDate:= StrToDate(Date1);
    qIPhone.Execute;
  except on E: Exception do begin
      Result:= False;
      Exit;
    end;
  end;
  Result:= True;
end;

function TDM.PhoneSearch(Phone: Int64): Integer;
begin
  qFindPhone.Close;
  qFindPhone.ParamByName('PH_ID').AsInteger:= Phone;
  //qFindPhone.ParamByName('PH_STR').AsString:=SPhone;
  qFindPhone.Open;
  if VarIsNull(qFindPhone['CNTR']) then
    Result:= 0
  else
    Result:= qFindPhone['CNTR'];
  //некоторые БД возвращают NULL для таких запросов
end;

function TDM.PhoneUpdateDateComment(Phone: Int64; Comment, Date1: string): Boolean;
begin
  //При вызове телефон повторно помечается как активный
  try
    qUPhoneDT_Com.ParamByName('PH_DATEBEGIN').AsDate:= StrToDate(Date1);
    qUPhoneDT_Com.ParamByName('PH_COMMENT').AsString:= Comment;
    qUPhoneDT_Com.ParamByName('PH_ID').AsInteger:= Phone;
    qUPhoneDT_Com.Execute;
  except on E: Exception do begin
      Result:= False;
      Exit;
    end;
  end;
  Result:= True;
end;

function TDM.PhoneUpdateDate(Phone: Int64; Date1: string): Boolean;
begin
  //При вызове телефон повторно помечается как активный
  try
    qUPhoneDT.ParamByName('PH_ID').AsInteger:= Phone;
    qUPhoneDT.ParamByName('PH_DATEBEGIN').AsDate:= StrToDate(Date1);
    qUPhoneDT.Execute;
  except on E: Exception do begin
      Result:= False;
      Exit;
    end;
  end;
  Result:= True;
end;

function TDM.PhoneDelete(Phone: Int64; Date1: string; Manager: Integer): Boolean;
begin
  try
    qDPhone.ParamByName('PH_ID').AsInteger:= Phone;
    qDPhone.ParamByName('PH_DATEEND').AsDate:= StrToDate(Date1);
    qDPhone.ParamByName('PH_CLOSEDBY').AsInteger:= Manager;
    qDPhone.Execute;
  except on E: Exception do begin
      Result:= False;
      Exit;
    end;
  end;
  Result:= True;
end;

function TDM.ContactsCloseByOwner(Ownerid: Integer): Boolean;
begin
  try
    QUContactsByOwner.ParamByName('CN_OWNER').AsInteger:= OwnerID;
    QUContactsByOwner.Execute;
  except on E: Exception do begin
      Result:= False;
      Exit;
    end;
  end;
  Result:= True;
end;

function TDM.ContactsCloseByCompany(Companyid: Integer): Boolean;
begin
  try
    QUContactByComp.ParamByName('CN_COMPANY').AsInteger:= CompanyID;
    QUContactByComp.Execute;
  except on E: Exception do begin
      Result:= False;
      Exit;
    end;
  end;
  Result:= True;
end;

function TDM.UserClosebyID(UserID: Integer): Boolean;
begin
  try
    QUUserbyID.ParamByName('U_ID').AsInteger:= UserID;
    QUUserbyID.Execute;
  except on E: Exception do begin
      Result:= False;
      Exit;
    end;
  end;
  Result:= True;
end;

function TDM.CompanyClosebyID(CompanyID: Integer): Boolean;
begin
  //Пометить компанию как закрытую, неактивную
  try
    QUCompanyByID.ParamByName('CM_ID').AsInteger:= CompanyID;
    QUCompanyByID.Execute;
  except on E: Exception do begin
      Result:= False;
      Exit;
    end;
  end;
  Result:= True;
end;

function TDM.UserCloseAllViews(UseriD: Integer): Boolean;
begin
  //Функция отбирает права на просмотр для всех удаляемых пользователей
  // Таблицы JobsForBoss, ContactsViews по полю VIEWERID
  try
    qDelJobsForBoss.ParamByName('JB_VIEWERID').AsInteger:= UserID;
    qDelJobsForBoss.Execute;
    qDelContactsViews.ParamByName('CN_VIEWER').AsInteger:= UserID;
    qDelContactsViews.Execute;
    QDelUsersForBoss.ParamByName('UB_VIEWERID').AsInteger:= UserID;
    QDelUsersForBoss.Execute;
  except on E: Exception do begin
      Result:= False;
      Exit;
    end;
  end;
  Result:= True;
end;

function TDM.ContactCloseByID(ContactID, ClosedByManager: Integer; CommentClose: string):
  Boolean;
begin
  try
    QDContact.ParamByName('CN_ID').AsInteger:= ContactID;
    QDContact.ParamByName('CN_CLOSED_BY_MANAGER').AsInteger:= ClosedByManager;
    QDContact.ParamByName('CN_COMMENT_CLOSE').AsString:= CommentClose;
    QDContact.Execute;
  except on E: Exception do begin
      Result:= False;
      Exit;
    end;
  end;
  Result:= True;
end;

function TDM.ContactInsert(ManagerID, OwnerID, CompanyID, Periodicity: Integer;
  Contacter, Comment, NextDate, JobComment: string; JobType: Integer): Boolean;
begin
  try
    QIContact.ParamByName('CN_ID').AsInteger:= ContactMaxID + 1;
    QIContact.ParamByName('CN_OWNER').AsInteger:= OwnerID;
    QIContact.ParamByName('CN_MANAGER').AsInteger:= ManagerID;
    QIContact.ParamByName('CN_COMPANY').AsInteger:= CompanyID;
    QIContact.ParamByName('CN_CONTACTER').AsString:= Contacter;
    QIContact.ParamByName('CN_COMMENT').AsString:= Comment;
    QIContact.ParamByName('CN_JOBTYPE').AsInteger:= JobType;
    QIContact.ParamByName('CN_JOBCOMMENT').AsString:= JobComment;
    QIContact.ParamByName('CN_PERIODICITY').AsInteger:= Periodicity;
    //QIContact.ParamByName('CN_PARAMETER').AsString:=Parameter;
    QIContact.ParamByName('CN_NEXT_JOB_DATE').AsDate:= StrToDate(NextDate);
    QIContact.Execute;
  except on E: Exception do begin
      Result:= False;
      Exit;
    end;
  end;
  Result:= True;
end;

function TDM.ContactUpdate(ContactID, ManagerID, OwnerID, CompanyID, Periodicity: Integer;
  Contacter, Comment, NextDate, JobComment: string; JobType: Integer): Boolean;
begin
  try
    QUContactByID.ParamByName('CN_ID').AsInteger:= ContactID;
    QUContactByID.ParamByName('CN_OWNER').AsInteger:= OwnerID;
    QUContactByID.ParamByName('CN_MANAGER').AsInteger:= ManagerID;
    QUContactByID.ParamByName('CN_COMPANY').AsInteger:= CompanyID;
    QUContactByID.ParamByName('CN_CONTACTER').AsString:= Contacter;
    QUContactByID.ParamByName('CN_COMMENT').AsString:= Comment;
    QUContactByID.ParamByName('CN_JOBTYPE').AsInteger:= JobType;
    QUContactByID.ParamByName('CN_JOBCOMMENT').AsString:= JobComment;
    QUContactByID.ParamByName('CN_PERIODICITY').AsInteger:= Periodicity;
    //QUContactByID.ParamByName('CN_PARAMETER').AsString:=Parameter;
    QUContactByID.ParamByName('CN_NEXT_JOB_DATE').AsDate:= StrToDate(NextDate);
    QUContactByID.Execute;
  except on E: Exception do begin
      Result:= False;
      Exit;
    end;
  end;
  Result:= True;
end;

function TDM.ContactUpdateAuto(ContactID, LastJobID, ClosedBy: Integer;
  LastJobDate, NextJobDate: string; isClosed: Boolean; CommentClose: string): Boolean;
var
  DT: Variant;
begin
  try
    if isClosed then
      DT:= 0
    else
      DT:= StrToDate(NextJobDate);
    QUContactAuto.ParamByName('CN_ID').AsInteger:= ContactID;
    QUContactAuto.ParamByName('CN_LAST_JOB').AsInteger:= LastJobID;
    QUContactAuto.ParamByName('CN_LAST_JOB_DATE').AsDate:= StrToDate(LastJobDate);
    QUContactAuto.ParamByName('CN_NEXT_JOB_DATE').AsDate:= DT;
    if IsClosed then
      QUContactAuto.ParamByName('CN_ISCLOSED').AsInteger:= 1
    else
      QUContactAuto.ParamByName('CN_ISCLOSED').AsInteger:= 0;
    QUContactAuto.Execute;
    if IsClosed then
      ContactCloseByID(ContactID, ClosedBy, CommentClose);
  except on E: Exception do begin
      Result:= False;
      Exit;
    end;
  end;
  Result:= True;
end;

function TDM.ContactMaxID: Integer;
begin
  QMaxContact.Close;
  QMaxContact.Open;
  if VarIsNull(QMaxContact['CNTR']) then
    Result:= 0
  else
    Result:= QMaxContact['CNTR'];
end;

function TDM.CompanyNTInsert(CompanyNameType: string): Boolean;
begin
  try
    QIComNT.ParamByName('CNT_ID').AsInteger:= CompanyNTMaxID + 1;
    QIComNT.ParamByName('CNT_NAME').Asstring:= AnsiUpperCase(CompanynameType);
    QIComNT.ParamByName('CNT_CNTR').AsInteger:= 1;
    QIComNT.Execute;
  except on E: Exception do begin
      Result:= False;
      Exit;
    end;
  end;
  Result:= True;
end;

function TDM.CompanyNTUpdate(CompanyNameType: string): Boolean;
begin
  try
    //при каждом запуске добавляем +1
    QUComNT.ParamByName('CNT_ADD').AsInteger:= 1;
    QUComNT.ParamByName('CNT_NAME').Asstring:= AnsiUpperCase(CompanynameType);
    QUComNT.Execute;
  except on E: Exception do begin
      Result:= False;
      Exit;
    end;
  end;
  Result:= True;
end;

function TDM.CompanyNTInsertOrUpdate(CompanyNameType: string; out OpType: string):
  Boolean;
var
  Res: Integer;
begin
  QFindComNT.Close;
  QFindComNT.ParamByName('CNT_NAME').Asstring:= AnsiUpperCase(CompanynameType);
  QFindComNT.Open;
  if VarIsNull(QFindComNT['CNTR']) then
    Res:= 0
  else
    Res:= QFindComNT['CNTR'];
  if Res = 0 then begin
    Result:= CompanyNTInsert(CompanyNameType);
    OpType:= 'INS';
  end
  else begin
    Result:= CompanyNTUpdate(CompanyNameType);
    OpType:= 'UPD';
  end;

end;

function TDM.CompanyNTMaxID: Integer;
begin
  QCntrComNT.Close;
  QCntrComNT.Open;
  if VarIsNull(QCntrComNT['CNTR']) then
    Result:= 0
  else
    Result:= QCntrComNT['CNTR'];
end;

function TDM.CalcNextDate(LastDate: TDate; PeriodType: string;
  out IsClosed: Boolean): TDate;
var
  TmpDate: TDate;
  Year, Month, Day, DOW: Word;
begin
  Result:= 0;
  isClosed:= False;
  if PeriodType = 'ONCE' then begin
    isClosed:= True;
    Result:= 0;
  end;
  if PeriodType = 'WEEKLY' then
    Result:= LastDate + 7;
  if PeriodType = 'MONTHLY' then begin
    DecodeDateFully(LastDate, Year, Month, Day, DOW);
    Result:= LastDate + DaysInAMonth(Year, Month);
  end;
  if PeriodType = 'QUATERLY' then begin
    //Добавляем к дате три месяца подряд
    DecodeDateFully(LastDate, Year, Month, Day, DOW);
    TmpDate:= LastDate + DaysInAMonth(Year, Month);
    DecodeDateFully(TmpDate, Year, Month, Day, DOW);
    TmpDate:= TmpDate + DaysInAMonth(Year, Month);
    DecodeDateFully(TmpDate, Year, Month, Day, DOW);
    Result:= TmpDate + DaysInAMonth(Year, Month);
  end;
  if PeriodType = 'YEARLY' then begin
    DecodeDateFully(LastDate, Year, Month, Day, DOW);
    Result:= LastDate + DaysInAYear(Year);
  end;
end;

function TDM.Sendkey(const Key: Word; out SMessage: string): Boolean;
// Функция обрабатывает нажатие клавиши и возвращает текст Shortcut
begin
  SMessage:= '';
  QShortcut.Close;
  QShortcut.ParamByName('CS_SHORTCUT').AsInteger:= Key;
  QShortcut.Open;
  if not VarIsNull(QShortcut['CS_SHABLONE']) then begin
    SMessage:= QShortcut['CS_SHABLONE'];
    Result:= True;
  end
  else
    Result:= False;
end;

function TDM.ReadSettings(name, default: string): string;
begin
  QSettings.Close;
  QSettings.ParamByName('ST_NAME').AsString:= ANSIUpperCase(name);
  QSettings.Open;
  if VarIsNull(QSettings['ST_VALUE']) then
    Result:= default
  else
    Result:= QSettings['ST_VALUE'];
end;

function TDM.WriteSettings(name, Value: string): Boolean;
begin
  try
    QUSettings.ParamByName('ST_NAME').AsString:= ANSIUpperCase(name);
    QUSettings.ParamByName('ST_VALUE').AsString:= ANSIUpperCase(Value);
    QUSettings.Execute;
  except on E: Exception do begin
      Result:= False;
      Exit;
    end;
  end;
  Result:= True;
end;

procedure TDM.GetParent(const F_ID: Integer; var F_ParentID: Integer; var F_Value,
  F_ParentValue: string);
begin
  qFindParent.Close;
  qFindParent.ParamByName('ID').AsInteger:= F_ID;
  qFindParent.Open;
  if VarIsNull(QFindParent['PT_VALUE']) then
    F_Value:= ''
  else
    F_Value:= QFindParent['PT_VALUE'];
  if VarIsNull(QFindParent['PARENTID']) then
    F_ParentID:= 0
  else
    F_ParentID:= QFindParent['PARENTID'];
  if VarIsNull(QFindParent['PARENTVALUE']) then
    F_ParentValue:= ''
  else
    F_ParentValue:= QFindParent['PARENTVALUE'];
end;

procedure TDM.TreeFulFill(Tree: TsTreeView; isShowEmptyRows: Boolean; HeaderID: Integer);
var
  I, J, ChildCntr: Integer;
  ParentTreeNode, ChildTreeNode: TTreeNode;
  ShowTheRow: Boolean;
begin
  // Если IsShowEmptyRows = true, убраем ветки уровня 2, для которых нет строк
  Tree.Items.Clear;
  qTreeParent.Close;
  qTreeParent.Open;
  Tree.Items.BeginUpdate;
  for I:= 1 to qTreeParent.RecordCount do begin
    ParentTreeNode:= Tree.Items.AddChildObject(nil,
      qTreeParent.FieldByName('PT_VALUE').AsString,
      Pointer(qTreeParent.FieldByName('PT_ID').AsInteger));
    ParentTreeNode.ImageIndex:= 1;
    ParentTreeNode.SelectedIndex:= 2;
    qTreeChild.Close;
    qTreeChild.ParamByName('PARENTID').AsInteger:= qTreeParent['PT_ID'];
    qTreeChild.ParamByName('HEADERID').AsInteger:= HeaderID;
    qTreeChild.Open;
    ChildCntr:= 0;
    for J:= 1 to qTreeChild.RecordCount do begin
      ShowTheRow:= isShowEmptyRows or (qTreeChild['CNTR'] > 0);
      if ShowTheRow then begin
        Inc(ChildCntr);
        ChildTreeNode:= Tree.Items.AddChildObject(ParentTreeNode,
          qTreeChild.FieldByName('PT_VALUE').AsString,
          Pointer(qTreeChild.FieldByName('PT_ID').AsInteger));
        ChildTreeNode.ImageIndex:= 1;
        ChildTreeNode.SelectedIndex:= 2;
      end;
      qTreeChild.Next;
    end;
    qTreeParent.Next;
  end;
  Tree.Items.EndUpdate;
end;

procedure TDM.SaveGlobalHeader(Grid: TDBGridEh);
var
  I, Cntr: Integer;
begin
  for I:= 0 to Grid.Columns.Count - 1 do {// Iterate} begin
    qHdrGlobExists.ParamByName('FIELD').AsString:= Grid.Columns[I].FieldName;
    qHdrGlobExists.Open;
    if VarIsNull(qHdrGlobExists['CNTR']) then
      Cntr:= 0
    else
      Cntr:= qHdrGlobExists['CNTR'];
    if Cntr = 0 then begin
      qHdrGlobInsert.ParamByName('FIELD').AsString:= Grid.Columns[I].FieldName;
      qHdrGlobInsert.ParamByName('SIZE').AsInteger:= Grid.Columns[I].Width;
      qHdrGlobInsert.ParamByName('HEADER').AsString:= Grid.Columns[I].Title.Caption;
      qHdrGlobInsert.ParamByName('DISPLAYFORMAT').AsString:=
        Grid.Columns[I].DisplayFormat;
      qHdrGlobInsert.ParamByName('ORDERBY').AsInteger:= I;
      qHdrGlobInsert.Execute;
    end
    else begin
      qHdrGlobUpdate.ParamByName('FIELD').AsString:= Grid.Columns[I].FieldName;
      qHdrGlobUpdate.ParamByName('SIZE').AsInteger:= Grid.Columns[I].Width;
      qHdrGlobUpdate.ParamByName('HEADER').AsString:= Grid.Columns[I].Title.Caption;
      qHdrGlobUpdate.ParamByName('DISPLAYFORMAT').AsString:=
        Grid.Columns[I].DisplayFormat;
      qHdrGlobUpdate.ParamByName('ORDERBY').AsInteger:= I;
      qHdrGlobUpdate.Execute;
    end;
  end;
end;

procedure TDM.SaveHeader(Grid: TDBGridEh; Treeid: Integer);
var
  I, Cntr: Integer;
begin
  for I:= 0 to Grid.Columns.Count - 1 do {// Iterate} begin
    qHdrExists.ParamByName('FIELD').AsString:= Grid.Columns[I].FieldName;
    qHdrExists.ParamByName('TREEID').AsInteger:= TreeID;
    qHdrExists.Open;
    if VarIsNull(qHdrExists['CNTR']) then
      Cntr:= 0
    else
      Cntr:= qHdrExists['CNTR'];
    if Cntr = 0 then begin
      qHdrInsert.ParamByName('TREEID').AsInteger:= TreeID;
      qHdrInsert.ParamByName('FIELD').AsString:= Grid.Columns[I].FieldName;
      qHdrInsert.ParamByName('SIZE').AsInteger:= Grid.Columns[I].Width;
      qHdrInsert.ParamByName('HEADER').AsString:= Grid.Columns[I].Title.Caption;
      qHdrInsert.ParamByName('DISPLAYFORMAT').AsString:= Grid.Columns[I].DisplayFormat;
      qHdrInsert.ParamByName('SHOW').AsInteger:= 1;
      qHdrInsert.ParamByName('ORDERBY').AsInteger:= I;
      qHdrInsert.Execute;
    end
    else begin
      qHdrUpdate.ParamByName('TREEID').AsInteger:= TreeID;
      qHdrUpdate.ParamByName('FIELD').AsString:= Grid.Columns[I].FieldName;
      qHdrUpdate.ParamByName('SIZE').AsInteger:= Grid.Columns[I].Width;
      qHdrUpdate.ParamByName('HEADER').AsString:= Grid.Columns[I].Title.Caption;
      qHdrUpdate.ParamByName('DISPLAYFORMAT').AsString:= Grid.Columns[I].DisplayFormat;
      qHdrUpdate.ParamByName('SHOW').AsInteger:= 1;
      qHdrUpdate.ParamByName('ORDERBY').AsInteger:= I;
      qHdrUpdate.Execute;
    end;
  end;
end;

procedure TDM.SaveGlobalHeaderInForm(Field, Header, DisplayFormat: string;
  Size, OrderBy: Integer);
var
  Cntr: Integer;
begin
  qHdrGlobExists.Close;
  qHdrGlobExists.ParamByName('FIELD').AsString:= Field;
  qHdrGlobExists.Open;
  if VarIsNull(qHdrGlobExists['CNTR']) then
    Cntr:= 0
  else
    Cntr:= qHdrGlobExists['CNTR'];
  if Cntr = 0 then begin
    qHdrGlobInsert.ParamByName('FIELD').AsString:= Field;
    qHdrGlobInsert.ParamByName('SIZE').AsInteger:= Size;
    qHdrGlobInsert.ParamByName('HEADER').AsString:= Header;
    qHdrGlobInsert.ParamByName('DISPLAYFORMAT').AsString:= DisplayFormat;
    qHdrGlobInsert.ParamByName('ORDERBY').AsInteger:= Orderby;
    qHdrGlobInsert.Execute;
  end
  else begin
    qHdrGlobUpdate.ParamByName('FIELD').AsString:= Field;
    qHdrGlobUpdate.ParamByName('SIZE').AsInteger:= Size;
    qHdrGlobUpdate.ParamByName('HEADER').AsString:= Header;
    qHdrGlobUpdate.ParamByName('DISPLAYFORMAT').AsString:= DisplayFormat;
    qHdrGlobUpdate.ParamByName('ORDERBY').AsInteger:= Orderby;
    qHdrGlobUpdate.Execute;
  end;
end;

procedure TDM.SaveHeaderInForm(Field, Header,
  DisplayFormat: string; TreeId, Size, Show, OrderBy: Integer);
var
  Cntr: Integer;
begin
  qHdrExists.Close;
  qHdrExists.ParamByName('FIELD').AsString:= Field;
  qHdrExists.ParamByName('TREEID').AsInteger:= TreeID;
  qHdrExists.Open;
  if VarIsNull(qHdrExists['CNTR']) then
    Cntr:= 0
  else
    Cntr:= qHdrExists['CNTR'];
  if Cntr = 0 then begin
    qHdrInsert.ParamByName('FIELD').AsString:= Field;
    qHdrInsert.ParamByName('SIZE').AsInteger:= Size;
    qHdrInsert.ParamByName('HEADER').AsString:= Header;
    qHdrInsert.ParamByName('TREEID').AsInteger:= TreeID;
    qHdrInsert.ParamByName('SHOW').AsInteger:= Show;
    qHdrInsert.ParamByName('DISPLAYFORMAT').AsString:= DisplayFormat;
    qHdrInsert.ParamByName('ORDERBY').AsInteger:= Orderby;
    qHdrInsert.Execute;
  end
  else begin
    qHdrUpdate.ParamByName('FIELD').AsString:= Field;
    qHdrUpdate.ParamByName('SIZE').AsInteger:= Size;
    qHdrUpdate.ParamByName('HEADER').AsString:= Header;
    qHdrUpdate.ParamByName('TREEID').AsInteger:= TreeID;
    qHdrUpdate.ParamByName('SHOW').AsInteger:= Show;
    qHdrUpdate.ParamByName('DISPLAYFORMAT').AsString:= DisplayFormat;
    qHdrUpdate.ParamByName('ORDERBY').AsInteger:= OrderBy;
    qHdrUpdate.Execute;
  end;
end;

procedure TDM.RepaintGrid(var Grid: TDBGridEh; Treeid: Integer;
  GridFields: GridParameters);
var
  I: Integer;
begin
  Grid.Visible:= False;
  Grid.Columns.Clear;
  qDisplay.Close;
  //qDisplay.ParamByName('FORM').AsString:=FormName;
  // Выбираем одни и те же столбцы для раздела и подразделов
  // Для этого нужно отсылать ParentID а не ID
  qDisplay.ParamByName('TREEID').AsInteger:= TreeID;
  qDisplay.Open;
  I:= 0;
  while not QDisplay.Eof do begin
    if not (FCompany in GridFields) and (QDisplay['GS_FIELD'] = 'CM_NAME') then begin
      QDisplay.Next;
      Continue;
    end;
    if not (FCompany in GridFields) and (QDisplay['GS_FIELD'] = 'CM_CITY') then begin
      QDisplay.Next;
      Continue;
    end;
    if not (FTree in GridFields) and (QDisplay['GS_FIELD'] = 'PL_PARENT') then begin
      QDisplay.Next;
      Continue;
    end;
    if not (FTree in GridFields) and (QDisplay['GS_FIELD'] = 'PT_VALUE') then begin
      QDisplay.Next;
      Continue;
    end;
    Grid.Columns.Add;
    Grid.Columns[I].FieldName:= QDisplay['GS_FIELD'];
    Grid.Columns[I].Width:= QDisplay['GS_SIZE'];
    Grid.Columns[I].Visible:= (QDisplay['GS_SHOW'] = 1);
    Grid.Columns[I].Title.Caption:= QDisplay['GS_HEADER'];
    if not VarIsNull(QDisplay['GS_DISPLAYFORMAT']) then
      if Length(Trim(QDisplay['GS_DISPLAYFORMAT'])) > 0 then
        Grid.Columns[I].DisplayFormat:= QDisplay['GS_DISPLAYFORMAT'];
    Inc(I);
    QDisplay.Next;
  end;
  Grid.Visible:= True;
end;

{ TNodeRec }

procedure TNodeValue.Create;
begin
  inherited Create;
  F_ID:= 0;
  F_Value:= '';
  F_ParentID:= 0;
  F_ParentValue:= '';
end;

function TNodeValue.GetID: Integer;
begin
  Result:= F_ID;
end;

function TNodeValue.GetParentID: Integer;
begin
  Result:= F_ParentID;
end;

function TNodeValue.GetParentValue: string;
begin
  Result:= F_ParentValue;
end;

function TNodeValue.GetValue: string;
begin
  Result:= F_Value;
end;

function TNodeValue.Print: string;
begin
  Result:= IntToStr(F_ID) + ' ' + F_Value + ' ! ' + IntToStr(F_ParentID) + ' ' +
    F_ParentValue;
end;

procedure TNodeValue.SetID(const LID: Integer);
begin
  F_ID:= LID;
  DM.GetParent(F_ID, F_ParentID, F_Value, F_ParentValue);
end;

end.

