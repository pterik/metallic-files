program MetallicaView;

uses
  Forms,
  MainForm in 'MainForm.pas' {FormMain},
  ShowTree in 'ShowTree.pas' {FormTree},
  CommonUnit in '..\..\SharedRes\CommonUnit.pas',
  ShowCompany in 'ShowCompany.pas' {FormCompaniesShow},
  About in 'About.pas' {FormAbout},
  DataModule in 'DataModule.pas' {DM: TDataModule},
  Splash in 'Splash.pas' {SplashForm},
  MdiChild in 'MdiChild.pas' {FormMDIChild},
  ShowPrice in 'ShowPrice.pas' {FormPriceShow},
  ChangePrice in 'ChangePrice.pas' {FormPriceChange};

{$R *.RES}

begin
  Application.Initialize;
//  SplashForm:=TSplashForm.Create(Application);
//  SplashForm.Show;
//  SplashForm.Update;
  Application.Title := 'Просмотр прайсов';
  Application.CreateForm(TFormMain, FormMain);
  //Application.CreateForm(TDM, DM);
  //Application.CreateForm(TFormPriceChange, FormPriceChange);
//  SplashForm.Hide;
  //FormMain.ConnectToDatabase;
//  SplashForm.Close;
//  SplashForm.Free;
	Application.Run;
end.
