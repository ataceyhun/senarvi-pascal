{ Copyright (c) 1994 Seppo Enarvi }
unit Tgraf;

interface

procedure AlustaGrafiikka;

implementation

uses Graph;

procedure AlustaGrafiikka;

var
  GrafiikkaAjuri, GrafiikkaTila,
  VirheKoodi: Integer;

begin  { AlustaGrafiikka }
  GrafiikkaAjuri := VGA;
  GrafiikkaTila := VGAHi;
  InitGraph(GrafiikkaAjuri, GrafiikkaTila, '');  { Alustaa grafiikkatilan }
  VirheKoodi := GraphResult;
  if VirheKoodi <> grOk then  { Jos tuli virhe }
  begin
    Writeln('Grafiikka virhe: ', GraphErrorMsg(VirheKoodi));
    Writeln('(Sinulla ei luultavasti ole VGA n„yt”nohjainta!)');
    Writeln('Ohjelma keskeytet„„n...');
    Halt(1);
  end;
end;  { AlustaGrafiikka }

end.  { Tgraf }