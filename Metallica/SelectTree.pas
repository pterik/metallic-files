unit SelectTree;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, Grids, DBGrids, DBGridEh, ComCtrls, Mask, DBCtrlsEh, DataModule;

type
  TFormSelectTree = class(TForm)
    Tree: TTreeView;
    BitBtnCancel: TBitBtn;
    StaticText1: TStaticText;
    procedure TreeChange(Sender: TObject; Node: TTreeNode);
    procedure TreeExpanding(Sender: TObject; Node: TTreeNode;
      var AllowExpansion: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure TreeDblClick(Sender: TObject);
    procedure BitBtnCancelClick(Sender: TObject);
  private
    MyNode:TNodeValue;
  public
    procedure SetPosition(L, T: integer);
    procedure SetNewTree(NodeID, ParentID:integer);
  end;

var
  FormSelectTree: TFormSelectTree;

implementation

uses MainForm, ShowCompany, CommonUnit, NewItem, NewPriceList;

{$R *.dfm}

{ TFormPriceShow }

procedure TFormSelectTree.SetPosition(L,T:integer);
begin
Left:=L+ShiftLeft;
Top:=T+ShiftTop;
end;

procedure TFormSelectTree.SetNewTree(NodeID, ParentID:integer);
var i:integer;
begin
FormNewPriceList.SelectedTreeID:=0;
DM.TreeFulFill(Tree, true,0);
for I := 0 to Tree.Items.Count - 1 do
  if    (integer(Tree.Items[i].Data)=NodeID)
     or (integer(Tree.Items[i].Data)=ParentID)
  then Tree.Items[i].Expand(true);
Tree.ClearSelection;
for I := 0 to Tree.Items.Count - 1 do
  if integer(Tree.Items[i].Data)=NodeID
    then Tree.Select(Tree.Items[i]);
end;

procedure TFormSelectTree.TreeExpanding(Sender: TObject; Node: TTreeNode;
  var AllowExpansion: Boolean);
begin
MyNode.ID:=Integer(Node.Data);
end;

procedure TFormSelectTree.TreeChange(Sender: TObject; Node: TTreeNode);
begin
MyNode.ID:=Integer(Tree.Selected.Data);
end;

procedure TFormSelectTree.FormCreate(Sender: TObject);
begin
MyNode:=TNodeValue.Create;
end;

procedure TFormSelectTree.FormDestroy(Sender: TObject);
begin
MyNode.Destroy;
end;

procedure TFormSelectTree.TreeDblClick(Sender: TObject);
begin
if Tree.SelectionCount=0 then
  begin
  MessageDlg('�������� ���� �� �������� ������',mtWarning,[mbCancel],0);
  exit;
  end;
if MyNode.ParentID=0 then exit;
FormNewPriceList.SelectedTreeID:=MyNode.ID;
Close;
end;

procedure TFormSelectTree.BitBtnCancelClick(Sender: TObject);
begin
FormNewPriceList.SelectedTreeID:=0;
end;

end.
