unit ChangePrice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DBCtrls, DB, Grids, DBGrids, Mask,
  ZAbstractRODataset, ZDataset, DBCtrlsEh, DBLookupEh, DBGridEh,
  ZAbstractDataset, StrUtils;

type
  TFormPriceChange = class(TForm)
    BitBtnCancel: TBitBtn;
    Label1: TLabel;
    Label4: TLabel;
    DSPrice: TDataSource;
    BitBtnSave: TBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    edtPrice: TEdit;
    edtNewPrice: TEdit;
    edtRest: TEdit;
    edtNewRest: TEdit;
    QPrice: TZReadOnlyQuery;
    QUpdatePrice: TZQuery;
    QRestField: TZReadOnlyQuery;
    strngfldQRestFieldGS_FIELD: TStringField;
    intgrfldQRestFieldGS_ORDERBY: TIntegerField;
    intgrfldQPricePL_ID: TIntegerField;
    fltfldQPricePL_PRICE: TFloatField;
    strngfldQPriceREST: TStringField;
    procedure BitBtnCancelClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtnSaveClick(Sender: TObject);
  private
    F_ID:Integer;
    F_RestName:string;
  public
    procedure SetPosition(L, T: Integer);
    procedure SetNewPrice(PL_ID, PL_TREEID:integer);
  end;

var
  FormPriceChange: TFormPriceChange;

implementation

{$R *.dfm}

uses
  DataModule, MainForm, CommonUnit;

const
  isReloadList: Boolean = True;

  { TFormCompany }

procedure TFormPriceChange.SetPosition(L, T: Integer);
begin
  Left:= L + ShiftLeft;
  Top:= T + ShiftTop;
end;

procedure TFormPriceChange.BitBtnCancelClick(Sender: TObject);
begin
  FocusControl(EdtPrice);
end;

procedure TFormPriceChange.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of //
    VK_F2: BitBtnSave.Click;
    VK_Return: BitBtnSave.Click;
    VK_Escape: BitBtnCancel.Click;
  end; // case
end;

procedure TFormPriceChange.SetNewPrice(PL_ID, PL_TREEID:Integer);
begin
F_ID:=PL_ID;
EdtPrice.Clear;
EdtNewPrice.Clear;
EdtRest.Clear;
EdtNewRest.Clear;
QRestField.Close;
QRestField.ParamByName('TREEID').AsInteger:= PL_TREEID;
QRestField.Open;
if VarIsNull(QRestField['GS_FIELD']) then F_RestName:='0' else F_RestName:=QRestField['GS_FIELD'];
QPrice.Close;
QPrice.SQL.Text:='select PL_ID, PL_PRICE, '+F_RestName+' REST from price_lines pl where pl_id = :id';
QPrice.ParamByName('ID').AsInteger:= F_ID;
QPrice.Open;
EdtPrice.Text:=FloatToStr(0.01*Round(100*QPrice['PL_PRICE']));
EdtNewPrice.Text:=FloatToStr(0.01*Round(100*QPrice['PL_PRICE']));
if VarIsNull(QPrice['REST'])
then
  begin
  EdtRest.Text:='';
  EdtNewRest.Text:='0';
  end
else
  begin
  EdtRest.Text:=QPrice['REST'];
  EdtNewRest.Text:=QPrice['REST'];
  end;
end;

procedure TFormPriceChange.BitBtnSaveClick(Sender: TObject);
begin
if (edtNewPrice.Text<>edtPrice.Text) or  (edtNewRest.Text<>edtRest.Text) then
  begin
  if Pos(',',edtNewPrice.Text)>0 then edtNewPrice.Text:=AnsiReplaceStr(edtNewPrice.Text,',',SysUtils.DecimalSeparator);
  if Pos('.',edtNewPrice.Text)>0 then edtNewPrice.Text:=AnsiReplaceStr(edtNewPrice.Text,'.',SysUtils.DecimalSeparator);
  if Pos(',',edtNewrest.Text)>0 then edtNewrest.Text:=AnsiReplaceStr(edtNewRest.Text,',',SysUtils.DecimalSeparator);
  if Pos('.',edtNewRest.Text)>0 then edtNewRest.Text:=AnsiReplaceStr(edtNewRest.Text,'.',SysUtils.DecimalSeparator);
  QUpdatePrice.Close;
  QUpdatePrice.ParamByName('ID').AsInteger:=F_ID;
  if F_RestName='0'
    then QUpdatePrice.SQL.Text:='UPDATE PRICE_LINES SET PL_PRICE=:PRICE WHERE PL_ID=:ID'
    else
      begin
      QUpdatePrice.SQL.Text:='UPDATE PRICE_LINES SET PL_PRICE=:PRICE, '+F_Restname+'=:RESTVALUE WHERE PL_ID=:ID';
      QUpdatePrice.ParamByName('RESTVALUE').AsString:=edtNewRest.Text;
      end;
  QUpdatePrice.ParamByName('PRICE').AsFloat:=StrToFloat(edtNewPrice.Text);
  QUpdatePrice.ExecSQL;
  end;
end;

end.

