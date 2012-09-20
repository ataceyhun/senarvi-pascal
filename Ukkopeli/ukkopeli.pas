program UkkoPeli;

uses Dos, Kuvat;

type
  RuutuType = array[1..32, 1..20] of Byte;

const
  Ylos = 1;
  Vasemmalle = 2;
  Oikealle = 3;
  Alas = 4;
  VoiMennaSet: set of Byte = [TankoNro, TyhjaNro];

var
  X, Y: Integer;
  Ch: Char;
  Ruutu: RuutuType;
  RuutuTiedosto: File of RuutuType;

procedure VideoMode(Mode: Byte); assembler;

asm
  MOV   AH,00h
  MOV   AL,Mode
  INT   10h
end;

procedure PutPixel(X, Y, Color: Integer);

begin
  Mem[$A000:Y * 320 + X] := Color;
end;

function GetPixel(X, Y: Integer): Integer;

begin
  GetPixel := Mem[$A000:Y * 320 + X];
end;

function ReadKey: Char;

var
  Regs: Registers;

begin
  Regs.AX := 0;
  Intr($16, Regs);
  ReadKey := Chr(Regs.AX);
end;

procedure TeeTausta;

var
  KuvaX, KuvaY: Integer;

begin
  for KuvaY := 1 to 20 do
    for KuvaX := 1 to 32 do
      Ruutu[KuvaX, KuvaY] := TankoNro;
end;

procedure PiirraTausta;

var
  RuutuX, RuutuY,
  KuvaX, KuvaY: Byte;
  Kuva: KuvaType;

begin
  for RuutuY := 1 to 20 do
    for RuutuX := 1 to 32 do
    begin
      case Ruutu[RuutuX, RuutuY] of
        TiiliNro: Kuva := TiiliKuva;
        TankoNro: Kuva := TankoKuva;
        TyhjaNro: Kuva := TyhjaKuva;
      end;
      for KuvaY := 1 to 10 do
        for KuvaX := 1 to 10 do
          PutPixel((RuutuX - 1) * 10 + KuvaX - 1,
                   (RuutuY - 1) * 10 + KuvaY - 1,
                   Kuva[KuvaY, KuvaX]);
    end;
end;

procedure PiirraUkko;

var
  KuvaX, KuvaY: Integer;

begin
  for KuvaY := 1 to 10 do
    for KuvaX := 1 to 10 do
      if GetPixel((X - 1) * 10 + KuvaX - 1,
                  (Y - 1) * 10 + KuvaY - 1) = 0 then
        PutPixel((X - 1) * 10 + KuvaX - 1,
                 (Y - 1) * 10 + KuvaY - 1,
                 UkkoKuva[KuvaY, KuvaX]);
end;

procedure Mene(Suunta: Integer);

begin
  case Suunta of
    Ylos: if Ruutu[X - 1, Y] in VoiMennaSet then X := X - 1;
    Vasemmalle: if Ruutu[X - 1, Y] in VoiMennaSet then Y := Y - 1;
    Oikealle: if Ruutu[X - 1, Y] in VoiMennaSet then X := X + 1;
    Alas: if Ruutu[X - 1, Y] in VoiMennaSet then Y := Y + 1;
  end;
end;

begin
  VideoMode($13);
  TeeTausta;
  X := 1; Y := 1;
  repeat
    PiirraTausta;
    PiirraUkko;
    Ch := ReadKey;
    case Ch of
      '8': Mene(Ylos);
      '4': Mene(Vasemmalle);
      '6': Mene(Oikealle);
      '2': Mene(Alas);
    end;
  until Ch = #27;
end.