unit DBErrorExit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, sMemo, sBitBtn, sSkinProvider, sSkinManager;

type
  TFormDBErrorExit = class(TForm)
    Memo1: TsMemo;
    BitBtnClose: TsBitBtn;
    sSkinManager1: TsSkinManager;
    sSkinProvider1: TsSkinProvider;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    procedure SetPosition(L, T: integer);
    procedure SetErrorMessage;
  end;

var
  FormDBErrorExit: TFormDBErrorExit;

implementation

uses MainForm, DataModule;

{$R *.dfm}
procedure TFormDBErrorExit.SetPosition(L,T:integer);
begin
Left:=(Screen.Width-Self.Width) div 2;
Top:=(Screen.Height-Self.Height)div 2;
end;

procedure TFormDBErrorExit.FormCreate(Sender: TObject);
begin
SetErrorMessage;
end;

procedure TFormDBErrorExit.SetErrorMessage;
var Stext:string;
begin
Stext:='��������� Metallica Version 3.1'+chr(13)+chr(10);
Stext:=Stext+'��������� Metallica �� ����� ������������ � ���� '+chr(13)+chr(10);
Stext:=Stext+'������ � �������� ��������� ������.'+chr(13)+chr(10);
Stext:=Stext+'��������� ��������� CHECKM.EXE, ��� ��������� � '+chr(13)+chr(10);
Stext:=Stext+'����� ���������. ������������ � ����� ���� '+chr(13)+chr(10);
Stext:=Stext+'������ � ������� F2, ���� ��������� ����� '+chr(13)+chr(10);
Stext:=Stext+'��������� � ������� Windows. '+chr(13)+chr(10);
Stext:=Stext+'��� ��������� ������� ��������� Metallica ����� '+chr(13)+chr(10);
Stext:=Stext+'������������ ��������� �� �������. '+chr(13)+chr(10);
Stext:=Stext+'���� ������� �� ���������?'+chr(13)+chr(10);
Stext:=Stext+'������� �� ���. +38(067)220-79-76'+chr(13)+chr(10);
Stext:=Stext+'����������� ����� vitaly.makhaev@gmail.com'+chr(13)+chr(10);
Memo1.Text:=Stext;
end;

end.
