unit CommonUnitEng;
interface
uses Controls;

type
	TBlock=record
	id:integer; {����� �� ������}
	id_logical:integer; {����� ����������}
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

//������ � ���������� � ������ ���������������
function  FindPhone(var str:string;var phone:integer):boolean;
function  FindPhone2(var strng:string;var phone:Longint):boolean;
function  PhoneToPhoneNew(var ANum:int64):boolean;
function  PhoneToPhoneOld(var ANum:int64):boolean;{������� ������ �������� � 6-�������, ���� ���� �� ��� �� ����������, �������� 7127244->127244}
function  CalcBlock(const auction,forma:integer):integer;
function  AuctionFromBlock(const id_block:integer):integer;
function  FormaFromBlock(const id_block:integer):integer;
function  CalcSignature(const str:string):integer;
function  CalcLongSignature(const strng:string):Int64;
//������ � ���������� �������� � ������
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
//��������� ������ � ��������
function  WriteToRegistry(const FVar,FProg,FName:string):boolean;
function  ReadFromRegistry(var FVar:string;const FProg,FName:string):boolean;
function  NameToDeposit(const FStr:string;const Gazeta:integer):string;
function  GetUser(var AUser,APWD,AName:string;var AID:integer):boolean; //�������� �� �������
function  SetUser(const AUser,APWD,AName:string;const AID:integer):boolean;//������������ � ������
function  DetectDCOM:boolean;//����������� ������� �� �������
function  DetectMDAC:boolean;//����������� ������� �� �������
//������� ������ � ������� ������ � ������, ����������� ����� ���������
function  SaveFileToDir(const Source,Dir:string;const IDRub:integer):boolean;
function  MoveFile(const Source,Dest:string):boolean;
function  CopyFile(const Source,Dest:string;var MessageStr:string):boolean;
function  DeleteFolder(const DirDest:string):boolean;
function  GetProgName:string;//������� ���������� ��� ���������
function  GetProgDir:string;//������� ���������� ���� ����������� ���������
function  GetProgDirWOLetter:string;//������� ���������� ���� ����������� ��������� ��� ������ ����� (�:)
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
{������� ������������ ��� id_block �� forma auction.
��� ���������� ������ ��� ��������� id_block "�� ���������" ��� �������������� ����� � ������������ ��������}
Result:=106;
if (forma=0) and (auction>=3) then Result:=101; {�����}
if (forma>=1) and(auction>=4) then Result:=103; {�������}
if (forma>=3)and (auction>=3) then Result:=102; {�����}
if (forma>=4)and (auction>=6) then Result:=104; {��������}
end;

function AuctionFromBlock(const id_block:integer):integer;
{ TODO : ������� ��������� ���� auction ��� ������ ��� �� id_block.
������� �����:
��� �/��� ��������� ������ 0
��� br (101) ��������� 0+3, ������� 3
��� ram (102)��������� 3+3, ������� 3
��� vd (103) ��������� 1+4, ������� 4
��� didj (104)��������� 4+6, ������� 6
��� code (105)��������� 0+3, ������� 3
��� free (106,107) ��������� 0+0, ������� 0
��� ������� ����� ����������}
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
{ TODO : ������� ��������� ���� forma ��� ������ ��� �� id_block
������� �����:
��� �/��� ��������� ������ 0
��� br (101) ��������� 0+3, ������� 0
��� ram (102)��������� 3+3, ������� 3
��� vd (103) ��������� 1+4, ������� 1
��� didj (104)��������� 4+6, ������� 4
��� code (105)��������� 0+3, ������� 0
��� free (106,107) ��������� 0+0, ������� 0
��� ������� ����� ����������}
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
//������ ������ ����������� �� ����������� XOR. ������ 8 ����, 64 ���
//��������� ������ 8-������� char � �����
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
	for i:=1 to Len do //������ �� ������� �� ���������� �������
	  Res[j]:=Res[j] XOR R[i*8+j];
Result:=1;
Step:=1;
for i:=1 to 8 do
	begin
	Result:=Result+Res[i]*Step;
	Step:=Step*256;
  end;
{ TODO : ������ �������� � ������ }
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
	if (ch=240) then str[i]:='�';
	if (ch=241) then str[i]:='�';
	if (ch=242) then str[i]:='�';
	if (ch=243) then str[i]:='�';
	if (ch=244) then str[i]:='�';
	if (ch=245) then str[i]:='�';
	end;
end;

function FindPhone(var str:string;var phone:integer):boolean;
var pstn:integer;strphone:string;phone64:int64;
begin
{��� ���������� �������� �� �������� �� ����������� ������ � ����������� phone
���� �������� ���, �� Result:=false
������� ������ ������ �������� �� Result � �� ������ ������������ ������
���� ����� ������ �� ������ ������ �� ����� ������
������� �������� ���������:
���� ��� ��������, �� ������� ���������� � 8 � ����� 10 ���� � ����
������������ �� ������? ��������� �� ������� ���� �� ������������
������������� � ��������� �������� ���� � ������, ����� 11 ���� ������� ������� 8
���� ��� �����, �� � ��� 5,6 ��� 7 ���� � ����-��� ����, ������ ���, ��� ���������� �������
������������� �������� ������ ����, ��������� ����� �� ������ }
{ TODO : ������ ������������ �������� �� �����������, ���������� }
{���� ������� ������ �� ������� �� ������ ��������� � result:=true}
{�������� ������ ���������: ������� ������� ������� �� ������ �����,
����� �������� � ����� ������ ������� � ������ ����� �� �������-�����������
� ������ ������������� � �������������� ������}
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
{������ ������ strphone ��� ����� �� ������� ������������.
���� strphone �� ����� ��������,�� ��������� ��� ���,����� �� ������� exit ��� �������� length<5}
if (pos('-',strphone)=0) then begin Result:=false;exit;end;
{���� ��� ������- �� �������}
if (pos('-',strphone)=length(strphone)) then begin Result:=false;exit;end;
{���� ����� � ����� - �� �������}
while pos('-',strphone)>0 do delete(strphone,pos('-',strphone),1);
while pos('(',strphone)>0 do delete(strphone,pos('(',strphone),1);
while pos(')',strphone)>0 do delete(strphone,pos(')',strphone),1);
if strphone[1]='8' then	Delete(strphone,1,1); {������ ��� ������� 8, ����� �� ������ � ������ integer}
if not((length(strphone)=6)or(length(strphone)=7)or(length(strphone)=10)) then begin Result:=false;exit;end;
try
phone64:=StrToInt64(strPhone);
except on E:EConvertError do
	begin
	ShowMessage('������ ���������, ��� ��������������� � �������');
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
{��������! ������ ���������� ��� ������,������� ����� ���� ����� � ��������� � ��
��� ���������� �������� �� �������� �� ����������� ������ � ����������� phone
���� �������� ���, �� Result:=false. ������� ������ ������ �������� ��
   while FindPhone2() do
�������� ������ ���������:
������� ��� ������� ��������� ������ ����� � �����������.
��� ����������� ��������� � ";" ������� "," � "("
���� � ����� �� ����� �����������, ��������� ���.
������� ������� ����������� ���� ��� ����.
����� �������� � ����� ������ B ������� � ������ ����� �� �����������
� ������ ������������� � �������������� ������.
�� ����� ������ B ��������� �������
���� ���� � ������ B ������ �� ��������, ���������� false
���� ����� � ������ � �� �������� ���������}
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
	//������-�� ������� ����������� �������, �������������
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
{��������� ��������� ������� Num � �����
�������������� ��������� ��������:
������� �� 6-������� ��� �������� 7-������� - ���������� false, Num �� ���������
������� ������ 6-������� - ������� 7-�������� � true
������� 6-������� ��� ������� - ������� true, Num �� ���������}
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
   exit;{�������� �������}
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
{��������� ��������� ������� Num � ������������
�������������� ��������� ��������:
������� ������� - ��������� 80 � ����������
�������� ������� ��������� �� 80-10 000-00-00 �� 80-99 999-99-99
����� ������� �������� - ���������� false, Num �� ���������
������� ������ 7-������� - ������� true, ��� �� ������� ��� 7 � ������
������� ����� 6-������� - ������� true, ��� �� ������� }
{710,711,712,713,715,770,771,772,773,774,775,776,777,778,779}
{�������� ��������� ���������}
if (ANum>100000000)and(ANum<999999999) then
   begin
   ANum:=ANum+80000000000;
   Result:=true;
   exit;
   end;
if (ANum<100000)or(ANum>7999999) then
	 begin
   Result:=false;
   exit;{�������� �������}
   end;
{�������� �� 7-������� �������}
if (ANum>=1000000)and(ANum<7999999)
then
   begin
   Result:=((ANum-7000000) div 10000 in [10,11,12,13,15,70,71,72,73,74,75,76,77,78,79]);
   if Result then ANum:=ANum-7000000;
   end
{���� ������� 6-������� ������ ��������}
else Result:=true;
end;

function GetUser(var AUser,APWD,AName:string;var AID:integer):boolean;
{��������� ������ ��� ������������ �� �������. ���� ��� �� ������� ��� ��� ������ �������, �� �������� false}
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
{��������� �������������/�������� �������� ����� � ������ � �������}
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
//���� ��������� ������ ������, �� � ���������������� �� ���������
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
{��������� ������������ ���� � ������ FName � ���������� Dir � ������ IDRub+FShortName
���� ������� idRub<0 �� ����� ����������, ���� ������� idRub=0 �� ����� =000
���� ��������� ������ ��� ������, ������������ false. ��� � ������� - ������� true }
var Dest,MessageStr:string;
begin
Dest:=ExtractFileName(Source);//�������� �������� ���
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
//��������� ������������ ���� � ������ FName � ���� Dest
//���� ��������� ������ ��� ������, ������������ false � MessageStr. ��� � ������� - ������� true
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
//���� �� ������� ����� � ������������ ������
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
