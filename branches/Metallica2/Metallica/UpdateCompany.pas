unit UpdateCompany;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Buttons, Mask, DB, ZAbstractRODataset, ZAbstractDataset, 
  ZDataset, DBCtrlsEh, DBLookupEh, DBGridEh, sLabel, sEdit, sCheckBox, sMaskEdit, sComboBox, sMemo,
  sDialogs, sSpeedButton, sBitBtn;

type
  TFormUpdateCompany = class(TForm)
    Label1: TsLabel;
    EditCompany: TsEdit;
    Label2: TsLabel;
    Label4: TsLabel;
    MEChars: TsMaskEdit;
    Label5: TsLabel;
    BitBtnCancel: TsBitBtn;
    LabelisClosed: TsLabel;
    EditComment: TsMemo;
    BitBtnSave: TsBitBtn;
    QCompany: TZQuery;
    QCompanyCM_ID: TIntegerField;
    QCompanyCM_NAME: TStringField;
    QCompanyCM_COMMENT: TStringField;
    QCompanyCM_ISCLOSED: TIntegerField;
    QCompanyCM_HYPERLINK: TStringField;
    Label6: TsLabel;
    Label7: TsLabel;
    Label3: TsLabel;
    EditCity: TsEdit;
    QCompanyCM_CITY: TStringField;
    QCompanyCM_TRUST: TSmallintField;
    Label8: TsLabel;
    CBTrustLevel: TsComboBox;
    DSTrust: TDataSource;
    QTrustLevel: TZReadOnlyQuery;
    QTrustLevelTL_ID: TIntegerField;
    QTrustLevelTL_LEVEL: TIntegerField;
    QTrustLevelTL_COLOR: TIntegerField;
    QTrustLevelTL_NAME: TStringField;
    Label9: TsLabel;
    txtPriceList: TsEdit;
    btnSelectPrice: TsSpeedButton;
    SelectPriceDialog: TsOpenDialog;
    lblBusiness: TsLabel;
    mmoBusiness: TsMemo;
    strngfldQCompanyCM_BUSINESS: TStringField;
    procedure BitBtnCancelClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtnSaveClick(Sender: TObject);
    procedure btnSelectPriceClick(Sender: TObject);
  private
    F_CompanyId: Integer;
  public
    procedure SetPosition(L, T: Integer);
    procedure SetCompany(CompanyID: Integer);
  end;

var
  FormUpdateCompany: TFormUpdateCompany;

implementation

{$R *.dfm}

uses
  Companies, DataModule, MainForm, CommonUnit;

procedure TFormUpdateCompany.SetPosition(L, T: Integer);
begin
  Left:= L + ShiftLeft;
  Top:= T + ShiftTop;
end;

procedure TFormUpdateCompany.SetCompany(CompanyID: Integer);
var
  Field: TField;
begin
  MEChars.Text:= IntToStr(FormMain.SearchChars);
  F_CompanyID:= CompanyID;
  QCompany.Close;
  QCompany.ParamByName('COMPANYID').AsInteger:= F_CompanyID;
  QCompany.Open;
  EditCompany.Text:= QCompany['CM_NAME'];
  EditCity.Text:= QCompany['CM_CITY'];
  EditComment.Text:= QCompany['CM_COMMENT'];
  txtPriceList.Text:= QCompany.FieldByName('CM_HYPERLINK').AsString;
  mmoBusiness.Text:= QCompany.FieldByName('CM_BUSINESS').AsString;  
  case QCompany['CM_ISCLOSED'] of //
    0: LabelIsClosed.Caption:= 'Компания открытая, сотрудничаем с ней';
    1: LabelIsClosed.Caption:= 'Компания закрытая, неактивная';
    else
      LabelIsClosed.Caption:= '';
  end; // case
  QTrustlevel.Close;
  QTrustlevel.Open;
  QTrustlevel.First;
  CBTrustlevel.Clear;
  CBTrustlevel.Text:= QTrustlevel['TL_NAME'];
  while not QTrustlevel.eof do begin
    CBTrustLevel.Items.Add(QTrustlevel['TL_NAME']);
    if QTrustlevel['TL_ID'] = QCompany['CM_TRUST'] then
      CBTrustLevel.Text:= QTrustlevel['TL_NAME'];
    QTrustLevel.Next;
  end;
end;

procedure TFormUpdateCompany.BitBtnSaveClick(Sender: TObject);
var
  SCompanyName, SimilarCompanies: string;
  SimilarCompanyID, Found, Trustlevel: Integer;
begin
  ModalResult:= mrOk;
  if Length(EditCompany.Text) < 3 then begin
    MessageDlg('Название компании слишком маленькое, увеличьте его. При необходимости добавьте пробелы ', mtError, [mbOK], 0);
    Exit;
  end;
  SCompanyName:= ANSIUpperCase(EditCompany.Text);
  SimilarCompanies:= DM.CompanySearchLikeName(SCompanyName, FormMain.SearchChars, True,
    Found);
  SimilarCompanyID:= DM.CompanySearchExactName(SCompanyName);
  //Found>1 если найдены компании с похожими именами
  //SimilarCompanyID<>F_CompanyID если есть запись с таким точно именем.
  if (SimilarCompanyID <> F_CompanyID) and (SimilarCompanyID <> 0) then begin
    if MessageDlg('Компания с таким точно именем уже существует' + Chr(13) + Chr(10) +
      'Подтвердить сохранение?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
      Exit;
  end;

  if Found > 1 then
    if MessageDlg('Компания с похожими именами уже существуют' + Chr(13) + Chr(10)
      + SimilarCompanies + Chr(13) + Chr(10)
      + 'Подтвердить сохранение?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
      Exit;
  TrustLevel:= 0;
  qTrustlevel.Close;
  qTrustlevel.Open;
  qTrustlevel.First;
  while not QTrustlevel.eof do begin
    if QTrustlevel['TL_NAME'] = CBTrustLevel.Text then begin
      TrustLevel:= QTrustlevel['TL_ID'];
      Break;
    end;
    QTrustlevel.Next;
  end; // while
  DM.CompanyUpdate(F_CompanyID, EditCompany.Text, EditCity.Text, TrustLevel,
    DeleteLastReturn(EditComment.text), Trim(txtPriceList.Text), Trim(UpperCase(mmoBusiness.Text)));
  MessageDlg('Название успешно обновлено', mtInformation, [mbOK], 0);
  FocusControl(EditCompany);
end;

procedure TFormUpdateCompany.BitBtnCancelClick(Sender: TObject);
begin
  FocusControl(EditCompany);
end;

procedure TFormUpdateCompany.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of //
    VK_Escape: BitBtnCancel.Click;
    VK_F2: BitBtnSave.Click;
  end; // case
end;

procedure TFormUpdateCompany.btnSelectPriceClick(Sender: TObject);
begin
  SelectPriceDialog.FileName:= txtPriceList.Text;
  if SelectPriceDialog.Execute then
    txtPriceList.Text:= SelectPriceDialog.FileName;
end;

end.

