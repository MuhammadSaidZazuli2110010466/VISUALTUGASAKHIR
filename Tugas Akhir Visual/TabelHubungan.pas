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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

{$R *.dfm}

procedure TForm6.b1Click(Sender: TObject);
begin
 editbersih;

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
cbb3.Text:= '';

end;

end.
