unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, Vcl.Buttons;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    LabeledEdit4: TLabeledEdit;
    LabeledEdit5: TLabeledEdit;
    LabeledEdit6: TLabeledEdit;
    LabeledEdit7: TLabeledEdit;
    LabeledEdit8: TLabeledEdit;
    LabeledEdit9: TLabeledEdit;
    LabeledEdit10: TLabeledEdit;
    Panel3: TPanel;
    LabeledEdit11: TLabeledEdit;
    LabeledEdit12: TLabeledEdit;
    Panel4: TPanel;
    LabeledEdit13: TLabeledEdit;
    Label3: TLabel;
    LabeledEdit14: TLabeledEdit;
    Panel5: TPanel;
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;
    Label6: TLabel;
    Button1: TButton;
    Panel6: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Panel7: TPanel;
    Label4: TLabel;
    LabeledEdit15: TLabeledEdit;
    LabeledEdit16: TLabeledEdit;
    LabeledEdit17: TLabeledEdit;
    LabeledEdit18: TLabeledEdit;
    Label8: TLabel;
    Panel8: TPanel;
    Image1: TImage;
    ButtonSite: TButton;
    ButtonNext: TButton;
    ButtonFont: TButton;
    Panel9: TPanel;
    ButtonNew: TButton;
    ButtonPrint: TButton;
    ButtonSave: TButton;
    ButtonLoad: TButton;
    ButtonNext2: TButton;
    Panel10: TPanel;
    RadioGroup3: TRadioGroup;
    Panel11: TPanel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Label9: TLabel;
    Edit5: TEdit;
    Label10: TLabel;
    Panel12: TPanel;
    Label11: TLabel;
    Label12: TLabel;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Button7: TButton;
    Button8: TButton;
    Image2: TImage;
    BitBtn1: TBitBtn;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BitBtn1Click(Sender: TObject);
    procedure ButtonNextClick(Sender: TObject);
    procedure ButtonNext2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses Unit2;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
//if Form2 <>nil then Form2.Close;
//Form1.Close;
end;

procedure TForm1.ButtonNext2Click(Sender: TObject);
begin
Panel3.Visible:=false;
Panel13.Visible:=true;
end;

procedure TForm1.ButtonNextClick(Sender: TObject);
begin
Form2.Show;
end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
if MessageDlg('Закрыть программу?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then CanClose := False;
end;

end.
