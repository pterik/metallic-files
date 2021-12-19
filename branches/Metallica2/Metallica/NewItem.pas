unit NewItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ComCtrls, StdCtrls, Buttons, DB, ZAbstractRODataset, ZAbstractDataset, 
  ZDataset, DBCtrls, Grids, DBGrids, DBLookupEh, Mask, DBCtrlsEh, DBGridEh, sBitBtn, sLabel, sEdit, sCheckBox,
  DBAccess, Uni, MemDS, sSkinProvider, sSkinManager;

type
	TFormNewItem = class(TForm)
    EditTree: TEdit;
    qMaxParentPos: TUniQuery;
    qTreeInsertParent: TUniSQL;
    sSkinManager1: TsSkinManager;
    sSkinProvider1: TsSkinProvider;
    sLabel1: TsLabel;
    qMaxParentPosMAXPOS: TLargeintField;
    BitBtnCancel: TsBitBtn;
    BitBtnSave: TsBitBtn;
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtnSaveClick(Sender: TObject);
  private
  function MaximalPos:integer;
	public
    procedure SetNewItem;
    procedure SetPosition(L, T: integer);
    procedure SaveTreeItem;
	end;

var
	FormNewItem: TFormNewItem;

implementation

uses MainForm,  DataModule;

{$R *.dfm}

procedure TFormNewItem.SetNewItem;
begin
EditTree.Clear;
end;

procedure TFormNewItem.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
case Key of    //
  VK_Escape: BitBtnCancel.Click;
  VK_F2: BitBtnSave.Click;
end;    // case
end;


procedure TFormNewItem.BitBtnSaveClick(Sender: TObject);
var Pos:integer;
begin
if length(trim(EditTree.Text))<=1 then
	begin
	MessageDlg('Имя не введено, заполните поле',mtInformation,[mbOK],0);
  ModalResult:=mrNone;
	exit;
	end;
SaveTreeItem;
end;

procedure TFormNewItem.SetPosition(L, T: integer);
begin
Left:=L+ShiftLeft;
Top:=T+ShiftTop;
end;

procedure TFormNewItem.SaveTreeItem;
begin
qTreeInsertParent.ParamByName('PT_VALUE').AsString:=EditTree.Text;
qTreeInsertParent.ParamByName('PT_ORDERBY').AsInteger:=MaximalPos();
qTreeInsertParent.ParamByName('PT_DATE').AsDateTime:=Now();
qTreeInsertParent.Execute;
end;

function TFormNewItem.MaximalPos: integer;
begin
qMaxParentPos.Close;
qMaxParentPos.Open;
if VarIsNull(qMaxParentPos['MAXPOS'])
  then Result:=1
  else Result:=qMaxParentPos['MAXPOS'];
end;

end.
