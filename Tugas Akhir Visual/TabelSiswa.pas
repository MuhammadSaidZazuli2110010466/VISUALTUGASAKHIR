unit TabelSiswa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, frxClass, frxDBSet, ZAbstractConnection, ZConnection, Grids,
  DBGrids;

type
  TForm5 = class(TForm)
    edt1: TEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    edt2: TEdit;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    edt3: TEdit;
    edt4: TEdit;
    edt5: TEdit;
    cbb1: TComboBox;
    cbb2: TComboBox;
    edt6: TEdit;
    edt7: TEdit;
    dg1: TDBGrid;
    ds1: TDataSource;
    con1: TZConnection;
    frxdbdtst1: TfrxDBDataset;
    frxrprt1: TfrxReport;
    zqry1: TZQuery;
    b1: TButton;
    b2: TButton;
    b3: TButton;
    b4: TButton;
    b5: TButton;
    b6: TButton;
    edt8: TEdit;
    procedure FormShow(Sender: TObject);
    procedure editbersih;
    procedure posisiawal;
    procedure b1Click(Sender: TObject);
    procedure editenable;
    procedure b5Click(Sender: TObject);
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
  Form5: TForm5;
  id: string;

implementation

{$R *.dfm}

procedure TForm5.FormShow(Sender: TObject);
begin
posisiawal;
end;

procedure TForm5.editbersih;
begin

edt1.Clear;
edt2.Clear;
edt3.Clear;
edt4.Clear;
edt5.Clear;
edt6.Clear;
edt7.Clear;


cbb1.Text:= '';
cbb2.Text:= '';


end;

procedure TForm5.posisiawal;
begin
editbersih;

edt1.Enabled:= False;
edt2.Enabled:= False;
edt3.Enabled:= False;
edt4.Enabled:= False;
edt5.Enabled:= False;
edt6.Enabled:= False;
edt7.Enabled:= False;


edt8.Enabled:= False;

cbb1.Enabled:= False;
cbb2.Enabled:= False;


b1.Enabled:= True;
b2.Enabled:= False;
b3.Enabled:= False;
b4.Enabled:= False;
b5.Enabled:= False;
end;

procedure TForm5.b1Click(Sender: TObject);
begin
b1.Enabled:= false;
b2.Enabled:= True;
b3.Enabled:= False;
b4.Enabled:= False;
b5.Enabled:= True;

editbersih;
    editenable;
end;

procedure TForm5.editenable;
begin
edt1.Enabled:= True;
edt2.Enabled:= True;
edt3.Enabled:= True;
edt4.Enabled:= True;
edt5.Enabled:= True;
edt6.Enabled:= True;
edt7.Enabled:= True;


edt8.Enabled:= True;


cbb1.Enabled:= True;
cbb2.Enabled:= True;

end;

procedure TForm5.b5Click(Sender: TObject);
begin
posisiawal;
end;

procedure TForm5.b2Click(Sender: TObject);
begin
begin
if (edt1.Text= '')or (edt2.Text ='')or(edt3.Text ='')or(edt4.Text ='')or(edt5.Text ='')or(edt8.Text ='')or(cbb1.Text ='')or(edt6.Text= '')or (edt7.Text= '') or (cbb2.text= '' ) then
begin
ShowMessage('DATA TIDAK BOLEH KOSONG!');
end else
if (zqry1.Locate('nis',edt1.Text,[])) and (zqry1.Locate('nisn',edt2.Text,[])) then
begin
ShowMessage('DATA KELAS SUDAH DIGUNAKAN');
 posisiawal;
end else
begin
//simpan
zqry1.SQL.Clear;
zqry1.SQL.Add('insert into table_siswa values (null,"'+edt1.Text+'","'+edt2.Text+'","'+edt3.Text+'","'+edt4.Text+'","'+edt5.Text+'","'+edt8.Text+'","'+cbb1.Text+'","'+edt6.Text+'","'+edt7.Text+'","'+cbb2.text+'")');
zqry1.ExecSQL;

zqry1.SQL.Clear;
zqry1.SQL.Add('select * from table_siswa');
zqry1.Open;
ShowMessage('DATA BARHASIL DISIMPAN!');


end;
end;
end;


procedure TForm5.b3Click(Sender: TObject);
begin
begin
if (edt1.Text= '')or (edt2.Text ='')or(cbb1.Text= '')or (edt3.Text= '')or (edt4.Text ='') or (edt5.Text= '')or (edt6.Text ='') or (edt7.Text= '')or(cbb1.Text= '') or(cbb2.Text= '')then
begin
ShowMessage('INPUTAN WAJIB DIISI!');
end else
if (edt1.Text = zqry1.Fields[1].AsString) and (edt2.Text = zqry1.Fields[2].AsString) and (edt3.Text = zqry1.Fields[3].AsString) and (edt4.Text = zqry1.Fields[4].AsString) and (edt5.Text = zqry1.Fields[5].AsString) and (edt8.Text = zqry1.Fields[6].AsString)and (cbb1.Text = zqry1.Fields[7].AsString) and (edt6.Text = zqry1.Fields[8].AsString) and (edt7.Text = zqry1.Fields[9].AsString) and (cbb2.Text = zqry1.Fields[10].AsString) then
begin
ShowMessage('DATA TIDAK ADA PERUBAHAN');
posisiawal;
end else
begin
id:=dg1.DataSource.DataSet.FieldByName('id_siswa').AsString;
ShowMessage('DATA BERHASIL DIUPDATE!'); //UPDATE
zqry1.SQL.Clear;
zqry1.SQL.Add('Update table_siswa set nis= "'+edt1.Text+'",nisn="'+edt2.Text+'",nama="'+edt3.Text+'",nik="'+edt4.Text+'",tempat_lahir="'+edt5.Text+'",tgl_lahir="'+edt8.Text+'",jenis_kelamin="'+cbb1.Text+'",alamat="'+edt6.text+'",telpon="'+edt7.Text+'",status="'+cbb2.Text+'" where id_siswa="'+id+'"');
zqry1. ExecSQL;

zqry1.SQL.Clear;
zqry1.SQL.Add('select * from table_siswa');
zqry1.Open;
posisiawal;
end;
end;

   end;
procedure TForm5.b4Click(Sender: TObject);
begin
begin
if MessageDlg('APAKAH YAKIN MENGHAPUS DATA INI?',mtWarning,[mbYes,mbNo],0)= mryes then
begin
id:=dg1.DataSource.DataSet.FieldByName('id_siswa').AsString;
zqry1.SQL.Clear;
zqry1.SQL.Add(' delete from table_siswa where id_siswa="'+id+'"');
zqry1. ExecSQL;
zqry1.SQL.Clear;
zqry1.SQL.Add('select * from table_siswa');
zqry1.Open;
ShowMessage('DATA BERHASIL DIHAPUS');
posisiawal;
end else
begin
ShowMessage('DATA BATAL DIHAPUS');

end;
end;
end;

procedure TForm5.dg1CellClick(Column: TColumn);
begin
editenable;
b1.Enabled:= true;
b2.Enabled:= False;
b3.Enabled:= True;
b4.Enabled:= True;
b5.Enabled:= True;
id:=zqry1.Fields[0].AsString;
edt1.Text:= zqry1.FieldList[1].AsString;
edt2.Text:= zqry1.FieldList[2].AsString;
edt3.Text:= zqry1.FieldList[3].AsString;
edt4.Text:= zqry1.FieldList[4].AsString;
edt5.Text:= zqry1.FieldList[5].AsString;
edt8.Text:= zqry1.FieldList[6].AsString;
cbb1.Text:= zqry1.FieldList[7].AsString;
edt6.Text:= zqry1.FieldList[8].AsString;
edt7.Text:= zqry1.FieldList[9].AsString;
 cbb2.Text:= zqry1.FieldList[10].AsString;
end;

procedure TForm5.b6Click(Sender: TObject);
begin
frxrprt1.showreport();
end;

end.
