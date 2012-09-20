program ratkaise;

uses crt;

var
  lukuja, vastaus, tmp : integer;
  i, ii, iii, iv, v, vi, vii, viii, ix, x : integer;
  xi, xii, xiii, xiv, xv, xvi, xvii, xviii, xix, xx : integer;
  kaikkiluvut : set of byte;
  luku : array [1..20] of integer;
  tulos : array [1..100, 1..20] of integer;
  taulukko : array [1..20, 0..9] of integer;
  plus, miinus, kerto, jako, numerot, merkit : boolean;
  jatko : boolean;

procedure naytatulos;

var
  i, ii : integer;

begin
  for i := 1 to 100 do
    begin
      for ii := 1 to lukuja-1 do
        write(tulos[i, ii], ' - ');
      writeln(tulos[i, lukuja]);
    end;
end;

procedure naytaluvut;

var
  i : integer;

begin
  for i := 1 to lukuja-1 do
    write(luku[i], ' - ');
  writeln(luku[lukuja]);
end;

procedure merkitsetaulukkoon;

begin
  v := v+1;
  if v > 100 then
    v := 100;
  taulukko[1, i] := tulos[v, 1];
  taulukko[2, ii] := tulos[v, 2];
  taulukko[3, i] := tulos[v, 3];
  taulukko[4, ii] := tulos[v, 4];
  taulukko[5, i] := tulos[v, 5];
  taulukko[6, ii] := tulos[v, 6];
  taulukko[7, i] := tulos[v, 7];
  taulukko[8, ii] := tulos[v, 8];
  taulukko[9, i] := tulos[v, 9];
  taulukko[10, ii] := tulos[v, 10];
  taulukko[11, i] := tulos[v, 11];
  taulukko[12, ii] := tulos[v, 12];
  taulukko[13, i] := tulos[v, 13];
  taulukko[14, ii] := tulos[v, 14];
  taulukko[15, i] := tulos[v, 15];
  taulukko[16, ii] := tulos[v, 16];
  taulukko[17, i] := tulos[v, 17];
  taulukko[18, ii] := tulos[v, 18];
  taulukko[19, i] := tulos[v, 19];
  taulukko[20, ii] := tulos[v, 20];
end;

procedure kaikki;

begin
  for i := 0 to 9 do
  if taulukko[1, i] in kaikkiluvut then
  for ii := 0 to 9 do
  if taulukko[2, ii] in kaikkiluvut then
  for iii := 0 to 9 do
  if taulukko[3, iii] in kaikkiluvut then
  for iv := 0 to 9 do
  if taulukko[4, iv] in kaikkiluvut then
  merkitsetaulukkoon;
end;

  { xxi := 1;
    jatko := false;
    repeat
      case xxi of
        1: for ii := 0 to 9 do
             if taulukko[xxi, i] in kaikkiluvut then
               jatko := true
        2: for ii := 0 to 9 do
             if taulukko[xxi, ii] in kaikkiluvut then
               jatko := true
        3: for ii := 0 to 9 do
             if taulukko[xxi, iii] in kaikkiluvut then
               jatko := true
        4: for ii := 0 to 9 do
             if taulukko[xxi, iv] in kaikkiluvut then
               jatko := true
        5: for ii := 0 to 9 do
             if taulukko[xxi, v] in kaikkiluvut then
               jatko := true
        6: for ii := 0 to 9 do
             if taulukko[xxi, vi] in kaikkiluvut then
               jatko := true
        7: for ii := 0 to 9 do
             if taulukko[xxi, vii] in kaikkiluvut then
               jatko := true
        8: for ii := 0 to 9 do
             if taulukko[xxi, viii] in kaikkiluvut then
               jatko := true
        9: for ii := 0 to 9 do
             if taulukko[xxi, ix] in kaikkiluvut then
               jatko := true
        10: for ii := 0 to 9 do
              if taulukko[xxi, x] in kaikkiluvut then
                jatko := true
        11: for ii := 0 to 9 do
              if taulukko[xxi, xi] in kaikkiluvut then
                jatko := true
        12: for ii := 0 to 9 do
              if taulukko[xxi, xii] in kaikkiluvut then
                jatko := true
        13: for ii := 0 to 9 do
              if taulukko[xxi, xiii] in kaikkiluvut then
                jatko := true
        14: for ii := 0 to 9 do
              if taulukko[xxi, xiv] in kaikkiluvut then
                jatko := true
        15: for ii := 0 to 9 do
              if taulukko[xxi, xv] in kaikkiluvut then
                jatko := true
        16: for ii := 0 to 9 do
              if taulukko[xxi, xvi] in kaikkiluvut then
                jatko := true
        17: for ii := 0 to 9 do
              if taulukko[xxi, xvii] in kaikkiluvut then
                jatko := true
        18: for ii := 0 to 9 do
              if taulukko[xxi, xviii] in kaikkiluvut then
                jatko := true
        19: for ii := 0 to 9 do
              if taulukko[xxi, xix] in kaikkiluvut then
                jatko := true
        20: for ii := 0 to 9 do
              if taulukko[xxi, xx] in kaikkiluvut then
                jatko := true
      xxi := xxi+1;
    until (jatko = false) or (xxi = lukuja);
  }

procedure alusta;

begin
  for i := 1 to 20 do
    for ii := 0 to 9 do
      taulukko[i, ii] := ii;
  kaikkiluvut := [luku[1], luku[2], luku[3], luku[4]];
  v := 0;
end;

procedure tarkistaparametrit;

begin
  for i := 1 to 6 do
  begin
    if (paramstr(i) = '/?') then
    begin
      writeln('RATKAISE [/P] [/M] [/K] [/J] [/N] [/L]');
      writeln;
      writeln('/P    Saa k„ytt„„ pluslaskua');
      writeln('/M    Saa k„ytt„„ miinuslaskua');
      writeln('/K    Saa k„ytt„„ kertolaskua');
      writeln('/J    Saa k„ytt„„ jakolaskua');
      writeln('/N    Saa k„ytt„„ yht„ lukua monta kertaa');
      writeln('/L    Saa k„ytt„„ yhta laskutoimitusmerkki„ monta kertaa');
      halt(1);
    end;
    if (paramstr(i) = 'P') or (paramstr(i) = 'p') then
      plus := true;
    if (paramstr(i) = 'M') or (paramstr(i) = 'm') then
      miinus := true;
    if (paramstr(i) = 'K') or (paramstr(i) = 'k') then
      kerto := true;
    if (paramstr(i) = 'J') or (paramstr(i) = 'j') then
      jako := true;
    if (paramstr(i) = 'N') or (paramstr(i) = 'n') then
      numerot := true;
    if (paramstr(i) = 'L') or (paramstr(i) = 'l') then
      merkit := true;
  end;
end;

procedure kysele;

begin
  repeat
    write('Montako numeroa annat (2-20) : ');
    readln(lukuja);
    if lukuja < 2 then
      writeln('Liian pieni luku (',lukuja,')');
    if lukuja > 20 then
      writeln('Liian suuri luku (',lukuja,')');
  until (lukuja >= 2) and (lukuja <=20);
  for i := 1 to lukuja do
    repeat
      write('Anna luku ',i,' (0-9) : ');
      readln(luku[i]);
      if luku[i] < 0 then
        writeln('Liian pieni luku (',luku[i],')');
      if luku[i] > 9 then
        writeln('Liian suuri luku (',luku[i],')');
    until (luku[i] > -1) and (luku[i] < 10);
  write('Anna vastaus : ');
  readln(vastaus);
end;

begin
  tarkistaparametrit;
  kysele;
  alusta;
  writeln('Annetut luvut :');
  naytaluvut;
  kaikki;
  writeln('Kaikki j„rjestykset :');
  naytatulos;
  readkey;
end.