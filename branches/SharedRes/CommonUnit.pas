unit CommonUnit;

interface

uses
  Controls, Windows;

const
  params_default_file = 'database.ini';

type
  ChooseLanguage = (Russian, English);
  TBlock = record
    Id: Integer; {номер по списку}
    id_logical: Integer; {номер логический}
    type_block: string[20];
  end;
  TAgency = record
    name: string[10];
    Id: Integer;
    server: string[20];
    isOldFormat: Boolean;
    Name_ext: string[10];
    Dbase: string[20];
  end;
  TChannel = record
    Id: Integer;
    name: string;
    Ext: string;
    delta: Integer;
  end;
  TSetter = record
    name: string;
    Id: Integer;
  end;
  TServer = record
    Server, DataBase, BaseName, UserName, Password, FirstChar: string[40];
    id_agency: Integer;
    isOldFormat: Boolean;
  end;
  TFilter=object
  Field:array [1..5] of string;
  Text:array [1..5] of string;
  Value: array[1..5] of string;
  Business, CompanyLike, City:string;
  Counter:Integer;
  procedure ClearAll;
  procedure Clear(N:Integer);
  procedure RemoveFilter(N:integer);
  procedure Copy(N_From, N_To:Integer);
  procedure AddFilter(LField, LText, LValue:string);
  function Query:string;
  function Caption(N:Integer):string;

  end;

  //Работа с телефонами и другие вспомогательные
function FindPhone(var str: string; var phone: Integer): Boolean;
function FindPhone2(var strng: string; var phone: Longint): Boolean;
function FindPhone3(var strng: string; var isPrepared: Boolean; var phone: Int64):
  Boolean;
function FindPhoneOnce(var strng: string): Int64;
function PhoneToPhoneNew(var ANum: Int64): Boolean;
function PhoneToPhoneOld(var ANum: Int64): Boolean;
  {перевод любого телефона в 6-значный, даже если он уже не существует, например 7127244->127244}
function CalcBlock(const auction, forma: Integer): Integer;
function AuctionFromBlock(const id_block: Integer): Integer;
function FormaFromBlock(const id_block: Integer): Integer;
function CalcSignature(const str: string): Integer;
function CalcLongSignature(const strng: string): Int64;
function ParsePhoneByNumber(Number: Int64): string;
//работа с текстовыми строками и датами
function AddSpaces(const Strn: string; len: Integer): string;
function AddSpaces2(Strn: string; lenStrn: Integer; isLeftAlign: Boolean): string;
function isRussianChars(const Strng: string): Boolean;
function CheckLength(const Str: string): Integer;
procedure DosToWin(var Str: string);
function FDosToWin(const Str: string): string;
procedure WinToDos(var Str: string);
function FWinToDos(const Str: string): string;
procedure WinToDosInByte(var Chr: Byte);
function ConvertDateToFName(const D: TDateTime): string;
function ConvertDateToStr(const D: TDateTime): string;
function DeleteReturns(const A: string): string;
function DeleteLastReturn(Strn: string): string;
function DeleteFirstSpaces(const A: string): string;
function MondayOfDate(const Day: TDate): TDate;
function DayOfWeekRussian(CurDate: TDateTime): Integer;
function DetectDay(CurDate: TDateTime): string;
function Decrypt(const AStrng: AnsiString): String;
//Процедуры работы с реестром
function WriteToRegistry(const FVar, FProg, FName: string): Boolean;
function ReadFromRegistry(var FVar: string; const FProg, FName: string): Boolean;
function WriteRegisterStr(const FVar, FBranch, FName: string): Boolean;
function WriteRegisterDWORD(const FVar: Integer; FBranch, FName: string): Boolean;
function ReadRegisterStr(var FVar: string; const FBranch, FName: string): Boolean;
function ReadRegisterDWORD(var FVar: Integer; const FBranch, FName: string): Boolean;
function RegisterRecordExists(const FBranch: string): Boolean;
function ReadOnlyBranch(const FBranch: string; var KAccess: Longword): Boolean;
function DeleteRegister(const FName: string): Boolean;
function NameToDeposit(const FStr: string; const Gazeta: Integer): string;
function GetUser(var AUser, APWD, AName: string; var AID: Integer): Boolean;
  //Читается из реестра
function SetUser(const AUser, APWD, AName: string; const AID: Integer): Boolean;
  //записывается в реестр
function DetectDCOM: Boolean; //Определение чтением из реестра
function DetectMDAC: Boolean; //Определение чтением из реестра
//Функции работы с именами файлов и путями, определение имени программы
function SaveFileToDir(const Source, Dir: string; const IDRub: Integer): Boolean;
function MoveFile(const Source, Dest: string): Boolean;
function CopyFile(const Source, Dest: string; var MessageStr: string): Boolean;
function FreeDisk(const S: string): Int64; //Есть ли место на диске, который указан в пути
function DeleteFolder(const DirDest: string): Boolean;
function GetProgName: string; //Функция определяет имя программы
function GetProgDir: string; //Функция определяет путь запускаемой программы
function GetProgDirWOLetter: string;
procedure ShellOpen(hWnd: HWND; const FileName: string);
  //Функция определяет путь запускаемой программы без первой буквы (С:)
function GetTxtVersion(ProgName: string; Version: Integer; Language: ChooseLanguage):
  string;

implementation

uses
  Registry, Classes, Sysutils, Dialogs, ShellApi;

function DayOfWeekRussian(CurDate: TDateTime): Integer;
begin
  Result:= DayOfWeek(CurDate) - 1;
  if Result = 0 then
    Result:= 7;
end;

function DetectDay(CurDate: TDateTime): string;
begin
  case DayOfWeek(CurDate) of
    1: Result:= 'воскресенье';
    2: Result:= 'понедельник';
    3: Result:= 'вторник';
    4: Result:= 'среда';
    5: Result:= 'четверг';
    6: Result:= 'пятница';
    7: Result:= 'суббота';
  end; {case}
end;

function ConvertDateToStr(const D: TDateTime): string;
var
  Year, Month, Day: Word;
  Str: string;
begin
  DecodeDate(D, Year, Month, Day);
  if Day > 9 then
    Str:= IntToStr(Day)
  else
    Str:= '0' + IntToStr(Day);
  Str:= Str + '.';
  if Month > 9 then
    Str:= Str + IntToStr(Month)
  else
    Str:= Str + '0' + IntToStr(Month);
  Str:= Str + '.';
  Result:= Str + IntToStr(Year);
end;

function ConvertDateToFName(const D: TDateTime): string;
var
  Year, Month, Day: Word;
  StrName: string;
begin
  DecodeDate(D, Year, Month, Day);
  case Month of
    1: StrName:= 'jan';
    2: StrName:= 'feb';
    3: StrName:= 'mar';
    4: StrName:= 'apr';
    5: StrName:= 'may';
    6: StrName:= 'june';
    7: StrName:= 'july';
    8: StrName:= 'aug';
    9: StrName:= 'sept';
    10: StrName:= 'oct';
    11: StrName:= 'nov';
    12: StrName:= 'dec';
    else begin
        MessageDlg('Ошибка работы программы, сбой в конверторе дат', mtError, [mbOK], 0);
        Result:= '???';
      end;
  end; {case}
  if Day > 9 then
    StrName:= IntToStr(Day) + StrName
  else
    StrName:= '0' + IntToStr(Day) + StrName;
  Result:= StrName;
end;

function CalcBlock(const auction, forma: Integer): Integer;
begin
  {Функция рассчитывает тип id_block из forma auction.
  При превышении правил она формирует id_block "по максимуму" для восстановления сбоев с минимальными потерями}
  Result:= 106;
  if (forma = 0) and (auction >= 3) then
    Result:= 101; {обычн}
  if (forma >= 1) and (auction >= 4) then
    Result:= 103; {выделен}
  if (forma >= 3) and (auction >= 3) then
    Result:= 102; {рамка}
  if (forma >= 4) and (auction >= 6) then
    Result:= 104; {дайджест}
end;

function AuctionFromBlock(const id_block: Integer): Integer;
{Функция вычисляет поле auction для старых баз из id_block.
Правило такое:
для А/ТВК результат всегда 0
Для br (101) результат 0+3, возврат 3
Для ram (102)результат 3+3, возврат 3
Для vd (103) результат 1+4, возврат 4
Для didj (104)результат 4+6, возврат 6
Для code (105)результат 0+3, возврат 3
Для free (106,107) результат 0+0, возврат 0
Это правило может измениться}
begin
  case id_block of
    101: Result:= 3;
    102: Result:= 3;
    103: Result:= 4;
    104: Result:= 6;
    105: Result:= 3
    else
      Result:= 0;
  end; {case}
end;

function FormaFromBlock(const id_block: Integer): Integer;
{ Функция вычисляет поле forma для старых баз из id_block
Правило такое:
для А/ТВК результат всегда 0
Для br (101) результат 0+3, возврат 0
Для ram (102)результат 3+3, возврат 3
Для vd (103) результат 1+4, возврат 1
Для didj (104)результат 4+6, возврат 4
Для code (105)результат 0+3, возврат 0
Для free (106,107) результат 0+0, возврат 0
Это правило может измениться}
begin
  case id_block of
    101: Result:= 0;
    102: Result:= 3;
    103: Result:= 1;
    104: Result:= 4;
    else
      Result:= 0;
  end; {case}
end;

function CalcSignature(const str: string): Integer;
var
  I: Integer;
  R: Integer;
begin
  R:= 0;
  for I:= 1 to Length(str) do
    R:= R + Word(str[I]);
  Result:= R mod 5000;
end;

function CalcLongSignature(const strng: string): Int64;
var
  I, J, Len: Integer;
  Step: Int64;
  R: array of Byte;
  Res: array[1..8] of Byte;
  //Расчет фукции хэширования на поразрядном XOR. Размер 8 байт, 64 бит
  //Переводим строку 8-битовых char в буфер
begin
  try
    if Length(Strng) = 0 then begin
      Result:= 0;
      Exit;
    end;
    Len:= 1 + (Length(strng) div 8);
    SetLength(R, 8 + Len * 9);
    for I:= 1 to Len * 8 do begin
      if I <= Length(strng) then
        R[I]:= Byte(Strng[I])
      else
        R[I]:= $A5;
    end;
    for J:= 1 to 8 do
      Res[J]:= 0;
    for J:= 1 to 8 do
      for I:= 1 to Len do //проход от второго до последнего столбца
        Res[J]:= Res[J] xor R[I * 8 + J];
    Result:= 1;
    Step:= 1;
    for I:= 1 to 8 do begin
      Result:= Result + Res[I] * Step;
      Step:= Step * 256;
    end;
  except on E: Exception do
      MessageDlg('Исключение в CalcLongSignature, сообщите разработчику об ошибке',
        mtError, [mbOK], 0);
  end;
end;

function ParsePhoneByNumber(Number: Int64): string;
var
  Str: string;
  I, Len: Integer;
begin
  Str:= IntToStr(Number);
  Len:= Length(Str);
  if Len <10 then
    for I:= Length(Str) + 1 to 10 do
      Str:= '0' + Str;
  Result:= '(' + Copy(Str, 1, 3) + ') ' + Copy(Str, 4, 3) + '-'
    + Copy(Str, 7, 2) + '-' + Copy(Str, 9, 2);
end;

function MondayofDate(const Day: TDate): TDate;
var
  DWeek: Integer;
begin
  DWeek:= DayOfWeek(Day);
  case Dweek of
    1: Result:= Day - 6;
    2: Result:= Day;
    3: Result:= Day - 1;
    4: Result:= Day - 2;
    5: Result:= Day - 3;
    6: Result:= Day - 4;
    7: Result:= Day - 5;
    else
      Result:= 0;
  end;
end;

function CheckLength(const Str: string): Integer;
var
  I, J, words, max_mas: Integer;
  Mas: array[1..200] of Integer;
begin
  words:= 0;
  J:= 1;
  Mas[1]:= 1;
  for I:= 1 to Length(str) do begin
    if (str[I] = ' ') then begin
      Inc(J);
      Mas[J]:= I;
    end;
  end;
  max_mas:= J;
  for J:= 1 to max_mas - 1 do
    if Mas[J + 1] - Mas[J] > 3 then begin
      Inc(words);
    end;
  Result:= 1 + words div 20;
end;

procedure WinToDos(var Str: string);
var
  I: Integer;
  ch: Byte;
begin
  for I:= 1 to Length(Str) do begin
    ch:= Byte(str[I]);
    if (ch >= 192) and (ch <= 239) then
      str[I]:= Char(ch - 64);
    if (ch >= 240) then
      str[I]:= Char(ch - 16);
    if ch = $A8 then
      str[I]:= Char($F0);
    if ch = $B8 then
      str[I]:= Char($F1);
    if ch = $B9 then
      str[I]:= Char($FC);
  end;
end;

function FWinToDos(const Str: string): string;
var
  S: string;
begin
  S:= Str;
  WinToDos(S);
  Result:= S;
end;

procedure WinToDosInByte(var Chr: Byte);
var
  ch: Byte;
begin
  ch:= Chr;
  if (ch >= 192) and (ch <= 239) then
    Chr:= ch - 64;
  if (ch >= 240) then
    Chr:= ch - 16;
  if ch = $A8 then
    Chr:= $F0;
  if ch = $B8 then
    Chr:= $F1;
  if ch = $B9 then
    Chr:= $FC;
end;

procedure DosToWin(var Str: string);
var
  I: Integer;
  ch: Byte;
begin
  for I:= 1 to Length(Str) do begin
    ch:= Byte(str[I]);
    if (ch >= 128) and (ch <= 175) then
      str[I]:= Char(ch + 64);
    if (ch >= 224) and (ch <= 239) then
      str[I]:= Char(ch + 16);
    if (ch = 240) then
      str[I]:= 'Ё';
    if (ch = 241) then
      str[I]:= 'ё';
    if (ch = 242) then
      str[I]:= 'Є';
    if (ch = 243) then
      str[I]:= 'є';
    if (ch = 244) then
      str[I]:= 'Ї';
    if (ch = 245) then
      str[I]:= 'ї';
    if (ch = 252) then
      str[I]:= '№';
  end;
end;

function FDosToWin(const Str: string): string;
var
  S: string;
begin
  S:= Str;
  DosToWin(S);
  Result:= S;
end;

function FindPhone(var str: string; var phone: Integer): Boolean;
var
  pstn: Integer;
  strphone: string;
  phone64: Int64;
begin
  {При нахождении телефона он удалется из присылаемой строки и заполняется phone
  Если телефона нет, то Result:=false
  Снаружи должна стоять проверка на Result и на размер возвращаемой строки
  Если стока пустая то искать дальше не имеет смысла
  Правило телефона следующее:
  если это межгород, то телефон начинается с 8 и далее 10 цифр и тире
  используются ли скобки? непонятно но неплохо было бы использовать
  разделителями в межгороде являются тире и скобки, всего 11 цифр включая ведущую 8
  если это город, то в нем 5,6 или 7 цифр и одно-два тире, скобок нет, это требование жесткое
  разделителями являются только тире, остальные знаки не входят }
  { TODO : сейчас межгородские телефоны не блокируются, доработать }
  {если телефон найден то телефон из строки удаляется и result:=true}
  {Алгоритм поиска следующий: удаляем ведущие символы до первой цифры,
  затем копируем в новую строку начиная с первой цифры до символа-разделителя
  и удалем скопированное в первоначальной строке}
  Result:= True;
  while (Length(str) > 4) do
    if not (str[1] in ['0'..'9', '(']) then
      delete(str, 1, 1)
    else
      Break;
  if Length(str) < 5 then begin
    Result:= False;
    str:= '';
    Exit;
  end;
  pstn:= 1;
  repeat
    if not (str[pstn] in ['0'..'9', '-', '(', ')']) then
      Break
    else
      Inc(pstn);
  until pstn > Length(str);
  Dec(pstn);
  strphone:= Copy(str, 1, pstn);
  Str:= Copy(str, pstn + 1, Length(str) - pstn);
  {Теперь крутим strphone как можем на предмет телефонности.
  Если strphone не имеет телефона,то запускаем еще раз,выход по первому exit для которого length<5}
  if (pos('-', strphone) = 0) then begin
    Result:= False;
    Exit;
  end;
  {Если нет минуса- не телефон}
  if (pos('-', strphone) = Length(strphone)) then begin
    Result:= False;
    Exit;
  end;
  {Если минус в конце - не телефон}
  while pos('-', strphone) > 0 do
    delete(strphone, pos('-', strphone), 1);
  while pos('(', strphone) > 0 do
    delete(strphone, pos('(', strphone), 1);
  while pos(')', strphone) > 0 do
    delete(strphone, pos(')', strphone), 1);
  if strphone[1] = '8' then
    Delete(strphone, 1, 1); {храним без ведущей 8, иначе не входит в размер integer}
  if not ((Length(strphone) = 6) or (Length(strphone) = 7) or (Length(strphone) = 10)) then
    begin
    Result:= False;
    Exit;
  end;
  try
    phone64:= StrToInt64(strPhone);
  except on E: EConvertError do begin
      MessageDlg('Ошибка программы, при конвертировании в телефон, сообщите разработчику',
        mtError, [mbOK], 0);
      Result:= False;
      phone64:= 0;
      str:= '';
    end;
  end;
  if (phone64 < 2147483647) and (phone64 > 99999) then
    phone:= phone64
  else begin
    Result:= False;
    phone:= 0;
  end;
end;

function FindPhone2(var strng: string; var phone: Longint): Boolean;
var
  I, pstn: Integer;
  Strn2, strphone: string;
begin
  {Внимание! Строка изменяется при работе,сделать копию если нужно её сохранить в БД
  При нахождении телефона он удалется из присылаемой строки и заполняется phone
  Если телефона нет, то Result:=false. Снаружи должна стоять проверка на
    while FindPhone2() do
  Алгоритм поиска следующий:
  Удаляем ВСЕ символы оставляем только цифры и разделители.
  ВСе разделители переводим в ";" убираем "," и "("
  Если в конце не стоит разделитель, добавляем его.
  Убираем двойные разделители если они есть.
  Затем копируем в новую строку B начиная с первой цифры до разделителя
  и удалем скопированное в первоначальной строке.
  Из новой строки B формируем телефон
  Если цифр в строке B больше не осталось, возвращаем false
  Если цифры в строке В не являются телефоном}
  if Length(Strng) < 4 then begin
    phone:= 0;
    Result:= False;
    Exit;
  end;
  Strn2:= '';
  while Pos('(044)', Strng) > 0 do
    Delete(Strng, Pos('(044)', Strng), 5);
  for I:= 1 to Length(Strng) do begin
    if strng[I] in ['0'..'9', ';'] then
      Strn2:= Strn2 + Strng[I];
    if (strng[I] = '(') or (strng[I] = ',') then
      Strn2:= Strn2 + ';';
  end;
  Strn2:= Strn2 + ';';
  while (pos(';;', strn2) > 0) do
    delete(strn2, pos(';;', strn2), 1);
  while Pos(';', Strn2) = 1 do
    delete(strn2, 1, 1);
  Pstn:= Pos(';', Strn2);
  Strphone:= Copy(Strn2, 1, pstn - 1);
  Strn2:= Copy(strn2, pstn + 1, Length(strn2) - pstn);
  Result:= True;
  if (Length(Strn2) > 7) and (Strn2[1] = '8') then
    Delete(Strn2, 1, 1);
  if Length(StrPhone) < 7 then begin
    //Почему-то неверно определился телефон, перестраховка
    Phone:= 0;
    Result:= False;
    Exit;
  end;
  Strng:= Strn2;
  try
    phone:= StrToInt64(strPhone);
  except on E: EConvertError do begin
      Result:= False;
      phone:= 0;
    end;
  end;
end;

function FindPhone3(var strng: string; var isPrepared: Boolean; var phone: Int64):
  Boolean;
var
  I, pstn: Integer;
  Strn2, strphone: string;
begin
  {Внимание! Строка изменяется при работе,сделать копию если нужно её сохранить в БД
  Устанавливается IsPrepared=true для более быстрого разбора при повторных запусках
  При нахождении телефона он удалется из присылаемой строки и заполняется phone
  Если телефона нет, то Result:=false. Снаружи должна стоять проверка на
    while FindPhone3() do
  Алгоритм поиска следующий:
  Удаляем ВСЕ символы оставляем только цифры и разделители.
  ВСе разделители переводим в ";" убираем "," и "("
  Если в конце не стоит разделитель, добавляем его.
  Убираем двойные разделители если они есть.
  Затем копируем в новую строку B начиная с первой цифры до разделителя
  и удалем скопированное в первоначальной строке.
  Из новой строки B формируем телефон
  Если цифр в строке B больше не осталось, возвращаем false
  Если цифры в строке В не являются телефоном}
  if Length(Strng) < 4 then begin
    phone:= 0;
    isPrepared:= True;
    Result:= False;
    Exit;
  end;
  Strn2:= '';
  while Pos('(044)', Strng) > 0 do
    Delete(Strng, Pos('(044)', Strng), 5);
  if not IsPrepared then begin
    for I:= 1 to Length(Strng) do begin
      if strng[I] in ['0'..'9'] then
        Strn2:= Strn2 + Strng[I]
      else
        Strn2:= Strn2 + ';';
    end;
    Strn2:= Strn2 + ';';
    while (pos(';;', strn2) > 0) do
      delete(strn2, pos(';;', strn2), 1);
    while Pos(';', Strn2) = 1 do
      delete(strn2, 1, 1);
  end
  else
    Strn2:= Strng;
  isPrepared:= True;
  Pstn:= Pos(';', Strn2);
  Strphone:= Copy(Strn2, 1, pstn - 1);
  Strn2:= Copy(strn2, pstn + 1, Length(strn2) - pstn);
  Strng:= Strn2;
  Result:= True;
  if Length(StrPhone) = 7 then begin
    //Дописываем к телефону 044
    StrPhone:= '044' + StrPhone;
    Result:= True;
  end;
  if Length(StrPhone) < 7 then begin
    phone:= 0;
    Result:= True;
    Exit;
  end;
  try
    phone:= StrToInt64(strPhone);
  except on E: EConvertError do begin
      Result:= False;
      phone:= 0;
    end;
  end;
end;

function FindPhoneOnce(var strng: string): Int64;
var
  I: Integer;
  Strn2: string;
begin
  {Телефон в строке ищется лишь однажды.
  Если телефона нет, то Result:=0.
  Алгоритм поиска следующий:
  Удаляем ВСЕ символы оставляем только цифры.
  Переводим в integer. Если передача не удалась, возвращаем 0.
  Проверяем попадание в семизначный+две.
  Если телефон принадлежит 8-800, также определяем это.
  Затем преобразуем в "нормальный" номер безу нулей в начале.
  И готовим строку возврата с лидирующими нулями.
  }
  Strn2:= '';
  for I:= 1 to Length(Strng) do
    if strng[I] in ['0'..'9'] then
      Strn2:= Strn2 + Strng[I];
  if Length(Strn2) <> 9 then begin
    Result:= 0;
    Exit;
  end;
  try
    Result:= StrToInt64(strn2);
  except on E: EConvertError do begin
      Result:= 0;
    end;
  end;
end;

function GetProgDir: string;
begin
  Result:= ExtractFileDir(Paramstr(0));
end;

function GetProgDirWOLetter: string;
var
  FStr: string;
begin
  FStr:= ExtractFileDir(Paramstr(0));
  Result:= Copy(FStr, 3, Length(FStr) - 2);
end;

procedure ShellOpen(hWnd: HWND; const FileName: string);
var
  Code: Integer;
begin
  Code:=  ShellExecute(hWnd, 'open', PChar(FileName), nil, nil, SW_SHOWNORMAL);
  case Code of
    SE_ERR_NOASSOC, SE_ERR_ASSOCINCOMPLETE :
      Code:= ShellExecute(hWnd, 'open', PChar('rundll32.exe'),
        PChar('shell32.dll,OpenAs_RunDLL ' + FileName), nil, SW_SHOWNORMAL);
  end;
  if Code <= 32 then
    RaiseLastOSError;
end;

function GetProgName: string;
begin
  Result:= ExtractFileName(Paramstr(0));
end;

function DeleteReturns(const A: string): string;
var
  I: Integer;
  strng: string;
begin
  strng:= A;
  for I:= 1 to Length(strng) do
    if strng[I] in [Char(13), Char(10)] then
      strng[I]:= ' ';
  Result:= strng;
end;

function DeleteLastReturn(Strn: string): string;
var
  Ch: string;
begin
  //Удаляем неправильные конечные символы
  Ch:= copy(Strn, Length(Strn), 1);
  if (Ch = Chr(10)) or (ch = Chr(13)) then
    Delete(Strn, Length(Strn), 1);
  Ch:= copy(Strn, Length(Strn), 1);
  if (Ch = Chr(10)) or (ch = Chr(13)) then
    Delete(Strn, Length(Strn), 1);
  Result:= strn;
end;

function DeleteFirstSpaces(const A: string): string;
var
  strng: string;
begin
  if Length(A) < 1 then begin
    Result:= '';
    Exit;
  end;
  strng:= A;
  while pos(' ', strng) = 1 do
    Delete(strng, 1, 1);
  Result:= strng;
end;

function PhoneToPhoneNew(var ANum: Int64): Boolean;
begin
  {Процедура переводит телефон Num в новый
  Обрабатываются следующие ситуации:
  Телефон не 6-значный или неверный 7-значный - возвращаем false, Num не изменился
  Телефон старый 6-значный - возврат 7-значного и true
  Телефон 6-значный без семерок - возврат true, Num не изменился}
  {710,711,712,713,715,770,771,772,773,774,775,776,777,778,779}
  if (ANum > 80100000000) and (ANum < 89999999999) then begin
    ANum:= ANum - 80000000000;
    Result:= True;
    Exit;
  end;
  if (ANum < 100000) or (ANum > 7999999) then begin
    Result:= False;
    Exit; {неверный телефон}
  end;
  if (ANum >= 100000) and (ANum <= 999999) then begin
    Result:= True;
    if (ANum div 10000 in [10, 11, 12, 13, 15, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79])
      then
      ANum:= ANum + 7000000;
  end
  else begin
    Result:= ((ANum - 7000000) div 10000 in [10, 11, 12, 13, 15, 70, 71, 72, 73, 74, 75,
      76, 77, 78, 79]);
  end;
end;

function PhoneToPhoneOld(var ANum: Int64): Boolean;
begin
  {Процедура переводит телефон Num в шестизначный
  Обрабатываются следующие ситуации:
  Сотовый телефон - добавляем 80 и возвращаем
  Диапазон сотовых телефонов от 80-10 000-00-00 до 80-99 999-99-99
  Новый телефон неверный - возвращаем false, Num не изменился
  Телефон верный 7-значный - возврат true, тот же телефон без 7 в начале
  Телефон любой 6-значный - возврат true, тот же телефон }
  {710,711,712,713,715,770,771,772,773,774,775,776,777,778,779}
  {Проверка диапазона телефонов}
  if (ANum > 100000000) and (ANum < 999999999) then begin
    ANum:= ANum + 80000000000;
    Result:= True;
    Exit;
  end;
  if (ANum < 100000) or (ANum > 7999999) then begin
    Result:= False;
    Exit; {неверный телефон}
  end;
  {Является ли 7-значным телефон}
  if (ANum >= 1000000) and (ANum < 7999999) then begin
    Result:= ((ANum - 7000000) div 10000 in [10, 11, 12, 13, 15, 70, 71, 72, 73, 74, 75,
      76, 77, 78, 79]);
    if Result then
      ANum:= ANum - 7000000;
  end
    {Если телефон 6-значный другая проверка}
  else
    Result:= True;
end;

function GetUser(var AUser, APWD, AName: string; var AID: Integer): Boolean;
{Процедура читает имя пользователя из реестра. Если имя не указано или нет такого реестра, то выдается false}
var
  R: TRegistry;
begin
  R:= TRegistry.Create;
  try
    R.Rootkey:= HKEY_CURRENT_USER;
    R.OpenKey('SOFTWARE\PterikSoft\TyperADS', False);
    AUSER:= R.ReadString('USER');
    APWD:= R.ReadString('PWD');
    AName:= R.ReadString('Name');
    AID:= R.ReadInteger('ID');
    R.CloseKey;
  except on E: ERegistryException do begin
      Result:= False;
      R.Free;
      Exit;
    end;
  end;
  Result:= True;
  if (AUSER = '') or (APWD = '') then
    Result:= False;
  R.Free;
end;

function SetUser(const AUser, APWD, AName: string; const AID: Integer): Boolean;
{Процедура устанавливает/изменяет значения имени и пароля в реестре}
var
  R: TRegistry;
begin
  R:= TRegistry.Create;
  try
    R.Rootkey:= HKEY_CURRENT_USER;
    R.OpenKey('SOFTWARE\PterikSoft\TyperADS', True);
    R.WriteString('USER', AUser);
    R.WriteString('PWD', APWD);
    R.WriteString('Name', AName);
    R.WriteInteger('ID', AID);
    R.CloseKey;
  except on E: ERegistryException do begin
      Result:= False;
      R.Free;
      Exit;
    end;
  end;
  Result:= True;
  R.Free;
end;

function WriteToRegistry(const FVar, FProg, FName: string): Boolean;
var
  R: TRegistry;
begin
  // Функция устаревшая, используй WriteToRegister2
  R:= TRegistry.Create;
  try
    R.Rootkey:= HKEY_CURRENT_USER;
    R.OpenKey('SOFTWARE\PterikSoft\' + FProg, True);
    R.WriteString(FName, FVar);
    R.CloseKey;
  except on E: ERegistryException do begin
      MessageDlg('Ошибка работы программы, невозможно записать в реестр. Сообщите об этом разработчику.', mtError, [mbOK], 0);
      R.Free;
      Result:= False;
      Exit;
    end;
  end;
  Result:= True;
  R.Free;
end;

function ReadFromRegistry(var FVar: string; const FProg, FName: string): Boolean;
var
  R: TRegistry;
begin
  // Функция устаревшая, используй ReadRegisterStr
  R:= TRegistry.Create;
  try
    R.Rootkey:= HKEY_CURRENT_USER;
    R.OpenKey('SOFTWARE\PterikSoft\' + FProg, False);
    FVar:= R.ReadString(FName);
  except on E: ERegistryException do begin
      R.Free;
      Result:= False;
      Exit;
    end;
  end;
  if FVar = '' then
    Result:= False
  else
    Result:= True;
  //Если прочитало пустую строку, то в действительности не прочитало
  R.Free;
end;

function WriteRegisterStr(const FVar, FBranch, FName: string): Boolean;
var
  R: TRegistry;
begin
  R:= TRegistry.Create;
  try
    R.Rootkey:= HKEY_CURRENT_USER;
    R.OpenKey(FBranch, True);
    R.WriteString(FName, FVar);
    R.CloseKey;
  except on E: ERegistryException do begin
      R.Free;
      Result:= False;
      Exit;
    end;
  end;
  Result:= True;
  R.Free;
end;

function WriteRegisterDWORD(const FVar: Integer; FBranch, FName: string): Boolean;
var
  R: TRegistry;
begin
  R:= TRegistry.Create;
  try
    R.Rootkey:= HKEY_CURRENT_USER;
    R.OpenKey(FBranch, True);
    R.WriteInteger(FName, FVar);
    R.CloseKey;
  except on E: ERegistryException do begin
      R.Free;
      Result:= False;
      Exit;
    end;
  end;
  Result:= True;
  R.Free;
end;

function ReadRegisterStr(var FVar: string; const FBranch, FName: string): Boolean;
var
  R: TRegistry;
begin
  R:= TRegistry.Create;
  try
    R.Rootkey:= HKEY_CURRENT_USER;
    R.OpenKey(FBranch, False);
    FVar:= R.ReadString(FName);
  except on E: ERegistryException do begin
      R.Free;
      Result:= False;
      Exit;
    end;
  end;
  Result:= True;
  R.Free;
end;

function ReadRegisterDWORD(var FVar: Integer; const FBranch, FName: string): Boolean;
var
  R: TRegistry;
begin
  R:= TRegistry.Create;
  try
    R.Rootkey:= HKEY_CURRENT_USER;
    R.OpenKey(FBranch, False);
    FVar:= R.ReadInteger(FName);
  except on E: ERegistryException do begin
      R.Free;
      Result:= False;
      Exit;
    end;
  end;
  Result:= True;
  R.Free;
end;

function RegisterRecordExists(const FBranch: string): Boolean;
var
  R: TRegistry;
begin
  R:= TRegistry.Create;
  R.Rootkey:= HKEY_CURRENT_USER;
  Result:= R.KeyExists(FBranch);
  R.Free;
end;

function ReadOnlyBranch(const FBranch: string; var KAccess: Longword): Boolean;
var
  R: TRegistry;
begin
  R:= TRegistry.Create;
  R.Rootkey:= HKEY_CURRENT_USER;
  Result:= R.OpenKeyReadOnly(FBranch);
  //KEY_ALL_ACCESS	combination of KEY_READ, KEY_WRITE, and KEY_CREATE_LINK.
  //KEY_READ	combination of KEY_QUERY_VALUE, KEY_ENUMERATE_SUB_KEYS, and KEY_NOTIFY.
  //KEY_WRITE	combination of KEY_SET_VALUE and KEY_CREATE_SUB_KEY.
  //KEY_QUERY_VALUE	grants permission to query subkey data.
  //KEY_ENUMERATE_SUB_KEYS	grants permission to enumerate subkeys.
  //KEY_NOTIFY	grants ability to receive change notifications.
  //KEY_SET_VALUE	grants permission to set subkey data.
  //KEY_CREATE_SUB_KEY	grants permission to create subkeys.
  //KEY_CREATE_LINK	grants permission to create symbolic links.
  //KEY_EXECUTE
  KAccess:= R.Access;
  R.Free;
end;

function DeleteRegister(const FName: string): Boolean;
var
  R: TRegistry;
begin
  R:= TRegistry.Create;
  try
    R.Rootkey:= HKEY_CURRENT_USER;
    if R.KeyExists(FName) then
      R.DeleteKey(FName);
  except on E: ERegistryException do begin
      R.Free;
      Result:= False;
      Exit;
    end;
  end;
  Result:= True;
  R.Free;
end;

function DetectDCOM: Boolean;
var
  S: string;
  R: TRegistry;
begin
  Result:= False;
  R:= TRegistry.Create;
  try
    R.Rootkey:= HKEY_LOCAL_MACHINE;
    R.OpenKey('SOFTWARE\Microsoft\OLE', False);
    S:= UpperCase(R.ReadString('EnableDCOM'));
    if S = 'Y' then
      Result:= True;
    R.CloseKey;
  finally R.Free;
  end;
end;

function DetectMDAC: Boolean;
var
  R: TRegistry;
begin
  Result:= False;
  R:= TRegistry.Create;
  try
    R.Rootkey:= HKEY_CLASSES_ROOT;
    R.OpenKey('\ADODB.Connection\CurVer', False);
    if R.ReadString('') <> '' then
      Result:= True;
    R.CloseKey;
  finally R.Free;
  end;
end;

procedure MakeXOR(var AByte: AnsiChar; const BByte: Integer);
begin
  AByte:= AnsiChar(Integer(AByte) xor BByte);
end;

function Decrypt(const AStrng: AnsiString): String;
var
  I: Integer;
  Bt: AnsiChar;
  Str2: string[100];
begin
  Str2:= AStrng;
  for I:= 1 to Length(AStrng) do
  begin
    Bt:= AStrng[I];
    MakeXOR(Bt, $96);
    Str2[I]:= Bt;
  end;
  Result:= Str2;
end;

function NameToDeposit(const FStr: string; const Gazeta: Integer): string;
var
  RPath: string;
begin
  if not ReadFromRegistry(Rpath, GetProgName, 'Repository') then
    MessageDlg('Ошибка работы программы. Сбой с работой пути репозитария.', mtError,
      [mbOK], 0);
  Result:= RPath + '\' + FStr[1];
end;

function SaveFileToDir(const Source, Dir: string; const IDRub: Integer): Boolean;
{Процедура переписывает файл с именем FName в директорию Dir с именем IDRub+FShortName
Если указать idRub<0 то номер опускается, если указать idRub=0 то номер =000
Если возникает ошибка при записи, возвращается false. Все в порядке - возврат true }
var
  Dest, MessageStr: string;
begin
  Dest:= ExtractFileName(Source); //Вырезаем короткое имя
  if IDRUb < 0 then
    Dest:= Dir + '\' + Dest
  else
    if IDRub = 0 then
    Dest:= Dir + '\000_' + Dest
  else
    Dest:= Dir + '\' + Format('%d', [idRub]) + '_' + Dest;
  if not CopyFile(Source, Dest, MessageStr) then begin
    MessageDlg(MessageStr, mtError, [mbOK], 0);
    Result:= False;
  end
  else
    Result:= True;
end;

function MoveFile(const Source, Dest: string): Boolean;
var
  MessageStr: string;
begin
  if not CopyFile(Source, Dest, MessageStr) then begin
    MessageDlg(MessageStr, mtError, [mbOK], 0);
    Result:= False;
    Exit;
  end;
  if not DeleteFile(PChar(Source)) then
    MessageDlg('Невозможно удалить файл ' + Source, mtInformation, [mbOK], 0);
  Result:= True;
end;

function CopyFile(const Source, Dest: string; var MessageStr: string): Boolean;
//Процедура переписывает файл с именем FName в файл Dest
//Если возникает ошибка при записи, возвращается false и MessageStr. Все в порядке - возврат true
var
  S, D: TFileStream;
  FHSource, FHDest: Integer;
begin
  Result:= True;
  try //EOpen error
    S:= TFileStream.Create(Source, fmOpenRead);
  except on E: EFOpenError do begin
      MessageStr:= 'Невозможно открыть файл ' + Source;
      Result:= False;
      Exit;
    end;
  end;
  try //ECreateError
    D:= TFileStream.Create(Dest, fmOpenWrite or fmCreate);
  except on E: EFCreateError do begin
      MessageStr:= 'Невозможно создать файл ' + Dest + ' Убедитесь в доступности диска';
      Result:= False;
      D.Free;
      Exit;
    end;
  end;
  // Проверка наличия свободного места
  try //EWriteError
    D.CopyFrom(S, S.Size);
  except on E: EWriteError do begin
      MessageStr:= 'Невозможно записать файл ' + Dest + ' Возможно, нет места на диске';
      Result:= False;
      S.Free;
      D.Free;
      Exit;
    end;
  end;
  FreeAndNil(D);
  FreeAndNil(S);
  if Result then begin
    FHSource:= FileOpen(Source, fmOpenRead);
    FHDest:= FileOpen(Dest, fmOpenReadWrite);
    FileSetDate(FHDest, FileGetDate(FHSource));
    FileClose(FHSource);
    FileClose(FHDest);
  end;
end;

function FreeDisk(const S: string): Int64;
var
  R: Byte;
begin
  R:= Byte(S[1]) - Byte('A') + 1;
  Result:= DiskFree(R);
  if Result = -1 then
    Result:= 0;
end;

function DeleteFolder(const DirDest: string): Boolean;
var
  DelFile: TSearchRec;
begin
  Result:= True;
  if FindFirst(DirDest + '\*.*', faAnyFile, DelFile) = 0 then
    repeat
      if (DelFile.name = '.') or (DelFile.name = '..') then
        Continue;
      if (DelFile.Attr and faDirectory) = 0 then begin
        if not DeleteFile(DirDest + '\' + DelFile.name) then
          Result:= False;
      end
      else begin
        if not DeleteFolder(DirDest + '\' + DelFile.name) then
          Result:= False;
      end;
    until FindNext(DelFile) <> 0;
  FindClose(DelFile);
  if not RemoveDir(DirDest) then
    Result:= False;
end;

function isRussianChars(const Strng: string): Boolean;
//Есть ли русские буквы в передаваемой строке
var
  I: Integer;
begin
  Result:= False;
  for I:= 1 to Length(Strng) do
    if Strng[I] in [Char($80)..Char($FF)] then
      Result:= True;
end;

function AddSpaces(const Strn: string; len: Integer): string;
var
  K: Integer;
  Str2: string;
begin
  Str2:= TrimLeft(Strn);
  if Length(Str2) > len then
    Result:= Copy(Str2, 1, len)
  else begin
    Result:= Str2;
    SetLength(Result, len);
    for K:= Length(Str2) + 1 to len do
      Result[K]:= ' ';
  end;
end;

function AddSpaces2(Strn: string; lenStrn: Integer; isLeftAlign: Boolean): string;
var
  K: Integer;
  Str2: string;
begin
  Strn:= trim(strn);
  if Length(Strn) >= LenStrn then begin
    Result:= Copy(Strn, 1, LenStrn);
    Exit;
  end;
  Str2:= '';
  for K:= Length(Strn) + 1 to LenStrn do
    Str2:= ' ' + Str2;
  if isLeftAlign then
    Result:= strn + Str2
  else
    Result:= Str2 + Strn;
end;

function GetTxtVersion(ProgName: string; Version: Integer; Language: ChooseLanguage):
  string;
begin
  // Процедура по имени PROGNAME и VERSION определяет текстовый идентификатор программы
  // Служит для определения демо-версий и корректного ведения номеров
  if (ProgName = 'CALENDAR') and (Language = Russian) then begin
    case Version of //
      1000: Result:= 'демо-версия 1.0 D';
      else
        Result:= ' первая версия';
    end; // case
  end;
  if (ProgName = 'CALENDAR') and (Language = English) then begin
    case Version of //
      1000: Result:= 'demo version 1.0 D';
      else
        Result:= ' first version';
    end; // case
  end;
end;

{ TFilter }

procedure TFilter.AddFilter(LField, LText, LValue: string);
begin
Inc(Counter);
if Counter>5 then Counter:=5;
Field[Counter]:=LField;
Text[Counter]:=LText;
Value[Counter]:=LValue;
end;

function TFilter.Caption(N: Integer): string;
begin
if (Trim(Text[N])<>'') or (Trim(Value[N])<>'')
  then Result:=Text[N]+'='+Value[N]
  else Result:='';
end;

procedure TFilter.Clear(N: Integer);
begin
Field[N]:=''; Text[N]:=''; Value[N]:='';
end;

procedure TFilter.ClearAll;
var i:Integer;
begin
Counter:=0;
Business:='';
CompanyLike:='';
for i:=1 to 5 do Clear(i);
end;

procedure TFilter.Copy(N_From, N_To: Integer);
var LField, LText, LValue:string;
begin
LField:=Field[N_From];
LText:=Text[N_From];
LValue:=Value[N_From];
Field[N_To]:=LField;
Text[N_To]:=LText;
Value[N_To]:=LValue;
end;

function TFilter.Query: string;
var i:Integer;
begin
for i:=1 to 5 do
  begin
  if Trim(Field[i])<>'' then
    begin
    if Text[i]='Поставщик' then CompanyLike := Value[i] else
      if Text[i]='Вид деятельности' then Business := Value[i] else
        Result:=Result+' and '+Field[i]+' = '''+Value[i]+'''';
    end;
  end;
end;

procedure TFilter.RemoveFilter(N:Integer);
var i:Integer;
begin
if Counter>0 then Dec(Counter);
  //Удаляем фильтр номер N вне зависимости от Counter
  //Просто копируем фильтр N+1 в фильтр N
  // Затем очищаем фильтр 5
if Text[N]='Поставщик' then CompanyLike := '';
if Text[N]='Вид деятельности' then Business := '';
for i:=N to 4 do Copy(i+1,i);
Clear(5);
end;

end.

