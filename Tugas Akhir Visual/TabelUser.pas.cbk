unit TabelUser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, frxClass, frxDBSet, ZAbstractConnection, ZConnection, StdCtrls;

type
  TForm7 = class(TForm)
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    edt2: TEdit;
    edt3: TEdit;
    edt4: TEdit;
    edt5: TEdit;
    b1: TButton;
    b2: TButton;
    b3: TButton;
    b4: TButton;
    b5: TButton;
    b6: TButton;
    ds1: TDataSource;
    con1: TZConnection;
    frxdbdtst1: TfrxDBDataset;
    zqry1: TZQuery;
    dg1: TDBGrid;
    frxrprt1: TfrxReport;
    procedure b1Click(Sender: TObject);
    procedure editbersih;
    procedure editenable;
    procedure posisiawal;
    procedure b5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure b2Click(Sender: TObject);
    procedure b3Click(Sender: TObject);
    procedure b4Click(Sender: TObject);
    procedure dg1CellClick(Column: TColumn);
    procedure b6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;
    id: string;
implementation

{$R *.dfm}

procedure TForm7.b1Click(Sender: TObject);
begin
editbersih;

b1.Enabled:= false;
b2.Enabled:= True;
b3.Enabled:= False;
b4.Enabled:= False;
b5.Enabled:= True;

editenable;
end;

procedure TForm7.editbersih;
begin
edt2.Clear;
edt3.Clear;
edt4.Clear;
edt5.Clear;
end;

procedure TForm7.editenable;
begin
edt2.Enabled:= True;
edt3.Enabled:= True;
edt4.Enabled:= True;
edt5.Enabled:= True;
end;

procedure TForm7.posisiawal;
begin
editbersih;

edt2.Enabled:= false;
edt3.Enabled:= false;
edt4.Enabled:= false;
edt5.Enabled:= false;

b1.Enabled:= True;
b2.Enabled:= False;
b3.Enabled:= False;
b4.Enabled:= False;
b5.Enabled:= False
end;

procedure TForm7.b5Click(Sender: TObject);
begin
posisiawal;
end;

procedure TForm7.FormShow(Sender: TObject);
begin
posisiawal;
end;

procedure TForm7.b2Click(Sender: TObject);
begin
if (edt2.Text= '')or (edt3.Text ='')or(edt4.Text= '')or (edt5.Text ='')then
begin
ShowMessage('DATA TIDAK BOLEH KOSONG!');
end else
if (zqry1.Locate('username',edt2.Text,[])) and (zqry1.Locate('password',edt3.Text,[])) then
begin
ShowMessage('DATA USER SUDAH DIGUNAKAN');
posisiawal;
end else
begin
//simpan
zqry1.SQL.Clear;
zqry1.SQL.Add('insert into tabel_user values (null,"'+edt2.Text+'","'+edt3.Text+'","'+edt4.Text+'","'+edt5.Text+'")');
zqry1.ExecSQL;

zqry1.SQL.Clear;
zqry1.SQL.Add('select * from tabel_user');
zqry1.Open;
ShowMessage('DATA BERHASIL DISIMPAN!');
posisiawal;

end;
end;

procedure TForm7.b3Click(Sender: TObject);
begin
if (edt2.Text= '')or (edt3.Text ='')or (edt4.Text= '')or (edt5.Text ='') then
begin
ShowMessage('INPUTAN WAJIB DIISI!');
end else
if (edt2.Text = zqry1.Fields[1].AsString) and (edt3.Text = zqry1.Fields[2].AsString) and (edt4.Text = zqry1.Fields[3].AsString) and (edt5.Text = zqry1.Fields[4].AsString)then
begin
ShowMessage('DATA TIDAK ADA PERUBAHAN');
posisiawal;
end else
begin
id:=dg1.DataSource.DataSet.FieldByName('id_user').AsString;
ShowMessage('DATA BERHASIL DIUPDATE!'); //UPDATE
zqry1.SQL.Clear;
zqry1.SQL.Add('Update tabel_user set username= "'+edt2.Text+'",password="'+edt3.Text+'",level="'+edt4.Text+'",status="'+edt5.Text+'" where id_user="'+id+'"');
zqry1. ExecSQL;

zqry1.SQL.Clear;
zqry1.SQL.Add('select * from tabel_user');
zqry1.Open;
posisiawal;
end;
end;

procedure TForm7.b4Click(Sender: TObject);
begin
if MessageDlg('APAKAH YAKIN MENGHAPUS DATA INI?',mtWarning,[mbYes,mbNo],0)= mryes then
begin
id:=dg1.DataSource.DataSet.FieldByName('id_user').AsString;
zqry1.SQL.Clear;
zqry1.SQL.Add(' delete from tabel_user where id_user="'+id+'"');
zqry1. ExecSQL;
zqry1.SQL.Clear;
zqry1.SQL.Add('select * from tabel_user');
zqry1.Open;
ShowMessage('DATA BERHASIL DIHAPUS');
posisiawal;
end else
begin
ShowMessage('DATA BATAL DIHAPUS');
posisiawal;
end;
end;

procedure TForm7.dg1CellClick(Column: TColumn);
begin
  editenable;
b1.Enabled:= true;
b2.Enabled:= False;
b3.Enabled:= True;
b4.Enabled:= True;
b5.Enabled:= True;
id:=zqry1.Fields[0].AsString;
edt2.Text:= zqry1.FieldList[1].AsString;
edt3.Text:= zqry1.FieldList[2].AsString;
edt4.Text:= zqry1.FieldList[3].AsString;
edt5.Text:= zqry1.FieldList[4].AsString;
end;

procedure TForm7.b6Click(Sender: TObject);
begin
frxrprt1.showreport();
end;

end.
