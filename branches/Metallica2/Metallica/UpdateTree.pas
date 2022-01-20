unit UpdateTree;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Buttons, DB, Grids, DBGrids, DBGridEh, ComCtrls, Mask,
  DBCtrlsEh, DataModule, sLabel, sEdit, sCheckBox, sMaskEdit, sComboBox, sMemo,
  sDialogs, sSpeedButton, sTreeView, sBitBtn, MemDS, DBAccess, Uni, sSkinProvider, sSkinManager;

type
  TFormUpdateTree = class(TForm)
    BitBtnClose: TsBitBtn;
    Tree: TsTreeView;
    BitBtnSameNode: TsBitBtn;
    BitBtnNewNode: TsBitBtn;
    BitBtnDelete: TsBitBtn;
    qSubTreeExists: TUniQuery;
    qSubTreeExistsCNTR: TIntegerField;
    QTreeClose: TUniSQL;
    qLinesDelete: TUniSQL;
    qTreeDelete: TUniSQL;
    sSkinManager1: TsSkinManager;
    sSkinProvider1: TsSkinProvider;
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

uses MainForm, ShowCompany, CommonUnit, NewItem, NewSubItem, System.UITypes;

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
begin
if Tree.SelectionCount=0 then
  begin
  MessageDlg('Выберите один из разделов дерева',mtWarning,[mbCancel],0);
  exit;
  end;
MyNode.ID:=Integer(Tree.Selected.Data);
if MyNode.ParentID<>0 then
  begin
  MessageDlg('Запрещено создавать раздел, переместитесь на одну ступень выше',mtError,[mbCancel],0);
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
  MessageDlg('Выберите один из разделов дерева',mtWarning,[mbCancel],0);
  exit;
  end;
if MyNode.ParentID<>0 then
  begin
  MessageDlg('Выберите один из главных разделов',mtError,[mbCancel],0);
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
  MessageDlg('Выберите один из (под)разделов дерева',mtWarning,[mbCancel],0);
  exit;
  end;
if MyNode.ParentID=0 then
  begin
  if MessageDlg('Хотите удалить раздел '+MyNode.Value+' в рубрикаторе? Сначала необходимо удалить подразделы',mtWarning, [mbNo, mbYes],0)=mrNo
  then exit;
  QSubTreeExists.Close;
  QSubTreeExists.ParamByName('PARENTID').AsInteger:=MyNode.ID;
  QSubTreeExists.Open;
  if QSubTreeExists['CNTR']>0 then
    begin
    MessageDlg('У раздела есть активные подразделы, удалите их',mtError, [mbYes],0);
    exit;
    end;
  QTreeClose.ParamByName('ID').AsInteger:=MyNode.ID;
  QTreeClose.ParamByName('CDATE').AsDate:=Now();
  QTreeClose.Execute;
  end
else
  begin
  if MessageDlg('Подтверждаете удаление (под)раздела '+MyNode.Value+'?'+chr(10)+chr(13)
                +'Все строки из прайс-листов также будут удалены.',mtConfirmation,[mbNo,mbYes],0)=mrNo then exit;
  qLInesDelete.ParamByName('ID').AsInteger:=MyNode.ID;
  qLInesDelete.ParamByName('PTDATE').AsDateTime:=Now();
  qLInesDelete.Execute;
  qTreeDelete.ParamByName('ID').AsInteger:=MyNode.ID;
  qTReeDelete.ParamByName('PTDATE').AsDateTime:=Now();
  qTReeDelete.Execute;
  end;
DM.TreeFulFill(Tree, true,0);
end;

end.

