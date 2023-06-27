unit TabelPoin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, ZAbstractConnection, ZConnection, StdCtrls, Grids, DBGrids;

type
  TForm4 = class(TForm)
    lbll1: TLabel;
    lbll2: TLabel;
    lbll3: TLabel;
    edt1: TEdit;
    edt2: TEdit;
    b1: TButton;
    b2: TButton;
    b3: TButton;
    b4: TButton;
    b5: TButton;
    dg1: TDBGrid;
    cbb1: TComboBox;
    b6: TButton;
    ds1: TDataSource;
    con1: TZConnection;
    zqry1: TZQuery;
    frxdbdtst1: TfrxDBDataset;
    frxrprt1: TfrxReport;
    lbl1: TLabel;
    cbb2: TComboBox;
    frxrprt2: TfrxReport;
    procedure b1Click(Sender: TObject);
    procedure b2Click(Sender: TObject);
    procedure b3Click(Sender: TObject);
    procedure b4Click(Sender: TObject);
    procedure b6Click(Sender: TObject);
    procedure editbersih;
    procedure editenable;
    procedure posisiawal;
    procedure b5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;
 id: string;

implementation

{$R *.dfm}


procedure TForm4.b1Click(Sender: TObject);
begin

b1.Enabled:= false;
b2.Enabled:= True;
b3.Enabled:= False;
b4.Enabled:= False;
b5.Enabled:= True;

editbersih;
    editenable;
end;

procedure TForm4.b2Click(Sender: TObject);
begin
begin
if (edt1.Text= '')or (edt2.Text ='')or(cbb1.Text= '')or (cbb2.Text= '') then
begin
ShowMessage('DATA TIDAK BOLEH KOSONG!');
end else
if (zqry1.Locate('nama_poin',edt1.Text,[])) and (zqry1.Locate('bobot',edt2.Text,[])) then
begin
ShowMessage('DATA KELAS SUDAH DIGUNAKAN');
 posisiawal;
end else
begin
//simpan
zqry1.SQL.Clear;
zqry1.SQL.Add('insert into tabel_poin values (null,"'+edt1.Text+'","'+edt2.Text+'","'+cbb1.Text+'","'+cbb2.Text+'")');
zqry1.ExecSQL;

zqry1.SQL.Clear;
zqry1.SQL.Add('select * from tabel_poin');
zqry1.Open;
ShowMessage('DATA BARHASIL DISIMPAN!');


end;
end;
end;

procedure TForm4.b3Click(Sender: TObject);
begin

begin
if (edt1.Text= '')or (edt2.Text ='')or(cbb1.Text= '')or(cbb2.Text= '')then
begin
ShowMessage('INPUTAN WAJIB DIISI!');
end else
if (edt1.Text = zqry1.Fields[1].AsString) and (edt2.Text = zqry1.Fields[2].AsString) and (cbb1.Text = zqry1.Fields[3].AsString) and (cbb2.Text = zqry1.Fields[4].AsString)then
begin
ShowMessage('DATA TIDAK ADA PERUBAHAN');
posisiawal;
end else
begin
id:=dg1.DataSource.DataSet.FieldByName('id_poin').AsString;
ShowMessage('DATA BERHASIL DIUPDATE!'); //UPDATE
zqry1.SQL.Clear;
zqry1.SQL.Add('Update tabel_poin set nama_poin= "'+edt1.Text+'",bobot="'+edt2.Text+'",jenis="'+cbb1.Text+'" ,status="'+cbb2.Text+'" where id_kelas="'+id+'"');
zqry1. ExecSQL;

zqry1.SQL.Clear;
zqry1.SQL.Add('select * from tabel_poin');
zqry1.Open;

end;
end;
end;

procedure TForm4.b4Click(Sender: TObject);
begin
begin
if MessageDlg('APAKAH YAKIN MENGHAPUS DATA INI?',mtWarning,[mbYes,mbNo],0)= mryes then
begin
id:=dg1.DataSource.DataSet.FieldByName('id_poin').AsString;
zqry1.SQL.Clear;
zqry1.SQL.Add(' delete from tabel_poin where id_poin="'+id+'"');
zqry1. ExecSQL;
zqry1.SQL.Clear;
zqry1.SQL.Add('select * from tabel_poin');
zqry1.Open;
ShowMessage('DATA BERHASIL DIHAPUS');
posisiawal;
end else
begin
ShowMessage('DATA BATAL DIHAPUS');

end;
end;
end;

procedure TForm4.b6Click(Sender: TObject);
begin
frxrprt1.showreport();
end;

procedure TForm4.editbersih;
begin
edt1.Clear;
edt2.Clear;
cbb1.Text:= '';
cbb2.Text:= '';
end;

procedure TForm4.editenable;
begin
edt1.Enabled:= True;
edt2.Enabled:= True;
cbb1.Enabled:= True;
cbb2.Enabled:= True;
end;

procedure TForm4.posisiawal;
begin
editbersih;

edt1.Enabled:= False;
edt2.Enabled:= False;
cbb1.Enabled:= False;
cbb2.Enabled:= False;

b1.Enabled:= True;
b2.Enabled:= False;
b3.Enabled:= False;
b4.Enabled:= False;
b5.Enabled:= False;
end;

procedure TForm4.b5Click(Sender: TObject);
begin
posisiawal;
end;

procedure TForm4.FormShow(Sender: TObject);
begin
 posisiawal;
end;

end.
