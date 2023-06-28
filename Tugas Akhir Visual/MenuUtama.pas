unit MenuUtama;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, frxpngimage, ExtCtrls, jpeg;

type
  TForm9 = class(TForm)
    mm1: TMainMenu;
    ABELKELAS1: TMenuItem;
    ABELWALIKELAS1: TMenuItem;
    ABELORANGTUA1: TMenuItem;
    ABELPOIN1: TMenuItem;
    ABELSISWA1: TMenuItem;
    ABELHUBUNGAN1: TMenuItem;
    ABELUSER1: TMenuItem;
    ABELSEMESTER1: TMenuItem;
    ABELKELAS2: TMenuItem;
    img1: TImage;
    procedure ABELWALIKELAS1Click(Sender: TObject);
    procedure ABELORANGTUA1Click(Sender: TObject);
    procedure ABELPOIN1Click(Sender: TObject);
    procedure ABELSISWA1Click(Sender: TObject);
    procedure ABELHUBUNGAN1Click(Sender: TObject);
    procedure ABELUSER1Click(Sender: TObject);
    procedure ABELSEMESTER1Click(Sender: TObject);
    procedure ABELKELAS2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form9: TForm9;

implementation

uses Tabelwalikelas, Tabelortu, TabelPoin, TabelSiswa, TabelHubungan,
  TabelUser, TabelSemester, TabelKelas;

{$R *.dfm}

procedure TForm9.ABELWALIKELAS1Click(Sender: TObject);
begin
form2.showmodal
end;

procedure TForm9.ABELORANGTUA1Click(Sender: TObject);
begin
form3.showmodal
end;

procedure TForm9.ABELPOIN1Click(Sender: TObject);
begin
form4.showmodal
end;

procedure TForm9.ABELSISWA1Click(Sender: TObject);
begin
form5.showmodal
end;

procedure TForm9.ABELHUBUNGAN1Click(Sender: TObject);
begin
form6.showmodal
end;

procedure TForm9.ABELUSER1Click(Sender: TObject);
begin
form7.showmodal
end;

procedure TForm9.ABELSEMESTER1Click(Sender: TObject);
begin
form8.showmodal
end;

procedure TForm9.ABELKELAS2Click(Sender: TObject);
begin
 form1.showmodal
end;

end.
