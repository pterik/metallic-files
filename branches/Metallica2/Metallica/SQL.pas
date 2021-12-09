unit SQL;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, DB, ZAbstractRODataset, 
  ZAbstractDataset, ZDataset, DBGridEh, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, 
  DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh, sLabel, sEdit, sCheckBox, sMaskEdit, sComboBox, sMemo, sDialogs, sSpeedButton,
  sButton, sBitBtn;

type
  TFormSQL = class(TForm)
    BitBtnExecute: TsBitBtn;
    MemoSQL: TsMemo;
    EditName: TsEdit;
    ButtonOpenFile: TsButton;
    CBExecute: TsCheckBox;
    DSQuery: TDataSource;
    ZQuery: TZQuery;
    SDSQL: TsSaveDialog;
    Label1: TsLabel;
    Label2: TsLabel;
    DBGridEh1: TDBGridEh;
    BitBtnCancel: TsBitBtn;
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
  else MessageDlg('Файл '+SDSQL.FileName+' не существует. Укажите другое имя',mtWarning,[mbOK],0);
  end;    
end;

procedure TFormSQL.BitBtnExecuteClick(Sender: TObject);
begin
if trim(MemoSQL.Text)='' then
	begin
	MessageDlg('Укажите команду для выполнения',mtInformation,[mbOK],0);
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
	MessageDlg('Ошибка выполнения: '+E.Message,mtError,[mbOK],0);
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
