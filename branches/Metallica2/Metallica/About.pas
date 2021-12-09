unit About;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, sMemo, sBitBtn;

type
  TFormAbout = class(TForm)
    Memo1: TsMemo;
    BitBtnClose: TsBitBtn;
  private
    { Private declarations }
  public
    procedure SetPosition(L, T: integer);
    procedure SetAbout;
  end;

var
  FormAbout: TFormAbout;

implementation

uses MainForm, DataModule;

{$R *.dfm}
procedure TFormAbout.SetPosition(L,T:integer);
begin
Left:=(Screen.Width-Self.Width) div 2;
Top:=(Screen.Height-Self.Height)div 2;
end;

procedure TFormAbout.SetAbout;
var Stext:string;
begin
Stext:='��������� Metallica Version 3.1'+chr(13)+chr(10);
Stext:=Stext+'���� ������� �� ���������?'+chr(13)+chr(10);
Stext:=Stext+'������� �� ���. +38(067)220-79-76'+chr(13)+chr(10);
Stext:=Stext+'����������� ����� vitaly.makhaev@gmail.com'+chr(13)+chr(10);
Memo1.Text:=Stext;
end;

end.
