unit About;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons,  MdiChild;

type
  TFormAbout = class(TFormMDIChild)
    Memo1: TMemo;
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
//Left:=(Screen.Width-Self.Width) div 2;
//Top:=(Screen.Height-Self.Height)div 2;
end;

procedure TFormAbout.SetAbout;
var Stext:string;
begin
Stext:='Программа MetallicaView Version 2.2'+chr(13)+chr(10);
Stext:=Stext+'Есть вопросы по программе?'+chr(13)+chr(10);
Stext:=Stext+'Звоните по тел. +38(044)383-67-22'+chr(13)+chr(10);
Stext:=Stext+'Электронная почта vitaly.makhaev@gmail.com'+chr(13)+chr(10);
Memo1.Text:=Stext;
end;

end.
