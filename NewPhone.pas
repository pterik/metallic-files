unit NewPhone;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ComCtrls, Db, DBTables;

type
  TFormNewPhone = class(TForm)
    BitBtnSave: TBitBtn;
    BitBtnCancel: TBitBtn;
    Label1: TLabel;
    EditComment: TEdit;
    Label2: TLabel;
    MonthCalendar: TMonthCalendar;
    Label3: TLabel;
    Label4: TLabel;
    SPSetPhone: TStoredProc;
    EditPhone: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure BitBtnCancelClick(Sender: TObject);
    procedure BitBtnSaveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
	{ Private declarations }
  public
	{ Public declarations }
  end;

var
  FormNewPhone: TFormNewPhone;

implementation

uses Phones, MainForm;

{$R *.DFM}

procedure TFormNewPhone.FormCreate(Sender: TObject);
begin
Left:=0;Top:=0;
MonthCalendar.Date:=Date;
EditComment.Text:='';
EditPhone.text:='';
end;

procedure TFormNewPhone.BitBtnCancelClick(Sender: TObject);
begin
EditComment.Text:='';
EditPhone.text:='';
Close;
end;

procedure TFormNewPhone.BitBtnSaveClick(Sender: TObject);
var str:string;
begin
str:=EditPhone.Text;
while pos('-',str)>0 do delete(str,pos('-',str),1);
while pos('(',str)>0 do delete(str,pos('(',str),1);
while pos(')',str)>0 do delete(str,pos(')',str),1);
try
StrToInt64(str);
except on E:EconvertError do
	begin
	MessageDlg('Необходимо указывать только цифры',mtError,[mbok],0);
	exit;
	end;
end;
if length(str)<6 then begin MessageDlg('Указывайте не менее 6 цифр',mtError,[mbOK],0);exit;end;
if (length(str)=8)or(length(str)=9) then begin MessageDlg('Неверно указан номер, исправьте ошибку. Вероятно, вы ввели 8 или 9 цифр',mtError,[mbOK],0);exit;end;
if length(str)>10 then begin MessageDlg('Неверно указан номер,в нем более 10 цифр. Впереди 8 не нужна',mtError,[mbOK],0);exit;end;
SPSetPhone.ParamByName('@number').AsInteger:=StrToInt(Str);
SPSetPhone.ParamByName('@who_blocks').AsString:=EditComment.Text;
SPSetPhone.ParamByName('@date_insert').AsString:=DateToStr(MonthCalendar.Date);
SPSetPhone.ExecProc;
if SPSetPhone.ParamByName('RETURN_VALUE').AsInteger=-1 then MessageDlg('Нельзя заблокировать номер, он относится к commomphones. Обратитесь к разработчику',mtError,[mbok],0);
if SPSetPhone.ParamByName('RETURN_VALUE').AsInteger=1 then MessageDlg('Такой номер уже существует',mtError,[mbok],0);
if SPSetPhone.ParamByName('RETURN_VALUE').AsInteger=0 then	MessageDlg('Телефон занесен в базу',mtConfirmation,[mbOK],0);
Close;
end;

procedure TFormNewPhone.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
SPSetPhone.Close;
EditComment.Text:='';
EditPhone.text:='';
end;

end.
