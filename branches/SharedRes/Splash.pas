unit Splash;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls;

type
  TSplashForm = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
		{ Public declarations }
  end;

var
  SplashForm: TSplashForm;

implementation

uses MainForm;

{$R *.dfm}

procedure TSplashForm.FormCreate(Sender: TObject);
begin
Image1.Left:=(Width-514) div 2;
Image1.Top:=(Height-162)div 2;
end;

end.
