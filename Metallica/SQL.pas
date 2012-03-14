unit SQL;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, DBGridEh;

type
  TFormSQL = class(TForm)
    BitBtnExecute: TBitBtn;
    MemoSQL: TMemo;
    EditName: TEdit;
    ButtonOpenFile: TButton;
    CBExecute: TCheckBox;
    DSQuery: TDataSource;
    ZQuery: TZQuery;
    SDSQL: TSaveDialog;
    Label1: TLabel;
    Label2: TLabel;
    DBGridEh1: TDBGridEh;
    BitBtnCancel: TBitBtn;
    procedure ButtonOpenFileClick(Sender: TObject);
    procedure BitBtnExecuteClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSQL: TFormSQL;

implementation

{$R *.dfm}

procedure TFormSQL.ButtonOpenFileClick(Sender: TObject);
begin
if SDSQL.Execute then
	begin
	if FileExists(SDSQL.FileName)
  then
    begin
    MemoSQL.Lines.LoadFromFile(SDSQL.FileName);
    EditName.Text:=SDSQL.FileName;
    end
  else MessageDlg('���� '+SDSQL.FileName+' �� ����������. ������� ������ ���',mtWarning,[mbOK],0);
  end;    
end;

procedure TFormSQL.BitBtnExecuteClick(Sender: TObject);
begin
if trim(MemoSQL.Text)='' then
	begin
	MessageDlg('������� ������� ��� ����������',mtInformation,[mbOK],0);
	exit;
	end;
ZQuery.Close;
ZQuery.SQL.Clear;
ZQuery.SQL.Text:=MemoSQL.Text;
try
if CBExecute.Checked
then
	begin
	DSQuery.DataSet:=nil;
	ZQuery.ExecSQL;
	end
else
	begin
	DSQuery.DataSet:=ZQuery;
	ZQuery.Open;
	end;
except on e:Exception do
	MessageDlg('������ ����������: '+E.Message,mtError,[mbOK],0);
end;
end;

procedure TFormSQL.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
case Key of    //
		VK_F9: BitBtnExecute.Click;
		VK_Escape: BitBtnCancel.Click;
end;    // case

end;

end.