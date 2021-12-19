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
Stext:='Программа Metallica Version 3.1'+chr(13)+chr(10);
Stext:=Stext+'Программа Metallica не может подключиться к базе '+chr(13)+chr(10);
Stext:=Stext+'данных и аварийно завершает работу.'+chr(13)+chr(10);
Stext:=Stext+'Запустите программу CHECKM.EXE, она находится в '+chr(13)+chr(10);
Stext:=Stext+'папке программы. Подключитесь к Вашей базе '+chr(13)+chr(10);
Stext:=Stext+'данных и нажмите F2, Ваши настройки будут '+chr(13)+chr(10);
Stext:=Stext+'сохранены в реестре Windows. '+chr(13)+chr(10);
Stext:=Stext+'При следующем запуске программы Metallica будет '+chr(13)+chr(10);
Stext:=Stext+'использовать настройки из реестра. '+chr(13)+chr(10);
Stext:=Stext+'Есть вопросы по программе?'+chr(13)+chr(10);
Stext:=Stext+'Звоните по тел. +38(067)220-79-76'+chr(13)+chr(10);
Stext:=Stext+'Электронная почта vitaly.makhaev@gmail.com'+chr(13)+chr(10);
Memo1.Text:=Stext;
end;

end.
