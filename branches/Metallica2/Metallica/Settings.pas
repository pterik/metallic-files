unit Settings;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Buttons, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, Mask, sLabel, sEdit, sCheckBox, sMaskEdit, sComboBox, sMemo, sDialogs, sSpeedButton,
  sBitBtn, sSkinProvider, sSkinManager;

type
  TFormSettings = class(TForm)
    BitBtnCancel: TsBitBtn;
    BitBtnSave: TsBitBtn;
    MESearch: TsMaskEdit;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    MECode: TsMaskEdit;
    sSkinManager1: TsSkinManager;
    sSkinProvider1: TsSkinProvider;
    procedure BitBtnSaveClick(Sender: TObject);
  private
  public
    procedure SetPosition(L, T: integer);
    procedure SetForm;
  end;

var
  FormSettings: TFormSettings;

implementation

uses System.UITypes, DataModule, MainForm, EnterUser;

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
  MessageDlg('Укажите код из двух цифр с учетом нулей, например 44 ',mtWarning,[mbOK],0);
  ModalResult:=mrNone;
  exit;
  end;
if not DM.WriteSettings('CITY_CODE', MECode.Text) then MessageDlg('Ошибка программы, неверно сохранился код города. Обратитесь к разработчику',mtError,[mbOK],0);
if not DM.WriteSettings('DIGITS_WHILE_SEARCH', MESearch.Text) then MessageDlg('Ошибка программы, неверно сохранилось количество символов в поиске. Обратитесь к разработчику',mtError,[mbOK],0);
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
