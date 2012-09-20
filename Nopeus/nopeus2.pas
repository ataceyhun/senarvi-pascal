program nopeus2;

uses crt, dos;

type
  kirjaintyyppi = 'a'..'z';

var
  pisteet         : integer;
  loppulippu      : boolean;
  kirjain         : kirjaintyyppi;
  oikeakirjain    : kirjaintyyppi;
  ch              : char;
  tunti, minuutti, sekuntti, sekuntti100 : word;
  alkutunti, alkuminuutti, alkusekuntti, alkusekuntti100 : word;

label 1;

procedure alkuajat;

begin
  gettime(alkutunti, alkuminuutti, alkusekuntti, alkusekuntti100);
  settime(0, 0, 0, 0);
end;

procedure loppuajat;

begin
  gettime(tunti, minuutti, sekuntti, sekuntti100);
end;

procedure asetaajat;

begin
  alkutunti := alkutunti + tunti;
  alkuminuutti := alkuminuutti + minuutti;
  alkusekuntti := alkusekuntti + sekuntti;
  alkusekuntti100 := alkusekuntti100 + sekuntti100;
  if alkusekuntti100 > 60 then
  begin
    alkusekuntti := alkusekuntti + (alkusekuntti100 - 60);
    alkusekuntti100 := 60;
  end;
  if alkusekuntti > 60 then
  begin
    alkuminuutti := alkuminuutti + (alkusekuntti - 60);
    alkusekuntti := 60;
  end;
  if alkuminuutti > 60 then
  begin
    alkutunti := alkutunti + (alkuminuutti - 60);
    alkuminuutti := 60;
  end;
  settime(alkutunti, alkuminuutti, alkusekuntti, alkusekuntti100);
end;

procedure beep;

begin
  sound(220);
  delay(200);
  nosound;
end;

begin
  clrscr;
  loppulippu := false;
  repeat
    repeat
    until keypressed;
    alkuajat;
    for oikeakirjain := 'a' to 'z' do
    1: begin
         readln(kirjain);
         if kirjain <> oikeakirjain then
         begin
           beep;
           goto 1;
         end;
       end;
         loppuajat;
         clrscr;
         repeat
           asetaajat;
           writeln('aika : ', tunti, '.', minuutti, '.', sekuntti, '.', sekuntti100);
           write('Haluatko yritt„„ uudelleen (K/E) : '); readln(ch);
           clrscr;
         until (ch = 'k') or (ch = 'e') or (ch = 'K') or (ch = 'E');
         if (ch = 'e') or (ch = 'E') then
           loppulippu := true;
   until loppulippu;
end.