unit CommonUnitEng;
interface
uses Controls;

type
	TBlock=record
	id:integer; {номер по списку}
	id_logical:integer; {номер логический}
	type_block:string[20];
	end;
	TAgency=record
	Name:string[10];
	id:integer;
	server:string[20];
	isOldFormat:boolean;
	Name_ext:string[10];
	Dbase:string[20];
	end;
	TChannel=record
	id:integer;
	Name:string;
	Ext:string;
	delta:integer;
	end;
	TSetter=record
	Name:string;
	id:integer;
	end;
	TServer=record
	Server,DataBase,BaseName,UserName,Password,FirstChar:String[40];
	id_agency:integer;
	isOldFormat:boolean;
	end;

//Работа с телефонами и другие вспомогательные
function  FindPhone(var str:string;var phone:integer):boolean;
function  FindPhone2(var strng:string;var phone:Longint):boolean;
function  PhoneToPhoneNew(var ANum:int64):boolean;
function  PhoneToPhoneOld(var ANum:int64):boolean;{перевод любого телефона в 6-значный, даже если он уже не существует, например 7127244->127244}
function  CalcBlock(const auction,forma:integer):integer;
function  AuctionFromBlock(const id_block:integer):integer;
function  FormaFromBlock(const id_block:integer):integer;
function  CalcSignature(const str:string):integer;
function  CalcLongSignature(const strng:string):Int64;
//работа с текстовыми строками и датами
function  AddSpaces(const Strn:string;len:integer):string;
function  AddSpaces2(Strn:string;lenStrn:integer;isLeftAlign:boolean):string;
function  isRussianChars(const Strng:string):boolean;
function  CheckLength(const Str:string):integer;
procedure DosToWin(var Str:string);
procedure WinToDos(var Str:string);
procedure WinToDosInByte(var chr:byte);
function  ConvertDateToFName(const D:TDateTime):string;
function  ConvertDateToStr(const D:TDateTime):string;
function  DeleteReturns(const A:string):string;
function  DeleteFirstSpaces(const A:string):string;
function  MondayOfDate(const Day:TDate):TDate;
function  DayOfWeekRussian(CurDate:TDateTime):integer;
function  DetectDay(CurDate:TDateTime):string;
function  Decrypt(const AStrng:string):String;
//Процедуры работы с реестром
function  WriteToRegistry(const FVar,FProg,FName:string):boolean;
function  ReadFromRegistry(var FVar:string;const FProg,FName:string):boolean;
function  NameToDeposit(const FStr:string;const Gazeta:integer):string;
function  GetUser(var AUser,APWD,AName:string;var AID:integer):boolean; //Читается из реестра
function  SetUser(const AUser,APWD,AName:string;const AID:integer):boolean;//записывается в реестр
function  DetectDCOM:boolean;//Определение чтением из реестра
function  DetectMDAC:boolean;//Определение чтением из реестра
//Функции работы с именами файлов и путями, определение имени программы
function  SaveFileToDir(const Source,Dir:string;const IDRub:integer):boolean;
function  MoveFile(const Source,Dest:string):boolean;
function  CopyFile(const Source,Dest:string;var MessageStr:string):boolean;
function  DeleteFolder(const DirDest:string):boolean;
function  GetProgName:string;//Функция определяет имя программы
function  GetProgDir:string;//Функция определяет путь запускаемой программы
function  GetProgDirWOLetter:string;//Функция определяет путь запускаемой программы без первой буквы (С:)
implementation

uses Registry, Windows,Classes, Sysutils, Dialogs;

function DayOfWeekRussian(CurDate:TDateTime):integer;
begin
Result:=DayOfWeek(CurDate)-1;
if Result=0 then Result:=7;
end;

function DetectDay(CurDate:TDateTime):string;
begin
case DayOfWeek(CurDate) of
1:Result:='Sunday';
2:Result:='Monday';
3:Result:='Tuesday';
4:Result:='Wednesday';
5:Result:='Thursday';
6:Result:='Friday';
7:Result:='Saturday';
end; {case}
end;

function ConvertDateToStr(const D:TDateTime):string;
var Year, Month, Day: Word;Str:String;
begin
DecodeDate(D,Year,Month,Day);
if Day>9 then Str:=IntToStr(Day)
  else Str:='0'+IntToStr(Day);
Str:=Str+'.';
if Month>9 then Str:=Str+IntToStr(Month)
  else Str:=Str+'0'+IntToStr(Month);
Str:=Str+'.';
Result:=Str+IntToStr(Year);
end;

function ConvertDateToFName(const D:TDateTime):string;
var Year, Month, Day: Word;StrName:string;
begin
DecodeDate(D,Year,Month,Day);
case Month of
1:StrName:='jan';
2:StrName:='feb';
3:StrName:='mar';
4:StrName:='apr';
5:StrName:='may';
6:StrName:='june';
7:StrName:='july';
8:StrName:='aug';
9:StrName:='sept';
10:StrName:='oct';
11:StrName:='nov';
12:StrName:='dec';
else begin MessageDlg('Internal error in program while converting data',mtError,[mbOK],0);Result:='???';end;
end;{case}
if Day>9 then StrName:=IntToStr(Day)+StrName
	else StrName:='0'+IntToStr(Day)+StrName;
Result:=StrName;
end;

function CalcBlock(const auction,forma:integer):integer;
begin
{Функция рассчитывает тип id_block из forma auction.
При превышении правил она формирует id_block "по максимуму" для восстановления сбоев с минимальными потерями}
Result:=106;
if (forma=0) and (auction>=3) then Result:=101; {обычн}
if (forma>=1) and(auction>=4) then Result:=103; {выделен}
if (forma>=3)and (auction>=3) then Result:=102; {рамка}
if (forma>=4)and (auction>=6) then Result:=104; {дайджест}
end;

function AuctionFromBlock(const id_block:integer):integer;
{ TODO : Функция вычисляет поле auction для старых баз из id_block.
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
101:Result:=3;
102:Result:=3;
103:Result:=4;
104:Result:=6;
105:Result:=3
else Result:=0;
end; {case}
end;

function FormaFromBlock(const id_block:integer):integer;
{ TODO : Функция вычисляет поле forma для старых баз из id_block
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
101:Result:=0;
102:Result:=3;
103:Result:=1;
104:Result:=4;
else Result:=0;
end; {case}
end;

function CalcSignature(const str:string):integer;
var i:integer;R:integer;
begin
R:=0;
for i:=1 to length(str) do R:=R+word(str[i]);
result:=R mod 5000;
end;

function CalcLongSignature(const strng:string):Int64;
var i,j, Len:integer;
Step:int64;
R:array of byte;
Res:array[1..8] of byte;
//Расчет фукции хэширования на поразрядном XOR. Размер 8 байт, 64 бит
//Переводим строку 8-битовых char в буфер
begin
try
if length(Strng)=0 then begin result:=0;exit;end;
Len:=1+(length(strng) div 8);
SetLength(R,8+Len*9);
for i:=1 to Len*8 do
	begin
	if i<=length(strng)
  	then R[i]:=Byte(Strng[i])
    else R[i]:=$A5;
  end;
for j:=1 to 8 do Res[j]:=0;
for j:=1 to 8 do
	for i:=1 to Len do //проход от второго до последнего столбца
	  Res[j]:=Res[j] XOR R[i*8+j];
Result:=1;
Step:=1;
for i:=1 to 8 do
	begin
	Result:=Result+Res[i]*Step;
	Step:=Step*256;
  end;
{ TODO : Убрать проверку в релизе }
except on E:Exception do
	ShowMessage('Exception in CalcLongSignature');
end;
end;


function MondayofDate(const Day:TDate):TDate;
var DWeek:integer;
begin
DWeek:=DayOfWeek(Day);
case Dweek of
1:Result:=Day-6;
2:Result:=Day;
3:Result:=Day-1;
4:Result:=Day-2;
5:Result:=Day-3;
6:Result:=Day-4;
7:Result:=Day-5;
else Result:=0;
end;
end;

function CheckLength(const Str:string):integer;
var i,j,words,max_mas:integer;Mas:array[1..200] of integer;
begin
words:=0;
j:=1;Mas[1]:=1;
for i:=1 to length(str) do
	begin
	if (str[i] =' ') then begin inc(j);Mas[j]:=i;end;
	end;
	max_mas:=j;
for j:=1 to max_mas-1 do
	if Mas[j+1]-Mas[j]>3 then begin inc(words);end;
Result:=1+words div 20;
end;

procedure WinToDos(var Str:string);
var i:integer;ch:byte;
begin
for i:=1 to Length(Str) do
	begin
	ch:=byte(str[i]);
	if (ch>=192)and(ch<=239) then str[i]:=char(ch-64);
	if (ch>=240) then str[i]:=char(ch-16);
	if ch=$A8 then str[i]:=char($F0);
	if ch=$B8 then str[i]:=char($F1);
	if ch=$B9 then str[i]:=char($FC);
	end;
end;

procedure WinToDosInByte(var chr:byte);
var ch:byte;
begin
ch:=chr;
if (ch>=192)and(ch<=239) then chr:=ch-64;
if (ch>=240) then chr:=ch-16;
if ch=$A8 then chr:=$F0;
if ch=$B8 then chr:=$F1;
if ch=$B9 then chr:=$FC;
end;

procedure DosToWin(var Str:string);
var i:integer;ch:byte;
begin
for i:=1 to Length(Str) do
	begin
	ch:=byte(str[i]);
	if (ch>=128)and(ch<=175) then str[i]:=char(ch+64);
	if (ch>=224)and(ch<=239) then str[i]:=char(ch+16);
	if (ch=240) then str[i]:='Ё';
	if (ch=241) then str[i]:='ё';
	if (ch=242) then str[i]:='Є';
	if (ch=243) then str[i]:='є';
	if (ch=244) then str[i]:='Ї';
	if (ch=245) then str[i]:='ї';
	end;
end;

function FindPhone(var str:string;var phone:integer):boolean;
var pstn:integer;strphone:string;phone64:int64;
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
Result:=true;
while (length(str)>4) do
	if not (str[1] in ['0'..'9','(']) then delete(str,1,1) else break;
if length(str)<5 then begin Result:=false;str:='';exit;end;
pstn:=1;
repeat
	if not(str[pstn] in ['0'..'9','-','(',')']) then break
	else inc(pstn);
until pstn>length(str);
dec(pstn);
strphone:=Copy(str,1,pstn);
Str:=Copy(str,pstn+1,length(str)-pstn);
{Теперь крутим strphone как можем на предмет телефонности.
Если strphone не имеет телефона,то запускаем еще раз,выход по первому exit для которого length<5}
if (pos('-',strphone)=0) then begin Result:=false;exit;end;
{Если нет минуса- не телефон}
if (pos('-',strphone)=length(strphone)) then begin Result:=false;exit;end;
{Если минус в конце - не телефон}
while pos('-',strphone)>0 do delete(strphone,pos('-',strphone),1);
while pos('(',strphone)>0 do delete(strphone,pos('(',strphone),1);
while pos(')',strphone)>0 do delete(strphone,pos(')',strphone),1);
if strphone[1]='8' then	Delete(strphone,1,1); {храним без ведущей 8, иначе не входит в размер integer}
if not((length(strphone)=6)or(length(strphone)=7)or(length(strphone)=10)) then begin Result:=false;exit;end;
try
phone64:=StrToInt64(strPhone);
except on E:EConvertError do
	begin
	ShowMessage('Ошибка программы, при конвертировании в телефон');
	Result:=false;
	phone64:=0;
	str:='';
	end;
end;
if (phone64<2147483647)and(phone64>99999) then phone:=phone64
else
	begin
	Result:=false;
	phone:=0;
	end;
end;

function FindPhone2(var strng:string;var phone:Longint):boolean;
var i,pstn:integer;Strn2, strphone:string;
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
if length(Strng)<4 then begin phone:=0; Result:=false;exit;end;
Strn2:='';
while Pos('(044)',Strng)>0 do Delete(Strng,Pos('(044)',Strng),5);
for i:=1 to length(Strng) do
	begin
	if strng[i] in ['0'..'9',';'] then Strn2:=Strn2+Strng[i];
	if (strng[i]='(')or(strng[i]=',') then Strn2:=Strn2+';';
  end;
Strn2:=Strn2+';';
while (pos(';;',strn2)>0) do
	delete(strn2,pos(';;',strn2),1);
while Pos(';',Strn2)=1 do delete(strn2,1,1);
Pstn:=Pos(';',Strn2);
Strphone:=Copy(Strn2,1,pstn-1);
Strn2:=Copy(strn2,pstn+1,length(strn2)-pstn);
Result:=true;
if (length(Strn2)>7) and (Strn2[1]='8') then Delete(Strn2,1,1);
if length(StrPhone)<7 then
	begin
	//Почему-то неверно определился телефон, перестраховка
  Phone:=0;
  Result:=false;
	exit;
  end;
Strng:=Strn2;
try
phone:=StrToInt64(strPhone);
except on E:EConvertError do
	begin
	Result:=false;
	phone:=0;
	end;
end;
end;

function GetProgDir:string;
begin
Result:=ExtractFileDir(Paramstr(0));
end;

function GetProgDirWOLetter:string;
var FStr:string;
begin
FStr:=ExtractFileDir(Paramstr(0));
Result:=Copy(FStr,3,length(FStr)-2);
end;

function GetProgName:string;
begin
Result:=ExtractFileName(Paramstr(0));
end;

function DeleteReturns(const A:string):string;
var i:integer;strng:string;
begin
strng:=A;
for i:=1 to length(strng) do
	if strng[i] in [char(13),char(10)] then strng[i]:=' ';
Result:=strng;
end;

function DeleteFirstSpaces(const A:string):string;
var strng:string;
begin
if length(A)<1 then
	begin
	Result:='';
	exit;
	end;
strng:=A;
while pos(' ',strng)=1 do Delete(strng,1,1);
Result:=strng;
end;

function PhoneToPhoneNew(var ANum:int64):boolean;
begin
{Процедура переводит телефон Num в новый
Обрабатываются следующие ситуации:
Телефон не 6-значный или неверный 7-значный - возвращаем false, Num не изменился
Телефон старый 6-значный - возврат 7-значного и true
Телефон 6-значный без семерок - возврат true, Num не изменился}
{710,711,712,713,715,770,771,772,773,774,775,776,777,778,779}
if (ANum>80100000000)and(ANum<89999999999) then
   begin
   ANum:=ANum-80000000000;
   Result:=true;
   exit;
   end;
if (ANum<100000)or(ANum>7999999) then
   begin
   Result:=false;
   exit;{неверный телефон}
	 end;
if (ANum>=100000)and(ANum<=999999) then
	 begin
   Result:=true;
   if (ANum div 10000 in [10,11,12,13,15,70,71,72,73,74,75,76,77,78,79]) then ANum:=ANum+7000000;
   end
else
   begin
   Result:=((ANum-7000000) div 10000 in [10,11,12,13,15,70,71,72,73,74,75,76,77,78,79]);
   end;
end;

function PhoneToPhoneOld(var ANum:int64):boolean;
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
if (ANum>100000000)and(ANum<999999999) then
   begin
   ANum:=ANum+80000000000;
   Result:=true;
   exit;
   end;
if (ANum<100000)or(ANum>7999999) then
	 begin
   Result:=false;
   exit;{неверный телефон}
   end;
{Является ли 7-значным телефон}
if (ANum>=1000000)and(ANum<7999999)
then
   begin
   Result:=((ANum-7000000) div 10000 in [10,11,12,13,15,70,71,72,73,74,75,76,77,78,79]);
   if Result then ANum:=ANum-7000000;
   end
{Если телефон 6-значный другая проверка}
else Result:=true;
end;

function GetUser(var AUser,APWD,AName:string;var AID:integer):boolean;
{Процедура читает имя пользователя из реестра. Если имя не указано или нет такого реестра, то выдается false}
var R:TRegistry;
begin
R:=TRegistry.Create;
try
R.Rootkey:=HKEY_LOCAL_MACHINE;
R.OpenKey('SOFTWARE\PterikSoft\TyperADS',False);
AUSER:=R.ReadString('USER');
APWD:=R.ReadString('PWD');
AName:=R.ReadString('Name');
AID:=R.ReadInteger('ID');
R.CloseKey;
except on E:ERegistryException do
	begin
	Result:=false;
	R.Free;
	exit;
	end;
end;
Result:=true;
if (AUSER='')or(APWD='') then Result:=false;
R.Free;
end;

function SetUser(const AUser,APWD,AName:string;const AID:integer):boolean;
{Процедура устанавливает/изменяет значения имени и пароля в реестре}
var R:TRegistry;
begin
R:=TRegistry.Create;
try
R.Rootkey:=HKEY_LOCAL_MACHINE;
R.OpenKey('SOFTWARE\PterikSoft\TyperADS',true);
R.WriteString('USER',AUser);
R.WriteString('PWD',APWD);
R.WriteString('Name',AName);
R.WriteInteger('ID',AID);
R.CloseKey;
except on E:ERegistryException do
	begin
	Result:=false;
	R.Free;
	exit;
	end;
end;
Result:=true;
R.Free;
end;

function WriteToRegistry(const FVar,FProg,FName:string):boolean;
var R:TRegistry;
begin
R:=TRegistry.Create;
try
R.Rootkey:=HKEY_LOCAL_MACHINE;
R.OpenKey('SOFTWARE\PterikSoft\'+FProg,True);
R.WriteString(FName,FVar);
R.CloseKey;
except on E:ERegistryException do
	begin
	MessageDlg('Internal error, program may not write into registry. Please contact to developer.',mtError,[mbOK],0);
	R.Free;
	Result:=false;
	exit;
	end;
	end;
R.Free;
Result:=true;
end;

function ReadFromRegistry(var FVar:string;const FProg,FName:string):boolean;
var R:TRegistry;
begin
R:=TRegistry.Create;
try
R.Rootkey:=HKEY_LOCAL_MACHINE;
R.OpenKey('SOFTWARE\PterikSoft\'+FProg,False);
FVar:=R.ReadString(FName);
except on E:ERegistryException do
	begin
	R.Free;
	Result:=false;
	exit;
	end;
	end;
if FVar='' then Result:=false else Result:=true;
//Если прочитало пустую строку, то в действительности не прочитало
end;

function DetectDCOM:boolean;
var S:String;R:TRegistry;
begin
Result:=False;
R:=TRegistry.Create;
try
R.Rootkey:=HKEY_LOCAL_MACHINE;
R.OpenKey('SOFTWARE\Microsoft\OLE',False);
S:=UpperCase(R.ReadString('EnableDCOM'));
if S='Y' then Result:=true;
R.CloseKey;
finally R.Free;end;
end;

function DetectMDAC:boolean;
var R:TRegistry;
begin
Result:=False;
R:=TRegistry.Create;
try
R.Rootkey:=HKEY_CLASSES_ROOT;
R.OpenKey('\ADODB.Connection\CurVer',False);
if R.ReadString('')<>'' then Result:=true;
R.CloseKey;
finally R.Free;end;
end;

procedure MakeXOR(var AByte:Char;const BByte:integer);
begin
AByte:=char(integer(AByte) XOR BByte);
end;

function Decrypt(const AStrng:string):String;
var i:integer;Bt:char;Str2:string[100];
begin
Str2:=AStrng;
for i:=1 to length(AStrng) do
	begin
	Bt:=AStrng[i];
	MakeXOR(Bt,$96);
	Str2[i]:=Bt;
	end;
Result:=Str2;
end;

function NameToDeposit(const FStr:string;const Gazeta:integer):string;
var RPath:string;
begin
if not ReadFromRegistry(Rpath,GetProgName,'Repository') then MessageDlg('Internal error in program. Path to repositary is invalid. Please contact to developer.',mtError,[mbOK],0);
Result:=RPath+'\'+FStr[1];
end;

function SaveFileToDir(const Source,Dir:string;const IDRub:integer):boolean;
{Процедура переписывает файл с именем FName в директорию Dir с именем IDRub+FShortName
Если указать idRub<0 то номер опускается, если указать idRub=0 то номер =000
Если возникает ошибка при записи, возвращается false. Все в порядке - возврат true }
var Dest,MessageStr:string;
begin
Dest:=ExtractFileName(Source);//Вырезаем короткое имя
if IDRUb<0 then Dest:=Dir+'\'+Dest else
	if IDRub=0 then Dest:=Dir+'\000_'+Dest
	else Dest:=Dir+'\'+Format('%d',[idRub])+'_'+Dest;
if not CopyFile(Source,Dest,MessageStr) then begin MessageDlg(MessageStr,mtError,[mbOK],0);Result:=false;end
	else Result:=true;
end;

function MoveFile(const Source,Dest:string):boolean;
var MessageStr:string;
begin
if not CopyFile(Source,Dest,MessageStr) then begin MessageDlg(MessageStr,mtError,[mbOK],0);Result:=false;exit;end;
if not DeleteFile(PChar(Source)) then MessageDlg('Can`t delete file'+Source,mtInformation,[mbOK],0);
Result:=true;
end;

function CopyFile(const Source,Dest:string;var MessageStr:string):boolean;
//Процедура переписывает файл с именем FName в файл Dest
//Если возникает ошибка при записи, возвращается false и MessageStr. Все в порядке - возврат true
var S,D:TFileStream;
FHSource,FHDest:integer;
begin
Result:=true;
try //EOpen error
S:=TFileStream.Create(Source,fmOpenRead);
except on E:EFOpenError do
	begin
	MessageStr:='Can`t open file '+Source;
	Result:=false;
	exit;
	end;
end;
try //ECreateError
D:=TFileStream.Create(Dest,fmOpenWrite or fmCreate);
except on E:EFCreateError do
	begin
	MessageStr:='Can`t create file '+Dest+'. Make sure disk drive is valid';
	Result:=false;
	D.Free;
	exit;
	end;
end;
try //EWriteError
D.CopyFrom(S,S.Size);
except on E:EWriteError do
	begin
	MessageStr:='Can`t write file '+Dest+'. Possible, no free disk space.';
	Result:=false;
	S.Free;
	D.Free;
	exit;
	end;
end;
FreeandNil(D);
FreeAndNil(S);
if Result then
	begin
	FHSource:=FileOpen(Source,fmOpenRead);
	FHDest:=FileOpen(Dest,fmOpenReadWrite);
	FileSetDate(FHDest,FileGetDate(FHSource));
	FileClose(FHSource);
	FileClose(FHDest);
	end;
end;

function DeleteFolder(const DirDest:string):boolean;
var DelFile:TSearchRec;
begin
Result:=true;
if FindFirst(DirDest+'\*.*',faAnyFile,DelFile)=0 then
	repeat
	if (DelFile.Name='.') or (DelFile.Name='..') then continue;
	if (DelFile.Attr and faDirectory)=0 then
		begin
		if not DeleteFile(DirDest+'\'+DelFile.Name) then Result:=false;
		end
		else
		begin
		if not DeleteFolder(DirDest+'\'+DelFile.Name) then Result:=false;
		end;
	until FindNext(DelFile)<>0;
FindClose(DelFile);
if not RemoveDir(DirDest) then Result:=false;
end;

function isRussianChars(const Strng:string):boolean;
//Есть ли русские буквы в передаваемой строке
var i:integer;
begin
Result:=false;
for i:=1 to length(Strng) do
	if Strng[i] in [char($80)..char($FF)] then Result:=true;
end;

function AddSpaces(const Strn:string;len:integer):string;
var k:integer;
Str2:string;
begin
Str2:=TrimLeft(Strn);
if length(Str2)>len then result:=Copy(Str2,1,len)
else
	begin
	Result:=Str2;
	SetLength(Result,len);
	for k:=length(Str2)+1 to len do Result[k]:=' ';
	end;
end;

function AddSpaces2(Strn:string;lenStrn:integer;isLeftAlign:boolean):string;
var k:integer;
Str2:string;
begin
Strn:=trim(strn);
if Length(Strn)>=LenStrn then begin Result:=Strn;exit; end;
Str2:='';
for k:=Length(Strn)+1 to LenStrn do Str2:=' '+Str2;
if isLeftAlign then Result:=strn+Str2 else Result:=Str2+Strn;
end;

end.
