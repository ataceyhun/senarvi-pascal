program sokkelodemo (input, output);

uses
  Graph, Crt;

var
  GraphDriver, GraphMode : integer;
  TextMode, Color        : word;
  ErrorCode              : integer;
  continue               : boolean;
  tab                    : array[1..21, 1..4] of integer;
  i                      : integer;
  vastaus                : char;
  suunta                 : integer;
  x, y                   : integer;

procedure alustus;
  begin
    GraphDriver := Detect;
    InitGraph(GraphDriver, GraphMode,'');
    SetBkColor(2);
    SetColor(15);
    ErrorCode := GraphResult;
    if ErrorCode <> grOk then
      begin
        Writeln('Grafiikka virhe: ',GraphErrorMsg(ErrorCode));
        Writeln('(Sinulla ei ole grafiikkakorttia!)');
        Writeln('Ohjelma keskeytetaan');
        Readln;
        Halt(1);
      end;
  end;

procedure paikat;
  begin
    tab[1, 1] := 0;
    tab[1, 2] := 0;
    tab[1, 3] := 0;
    tab[1, 4] := 200;
    tab[2, 1] := 20;
    tab[2, 2] := 20;
    tab[2, 3] := 20;
    tab[2, 4] := 200;
    tab[3, 1] := 40;
    tab[3, 2] := 40;
    tab[3, 3] := 40;
    tab[3, 4] := 180;
    tab[4, 1] := 60;
    tab[4, 2] := 60;
    tab[4, 3] := 60;
    tab[4, 4] := 160;
    tab[5, 1] := 80;
    tab[5, 2] := 80;
    tab[5, 3] := 80;
    tab[5, 4] := 140;
    tab[6, 1] := 100;
    tab[6, 2] := 100;
    tab[6, 3] := 100;
    tab[6, 4] := 120;
    tab[7, 1] := 120;
    tab[7, 2] := 80;
    tab[7, 3] := 120;
    tab[7, 4] := 120;
    tab[8, 1] := 140;
    tab[8, 2] := 60;
    tab[8, 3] := 140;
    tab[8, 4] := 140;
    tab[9, 1] := 160;
    tab[9, 2] := 40;
    tab[9, 3] := 160;
    tab[9, 4] := 160;
    tab[10, 1] := 180;
    tab[10, 2] := 20;
    tab[10, 3] := 180;
    tab[10, 4] := 180;
    tab[11, 1] := 200;
    tab[11, 2] := 0;
    tab[11, 3] := 200;
    tab[11, 4] := 200;
    tab[12, 1] := 0;
    tab[12, 2] := 0;
    tab[12, 3] := 200;
    tab[12, 4] := 0;
    tab[13, 1] := 20;
    tab[13, 2] := 20;
    tab[13, 3] := 180;
    tab[13, 4] := 20;
    tab[14, 1] := 40;
    tab[14, 2] := 40;
    tab[14, 3] := 160;
    tab[14, 4] := 40;
    tab[15, 1] := 60;
    tab[15, 2] := 60;
    tab[15, 3] := 140;
    tab[15, 4] := 60;
    tab[16, 1] := 80;
    tab[16, 2] := 80;
    tab[16, 3] := 120;
    tab[16, 4] := 80;
    tab[17, 1] := 120;
    tab[17, 2] := 100;
    tab[17, 3] := 120;
    tab[17, 4] := 120;
    tab[18, 1] := 80;
    tab[18, 2] := 140;
    tab[18, 3] := 140;
    tab[18, 4] := 140;
    tab[19, 1] := 60;
    tab[19, 2] := 160;
    tab[19, 3] := 160;
    tab[19, 4] := 160;
    tab[20, 1] := 40;
    tab[20, 2] := 180;
    tab[20, 3] := 180;
    tab[20, 4] := 180;
    tab[21, 1] := 20;
    tab[21, 2] := 200;
    tab[21, 3] := 200;
    tab[21, 4] := 200;
  end;

procedure kuva;
  begin
    for i := 1 to 21 do
      line(tab[i, 1], tab[i, 2], tab[i, 3], tab[i, 4]);
  end;

procedure tarkistus;
  var
    i : integer;

  begin
    for i := 1 to 21 do
      begin
      if tab[i, 1]-tab[i, 3] = 0 then     { Jos on pystysuora viiva }
        begin
          if y >= tab[i, 2] then
            if y <= tab[i, 4] then
                if x = tab[i, 1]-10 then       { Jos t”rm„t„„n siihen }
                  begin
                    if suunta = 2 then
                      suunta := suunta+1;
                    if suunta = 4 then
                      suunta := 1;
                   {if suunta = 3 then
                      y := y-10;
                    if suunta = 1 then
                      x := x+10;}
                  end;
        end;
      if tab[i, 2]-tab[i, 4] = 0 then     { Jos on vaakasuora viiva }
        begin
          if x > tab[i, 1] then
            if x < tab[i, 3] then
              if y = tab[i, 2]-10 then       { Jos t”rm„t„„n siihen }
                begin
                  if suunta = 1 then
                    suunta := suunta+1;
                  if suunta = 3 then
                    suunta := suunta+1;
                  if suunta = 2 then
                    {y := y+10;
                  if suunta = 4 then
                    y := y-10;}
                end;
        end;
      end;
  end;

procedure piirto;
  var
    r      : char;

  begin
    r := ReadKey;
    suunta := 1;
    x := 10;
    y := 200;
    while r <> 'q' do
      begin
        tarkistus;
        SetColor(2);
        circle(x, y, 4);
        if suunta = 4 then
          begin
            SetColor(15);
            x := x-2;
            gotoxy(x, y);
            delay(20);
            circle(x, y, 4);
          end;
        if suunta = 2 then
          begin
            SetColor(15);
            x := x+2;
            gotoxy(x, y);
            delay(20);
            circle(x, y, 4);
          end;
        if suunta = 1 then
          begin
            SetColor(15);
            y := y-2;
            gotoxy(x, y);
            delay(20);
            circle(x, y, 4);
          end;
        if suunta = 3 then
          begin
            SetColor(15);
            y := y+2;
            gotoxy(x, y);
            delay(20);
            circle(x, y, 4);
          end;
      end;
  end;
begin
  continue := false;
  while not continue do
    begin
      alustus;
      paikat;
      kuva;
      piirto;
      CloseGraph;
      writeln('Haluatko jatkaa (K\E)? Ilmoita tarvittaessa 2 kertaa.');
      readln;
      read(vastaus);
      if vastaus = 'e' then continue := true
    end;
end.