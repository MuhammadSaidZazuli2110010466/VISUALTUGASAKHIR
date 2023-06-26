program Sekolah;

uses
  Forms,
  TabelKelas in 'TabelKelas.pas' {Form1},
  Tabelwalikelas in 'Tabelwalikelas.pas' {Form2},
  Tabelortu in 'Tabelortu.pas' {Form3},
  TabelPoin in 'TabelPoin.pas' {Form4},
  TabelSiswa in 'TabelSiswa.pas' {Form5};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
