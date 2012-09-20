program Demo;

uses Crt, Graph;

const
  Palloja = 5;
  Viive: Integer = 10;
  Laskuri: Integer = 0;
  Nopeus = 2;
  FillPattern = SolidFill;

type
  PalloType = record
    X, Y,
    XSuunta, YSuunta,
    Vari: Integer;
  end;

var
  Pallot: array[1..Palloja] of PalloType;
  GraDriv, GraMode,
  Ind, Ind2: Integer;
  Clock: ^Word;
  Clock1, Clock2: Word;
  ArvoUudestaan: Boolean;

procedure Tasaa_Nopeus;

begin
  Delay(Viive);
  Inc(Laskuri); if Laskuri < 3 then Exit;
  Laskuri := 0; Clock1 := Clock^;
  if Clock1 - Clock2 >= 0 then
    if Clock1 - Clock2 < 2 then Inc(Viive)
    else
      if Viive > 0 then Dec(Viive);
  Clock2 := Clock1;
end;

begin
  GraDriv := CGA; GraMode := CGAC0;
  InitGraph(GraDriv, GraMode, 'D:\TP\BGI');
  if GraphResult <> 0 then Halt;
  Randomize;
  for Ind := 1 to Palloja do with Pallot[Ind] do
  begin
    repeat
      ArvoUudestaan := False;
      X := Random(310) + 5; Y := Random(190) + 5;
      for Ind2 := 1 to Palloja do
        if (Ind2 <> Ind) and
           (Pallot[Ind2].X + 5 >= X - 5) and
           (Pallot[Ind2].X - 5 <= X + 5) and
           (Pallot[Ind2].Y + 5 >= Y - 5) and
           (Pallot[Ind2].Y - 5 <= Y + 5) then
          ArvoUudestaan := True;
    until ArvoUudestaan = False;
    XSuunta := Nopeus * 2 * Random(2) - Nopeus;
    YSuunta := Nopeus * 2 * Random(2) - Nopeus;
    Vari := Random(3) + 1;
  end;
  Clock := Ptr($40, $6C);
  Clock2 := Clock^;
  repeat
    for Ind := 1 to Palloja do with Pallot[Ind] do
    begin
      SetColor(0);
      SetFillStyle(EmptyFill, Vari);
      FillEllipse(X, Y, 5, 5);
      SetFillStyle(FillPattern, Vari);
      X := X + XSuunta; Y := Y + YSuunta;
      for Ind2 := 1 to Palloja do
        if (Ind2 <> Ind) and (Pallot[Ind2].X + 5 >= X - 5) and
           (Pallot[Ind2].X - 5 <= X + 5) and
           (Pallot[Ind2].Y + 5 >= Y - 5) and
           (Pallot[Ind2].Y - 5 <= Y + 5) then
          begin
            XSuunta := -XSuunta; YSuunta := -YSuunta;
            X := X + XSuunta; Y := Y + YSuunta;
          end;
      if (X > 315) or (X < 5) then
        begin XSuunta := -XSuunta; X := X + XSuunta; end;
      if (Y > 195) or (Y < 5) then
        begin YSuunta := -YSuunta; Y := Y + YSuunta; end;
      FillEllipse(X, Y, 5, 5);
    end;
    Tasaa_Nopeus;
  until KeyPressed;
  CloseGraph;
  Writeln('Viive on ', Viive);
end.