unit Export;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Buttons, sBitBtn, sDialogs, sMemo, sSkinProvider,
  sSkinManager;

type
  TFormExport = class(TForm)
    BitBtnLoad: TsBitBtn;
    BitBtnSave: TsBitBtn;
    BitBtnClose: TsBitBtn;
    MemoLoad: TsMemo;
    OD: TsOpenDialog;
    StaticText1: TStaticText;
    sSkinManager1: TsSkinManager;
    sSkinProvider1: TsSkinProvider;
    procedure BitBtnLoadClick(Sender: TObject);
    procedure BitBtnSaveClick(Sender: TObject);
  private
    { Private declarations }
  public
  HostName, Protocol, Database, UserName :string;
  Operation:string;
    procedure SetPosition(L, T: integer);
    procedure SetForm;
  end;

var
  FormExport: TFormExport;

implementation
uses CommonUnit;
{$R *.dfm}

procedure TFormExport.BitBtnLoadClick(Sender: TObject);
var F:TextFile;
s:string;
begin
Operation:='LOAD';
if OD.Execute then
  begin
  MemoLoad.Lines.LoadFromFile(OD.FileName);
  AssignFile(F,OD.FileName);
  try
	Reset(F);
  MemoLoad.Clear;
  MemoLoad.Lines.Add('���������, ����������� �� ����� '+OD.FileName);
  while not EOF(F) do
    begin
    Readln(F,S);
    if pos('//',trim(S))>0 then MemoLoad.Lines.Add(S);
    if Pos('HOSTNAME',S)>0 then
      begin
      Delete(S,Pos('HOSTNAME',S),8);
      TrimLeft(S);
      if Pos('=',S)= 1 then Delete(S,1,1);
      HostName:=S;
      MemoLoad.Lines.Add('HOSTNAME='+HostName);
      end;
    if Pos('DATABASE',S)>0 then
      begin
      Delete(S,Pos('DATABASE',S),8);
      TrimLeft(S);
      if Pos('=',S)= 1 then Delete(S,1,1);
      Database:=S;
      MemoLoad.Lines.Add('DATABASE='+Database);
      end;
    if Pos('PROTOCOL',S)>0 then
      begin
      Delete(S,Pos('PROTOCOL',S),8);
      TrimLeft(S);
      if Pos('=',S)= 1 then Delete(S,1,1);
      Protocol:=S;
      MemoLoad.Lines.Add('PROTOCOL='+Protocol);
      end;
    if Pos('USERNAME',S)>0 then
      begin
      Delete(S,Pos('USERNAME',S),8);
      TrimLeft(S);
      if Pos('=',S)= 1then Delete(S,1,1);
      UserName:=S;
      MemoLoad.Lines.Add('USERNAME='+UserName);
      end;
    end;    // while
	finally
		CloseFile(F);
	end;

  end;
end;

procedure TFormExport.SetPosition(L,T:integer);
begin
Left:=L+30;
Top:=T+30;
end;


procedure TFormExport.BitBtnSaveClick(Sender: TObject);
var F:TextFile;
begin
Operation:='SAVE';
AssignFile(F,GetProgDir+'\'+params_default_file);
try
Rewrite(F);
Writeln(F,'// ���� ���� ������ ���������� CheckCom.exe ������ ��� �������� �������� ����� ������������. ');
Writeln(F,'// ��������� ���� � ����� � ����������, ������������ � database.ini ');
Writeln(F,'[Connection Parameters]');
Writeln(F,'HOSTNAME='+HostName);
Writeln(F,'DATABASE='+Database);
Writeln(F,'PROTOCOL='+Protocol);
Writeln(F,'USERNAME='+UserName);
finally
CloseFile(F);
end;
MessageDlg('��������� �������� � ���� '+GetProgDir+'\'+params_default_file+'. ������ �������� � �������� ����.',mtInformation,[mbOK],0);
end;

procedure TFormExport.SetForm;
begin
MemoLoad.Clear;
MemoLoad.Lines.Add('HOSTNAME='+HostName);
MemoLoad.Lines.Add('DATABASE='+Database);
MemoLoad.Lines.Add('PROTOCOL='+Protocol);
MemoLoad.Lines.Add('USERNAME='+UserName);
end;

end.