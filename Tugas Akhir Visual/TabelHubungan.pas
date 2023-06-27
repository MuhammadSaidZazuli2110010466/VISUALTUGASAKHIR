unit TabelHubungan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, frxClass, frxDBSet, ZAbstractConnection, ZConnection, StdCtrls;

type
  TForm6 = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    b1: TButton;
    b2: TButton;
    b3: TButton;
    b4: TButton;
    b5: TButton;
    b6: TButton;
    ds1: TDataSource;
    con1: TZConnection;
    frxdbdtst1: TfrxDBDataset;
    frxrprt1: TfrxReport;
    zqry1: TZQuery;
    dg1: TDBGrid;
    edt1: TEdit;
    edt2: TEdit;
    cbb1: TComboBox;
    cbb2: TComboBox;
    procedure b1Click(Sender: TObject);
    procedure editbersih;
    procedure  posisiawal;
    procedure FormShow(Sender: TObject);
    procedure b5Click(Sender: TObject);
    procedure b2Click(Sender: TObject);
    procedure editenable;
    procedure b3Click(Sender: TObject);
    procedure b4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;
   id: string;
implementation

{$R *.dfm}

procedure TForm6.b1Click(Sender: TObject);
begin
  editbersih;
    editenable;
b1.Enabled:= false;
b2.Enabled:= True;
b3.Enabled:= False;
b4.Enabled:= False;
b5.Enabled:= True;
end;

procedure TForm6.editbersih;
begin
edt1.Clear;
edt2.Clear;

cbb1.Text:= '';
cbb2.Text:= '';


end;

procedure TForm6.posisiawal;
begin
editbersih;

cbb1.Enabled:= false;
cbb2.Enabled:= false;
edt1.Enabled:= false;
edt2.Enabled:= false;

b1.Enabled:= True;
b2.Enabled:= False;
b3.Enabled:= False;
b4.Enabled:= False;
b5.Enabled:= False
end;

procedure TForm6.FormShow(Sender: TObject);
begin
posisiawal;
end;

procedure TForm6.b5Click(Sender: TObject);
begin
posisiawal;
end;

procedure TForm6.b2Click(Sender: TObject);
begin
if (cbb1.Text= '')or (cbb2.Text ='')or(edt1.Text= '')or (edt2.Text ='')then
begin
ShowMessage('DATA TIDAK BOLEH KOSONG!');
end else
if (zqry1.Locate('id_siswa',cbb1.Text,[])) and (zqry1.Locate('id_ortu',cbb2.Text,[])) then
begin
ShowMessage('DATA USER SUDAH DIGUNAKAN');
posisiawal;
end else
begin
//simpan
zqry1.SQL.Clear;
zqry1.SQL.Add('insert into tabel_hubungan values (null,"'+cbb1.Text+'","'+cbb2.Text+'","'+edt1.Text+'","'+edt2.Text+'")');
zqry1.ExecSQL;

zqry1.SQL.Clear;
zqry1.SQL.Add('select * from tabel_hubungan');
zqry1.Open;
ShowMessage('DATA BERHASIL DISIMPAN!');
posisiawal;

end;
end;

procedure TForm6.editenable;
begin
cbb1.Enabled:= True;
cbb2.Enabled:= True;
edt1.Enabled:= True;
edt2.Enabled:= True;
end;

procedure TForm6.b3Click(Sender: TObject);
begin
if (cbb1.Text= '')or (cbb2.Text ='')or (edt1.Text= '')or (edt2.Text ='') then
begin
ShowMessage('INPUTAN WAJIB DIISI!');
end else
if (cbb1.Text = zqry1.Fields[1].AsString) and (cbb2.Text = zqry1.Fields[2].AsString) and (edt1.Text = zqry1.Fields[3].AsString) and (edt2.Text = zqry1.Fields[4].AsString)then
begin
ShowMessage('DATA TIDAK ADA PERUBAHAN');
posisiawal;
end else
begin
id:=dg1.DataSource.DataSet.FieldByName('id_user').AsString;
ShowMessage('DATA BERHASIL DIUPDATE!'); //UPDATE
zqry1.SQL.Clear;
zqry1.SQL.Add('Update tabel_hubungan set id_siswa= "'+cbb1.Text+'",id_ortu="'+cbb2.Text+'",status_hubungan="'+edt1.Text+'",keterangan="'+edt2.Text+'" where id_user="'+id+'"');
zqry1. ExecSQL;

zqry1.SQL.Clear;
zqry1.SQL.Add('select * from tabel_hubungan');
zqry1.Open;
posisiawal;
end;
end;

procedure TForm6.b4Click(Sender: TObject);
begin
if MessageDlg('APAKAH YAKIN MENGHAPUS DATA INI?',mtWarning,[mbYes,mbNo],0)= mryes then
begin
id:=dg1.DataSource.DataSet.FieldByName('id_user').AsString;
zqry1.SQL.Clear;
zqry1.SQL.Add(' delete from tabel_user where id_user="'+id+'"');
zqry1. ExecSQL;
zqry1.SQL.Clear;
zqry1.SQL.Add('select * from tabel_hubungan');
zqry1.Open;
ShowMessage('DATA BERHASIL DIHAPUS');
posisiawal;
end else
begin
ShowMessage('DATA BATAL DIHAPUS');
posisiawal;
end;
end;

end.
