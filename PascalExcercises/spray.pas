program Spray;

uses Crt, Graph;

const
  PisteitaKerralla = 10;
  Sade = 10;

var
  PalloX,
  PalloY,
  Suunta,
  I,
  KohtaX,
  KohtaY: Integer;

procedure Alusta;

var
  GrafiikkaAjuri,
  GrafiikkaTila,
  VirheKoodi: Integer;

begin { Alusta }
  GrafiikkaAjuri := VGA;
  GrafiikkaTila := VGALo;
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
  Randomize;
  PalloX := GetMaxX div 2;
  PalloY := GetMaxY div 2;
  repeat
    Suunta := Random(4);
    case Suunta of
      0: if PalloX < GetMaxX then PalloX := PalloX + 1;
      1: if PalloX > 0 then PalloX := PalloX - 1;
      2: if PalloY < GetMaxY then PalloY := PalloY + 1;
      3: if PalloY > 0 then PalloY := PalloY - 1;
    end;
    for I := 1 to PisteitaKerralla do
    begin
      KohtaX := Random(Sade * 4) - Sade * 2;
      KohtaY := Random(Sade * 2) - Sade;
      PutPixel(PalloX + KohtaX, PalloY - KohtaY, Random(2));
    end;
  until KeyPressed;
end.