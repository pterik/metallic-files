unit Phones;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DBGrids, Db, DBTables, Mask,Variants,CommonUnit;

type
  TFormPhones = class(TForm)
    BitBtnClose: TBitBtn;
    QPhones: TQuery;
    Label1: TLabel;
    ButtonSearch: TButton;
    LabelComment: TLabel;
    LabelNum: TLabel;
    LabelBlock: TLabel;
    LabelDate: TLabel;
    EditSearch: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    QPhonesCount: TQuery;
    OD: TOpenDialog;
    Query: TQuery;
    SaveDialog: TSaveDialog;
    procedure BitBtnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
		procedure ButtonSearchClick(Sender: TObject);
		procedure EditSearchKeyUp(Sender: TObject; var Key: Word;
			Shift: TShiftState);
		procedure FormClose(Sender: TObject; var Action: TCloseAction);
	private
		{ Private declarations }
	public
		{ Public declarations }
	end;


var
	FormPhones: TFormPhones;

implementation

uses MainForm ;

{$R *.DFM}
procedure TFormPhones.BitBtnCloseClick(Sender: TObject);
begin
EditSearch.Text:='';
LabelNum.Caption:='';
LabelBlock.Caption:='';
LabelDate.Caption:='';
QPhones.Close;
QPhonesCount.Close;
Close;
end;

procedure TFormPhones.FormCreate(Sender: TObject);
begin
FormPhones.Left:=Width div 2;
FormPhones.Top:=Height div 2;
LabelComment.Caption:='';
if DirectoryExists('D:\APPZ\PREM_KHR\ADS-FREE\NOREPLY')
   then SaveDialog.InitialDir:='D:\APPZ\PREM_KHR\ADS-FREE\NOREPLY'
   else SaveDialog.InitialDir:=FormMain.CurDir;
end;

procedure TFormPhones.ButtonSearchClick(Sender: TObject);
var str,strphone:string;isLongPhone:boolean;
begin
QPhones.Close;
LabelComment.Caption:='Идет поиск...';
str:=EditSearch.Text;
while pos('-',str)>0 do delete(str,pos('-',str),1);
while pos('(',str)>0 do delete(str,pos('(',str),1);
while pos(')',str)>0 do delete(str,pos(')',str),1);
isLongPhone:=false;
if pos('8',str)=1 then begin delete(str,1,1);isLongPhone:=true;end;
try
StrToInt64(str);
except on EConvertError do
	begin
	LabelComment.Caption:='Неверно введен телефон поиска, нужно только цифры';
	LabelNum.Caption:='';
	LabelBlock.Caption:='';
	LabelDate.Caption:='';
	FocusControl(EditSearch);
	exit;
	end;
end;
if length(str)<6 then
	begin
	LabelComment.Caption:='';
	LabelNum.Caption:='';
	LabelBlock.Caption:='';
	LabelDate.Caption:='';
	MessageDlg('Указывайте не менее 6 цифр',mtError,[mbCancel],0);
	exit;
	end;
if (length(str)=8)or(length(str)=9) then
	begin
	LabelComment.Caption:='';
	LabelNum.Caption:='';
	LabelBlock.Caption:='';
	LabelDate.Caption:='';
	MessageDlg('Неверно указан номер, исправьте ошибку. Вероятно, вы ввели 8 или 9 цифр',mtError,[mbCancel],0);
	exit;
	end;
if length(str)>10 then
	begin
	LabelComment.Caption:='';
	LabelNum.Caption:='';
	LabelBlock.Caption:='';
	LabelDate.Caption:='';
	MessageDlg('Неверно указан номер,в нем более 10 цифр.',mtError,[mbCancel],0);
	exit;
	end;
QPhones.ParamByName('number').AsInteger:=StrToInt64(str);
QPhones.Open;
if QPhones['number']=null
then
	begin
	LabelComment.Caption:='Телефон не найден в заблокированных';
	LabelNum.Caption:='';
	LabelBlock.Caption:='';
	LabelDate.Caption:='';
	end
else
	begin
	LabelComment.Caption:='Телефон найден';
	strphone:=IntToStr(QPhones['number']);
	if isLongPhone
	then
		begin
		Insert(')-',strphone,4);
		Insert('-',strphone,8);
		Insert('-',strphone,11);
		str:='Междугородний телефон 8-(0'+strphone;
		end
	else
		begin
		Insert('-',strphone,length(str)-1);
		Insert('-',strphone,length(str)-3);
		str:='Телефон: '+strphone;
		end;
	LabelNum.Caption:=str;
	str:='Кто блокировал: '+QPhones['who_blocks'];
	LabelBlock.Caption:=str;
	str:='Дата блокировки: '+DateToStr(QPhones['date_insert']);
	LabelDate.Caption:=str;
	end;
end;

procedure TFormPhones.EditSearchKeyUp(Sender: TObject; var Key: Word;
	Shift: TShiftState);
begin
if Key=VK_Return then ButtonSearchClick(Sender);
end;

procedure TFormPhones.FormClose(Sender: TObject; var Action: TCloseAction);
begin
QPhones.Close;
end;

end.
