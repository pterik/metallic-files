unit NewCompany;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Buttons, DBCtrls, DB, Grids, DBGrids, Mask, ZAbstractRODataset, 
  ZDataset, DBCtrlsEh, DBLookupEh, DBGridEh, sBitBtn, sLabel, sEdit, sCheckBox, sMaskEdit, sComboBox, sMemo,
  sDialogs, sSpeedButton;

type
  TFormNewCompany = class(TForm)
    BitBtnCancel: TsBitBtn;
    EditCompany: TsEdit;
    Label1: TsLabel;
    Label2: TsLabel;
    Label4: TsLabel;
    MEChars: TsMaskEdit;
    Label5: TsLabel;
    Label6: TsLabel;
    QCompanyNameType: TZReadOnlyQuery;
    DSCompanyNameType: TDataSource;
    QCompanyNameTypeCNT_ID: TIntegerField;
    QCompanyNameTypeCNT_NAME: TStringField;
    CBCompanyNameType: TsComboBox;
    MemoComment: TsMemo;
    Label7: TsLabel;
    Label8: TsLabel;
    BitBtnSave: TsBitBtn;
    Label3: TsLabel;
    EditCity: TsEdit;
    Label9: TsLabel;
    QTrustLevel: TZReadOnlyQuery;
    QTrustLevelTL_ID: TIntegerField;
    DSTrust: TDataSource;
    CBTrustLevel: TsComboBox;
    QTrustLevelTL_LEVEL: TIntegerField;
    QTrustLevelTL_COLOR: TIntegerField;
    QTrustLevelTL_NAME: TStringField;
    Label10: TsLabel;
    txtPriceList: TsEdit;
    btnSelectPrice: TsSpeedButton;
    SelectPriceDialog: TsOpenDialog;
    lblBusiness: TsLabel;
    mmoBusiness: TsMemo;
    procedure BitBtnCancelClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtnSaveClick(Sender: TObject);
    procedure btnSelectPriceClick(Sender: TObject);
  private
    F_LastOperType: string;
  public
    procedure SetPosition(L, T: Integer);
    procedure SetNewCompany(const IsChangeOwner: Boolean);
  end;

var
  FormNewCompany: TFormNewCompany;

implementation

{$R *.dfm}

uses
  DataModule, MainForm, Companies, CommonUnit;

const
  isReloadList: Boolean = True;

  { TFormCompany }

procedure TFormNewCompany.SetPosition(L, T: Integer);
begin
  Left:= L + ShiftLeft;
  Top:= T + ShiftTop;
end;

procedure TFormNewCompany.SetNewCompany(const IsChangeOwner: Boolean);
begin
  EditCompany.Clear;
  EditCity.Clear;
  txtPriceList.Clear;
  MemoComment.Clear;
  mmoBusiness.Clear;
  MEChars.Text:= IntToStr(FormMain.SearchChars);
  if (F_LastOperType = '') or (F_LastOperType = 'INS') then
  begin
    QCompanyNameType.Close;
    QCompanyNameType.Open;
    QCompanyNameType.First;
    CBCompanyNameType.Clear;
    while not QCompanyNameType.eof do
    begin
      CBCompanyNameType.Items.Add(QCompanyNameType['CNT_NAME']);
      QCompanyNameType.Next;
    end;
  end;
  CBCompanyNameType.Text:= '';
  QTrustlevel.Close;
  QTrustlevel.Open;
  QTrustlevel.First;
  CBTrustlevel.Clear;
  CBTrustlevel.Text:= QTrustlevel['TL_NAME'];
  while not QTrustlevel.eof do
  begin
    CBTrustLevel.Items.Add(QTrustlevel['TL_NAME']);
    QTrustLevel.Next;
  end;
end;

procedure TFormNewCompany.BitBtnCancelClick(Sender: TObject);
begin
  FocusControl(EditCompany);
end;

procedure TFormNewCompany.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of //
    VK_F2: BitBtnSave.Click;
    VK_Escape: BitBtnCancel.Click;
  end; // case
end;

procedure TFormNewCompany.BitBtnSaveClick(Sender: TObject);
var
  SToScreenText, CompanyNamePlusNT: string;
  Found, TrustLevel: Integer;
begin
  if Length(EditCompany.Text) < 3 then begin
    MessageDlg('Название компании слишком маленькое, увеличьте его. При необходимости добавьте пробелы ', mtError, [mbOK], 0);
    ModalResult:= mrNone;
    Exit;
  end;
  //Для поиска имени
  SToScreenText:= DM.CompanySearchLikeName(ANSIUpperCase(EditCompany.Text),
    FormMain.SearchChars, False, Found);
  //Для вставки в БД
  if Trim(CBCompanyNameType.Text) = '' then
    CompanyNamePlusNT:= EditCompany.Text
  else
    CompanyNamePlusNT:= EditCompany.Text + ', ' + CBCompanyNameType.Text;
  TrustLevel:= 0;
  qTrustlevel.Close;
  qTrustlevel.Open;
  qTrustlevel.First;
  while not QTrustlevel.eof do
    begin
    if QTrustlevel['TL_NAME'] = CBTrustLevel.Text then
      begin
      TrustLevel:= QTrustlevel['TL_ID'];
      Break;
      end;
    QTrustlevel.Next;
  end; // while
  if Found > 0 then
    begin
    if MessageDlg(SToScreenText + Chr(13) + Chr(10) + 'Подтвердите сохранение',
      mtConfirmation, [mbYes, mbNo], 0) = mrNo then
      begin
      ModalResult:= mrNone;
      Exit;
      end;
    DM.CompanyInsert(CompanyNamePlusNT, EditCity.Text, TrustLevel, MemoComment.text +
      Chr(13) + Chr(10) + 'Найдены похожие названия', Trim(txtPriceList.Text), UpperCase(Trim(mmoBusiness.Text)));
    DM.CompanyNTInsertOrUpdate(CBCompanyNameType.Text, F_LastOperType);
    //F_LastOperType='INS' определяет, что список CBCompanyNameType нужно передернуть
    //По умолчанию эта строка пустая
    end
  else
    begin
    DM.CompanyInsert(CompanyNamePlusNT, EditCity.Text, TrustLevel,
      DeleteLastReturn(MemoComment.Text), Trim(txtPriceList.Text), UpperCase(Trim(mmoBusiness.Text)));
    DM.CompanyNTInsertOrUpdate(CBCompanyNameType.Text, F_LastOperType);
    MessageDlg('Название успешно сохранено', mtInformation, [mbOK], 0);
    end;
  FocusControl(EditCompany);
end;

procedure TFormNewCompany.btnSelectPriceClick(Sender: TObject);
begin
  SelectPriceDialog.FileName:= txtPriceList.Text;
  if SelectPriceDialog.Execute then begin
    txtPriceList.Text:= SelectPriceDialog.FileName;
  end;
end;

end.

