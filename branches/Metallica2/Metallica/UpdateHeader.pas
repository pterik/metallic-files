unit UpdateHeader;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ComCtrls, StdCtrls, Buttons, DB, ZAbstractRODataset, ZAbstractDataset, 
  ZDataset, DBCtrls, Grids, DBGrids, DBLookupEh, Mask, DBCtrlsEh, DBGridEh, DataModule, sLabel, sEdit, sCheckBox, sMaskEdit, sComboBox, sMemo, sDialogs, sSpeedButton,
  sBitBtn, sSkinProvider, sSkinManager;

type
	TFormUpdateHeader = class(TForm)
    BitBtnCancel: TsBitBtn;
		Label1: TsLabel;
    BitBtnSave: TsBitBtn;
    EditHeader: TsEdit;
    Label2: TsLabel;
    EditOrderby: TsEdit;
    EditFormat: TsEdit;
    StaticText1: TStaticText;
    CBSaveGlobally: TsCheckBox;
    STRubrika: TStaticText;
    EditSize: TsEdit;
    Label3: TsLabel;
    CBHideField: TsCheckBox;
    sSkinManager1: TsSkinManager;
    sSkinProvider1: TsSkinProvider;
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtnSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
  MyNode:TNodeValue;
    procedure SaveNewHeader;
	public
  F_Field:string;
  F_Size, F_Orderby:integer;
    procedure SetUpdateHeader(Title, Field, Format:string;
      Size, Orderby, Treeid:integer);
    procedure SetPosition(L, T: integer);
	end;

var
	FormUpdateHeader: TFormUpdateHeader;

implementation

uses MainForm;

{$R *.dfm}

procedure TFormUpdateHeader.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
case Key of    //
  VK_Escape: BitBtnCancel.Click;
  VK_F2: BitBtnSave.Click;
end;    // case
end;


procedure TFormUpdateHeader.BitBtnSaveClick(Sender: TObject);
begin
if length(trim(EditHeader.Text))<=1 then
	begin
	MessageDlg('Имя не введено, заполните поле',mtInformation,[mbOK],0);
  ModalResult:=mrNone;
	exit;
	end;
try
StrToInt(EditSize.Text);
except on e: EConvertError do
	begin
	MessageDlg('Размер поля должен быть целым числом больше нуля',mtInformation,[mbOK],0);
  EditSize.Text:=IntToStr(F_Size);
  FocusControl(EditSize);
  ModalResult:=mrNone;
	exit;
	end;
end;
try
StrToInt(EditOrderby.Text);
except on e: EConvertError do
	begin
	MessageDlg('Номер столбца должен быть целым числом больше нуля',mtInformation,[mbOK],0);
  EditOrderby.Text:=IntToStr(F_Orderby);
  FocusControl(EditOrderby);
  ModalResult:=mrNone;
	exit;
	end;
end;
SaveNewHeader;
end;

procedure TFormUpdateHeader.SetPosition(L, T: integer);
begin
Left:=L+ShiftLeft;
Top:=T+ShiftTop;
end;

procedure TFormUpdateHeader.SaveNewHeader;
var Show:integer;
begin
F_Size:=StrToInt(EditSize.Text);
F_Orderby:=StrToInt(EditOrderby.Text);
if CBSaveGlobally.Checked then
  begin
  DM.SaveGlobalHeaderInForm(F_Field, EditHeader.Text,
      EditFormat.Text, F_Size, F_OrderBy);
  MessageDlg('Сохранены настройки для всех рубрик',mtInformation, [mbOK],0);
  end
else
  begin
  if CBHideField.Checked then Show:=0 else Show:=1;
  DM.SaveHeaderInForm(F_Field, EditHeader.Text,
      EditFormat.Text, MyNode.ID, F_Size, Show, F_OrderBy);
  MessageDlg('Сохранены настройки для подрубрики',mtInformation, [mbOK],0);
  end;
end;

procedure TFormUpdateHeader.SetUpdateHeader(Title, Field, Format:string;
      Size, Orderby, Treeid:integer);
begin
MyNode.ID:=Treeid;
EditHeader.Text:=Title;
F_Field:=Field;
EditFormat.Text:=Format;
F_Size:=Size;
F_Orderby:=Orderby;
STRubrika.Caption:='Рубрика '+MyNode.Value+' поле '+F_Field;
EditSize.Text:=IntToStr(F_Size);
EditOrderby.Text:=IntToStr(F_Orderby);
CBSaveGlobally.Checked:=false;
CBHideField.Checked:=false;
end;

procedure TFormUpdateHeader.FormCreate(Sender: TObject);
begin
MyNode:=TNodeValue.Create;
end;

procedure TFormUpdateHeader.FormDestroy(Sender: TObject);
begin
MyNode.Destroy;
end;

end.
