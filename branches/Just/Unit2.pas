unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.Samples.Calendar, Vcl.Buttons;

type
  TForm2 = class(TForm)
    Panel8: TPanel;
    Image1: TImage;
    ButtonSite: TButton;
    ButtonFont: TButton;
    Panel1: TPanel;
    Panel9: TPanel;
    ButtonPrint: TButton;
    ButtonSave: TButton;
    ButtonLoad: TButton;
    ButtonPrev: TButton;
    Panel2: TPanel;
    Button3: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Button8: TButton;
    Label4: TLabel;
    Button7: TButton;
    Label5: TLabel;
    Button9: TButton;
    Label6: TLabel;
    Button10: TButton;
    Button11: TButton;
    Label7: TLabel;
    Label8: TLabel;
    Button12: TButton;
    Label9: TLabel;
    Calendar1: TCalendar;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    ButtonNext: TButton;
    BitBtn1: TBitBtn;
    CheckBox8: TCheckBox;
    Panel3: TPanel;
    Image2: TImage;
    Button1: TButton;
    procedure ButtonNextClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

uses Unit1;

procedure TForm2.ButtonNextClick(Sender: TObject);
begin
//Form2.Hide;
//Form1.Show;
end;

procedure TForm2.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
//if MessageDlg('Закрыть программу?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then CanClose := False;
end;

end.
