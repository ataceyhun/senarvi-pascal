program SiniKayra;

uses Graph;

var
  GrafiikkaAjuri, GrafiikkaTila,
  VirheKoodi, Laskuri: Integer;

procedure Alusta;

begin { Alusta }
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
end; { Alusta }

begin
  Alusta;
  MoveTo(-1, GetMaxY div 3);
  for Laskuri := -1 to 100 do
    LineTo(Laskuri * 10, GetMaxX div 3 - Round(Sin(Laskuri / 10) * 200));
  MoveTo(-1, GetMaxY div 3);
  for Laskuri := -1 to 100 do
    LineTo(Laskuri * 10, GetMaxX div 3 - Round(Cos(Laskuri / 10) * 200));
  Readln;
  CloseGraph;
end.