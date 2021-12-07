unit ForBOSS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset;

type
  Flds= record
  Field, Header,DisplayFormat :string;
  Size,Show,Orderby:integer;
  end;
  TFormForBoss = class(TForm)
    BitBtnClose: TBitBtn;
    BitBtnAdditional: TBitBtn;
    BitBtnUpdateTree: TBitBtn;
    BitBtn1: TBitBtn;
    qGlobDelete: TZQuery;
    qGlobDeleteCNTR: TIntegerField;
    qGlobInsert: TZQuery;
    procedure BitBtnAdditionalClick(Sender: TObject);
    procedure BitBtnUpdateTreeClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
  F_D1, F_D2:TDate;
  Fld:array[0..13] of Flds;
  public
    procedure SetDates(D1, D2: TDate);
    procedure SetPosition(L, T: integer);
  end;

var
  FormForBoss: TFormForBoss;

implementation

uses DataModule, MainForm, UpdateTree, Settings;

{$R *.dfm}

procedure TFormForBoss.SetPosition(L,T:integer);
begin
Left:=(Screen.Width-Width) div 2;
Top:=(Screen.Height-Height) div 2;
end;

procedure TFormForBoss.SetDates(D1, D2:TDate);
begin
F_D1:=D1;
F_D2:=D2;
end;


procedure TFormForBoss.BitBtnAdditionalClick(Sender: TObject);
begin
if FormSettings=nil then Application.CreateForm(TFormSettings, FormSettings);
FormSettings.SetPosition(Self.Left,Self.Top);
FormSettings.SetForm;
FormSettings.ShowModal;
end;

procedure TFormForBoss.BitBtnUpdateTreeClick(Sender: TObject);
begin
if FormUpdateTree=nil then  Application.CreateForm(TFormUpdateTree, FormUpdateTree);
FormUpdateTree.SetPosition(FormMain.Left,FormMain.Top);
FormUpdateTree.SetTree();
FormUpdateTree.ShowModal;
end;

procedure TFormForBoss.BitBtn1Click(Sender: TObject);
var
  I: Integer;
begin
if MessageDlg('Все 10 полей станут видны, их размеры будут изменены'+chr(10) +chr(13)+'на размеры по умолчанию. Согласны?',mtWarning, [mbYes,mbNo],0) =mrNo then exit;
qGlobDelete.Close;
qGlobDelete.ExecSQL;
i:=0;
Fld[i].Field:='PL_PARENT';Fld[i].Header:='Раздел';Fld[i].Size:=100;
Fld[i].DisplayFormat:='';Fld[i].Show:= 1;Fld[i].Orderby:=i;
i:=1;
Fld[i].Field:='PT_VALUE';Fld[i].Header:='Подраздел';Fld[i].Size:=150;
Fld[i].DisplayFormat:='';Fld[i].Show:= 1;Fld[i].Orderby:=i;
i:=2;
Fld[i].Field:='PL_PRICE';Fld[i].Header:='Цена';Fld[i].Size:=80;
Fld[i].DisplayFormat:='';Fld[i].Show:= 1;Fld[i].Orderby:=i;
i:=3;
Fld[i].Field:='CM_NAME';Fld[i].Header:='Поставщик';Fld[i].Size:=150;
Fld[i].DisplayFormat:='';Fld[i].Show:= 1;Fld[i].Orderby:=i;
i:=4;
Fld[i].Field:='CM_CITY';Fld[i].Header:='Город';Fld[i].Size:=70;
Fld[i].DisplayFormat:='';Fld[i].Show:= 1;Fld[i].Orderby:=i;
for I := 1 to 9 do
begin
Fld[i+4].Field:='PL_VALUE'+IntToStr(i);Fld[i+4].Header:='Поле '+IntToStr(i);Fld[i+4].Size:=80;
Fld[i+4].DisplayFormat:='';Fld[i+4].Show:= 1;Fld[i+4].Orderby:=i+4;
end;
for I := 0 to 13 do
  begin
  qGlobInsert.Close;
  qGlobInsert.ParamByName('FIELD').AsString:=Fld[i].Field;
  qGlobInsert.ParamByName('SIZE').AsInteger:=Fld[i].Size;
  qGlobInsert.ParamByName('HEADER').AsString:=Fld[i].Header;
  qGlobInsert.ParamByName('SHOW').AsInteger:=Fld[i].Show;
  qGlobInsert.ParamByName('DISPLAYFORMAT').AsString:=Fld[i].DisplayFormat;
  qGlobInsert.ParamByName('ORDERBY').AsInteger:=Fld[i].Orderby;
  qGlobInsert.ExecSQL;
  end;
end;

end.
