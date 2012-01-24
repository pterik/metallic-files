program MetallicaView;

uses
  Forms,
  MainForm in 'MainForm.pas' {FormMain},
  ShowTree in 'ShowTree.pas' {FormTree},
  EnterUser in 'EnterUser.pas' {FormEnterUser},
  CommonUnit in '..\..\SharedRes\CommonUnit.pas',
  ShowCompany in 'ShowCompany.pas' {FormCompaniesShow},
  About in 'About.pas' {FormAbout},
  DataModule in 'DataModule.pas' {DM: TDataModule},
  Splash in 'Splash.pas' {SplashForm},
  MdiChild in 'MdiChild.pas' {FormMDIChild},
  ShowPrice in 'ShowPrice.pas' {FormPriceShow},
  ChangePrice in 'ChangePrice.pas' {FormChangePrice};

{$R *.RES}

begin
  Application.Initialize;
  SplashForm:=TSplashForm.Create(Application);
  SplashForm.Show;
  SplashForm.Update;
  Application.Title := 'Просмотр прайсов';
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TFormEnterUser, FormEnterUser);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFormChangePrice, FormChangePrice);
  SplashForm.Hide;
  FormEnterUser.ConnectToDatabase;
  SplashForm.Close;
  SplashForm.Free;
	Application.Run;
end.
