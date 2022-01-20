unit NewPriceRow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Buttons, DB, Grids, DBGrids, DBGridEh, ComCtrls, Mask,
  DBCtrlsEh, DataModule, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls,
  DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh, sLabel, sEdit, sCheckBox,
  sMaskEdit, sComboBox, sMemo, sDialogs, sSpeedButton, sBitBtn, DBAccess, Uni,
  MemDS, sSkinProvider, sSkinManager, Vcl.ExtCtrls, sPanel;

type
  TFormNewPriceRow = class(TForm)
    EditCompany: TsEdit;
    LabelComp: TsLabel;
    LabelCity: TsLabel;
    EditAddress: TsEdit;
    BitBtnCancel: TsBitBtn;
    BitBtnSave: TsBitBtn;
    Label1: TsLabel;
    EditNodeValue: TsEdit;
    EditCity: TsEdit;
    Label4: TsLabel;
    QCompany: TUniQuery;
    sSkinManager1: TsSkinManager;
    sSkinProvider1: TsSkinProvider;
    QCompanyCOMPANYID: TIntegerField;
    QCompanyCM_CITY: TStringField;
    QCompanyCM_NAME: TStringField;
    QCompanyCM_COMMENT: TStringField;
    UniSQLRowInsert: TUniSQL;
    QueryFieldNames: TUniQuery;
    QueryFieldNamesGS_TREEID: TIntegerField;
    QueryFieldNamesGS_FIELD: TStringField;
    QueryFieldNamesGS_HEADER: TStringField;
    QueryFieldNamesGS_SHOW: TSmallintField;
    QueryFieldNamesGS_SIZE: TIntegerField;
    QueryFieldNamesGS_DISPLAYFORMAT: TStringField;
    QueryFieldNamesGS_ORDERBY: TIntegerField;
    sPanel1: TsPanel;
    sPL_PRICE: TsEdit;
    sLabel2: TsLabel;
    sL1: TsLabel;
    sL2: TsLabel;
    sL3: TsLabel;
    sL4: TsLabel;
    sL5: TsLabel;
    sPL_VALUE1: TsEdit;
    sPL_VALUE2: TsEdit;
    sPL_VALUE3: TsEdit;
    sPL_VALUE4: TsEdit;
    sPL_VALUE5: TsEdit;
    sL6: TsLabel;
    sL7: TsLabel;
    sL8: TsLabel;
    sL9: TsLabel;
    sPL_VALUE6: TsEdit;
    sPL_VALUE7: TsEdit;
    sPL_VALUE8: TsEdit;
    sPL_VALUE9: TsEdit;
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtnSaveClick(Sender: TObject);
    procedure BitBtnCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    MyNode:TNodeValue;
    F_CompanyID:integer;
    F_HeaderID:integer;
    F_MaxOrderBy:integer;
  public
    procedure SetPosition(L, T: integer);
    procedure SetNewPriceRow(CompanyID, TreeID, HeaderID, MaxOrderBy:integer);
  end;

var
  FormNewPriceRow: TFormNewPriceRow;

implementation

uses MainForm, CommonUnit;

{$R *.dfm}

{ TFormPriceShow }

procedure TFormNewPriceRow.SetPosition(L,T:integer);
begin
Left:=L+ShiftLeft;
Top:=T+ShiftTop;
end;

procedure TFormNewPriceRow.SetNewPriceRow(CompanyID, TreeID, HeaderID, MaxOrderBy :integer);
begin
MyNode.ID:=TreeID;
F_HeaderID:=HeaderID;
F_CompanyID:=CompanyID;
F_MaxOrderBy:=MaxOrderBy;
qCompany.Close;
QCompany.ParamByName('COMPANYID').AsInteger:=CompanyID;
qCompany.Open;
EditCompany.Text:=QCompany['CM_NAME'];
EditCity.Text:=QCompany['CM_CITY'];
EditAddress.Text:=DeleteReturns(QCompany['CM_COMMENT']);
EditNodeValue.Text:=MyNode.Value;
sPL_PRICE.Text:='0.00';
QueryFieldNames.Close;
QueryFieldNames.ParamByName('TREEID').Value:=TreeID;
QueryFieldNames.Open;
while not QueryFieldNames.EOF do
  begin
		if QueryFieldNames['GS_FIELD']='PL_VALUE1' then sL1.Caption:=QueryFieldNames['GS_HEADER'];
		if QueryFieldNames['GS_FIELD']='PL_VALUE2' then sL2.Caption:=QueryFieldNames['GS_HEADER'];
		if QueryFieldNames['GS_FIELD']='PL_VALUE3' then sL3.Caption:=QueryFieldNames['GS_HEADER'];
		if QueryFieldNames['GS_FIELD']='PL_VALUE4' then sL4.Caption:=QueryFieldNames['GS_HEADER'];
		if QueryFieldNames['GS_FIELD']='PL_VALUE5' then sL5.Caption:=QueryFieldNames['GS_HEADER'];
		if QueryFieldNames['GS_FIELD']='PL_VALUE6' then sL6.Caption:=QueryFieldNames['GS_HEADER'];
		if QueryFieldNames['GS_FIELD']='PL_VALUE7' then sL7.Caption:=QueryFieldNames['GS_HEADER'];
		if QueryFieldNames['GS_FIELD']='PL_VALUE8' then sL8.Caption:=QueryFieldNames['GS_HEADER'];
		if QueryFieldNames['GS_FIELD']='PL_VALUE9' then sL9.Caption:=QueryFieldNames['GS_HEADER'];
    QueryFieldNames.Next;
  end;


sPL_VALUE1.Text:='';
sPL_VALUE2.Text:='';
sPL_VALUE3.Text:='';
sPL_VALUE4.Text:='';
sPL_VALUE5.Text:='';
sPL_VALUE6.Text:='';
sPL_VALUE7.Text:='';
sPL_VALUE8.Text:='';
sPL_VALUE9.Text:='';
end;


procedure TFormNewPriceRow.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
case Key of    //
  VK_F9: begin FocusControl(BitBtnSave); BitBtnSave.Click; end;
end;    // case

end;

procedure TFormNewPriceRow.BitBtnSaveClick(Sender: TObject);
begin
UniSQLRowInsert.Prepare;
UniSQLRowInsert.ParamByName('PL_HEADERID').Value:=F_HeaderID;
UniSQLRowInsert.ParamByName('PL_TREEID').Value:= MyNode.ID;
UniSQLRowInsert.ParamByName('PL_PRICE').Value:=StrToIntDef(sPL_Price.Text,0);
UniSQLRowInsert.ParamByName('PL_VALUE1').Value:= sPL_Value1.Text;
UniSQLRowInsert.ParamByName('PL_VALUE2').Value:= sPL_Value2.Text;
UniSQLRowInsert.ParamByName('PL_VALUE3').Value:= sPL_Value3.Text;
UniSQLRowInsert.ParamByName('PL_VALUE4').Value:= sPL_Value4.Text;
UniSQLRowInsert.ParamByName('PL_VALUE5').Value:= sPL_Value5.Text;
UniSQLRowInsert.ParamByName('PL_VALUE6').Value:= sPL_Value6.Text;
UniSQLRowInsert.ParamByName('PL_VALUE7').Value:= sPL_Value7.Text;
UniSQLRowInsert.ParamByName('PL_VALUE8').Value:= sPL_Value8.Text;
UniSQLRowInsert.ParamByName('PL_VALUE9').Value:= sPL_Value9.Text;
UniSQLRowInsert.ParamByName('PL_ORDERBY').Value:= F_MaxOrderBy;
UniSQLRowInsert.ParamByName('PL_DATE_UPDATE').Value:= Now();
UniSQLRowInsert.Execute;
//ZTableInsert.Insert;
//ZTableInsert['PL_DATE_UPDATE']:=Now();
//ZTableInsert.Post;
//ZTableInsert.CommitUpdates;
ModalResult:=mrOk;
end;

procedure TFormNewPriceRow.BitBtnCancelClick(Sender: TObject);
begin
//ZTableInsert.Cancel;
//ZTableInsert.CancelUpdates;
end;

procedure TFormNewPriceRow.FormCreate(Sender: TObject);
begin
NullStrictConvert := False;
MyNode:=TNodeValue.Create;
end;

procedure TFormNewPriceRow.FormDestroy(Sender: TObject);
begin
MyNode.Destroy;
end;

end.
