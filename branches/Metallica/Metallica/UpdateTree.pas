unit UpdateTree;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, Grids, DBGrids, DBGridEh, ComCtrls, Mask, DBCtrlsEh, DataModule;

type
  TFormUpdateTree = class(TForm)
    BitBtnClose: TBitBtn;
    Tree: TTreeView;
    BitBtnSameNode: TBitBtn;
    BitBtnNewNode: TBitBtn;
    BitBtnDelete: TBitBtn;
    qTreeDelete: TZQuery;
    qLinesDelete: TZQuery;
    qSubTreeExists: TZQuery;
    IntegerField2: TIntegerField;
    QTreeClose: TZQuery;
    procedure TreeChange(Sender: TObject; Node: TTreeNode);
    procedure TreeExpanding(Sender: TObject; Node: TTreeNode;
      var AllowExpansion: Boolean);
    procedure BitBtnSameNodeClick(Sender: TObject);
    procedure BitBtnNewNodeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BitBtnDeleteClick(Sender: TObject);
  private
    MyNode:TNodeValue;
//    procedure CreateTree;
  public
    procedure SetPosition(L, T: integer);
    procedure SetTree;
  end;

var
  FormUpdateTree: TFormUpdateTree;

implementation

uses MainForm, ShowCompany, CommonUnit, NewItem, NewSubItem;

{$R *.dfm}

{ TFormPriceShow }

procedure TFormUpdateTree.SetPosition(L,T:integer);
begin
Left:=L+ShiftLeft;
Top:=T+ShiftTop;
end;

procedure TFormUpdateTree.SetTree;
begin
DM.TreeFulFill(Tree, true,0);
end;

procedure TFormUpdateTree.TreeExpanding(Sender: TObject; Node: TTreeNode;
  var AllowExpansion: Boolean);
begin
MyNode.ID:=Integer(Node.Data);
end;

procedure TFormUpdateTree.TreeChange(Sender: TObject; Node: TTreeNode);
begin
MyNode.ID:=Integer(Tree.Selected.Data);
end;

procedure TFormUpdateTree.BitBtnSameNodeClick(Sender: TObject);
var i:integer;
begin
if Tree.SelectionCount=0 then
  begin
  MessageDlg('�������� ���� �� �������� ������',mtWarning,[mbCancel],0);
  exit;
  end;
MyNode.ID:=Integer(Tree.Selected.Data);
if MyNode.ParentID<>0 then
  begin
  MessageDlg('��������� ��������� ������, ������������� �� ���� ������� ����',mtError,[mbCancel],0);
  exit;
  end;
if FormNewSubItem=nil then  Application.CreateForm(TFormNewSubItem, FormNewSubItem);
FormNewSubItem.SetPosition(Self.Left,Self.Top);
FormNewSubItem.SetNewSubItem(MyNode.ID,MyNode.Value);
FormNewSubItem.ShowModal;
DM.TreeFulFill(Tree, true,0);
end;

procedure TFormUpdateTree.BitBtnNewNodeClick(Sender: TObject);
begin
if Tree.SelectionCount=0 then
  begin
  MessageDlg('�������� ���� �� �������� ������',mtWarning,[mbCancel],0);
  exit;
  end;
if MyNode.ParentID<>0 then
  begin
  MessageDlg('�������� ���� �� ������� ��������',mtError,[mbCancel],0);
  exit;
  end;
if FormNewItem=nil then  Application.CreateForm(TFormNewItem, FormNewItem);
FormNewItem.SetPosition(Self.Left,Self.Top);
FormNewItem.SetNewItem;
FormNewItem.ShowModal;
DM.TreeFulFill(Tree, true,0);
end;


procedure TFormUpdateTree.FormCreate(Sender: TObject);
begin
MyNode:=TNodeValue.Create;
end;

procedure TFormUpdateTree.FormDestroy(Sender: TObject);
begin
MyNode.Destroy;
end;

procedure TFormUpdateTree.BitBtnDeleteClick(Sender: TObject);
begin
if Tree.SelectionCount=0 then
  begin
  MessageDlg('�������� ���� �� (���)�������� ������',mtWarning,[mbCancel],0);
  exit;
  end;
if MyNode.ParentID=0 then
  begin
  if MessageDlg('������ ������� ������ '+MyNode.Value+' � �����������? ������� ���������� ������� ����������',mtWarning, [mbNo, mbYes],0)=mrNo
  then exit;
  QSubTreeExists.Close;
  QSubTreeExists.ParamByName('PARENTID').AsInteger:=MyNode.ID;
  QSubTreeExists.Open;
  if QSubTreeExists['CNTR']>0 then
    begin
    MessageDlg('� ������� ���� �������� ����������, ������� ��',mtError, [mbYes],0);
    exit;
    end;
  QTreeClose.Close;
  QTreeClose.ParamByName('ID').AsInteger:=MyNode.ID;
  QTreeClose.ParamByName('CDATE').AsDate:=Now();
  QTreeClose.ExecSQL;
  end
else
  begin
  if MessageDlg('������������� �������� (���)������� '+MyNode.Value+'?'+chr(10)+chr(13)
                +'��� ������ �� �����-������ ����� ����� �������.',mtConfirmation,[mbNo,mbYes],0)=mrNo then exit;
  qLinesDelete.Close;
  qLInesDelete.ParamByName('ID').AsInteger:=MyNode.ID;
  qLInesDelete.ParamByName('PTDATE').AsDateTime:=Now();
  qLInesDelete.ExecSQL;
  qTreeDelete.Close;
  qTreeDelete.ParamByName('ID').AsInteger:=MyNode.ID;
  qTReeDelete.ParamByName('PTDATE').AsDateTime:=Now();
  qTReeDelete.ExecSQL;
  end;
DM.TreeFulFill(Tree, true,0);
end;

end.
