program Oikeinkirjoitus;

uses
  Crt;

const
  MaximiPaikka = 2;

var
  Sana : array[0..MaximiPaikka, 1..5] of string;
  Paikka : integer;
  Kirjain : char;
  i : integer;
  Pisteet : integer;

procedure AsetaPaikat;

begin
  Sana[0, 1] := 'v';
  Sana[0, 2] := 'i';
  Sana[0, 3] := 'i';
  Sana[0, 4] := 's';
  Sana[0, 5] := 'i';
  Sana[1, 1] := 'k';
  Sana[1, 2] := 'u';
  Sana[1, 3] := 'u';
  Sana[1, 4] := 's';
  Sana[1, 5] := 'i';
  Sana[2, 1] := 'k';
  Sana[2, 2] := 'o';
  Sana[2, 3] := 'l';
  Sana[2, 4] := 'm';
  Sana[2, 5] := 'e';
end;

begin
  Pisteet := 20;
  AsetaPaikat;
  Randomize;
  Paikka := Random(MaximiPaikka);
  Write('Kirjoita: ');
  for i := 1 to 5 do
  Write(Sana[Paikka, i]);
  Writeln('.');
  i := 0;
  repeat
    i := i+1;
    Kirjain := ReadKey;
    if Kirjain = Sana[Paikka, i] then
    Write(Sana[Paikka, i]);
    if Kirjain <> Sana[Paikka, i] then
    begin
      Sound(100);
      Delay(20);
      NoSound;
      Pisteet := Pisteet-1;
      i := i-1;
    end;
  until i = 5;
  Writeln;
  Writeln('Sait ', Pisteet, ' pistett„.');
  ReadKey;
end.