unit MdiChild;

interface

uses
  Windows, Classes, Graphics, Forms, Controls, Grids, DBGridEh, ComCtrls,
  DB, ZAbstractRODataset, ZDataset, DataModule, StdCtrls;

type
  TFormMDIChild = class(TForm)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  end;

implementation

{$R *.DFM}

procedure TFormMDIChild.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:= caFree;
end;

end.
