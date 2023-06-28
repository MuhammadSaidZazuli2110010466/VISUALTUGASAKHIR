unit TabelSemester;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, frxClass, frxDBSet, ZAbstractConnection, ZConnection, StdCtrls;

type
  TForm8 = class(TForm)
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    cbb2: TComboBox;
    cbb3: TComboBox;
    cbb4: TComboBox;
    cbb5: TComboBox;
    edt1: TEdit;
    cbb6: TComboBox;
    cbb7: TComboBox;
    cbb8: TComboBox;
    b1: TButton;
    b2: TButton;
    b3: TButton;
    b4: TButton;
    b5: TButton;
    ds1: TDataSource;
    con1: TZConnection;
    frxdbdtst1: TfrxDBDataset;
    frxrprt1: TfrxReport;
    zqry1: TZQuery;
    dg1: TDBGrid;
    b6: TButton;
    lbl10: TLabel;
    lbl1: TLabel;
    zqry2: TZQuery;
    zqry3: TZQuery;
    zqry4: TZQuery;
    zqry5: TZQuery;
    zqry6: TZQuery;
    procedure b1Click(Sender: TObject);
    procedure editbersih;
    procedure editenable;
    procedure posisiawal;
    procedure FormShow(Sender: TObject);
    procedure b5Click(Sender: TObject);
    procedure b2Click(Sender: TObject);
    procedure b3Click(Sender: TObject);
    procedure b4Click(Sender: TObject);
    procedure b6Click(Sender: TObject);
    procedure dg1CellClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form8: TForm8;
    id: string;
implementation

{$R *.dfm}

procedure TForm8.b1Click(Sender: TObject);
begin
 editbersih;
    editenable;
b1.Enabled:= false;
b2.Enabled:= True;
b3.Enabled:= False;
b4.Enabled:= False;
b5.Enabled:= True;
end;

procedure TForm8.editbersih;
begin

cbb2.Text:= '';
cbb3.Text:= '';
cbb4.Text:= '';
cbb5.Text:= '';
cbb6.Text:= '';
edt1.clear;
cbb7.Text:= '';
cbb8.Text:= '';
end;

procedure TForm8.editenable;
begin

cbb2.Enabled:= True;
cbb3.Enabled:= True;
cbb4.Enabled:= True;
cbb5.Enabled:= True;
cbb6.Enabled:= True;
edt1.Enabled:= True;
cbb7.Enabled:= True;
cbb8.Enabled:= True;


end;

procedure TForm8.posisiawal;
begin
 editbersih;


cbb2.Enabled:= false;
cbb3.Enabled:= false;
cbb4.Enabled:= false;
cbb5.Enabled:= false;
cbb6.Enabled:= false;
edt1.Enabled:= false;
cbb7.Enabled:= false;
cbb8.Enabled:= false;



b1.Enabled:= True;
b2.Enabled:= False;
b3.Enabled:= False;
b4.Enabled:= False;
b5.Enabled:= False
end;

procedure TForm8.FormShow(Sender: TObject);
begin
posisiawal;
end;

procedure TForm8.b5Click(Sender: TObject);
begin
posisiawal;
end;

procedure TForm8.b2Click(Sender: TObject);
begin
begin
if  (cbb2.Text ='')or(cbb3.Text ='')or(cbb4.Text ='')or(cbb5.Text ='')or(cbb6.Text ='')or(edt1.Text ='')or(cbb7.Text= '')or (cbb8.Text= '')  then
begin
ShowMessage('DATA TIDAK BOLEH KOSONG!');
end else
if (zqry1.Locate('id_siswa',cbb2.Text,[])) and (zqry1.Locate('id_poin',cbb3.Text,[])) then
begin
ShowMessage('DATA KELAS SUDAH DIGUNAKAN');
 posisiawal;
end else
begin
//simpan
zqry1.SQL.Clear;
zqry1.SQL.Add('insert into tabel_semester values (null,"'+cbb2.Text+'","'+cbb3.Text+'","'+cbb4.Text+'","'+cbb5.Text+'","'+cbb6.Text+'","'+edt1.Text+'","'+cbb7.Text+'","'+cbb8.Text+'")');
zqry1.ExecSQL;

zqry1.SQL.Clear;
zqry1.SQL.Add('select * from tabel_semester');
zqry1.Open;
ShowMessage('DATA BARHASIL DISIMPAN!');

end;
end;
end;


procedure TForm8.b3Click(Sender: TObject);
begin
if (cbb2.Text ='')or (cbb3.Text= '')or (cbb4.Text ='')or (cbb5.Text ='')or(cbb6.Text ='')or (edt1.Text ='')or (cbb7.Text ='')or (cbb8.Text ='') then
begin
ShowMessage('INPUTAN WAJIB DIISI!');
end else
if(cbb2.Text = zqry1.Fields[1].AsString) and (cbb3.Text = zqry1.Fields[2].AsString) and (cbb4.Text = zqry1.Fields[3].AsString)and (cbb5.Text = zqry1.Fields[4].AsString)and (cbb6.Text = zqry1.Fields[5].AsString)and (edt1.Text = zqry1.Fields[6].AsString)and (cbb7.Text = zqry1.Fields[7].AsString)and (cbb8.Text = zqry1.Fields[8].AsString) then
begin
ShowMessage('DATA TIDAK ADA PERUBAHAN');
posisiawal;
end else
begin
id:=dg1.DataSource.DataSet.FieldByName('id_semester').AsString;
ShowMessage('DATA BERHASIL DIUPDATE!'); //UPDATE
zqry1.SQL.Clear;
zqry1.SQL.Add('Update tabel_semester set id_siswa="'+cbb2.Text+'",id_poin="'+cbb3.Text+'",id_wali="'+cbb4.Text+'",id_ortu="'+cbb5.Text+'",id_kelas="'+cbb6.Text+'",tanggal="'+edt1.Text+'",semester="'+cbb7.Text+'",status="'+cbb8.Text+'" where id_semester="'+id+'"');
zqry1. ExecSQL;

zqry1.SQL.Clear;
zqry1.SQL.Add('select * from tabel_semester');
zqry1.Open;
posisiawal;
end;
end;

procedure TForm8.b4Click(Sender: TObject);
begin
if MessageDlg('APAKAH YAKIN MENGHAPUS DATA INI?',mtWarning,[mbYes,mbNo],0)= mryes then
begin
id:=dg1.DataSource.DataSet.FieldByName('id_user').AsString;
zqry1.SQL.Clear;
zqry1.SQL.Add(' delete from tabel_semester where id_semester="'+id+'"');
zqry1. ExecSQL;
zqry1.SQL.Clear;
zqry1.SQL.Add('select * from tabel_semester');
zqry1.Open;
ShowMessage('DATA BERHASIL DIHAPUS');
posisiawal;
end else
begin
ShowMessage('DATA BATAL DIHAPUS');
posisiawal;
end;
end;

procedure TForm8.b6Click(Sender: TObject);
begin
frxrprt1.showreport();
end;

procedure TForm8.dg1CellClick(Column: TColumn);
begin
editenable;

b1.Enabled:= true;
b2.Enabled:= False;
b3.Enabled:= True;
b4.Enabled:= True;
b5.Enabled:= True;

id:=zqry1.Fields[0].AsString;
cbb2.Text:= zqry1.FieldList[1].AsString;
cbb3.Text:= zqry1.FieldList[2].AsString;
cbb4.Text:= zqry1.FieldList[3].AsString;
cbb5.Text:= zqry1.FieldList[4].AsString;
cbb6.Text:= zqry1.FieldList[5].AsString;
edt1.Text:= zqry1.FieldList[6].AsString;
cbb7.Text:= zqry1.FieldList[7].AsString;
cbb8.Text:= zqry1.FieldList[8].AsString;
end;

procedure TForm8.FormCreate(Sender: TObject);
begin
zqry2.First;
while not zqry2.Eof do
begin
  cbb2.items.add(zqry2.fieldbyname('id_siswa').asstring);
  zqry2.Next;
end;
zqry3.First;
while not zqry3.Eof do
begin
  cbb3.items.add(zqry3.fieldbyname('id_poin').asstring);
  zqry3.Next;
end;
zqry4.First;
while not zqry4.Eof do
begin
  cbb4.items.add(zqry4.fieldbyname('id_wali').asstring);
  zqry4.Next;
end;
zqry5.First;
while not zqry5.Eof do
begin
  cbb5.items.add(zqry5.fieldbyname('id_ortu').asstring);
  zqry5.Next;
end;
zqry6.First;
while not zqry6.Eof do
begin
  cbb6.items.add(zqry6.fieldbyname('id_kelas').asstring);
  zqry6.Next;
end;
end;

end.
