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
    intgrfldQPricePL_ID: TIntegerField;
    fltfldQPricePL_PRICE: TFloatField;
    intgrfldQPricePL_ID_1: TIntegerField;
    intgrfldQPricePL_HEADERID: TIntegerField;
    intgrfldQPricePL_TREEID: TIntegerField;
    fltfldQPricePL_PRICE_1: TFloatField;
    strngfldQPricePL_VALUE1: TStringField;
    strngfldQPricePL_VALUE2: TStringField;
    strngfldQPricePL_VALUE3: TStringField;
    strngfldQPricePL_VALUE4: TStringField;
    strngfldQPricePL_VALUE5: TStringField;
    strngfldQPricePL_VALUE6: TStringField;
    strngfldQPricePL_VALUE7: TStringField;
    strngfldQPricePL_VALUE8: TStringField;
    strngfldQPricePL_VALUE9: TStringField;
    intgrfldQPricePL_ORDERBY: TIntegerField;
    dtmfldQPricePL_DATE_UPDATE: TDateTimeField;
    smlntfldQPricePL_ISCLOSED: TSmallintField;
    QUpdatePrice: TZQuery;
    procedure BitBtnCancelClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtnSaveClick(Sender: TObject);
  private
    F_ID:Integer;
  public
    procedure SetPosition(L, T: Integer);
    procedure SetNewPrice(PL_ID:integer; RestField_Name:string);
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

procedure TFormPriceChange.SetNewPrice(PL_ID:Integer; RestField_Name:string);
begin
F_ID:=PL_ID;
EdtPrice.Clear;
EdtNewPrice.Clear;
EdtRest.Clear;
EdtNewRest.Clear;
QPrice.Close;
QPrice.ParamByName('ID').AsInteger:= F_ID;
QPrice.Open;
EdtPrice.Text:=FloatToStr(0.01*Round(100*QPrice['PL_PRICE']));
EdtNewPrice.Text:=FloatToStr(0.01*Round(100*QPrice['PL_PRICE']));
EdtRest.Text:=QPrice.FieldByName(RestField_Name).Value;
end;

procedure TFormPriceChange.BitBtnSaveClick(Sender: TObject);
begin
if edtNewPrice.Text<>edtPrice.Text then
  begin
  if Pos(',',edtNewPrice.Text)>0 then edtNewPrice.Text:=AnsiReplaceStr(edtNewPrice.Text,',',SysUtils.DecimalSeparator);
  if Pos('.',edtNewPrice.Text)>0 then edtNewPrice.Text:=AnsiReplaceStr(edtNewPrice.Text,'.',SysUtils.DecimalSeparator);
  QUpdatePrice.Close;
  QUpdatePrice.ParamByName('ID').AsInteger:=F_ID;
  QUpdatePrice.ParamByName('PRICE').AsFloat:=StrToFloat(edtNewPrice.Text);
  QUpdatePrice.ExecSQL;
  end;
end;

end.

