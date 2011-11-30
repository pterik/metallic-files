unit About;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TFormAbout = class(TForm)
    Memo1: TMemo;
    BitBtnClose: TBitBtn;
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
Stext:='Программа Metallica Version 2.1'+chr(13)+chr(10);
Stext:=Stext+'Есть вопросы по программе?'+chr(13)+chr(10);
Stext:=Stext+'Обращайтесь к разработчику по телефонам '+chr(13)+chr(10);
Stext:=Stext+'+38(044) 383-67-22 и +38(067)2207976'+chr(13)+chr(10);
Stext:=Stext+'Электронная почта yandex2000@gmail.com'+chr(13)+chr(10);
Memo1.Text:=Stext;
end;

end.
