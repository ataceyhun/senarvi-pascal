program Puhe;

var
  Tiedosto : Text;
  Lause : String;
  Lauseet : array[1..4, 1..50] of String;
  Rivi,
  Lauseen_Osa,
  Laskuri,
  Lauseita : Integer;
  Riveja : array[1..4] of Integer;

begin
  {$I-}
  Assign(Tiedosto, 'LAUSEET.TXT');
  Reset(Tiedosto);
  {$I+}
  if IOResult <> 0 then
  begin
    Writeln('Tiedostoa ei l”ydy: LAUSEET.TXT');
    Halt(1);
  end;
  Write('Kuinka monta lausetta arvotaan: ');
  Readln(Lauseita);
  Writeln;
  for Lauseen_Osa := 1 to 3 do
  begin
    Rivi := 0;
    repeat
      Readln(Tiedosto, Lause);
      if Lause <> '------------------------------' then
      begin
        Rivi := Rivi + 1;
        Lauseet[Lauseen_Osa, Rivi] := Lause;
      end;
    until Lause = '------------------------------';
    Riveja[Lauseen_Osa] := Rivi;
  end;
  Rivi := 0;
  while not Eof(Tiedosto) do
  begin
    Readln(Tiedosto, Lause);
    Rivi := Rivi + 1;
    Lauseet[4, Rivi] := Lause;
  end;
  Riveja[4] := Rivi;
  Randomize;
  for Laskuri := 1 to Lauseita do
  begin
    for Lauseen_Osa := 1 to 4 do
    begin
      Rivi := Random(Riveja[Lauseen_Osa]) + 1;
      Write(Lauseet[Lauseen_Osa, Rivi], ' ');
    end;
    Writeln;
  end;
  Writeln;
end.