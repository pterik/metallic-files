unit UpdatePriceRow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Buttons, DB, Grids, DBGrids, DBGridEh, ComCtrls, Mask,
  DBCtrlsEh, DataModule, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls,
  DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh, sLabel, sEdit, sCheckBox,
  sMaskEdit, sComboBox, sMemo, sDialogs, sSpeedButton,
  sBitBtn, DBAccess, Uni, MemDS, sSkinProvider, sSkinManager, Vcl.ExtCtrls,
  sPanel;

type
  TFormUpdatePriceRow = class(TForm)
    GridView: TDBGridEh;
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
    qDataView: TUniQuery;
    DSEdit: TUniDataSource;
    DSData: TUniDataSource;
    qDataViewPL_ID: TIntegerField;
    qDataViewPL_HEADERID: TIntegerField;
    qDataViewPL_TREEID: TIntegerField;
    qDataViewPL_PRICE: TFloatField;
    qDataViewPL_VALUE1: TStringField;
    qDataViewPL_VALUE2: TStringField;
    qDataViewPL_VALUE3: TStringField;
    qDataViewPL_VALUE4: TStringField;
    qDataViewPL_VALUE5: TStringField;
    qDataViewPL_VALUE6: TStringField;
    qDataViewPL_VALUE7: TStringField;
    qDataViewPL_VALUE8: TStringField;
    qDataViewPL_VALUE9: TStringField;
    qDataViewPL_ORDERBY: TIntegerField;
    qDataViewPL_DATE_UPDATE: TDateTimeField;
    qDataViewPL_ISCLOSED: TSmallintField;
    sSkinManager1: TsSkinManager;
    sSkinProvider1: TsSkinProvider;
    QCompanyCOMPANYID: TIntegerField;
    QCompanyCM_CITY: TStringField;
    QCompanyCM_NAME: TStringField;
    QCompanyCM_COMMENT: TStringField;
    QPriceLinesEdit: TUniQuery;
    QPriceLinesEditPL_ID: TIntegerField;
    QPriceLinesEditPL_HEADERID: TIntegerField;
    QPriceLinesEditPL_TREEID: TIntegerField;
    QPriceLinesEditPL_PRICE: TFloatField;
    QPriceLinesEditPL_VALUE1: TStringField;
    QPriceLinesEditPL_VALUE2: TStringField;
    QPriceLinesEditPL_VALUE3: TStringField;
    QPriceLinesEditPL_VALUE4: TStringField;
    QPriceLinesEditPL_VALUE5: TStringField;
    QPriceLinesEditPL_VALUE6: TStringField;
    QPriceLinesEditPL_VALUE7: TStringField;
    QPriceLinesEditPL_VALUE8: TStringField;
    QPriceLinesEditPL_VALUE9: TStringField;
    QPriceLinesEditPL_ORDERBY: TIntegerField;
    QPriceLinesEditPL_DATE_UPDATE: TDateTimeField;
    QPriceLinesEditPL_ISCLOSED: TSmallintField;
    QPriceLinesUpdate: TUniSQL;
    sPanel1: TsPanel;
    sTextPrice: TsLabel;
    sTextValue1: TsLabel;
    sTextValue2: TsLabel;
    sTextValue3: TsLabel;
    sTextValue4: TsLabel;
    sTextValue5: TsLabel;
    sTextValue6: TsLabel;
    sTextValue7: TsLabel;
    sTextValue8: TsLabel;
    sTextValue9: TsLabel;
    sPL_PRICE: TsEdit;
    sPL_VALUE1: TsEdit;
    sPL_VALUE2: TsEdit;
    sPL_VALUE3: TsEdit;
    sPL_VALUE4: TsEdit;
    sPL_VALUE5: TsEdit;
    sPL_VALUE6: TsEdit;
    sPL_VALUE7: TsEdit;
    sPL_VALUE8: TsEdit;
    sPL_VALUE9: TsEdit;
    GridTable: TDBGridEh;
    sPL_OLDPRICE: TsEdit;
    sTextOldPrice: TsLabel;
    sLabel3: TsLabel;
    sLabel4: TsLabel;
    sLabel5: TsLabel;
    sPL_OLDVALUE1: TsEdit;
    sPL_OLDVALUE2: TsEdit;
    sPL_OLDVALUE3: TsEdit;
    sOldTextValue2: TsLabel;
    sOldTextValue3: TsLabel;
    sOldTextValue1: TsLabel;
    sPL_OLDVALUE7: TsEdit;
    sOldTextValue7: TsLabel;
    sOldTextValue8: TsLabel;
    sPL_OLDVALUE8: TsEdit;
    sOldTextValue9: TsLabel;
    sPL_OLDVALUE9: TsEdit;
    sPL_OLDVALUE4: TsEdit;
    sOldTextValue4: TsLabel;
    sOldTextValue5: TsLabel;
    sPL_OLDVALUE5: TsEdit;
    sOldTextValue6: TsLabel;
    sPL_OLDVALUE6: TsEdit;
    qDisplay: TUniQuery;
    qDisplayGS_TREEID: TIntegerField;
    qDisplayGS_FIELD: TStringField;
    qDisplayGS_HEADER: TStringField;
    qDisplayGS_SHOW: TSmallintField;
    qDisplayGS_SIZE: TIntegerField;
    qDisplayGS_DISPLAYFORMAT: TStringField;
    qDisplayGS_ORDERBY: TIntegerField;
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtnSaveClick(Sender: TObject);
    procedure BitBtnCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    MyNode:TNodeValue;
    F_CompanyID:integer;
    F_PL_ID:integer;
    procedure RefreshView;
    procedure RefreshTable;
    procedure RenameValues(const Treeid: Integer);
  public
    procedure SetPosition(L, T: integer);
    procedure SetUpdatePriceRow(CompanyID,TreeID, PL_ID:integer);
  end;

var
  FormUpdatePriceRow: TFormUpdatePriceRow;

implementation

uses MainForm, CommonUnit;

{$R *.dfm}

{ TFormPriceShow }

procedure TFormUpdatePriceRow.SetPosition(L,T:integer);
begin
Left:=L+ShiftLeft;
Top:=T+ShiftTop;
end;

procedure TFormUpdatePriceRow.SetUpdatePriceRow(CompanyID, TreeID, PL_ID:integer);
begin
MyNode.ID:=TreeID;
F_PL_ID:=PL_ID;
F_CompanyID:=CompanyID;
qCompany.Close;
QCompany.ParamByName('COMPANYID').AsInteger:=CompanyID;
qCompany.Open;
EditCompany.Text:=QCompany['CM_NAME'];
EditCity.Text:=QCompany['CM_CITY'];
EditAddress.Text:=DeleteReturns(QCompany['CM_COMMENT']);
EditNodeValue.Text:=MyNode.Value;
RefreshView;
RefreshTable;
end;

procedure TFormUpdatePriceRow.RefreshView;
begin
qDataView.Close;
qDataView.ParamByName('pl_id').AsInteger:=F_PL_ID;
qDataView.Open;
sPL_PRICE.Text:=qDataView['PL_PRICE'];
sPL_VALUE1.Text:=qDataView['PL_VALUE1'];
sPL_VALUE2.Text:=qDataView['PL_VALUE2'];
sPL_VALUE3.Text:=qDataView['PL_VALUE3'];
sPL_VALUE4.Text:=qDataView['PL_VALUE4'];
sPL_VALUE5.Text:=qDataView['PL_VALUE5'];
sPL_VALUE6.Text:=qDataView['PL_VALUE6'];
sPL_VALUE7.Text:=qDataView['PL_VALUE7'];
sPL_VALUE8.Text:=qDataView['PL_VALUE8'];
sPL_VALUE9.Text:=qDataView['PL_VALUE9'];
sPL_OLDPRICE.Text:=qDataView['PL_PRICE'];
sPL_OLDVALUE1.Text:=qDataView['PL_VALUE1'];
sPL_OLDVALUE2.Text:=qDataView['PL_VALUE2'];
sPL_OLDVALUE3.Text:=qDataView['PL_VALUE3'];
sPL_OLDVALUE4.Text:=qDataView['PL_VALUE4'];
sPL_OLDVALUE5.Text:=qDataView['PL_VALUE5'];
sPL_OLDVALUE6.Text:=qDataView['PL_VALUE6'];
sPL_OLDVALUE7.Text:=qDataView['PL_VALUE7'];
sPL_OLDVALUE8.Text:=qDataView['PL_VALUE8'];
sPL_OLDVALUE9.Text:=qDataView['PL_VALUE9'];

if MyNode.ParentID<>0
	then RenameValues(MyNode.ParentID)
	else RenameValues(MyNode.ID);
end;

procedure TFormUpdatePriceRow.RefreshTable;
begin
//ZTableEdit.Close;
//ZTableEdit.Filter:='PL_ID ='+IntToStr(F_LineID);
//ZTableEdit.Filtered:=true;
//ZTableEdit.Open;
QPriceLinesEdit.Close;
QPriceLinesEdit.ParamByName('PL_ID').Value :=IntToStr(F_PL_ID);
QPriceLinesEdit.Open;
if MyNode.ParentID<>0
	then RenameValues(MyNode.ParentID)
	else RenameValues(MyNode.ID);
end;

procedure TFormUpdatePriceRow.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
case Key of    //
  VK_F9: begin FocusControl(BitBtnSave); BitBtnSave.Click; end;
end;    // case

end;

procedure TFormUpdatePriceRow.BitBtnSaveClick(Sender: TObject);
begin
//Доделать маску при сохранении значений и при вводе данных
// Исправить текст для старых значений
// на форме прайса - при переходе на следующую строку обновлять цену
QPriceLinesUpdate.ParamByName('PL_ID').Value:=F_PL_ID;
QPriceLinesUpdate.ParamByName('PL_PRICE').Value:=StrToFloat(sPL_PRICE.Text);
QPriceLinesUpdate.ParamByName('PL_VALUE1').Value:=sPL_VALUE1.Text;
QPriceLinesUpdate.ParamByName('PL_VALUE2').Value:=sPL_VALUE2.Text;
QPriceLinesUpdate.ParamByName('PL_VALUE3').Value:=sPL_VALUE3.Text;
QPriceLinesUpdate.ParamByName('PL_VALUE4').Value:=sPL_VALUE4.Text;
QPriceLinesUpdate.ParamByName('PL_VALUE5').Value:=sPL_VALUE5.Text;
QPriceLinesUpdate.ParamByName('PL_VALUE6').Value:=sPL_VALUE6.Text;
QPriceLinesUpdate.ParamByName('PL_VALUE7').Value:=sPL_VALUE7.Text;
QPriceLinesUpdate.ParamByName('PL_VALUE8').Value:=sPL_VALUE8.Text;
QPriceLinesUpdate.ParamByName('PL_VALUE9').Value:=sPL_VALUE9.Text;
QPriceLinesUpdate.ParamByName('PL_DATE_UPDATE').Value:=Now();
QPriceLinesUpdate.Execute;
ModalResult:=mrOk;
end;

procedure TFormUpdatePriceRow.BitBtnCancelClick(Sender: TObject);
begin
//ZTableEdit.CancelUpdates;
end;

procedure TFormUpdatePriceRow.FormCreate(Sender: TObject);
begin
MyNode:=TNodeValue.Create;
end;

procedure TFormUpdatePriceRow.FormDestroy(Sender: TObject);
begin
MyNode.Destroy;
end;

procedure TFormUpdatePriceRow.ReNameValues(const Treeid: Integer);
var
  RowMaskEdit1, RowMaskEdit2, RowMaskEdit3, RowMaskEdit4, RowMaskEdit5:string;
  RowMaskEdit6, RowMaskEdit7, RowMaskEdit8, RowMaskEdit9:string;
  isVisible:boolean;
begin
  qDisplay.Close;
  //qDisplay.ParamByName('FORM').AsString:=FormName;
  // Выбираем одни и те же столбцы для раздела и подразделов
  // Для этого нужно отсылать ParentID а не ID
  qDisplay.ParamByName('TREEID').AsInteger:= TreeID;
  qDisplay.Open;
  while not QDisplay.Eof do
  	begin
    if qDisplay['GS_FIELD']='PL_VALUE1' then
      begin
	    sTextValue1.Caption:=qDisplay['GS_HEADER'];
      sPL_VALUE1.Width:= QDisplay['GS_SIZE'];
      isVisible:=(QDisplay['GS_SHOW'] = 1);
      sPL_VALUE1.Visible:=isVisible;
      sTextValue1.Visible:=isVisible;
      sPL_OLDVALUE1.Visible:=isVisible;
      sOldTextValue1.Visible:=isVisible;
      if not VarIsNull(QDisplay['GS_DISPLAYFORMAT']) then
	      if Length(Trim(QDisplay['GS_DISPLAYFORMAT'])) > 0
        	then RowMaskEdit1:= QDisplay['GS_DISPLAYFORMAT']
          else RowMaskEdit1:= '';
      end;
    if qDisplay['GS_FIELD']='PL_VALUE2' then
      begin
	    sTextValue2.Caption:=qDisplay['GS_HEADER'];
      sPL_VALUE2.Width:= QDisplay['GS_SIZE'];
      isVisible:=(QDisplay['GS_SHOW'] = 1);
      sPL_VALUE1.Visible:=isVisible;
      sTextValue1.Visible:=isVisible;
      sPL_OLDVALUE1.Visible:=isVisible;
      sOldTextValue1.Visible:=isVisible;
      if not VarIsNull(QDisplay['GS_DISPLAYFORMAT']) then
	      if Length(Trim(QDisplay['GS_DISPLAYFORMAT'])) > 0
        	then RowMaskEdit2:= QDisplay['GS_DISPLAYFORMAT']
          else RowMaskEdit2:= '';
      end;
    if qDisplay['GS_FIELD']='PL_VALUE3' then
      begin
	    sTextValue3.Caption:=qDisplay['GS_HEADER'];
      sPL_VALUE3.Width:= QDisplay['GS_SIZE'];
      isVisible:=(QDisplay['GS_SHOW'] = 1);
      sPL_VALUE3.Visible:=isVisible;
      sTextValue3.Visible:=isVisible;
      sPL_OLDVALUE3.Visible:=isVisible;
      sOldTextValue3.Visible:=isVisible;
      if not VarIsNull(QDisplay['GS_DISPLAYFORMAT']) then
	      if Length(Trim(QDisplay['GS_DISPLAYFORMAT'])) > 0
        	then RowMaskEdit3:= QDisplay['GS_DISPLAYFORMAT']
          else RowMaskEdit3:= '';
      end;
    if qDisplay['GS_FIELD']='PL_VALUE4' then
      begin
	    sTextValue4.Caption:=qDisplay['GS_HEADER'];
      sPL_VALUE4.Width:= QDisplay['GS_SIZE'];
      isVisible:=(QDisplay['GS_SHOW'] = 1);
      sPL_VALUE4.Visible:=isVisible;
      sTextValue4.Visible:=isVisible;
      sPL_OLDVALUE4.Visible:=isVisible;
      sOldTextValue4.Visible:=isVisible;
      if not VarIsNull(QDisplay['GS_DISPLAYFORMAT']) then
	      if Length(Trim(QDisplay['GS_DISPLAYFORMAT'])) > 0
        	then RowMaskEdit4:= QDisplay['GS_DISPLAYFORMAT']
          else RowMaskEdit4:= '';
      end;
    if qDisplay['GS_FIELD']='PL_VALUE5' then
      begin
	    sTextValue5.Caption:=qDisplay['GS_HEADER'];
      sPL_VALUE5.Width:= QDisplay['GS_SIZE'];
      isVisible:=(QDisplay['GS_SHOW'] = 1);
      sPL_VALUE5.Visible:=isVisible;
      sTextValue5.Visible:=isVisible;
      sPL_OLDVALUE5.Visible:=isVisible;
      sOldTextValue5.Visible:=isVisible;
      if not VarIsNull(QDisplay['GS_DISPLAYFORMAT']) then
	      if Length(Trim(QDisplay['GS_DISPLAYFORMAT'])) > 0
        	then RowMaskEdit5:= QDisplay['GS_DISPLAYFORMAT']
          else RowMaskEdit5:= '';
      end;
    if qDisplay['GS_FIELD']='PL_VALUE6' then
      begin
	    sTextValue6.Caption:=qDisplay['GS_HEADER'];
      sPL_VALUE6.Width:= QDisplay['GS_SIZE'];
      isVisible:=(QDisplay['GS_SHOW'] = 1);
      sPL_VALUE6.Visible:=isVisible;
      sTextValue6.Visible:=isVisible;
      sPL_OLDVALUE6.Visible:=isVisible;
      sOldTextValue6.Visible:=isVisible;
      if not VarIsNull(QDisplay['GS_DISPLAYFORMAT']) then
	      if Length(Trim(QDisplay['GS_DISPLAYFORMAT'])) > 0
        	then RowMaskEdit6:= QDisplay['GS_DISPLAYFORMAT']
          else RowMaskEdit6:= '';
      end;
    if qDisplay['GS_FIELD']='PL_VALUE7' then
      begin
	    sTextValue7.Caption:=qDisplay['GS_HEADER'];
      sPL_VALUE7.Width:= QDisplay['GS_SIZE'];
      isVisible:=(QDisplay['GS_SHOW'] = 1);
      sPL_VALUE7.Visible:=isVisible;
      sTextValue7.Visible:=isVisible;
      sPL_OLDVALUE7.Visible:=isVisible;
      sOldTextValue7.Visible:=isVisible;
      if not VarIsNull(QDisplay['GS_DISPLAYFORMAT']) then
	      if Length(Trim(QDisplay['GS_DISPLAYFORMAT'])) > 0
        	then RowMaskEdit7:= QDisplay['GS_DISPLAYFORMAT']
          else RowMaskEdit7:= '';
      end;
    if qDisplay['GS_FIELD']='PL_VALUE8' then
      begin
	    sTextValue8.Caption:=qDisplay['GS_HEADER'];
      sPL_VALUE8.Width:= QDisplay['GS_SIZE'];
      isVisible:=(QDisplay['GS_SHOW'] = 1);
      sPL_VALUE8.Visible:=isVisible;
      sTextValue8.Visible:=isVisible;
      sPL_OLDVALUE8.Visible:=isVisible;
      sOldTextValue8.Visible:=isVisible;
      if not VarIsNull(QDisplay['GS_DISPLAYFORMAT']) then
	      if Length(Trim(QDisplay['GS_DISPLAYFORMAT'])) > 0
        	then RowMaskEdit8:= QDisplay['GS_DISPLAYFORMAT']
          else RowMaskEdit8:= '';
      end;
    if qDisplay['GS_FIELD']='PL_VALUE9' then
      begin
	    sTextValue9.Caption:=qDisplay['GS_HEADER'];
      sPL_VALUE9.Width:= QDisplay['GS_SIZE'];
      isVisible:=(QDisplay['GS_SHOW'] = 1);
      sPL_VALUE9.Visible:=isVisible;
      sTextValue9.Visible:=isVisible;
      sPL_OLDVALUE9.Visible:=isVisible;
      sOldTextValue9.Visible:=isVisible;
      if not VarIsNull(QDisplay['GS_DISPLAYFORMAT']) then
	      if Length(Trim(QDisplay['GS_DISPLAYFORMAT'])) > 0
        	then RowMaskEdit9:= QDisplay['GS_DISPLAYFORMAT']
          else RowMaskEdit9:= '';
      end;
    QDisplay.Next;
  end;
end;
end.
