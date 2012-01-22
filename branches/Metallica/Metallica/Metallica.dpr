program Metallica;

uses
  Forms,
  MainForm in 'MainForm.pas' {FormMain},
  About in 'About.pas' {FormAbout},
  EnterUser in 'EnterUser.pas' {FormEnterUser},
  Users in 'Users.pas' {FormUsers},
  UserUpdate in 'UserUpdate.pas' {FormUserUpdate},
  UserInsert in 'UserInsert.pas' {FormUserInsert},
  Splash in 'Splash.pas' {SplashForm},
  DataModule in 'DataModule.pas' {DM: TDataModule},
  NewCompany in 'NewCompany.pas' {FormNewCompany},
  UpdateCompany in 'UpdateCompany.pas' {FormUpdateCompany},
  SQL in 'SQL.pas' {FormSQL},
  ForBOSS in 'ForBOSS.pas' {FormForBoss},
  Settings in 'Settings.pas' {FormSettings},
  CommonUnit in '..\..\SharedRes\CommonUnit.pas',
  Companies in 'Companies.pas' {FormCompanies},
  NewPhone in 'NewPhone.pas' {FormNewPhone},
  SelectCompany in 'SelectCompany.pas' {FormSelectCompany},
  ShowCompany in 'ShowCompany.pas' {FormCompaniesShow},
  ShowPrice in 'ShowPrice.pas' {FormPriceShow},
  NewSubItem in 'NewSubItem.pas' {FormNewSubItem},
  SelectTree in 'SelectTree.pas' {FormSelectTree},
  NewPriceRow in 'NewPriceRow.pas' {FormNewPriceRow},
  UpdateTree in 'UpdateTree.pas' {FormUpdateTree},
  UpdateHeader in 'UpdateHeader.pas' {FormUpdateHeader},
  NewItem in 'NewItem.pas' {FormNewItem},
  NewPriceList in 'NewPriceList.pas' {FormNewPriceList};

{$R *.RES}
begin
  Application.Initialize;
  SplashForm:=TSplashForm.Create(Application);
  SplashForm.Show;
  SplashForm.Update;
  Application.Title := '�������������� �������';
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TFormEnterUser, FormEnterUser);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFormUpdateHeader, FormUpdateHeader);
  Application.CreateForm(TFormNewItem, FormNewItem);
  Application.CreateForm(TFormNewPriceList, FormNewPriceList);
  SplashForm.Hide;
  FormEnterUser.ConnectToDatabase;
  SplashForm.Close;
  SplashForm.Free;
	Application.Run;
end.