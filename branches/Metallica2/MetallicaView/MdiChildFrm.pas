unit MdiChildFrm;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms, Dialogs, 
  Menus, ComCtrls, ToolWin, ImgList, System.ImageList;

type

  TMDIChildForm = class(TForm)
    mmMain: TMainMenu;
    mmiFile: TMenuItem;
    mmiNew: TMenuItem;
    mmiOpen: TMenuItem;
    mmiClose: TMenuItem;
    N3: TMenuItem;
    mmiSave: TMenuItem;
    mmiSaveAs: TMenuItem;
    N2: TMenuItem;
    mmiPrint: TMenuItem;
    mmiPrintSetup: TMenuItem;
    N1: TMenuItem;
    mmiExit: TMenuItem;
    tlbMain: TsToolBar;
    tbOpen: TToolButton;
    tbNew: TToolButton;
    tbPrint: TToolButton;
    ToolButton4: TToolButton;
    tbUndo: TToolButton;
    tbCut: TToolButton;
    tbCopy: TToolButton;
    tbPaste: TToolButton;
    ToolButton9: TToolButton;
    tbBold: TToolButton;
    tbItalic: TToolButton;
    tbUnderline: TToolButton;
    ToolButton13: TToolButton;
    tbLAlign: TToolButton;
    tbCAlign: TToolButton;
    tbRAlign: TToolButton;
    ilMain: TImageList;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure mmiExitClick(Sender: TObject);
    procedure mmiCloseClick(Sender: TObject);
    procedure mmiOpenClick(Sender: TObject);
    procedure mmiNewClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
  end;

var
  MDIChildForm: TMDIChildForm;

implementation
uses MainFrm,  Printers;

{$R *.DFM}

procedure TMDIChildForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  { Reassign the toolbar parent }
  tlbMain.Parent := self;
  { If this is the last child form being displayed, then make the main form's
    toolbar visible }
  if (MainForm.MDIChildCount = 1) then
    MainForm.tlbMain.Visible := True
end;

procedure TMDIChildForm.mmiExitClick(Sender: TObject);
begin
  MainForm.Close;
end;

procedure TMDIChildForm.mmiCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TMDIChildForm.mmiOpenClick(Sender: TObject);
begin
  MainForm.mmiOpenClick(nil);
end;

procedure TMDIChildForm.mmiNewClick(Sender: TObject);
begin
  MainForm.mmiNewClick(nil);
end;

procedure TMDIChildForm.FormActivate(Sender: TObject);
begin
  { When the form becomes active, hide the main form's tool bar and assign
    this child form's tool bar to the parent form.   Then display this
    child form's toolbar. }
  MainForm.tlbMain.Visible := False;
  tlbMain.Parent := MainForm;
  tlbMain.Visible := True;
end;

procedure TMDIChildForm.FormDeactivate(Sender: TObject);
begin
  { The child form becomes inactive when it is either destroyed or when another
    child form becomes active.  Hide this form's toolbar so that the next form's
    toolbar will be visible. }
  tlbMain.Visible := False;
end;

end.


