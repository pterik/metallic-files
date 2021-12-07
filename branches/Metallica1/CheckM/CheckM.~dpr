program CheckM;

uses
  Forms,
  Connection in 'Connection.pas' {FormConnection},
  CommonUnit in '..\..\SharedRes\CommonUnit.pas',
  Export in 'Export.pas' {FormExport};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormConnection, FormConnection);
  Application.CreateForm(TFormExport, FormExport);
  Application.Run;
end.
