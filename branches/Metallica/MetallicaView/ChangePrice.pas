unit ChangePrice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DBCtrls, DB, Grids, DBGrids, Mask,
  ZAbstractRODataset, ZDataset, DBCtrlsEh, DBLookupEh, DBGridEh;

type
  TFormChangePrice = class(TForm)
    BitBtnCancel: TBitBtn;
    Label1: TLabel;
    Label4: TLabel;
    zQPrice: TZReadOnlyQuery;
    DSPrice: TDataSource;
    intgrfldQPriceCNT_ID: TIntegerField;
    strngfldQPriceCNT_NAME: TStringField;
    BitBtnSave: TBitBtn;
    Label2: TLabel;
    Label3: TLabel;
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
    procedure SetNewPrice(PL_ID:integer);
  end;

var
  FormChangePrice: TFormChangePrice;

implementation

{$R *.dfm}

uses
  DataModule, MainForm, CommonUnit;

const
  isReloadList: Boolean = True;

  { TFormCompany }

procedure TFormChangePrice.SetPosition(L, T: Integer);
begin
  Left:= L + ShiftLeft;
  Top:= T + ShiftTop;
end;

procedure TFormChangePrice.SetNewCompany(const IsChangeOwner: Boolean);
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

procedure TFormChangePrice.BitBtnCancelClick(Sender: TObject);
begin
  FocusControl(EditCompany);
end;

procedure TFormChangePrice.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of //
    VK_F2: BitBtnSave.Click;
    VK_Escape: BitBtnCancel.Click;
  end; // case
end;

procedure TFormChangePrice.BitBtnSaveClick(Sender: TObject);
var
  SToScreenText, CompanyNamePlusNT: string;
  Found, TrustLevel: Integer;
begin
  if Length(EditCompany.Text) < 3 then begin
    MessageDlg('�������� �������� ������� ���������, ��������� ���. ��� ������������� �������� ������� ', mtError, [mbOK], 0);
    ModalResult:= mrNone;
    Exit;
  end;
  //��� ������ �����
  SToScreenText:= DM.CompanySearchLikeName(ANSIUpperCase(EditCompany.Text),
    FormMain.SearchChars, False, Found);
  //��� ������� � ��
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
    if MessageDlg(SToScreenText + Chr(13) + Chr(10) + '����������� ����������',
      mtConfirmation, [mbYes, mbNo], 0) = mrNo then
      begin
      ModalResult:= mrNone;
      Exit;
      end;
    DM.CompanyInsert(CompanyNamePlusNT, EditCity.Text, TrustLevel, MemoComment.text +
      Chr(13) + Chr(10) + '������� ������� ��������', Trim(txtPriceList.Text), UpperCase(Trim(mmoBusiness.Text)));
    DM.CompanyNTInsertOrUpdate(CBCompanyNameType.Text, F_LastOperType);
    //F_LastOperType='INS' ����������, ��� ������ CBCompanyNameType ����� �����������
    //�� ��������� ��� ������ ������
    end
  else
    begin
    DM.CompanyInsert(CompanyNamePlusNT, EditCity.Text, TrustLevel,
      DeleteLastReturn(MemoComment.Text), Trim(txtPriceList.Text), UpperCase(Trim(mmoBusiness.Text)));
    DM.CompanyNTInsertOrUpdate(CBCompanyNameType.Text, F_LastOperType);
    MessageDlg('�������� ������� ���������', mtInformation, [mbOK], 0);
    end;
  FocusControl(EditCompany);
end;

procedure TFormChangePrice.btnSelectPriceClick(Sender: TObject);
begin
  SelectPriceDialog.FileName:= txtPriceList.Text;
  if SelectPriceDialog.Execute then begin
    txtPriceList.Text:= SelectPriceDialog.FileName;
  end;
end;

procedure TFormChangePrice.SetNewPrice;
begin

end;

end.
