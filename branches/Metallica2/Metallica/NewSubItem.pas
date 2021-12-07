unit NewSubItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, DBCtrls, Grids, DBGrids, DBLookupEh, Mask,
  DBCtrlsEh, DBGridEh;

type
	TFormNewSubItem = class(TForm)
    BitBtnCancel: TBitBtn;
		Label1: TLabel;
    BitBtnSave: TBitBtn;
    EditTree: TEdit;
    Label2: TLabel;
    EditParent: TEdit;
    QTreeInsert: TZQuery;
    qMaxParentPos: TZReadOnlyQuery;
    qMaxParentPosMAXPOS: TLargeintField;
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtnSaveClick(Sender: TObject);
  private
  F_ParentID:integer;
  function MaximalPos(ParentID:integer):integer;
	public
    procedure SetNewSubItem(ParentID: integer; ParentValue:string);
    procedure SetPosition(L, T: integer);
    procedure SaveTreeSubItem;
	end;

var
	FormNewSubItem: TFormNewSubItem;

implementation

uses MainForm,  DataModule;

{$R *.dfm}

procedure TFormNewSubItem.SetNewSubItem(ParentID:integer; ParentValue:string);
begin
EditTree.Clear;
F_ParentID:=ParentID;
EditParent.Text:=ParentValue;
end;

procedure TFormNewSubItem.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
case Key of    //
  VK_Escape: BitBtnCancel.Click;
  VK_F2: BitBtnSave.Click;
end;    // case
end;


procedure TFormNewSubItem.BitBtnSaveClick(Sender: TObject);
var Pos:integer;
begin
if length(trim(EditTree.Text))<=1 then
	begin
	MessageDlg('Имя не введено, заполните поле',mtInformation,[mbOK],0);
  ModalResult:=mrNone;
	exit;
	end;
SaveTreeSubItem;
end;

procedure TFormNewSubItem.SetPosition(L, T: integer);
begin
Left:=L+ShiftLeft;
Top:=T+ShiftTop;
end;

procedure TFormNewSubItem.SaveTreeSubItem;
begin
qTreeInsert.Close;
qTreeInsert.ParamByName('PT_PARENTID').AsInteger:=F_ParentID;
qTreeInsert.ParamByName('PT_VALUE').AsString:=EditTree.Text;
qTreeInsert.ParamByName('PT_ORDERBY').AsInteger:=MaximalPos(F_ParentID);
qTreeInsert.ParamByName('PT_DATE').AsDateTime:=Now();
qTreeInsert.ExecSQL;
end;

function TFormNewSubItem.MaximalPos(ParentID: integer): integer;
begin
qMaxParentPos.Close;
qMaxParentPos.ParamByName('PARENTID').AsInteger:=ParentID;
qMaxParentPos.Open;
if VarIsNull(qMaxParentPos['MAXPOS'])
  then Result:=1
  else Result:=qMaxParentPos['MAXPOS'];
end;

end.
