program nopeus1;

uses graph, crt;

var gd,gm                        : integer;
    ch                           : char;
    r, g, y                      : integer;
    gpisteet, rpisteet, ypisteet : integer;
    quit                         : boolean;
    pelaajat                     : integer;
    puoli                        : integer;

procedure init;

begin
  clrscr;
  writeln('Punaisen pelaajan n„pp„in  : t');
  writeln;
  writeln('Vihre„n pelaajan n„pp„in   : u');
  writeln;
  if pelaajat = 3 then
    writeln('Keltaisen pelaajan n„pp„in : o');
  readkey;
  gd:=detect;
  initgraph(gd,gm,'d:\tp\bgi');
  if graphresult <> grok then halt(1);
  puoli:=getmaxy div 2;
  quit:=false;
  r:=puoli;
  g:=puoli;
  y:=puoli;
end;

procedure piirratausta;

var alaosa, ylaosa, count : integer;

begin
  alaosa := puoli - ((puoli - 100) div 2);
  ylaosa := puoli + ((puoli - 100) div 2);
  ClearDevice;
  Line(100, puoli, 500, puoli);                   { keskiviiva        }
  line(100, 100, 500, 100);                       { yl„puoli          }
  line(100, getmaxy-100, 500, getmaxy-100);       { alapuoli          }
  line(100, alaosa, 500, alaosa);                 { alhaalla keskell„ }
  line(100, ylaosa, 500, ylaosa);                 { ylhaalla keskell„ }
  for count := 1 to 5 do
    line(count*100, 100, count*100, getmaxy-100); { sivuttaisviivat   }
end;

procedure pelaa;

var x    : integer;

begin
  piirratausta;
  x:=99;
  repeat
    x := x+1;
    ch := readkey;
    if ch ='q' then
      quit:=true;
    if (ch <> 't') and (r < getmaxy-100) then
      r := r+1;
    if (ch <> 'u') and (g < getmaxy-100) then
      g := g+1;
    if (ch <> 'o') and (y < getmaxy-100) then
      y := y+1;
    if (ch = 't') and (r > 100) then
      r := r-1;
    if (ch = 'u') and (g > 100) then
      g := g-1;
    if (ch = 'o') and (y > 100) then
      y := y-1;
    putpixel(x, r, red);
    putpixel(x, g, green);
    if pelaajat = 3 then putpixel(x, y, yellow);
  until (x=500) or quit;
end;

procedure naytapisteet;

begin
  if quit = false then
  begin
    if pelaajat = 2 then
    begin
      if g < r then
        gpisteet := gpisteet + 1;
      if r < g then
        rpisteet := rpisteet + 1;
    end;
    if pelaajat = 3 then
    begin
      if (g < r) and (g < y) then
        gpisteet := gpisteet + 1;
      if (r < g) and (r < y) then
        rpisteet := rpisteet + 1;
      if (y < g) and (y < r) then
        ypisteet := ypisteet + 1;
    end;
  end;
  writeln('Punaisen pisteet  : ', rpisteet);
  writeln('Vihre„n pisteet   : ', gpisteet);
  if pelaajat = 3 then
  writeln('Keltaisen pisteet : ', ypisteet);
end;

begin
  clrscr;
  gpisteet := 0;
  rpisteet := 0;
  ypisteet := 0;
  repeat;
    write('Kuinka monta pelaajaa (2-3) : '); readln(pelaajat);
    clrscr;
  until (pelaajat >= 2) and (pelaajat <= 3);
  repeat
    init;
    pelaa;
    outtextxy(100, 50, 'Paina jotain n„pp„int„...');
    readkey;
    closegraph;
    clrscr;
    naytapisteet;
    writeln('Paina jotain n„pp„int„...');
    readkey;
    repeat
      clrscr;
      write('Haluatko uuden pelin (K/E) : '); read(ch);
    until (ch = 'k') or (ch = 'e') or (ch = 'K') or (ch = 'E');
  until ch <> 'k';
  clrscr;
end.