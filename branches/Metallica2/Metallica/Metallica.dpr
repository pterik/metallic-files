program Metallica;

uses
  Vcl.Dialogs,
  Forms,
  MainForm in 'MainForm.pas' {FormMain},
  EnterUser in 'EnterUser.pas' {FormEnterUser},
  Users in 'Users.pas' {FormUsers},
  UserUpdate in 'UserUpdate.pas' {FormUserUpdate},
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
  NewPriceList in 'NewPriceList.pas' {FormNewPriceList},
  NewItem in 'NewItem.pas' {FormNewItem},
  UserInsert in 'UserInsert.pas' {FormUserInsert},
  DBErrorExit in 'DBErrorExit.pas' {FormDBErrorExit};

{$R *.RES}
var R:boolean;
begin
  Application.Initialize;
  Application.Title := 'Редактирование прайсов';
  Application.CreateForm(TSplashForm, SplashForm);
  SplashForm.Show;
  Application.CreateForm(TFormMain, FormMain);
  FormMain.Visible:=false;
  Application.CreateForm(TFormDBErrorExit, FormDBErrorExit);
  Application.CreateForm(TFormEnterUser, FormEnterUser);
  Application.CreateForm(TDM, DM);
  SplashForm.Update;
  SplashForm.Hide;
  FormDBErrorExit.Hide;
  //R:=FormEnterUser.ConnectToDatabase;
  //if R
  //	then FormEnterUser.ShowModal
  //  else
  //  	begin
  //    FormDBErrorExit.SetPosition(100,100);
  //    FormDBErrorExit.ShowModal;
  //    end;
  //if R then FormMain.ShowModal;
  SplashForm.Close;
	Application.Run;
end.
