unit Settings;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, Mask;

type
  TFormSettings = class(TForm)
    BitBtnCancel: TBitBtn;
    BitBtnSave: TBitBtn;
    MESearch: TMaskEdit;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    MECode: TMaskEdit;
    procedure BitBtnSaveClick(Sender: TObject);
  private
  public
    procedure SetPosition(L, T: integer);
    procedure SetForm;
  end;

var
  FormSettings: TFormSettings;

implementation

uses DataModule, MainForm, EnterUser;

{$R *.dfm}

procedure TFormSettings.SetForm;
begin
MECode.Text:=FormMain.CityCode;
MESearch.Text:=IntTOStr(FormMain.SearchChars);
end;

procedure TFormSettings.SetPosition(L,T:integer);
begin
Left:=L+ShiftLeft;
Top:=T+ShiftTop;
end;

procedure TFormSettings.BitBtnSaveClick(Sender: TObject);
var S:string;
begin
if length(trim(MECode.Text))<>2
then
  begin
  MessageDlg('������� ��� �� ���� ���� � ������ �����, �������� 44 ',mtWarning,[mbOK],0);
  ModalResult:=mrNone;
  exit;
  end;
if not DM.WriteSettings('CITY_CODE', MECode.Text) then MessageDlg('������ ���������, ������� ���������� ��� ������. ���������� � ������������',mtError,[mbOK],0);
if not DM.WriteSettings('DIGITS_WHILE_SEARCH', MESearch.Text) then MessageDlg('������ ���������, ������� ����������� ���������� �������� � ������. ���������� � ������������',mtError,[mbOK],0);
try
FormMain.CityCode:=DM.ReadSettings('CITY_CODE','44');
except on E:Exception do
  FormMain.CityCode:='44';
end;
S:=DM.ReadSettings('DIGITS_WHILE_SEARCH','4');
try
FormMain.SearchChars:=StrToInt(S);
except on E:EConvertError do
  FormMain.SearchChars:=4;
end;
end;

end.