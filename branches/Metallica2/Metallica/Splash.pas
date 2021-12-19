unit Splash;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, jpeg, ExtCtrls, StdCtrls, sSkinProvider, sSkinManager;

type
  TSplashForm = class(TForm)
    Image1: TImage;
    sSkinManager1: TsSkinManager;
    sSkinProvider1: TsSkinProvider;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
	procedure Update;
  end;

var
  SplashForm: TSplashForm;

implementation

uses MainForm;

{$R *.dfm}

procedure TSplashForm.FormCreate(Sender: TObject);
begin
Left:=(Screen.Width-Width) div 2;
Top:=(Screen.Height-Height) div 2;
Image1.Left:=(Width-514) div 2;
Image1.Top:=(Height-162)div 2;
end;

procedure TSplashForm.Update;
begin
inherited;
end;

end.
