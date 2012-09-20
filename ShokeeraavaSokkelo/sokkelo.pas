program Shokeeraava_Sokkelo;

uses crt,          dos,
     muutu,        hiiriu,
     huone1u,      huone2u,
     huone3u,      huone4u,
     huone5u,      huone6u,
     kartta1u,     sokkelou;



procedure laitaoik(var tavara : string);

forward



procedure edellinenhuonepro;

forward



function mikatavara(var tavara : string; muuttuja : integer): integer;

forward



procedure valitsetavarapro;

forward



procedure tarkistavalikko;

forward



procedure kaikkifalse;

forward



procedure valikkopro;

forward



procedure messagebox;

forward



procedure kartanotto;

forward



procedure avaimenotto;

forward



procedure alku;

forward



procedure loppupro;

forward



procedure laitaoik(var tavara : string);

begin
  if (paikka[1]<>'tyhja') and (paikka[2]<>'tyhja') and (paikka[3]<>'tyhja') and
  (paikka[4]<>'tyhja') and (paikka[5]='tyhja') then paikka[5]:=tavara;
  if (paikka[1]<>'tyhja') and (paikka[2]<>'tyhja') and (paikka[3]<>'tyhja') and
  (paikka[4]='tyhja') then paikka[4]:=tavara;
  if (paikka[1]<>'tyhja') and (paikka[2]<>'tyhja') and (paikka[3]='tyhja') then
  paikka[3]:=tavara;
  if (paikka[1]<>'tyhja') and (paikka[2]='tyhja') then
  paikka[2]:=tavara;
  if paikka[1]='tyhja' then
  paikka[1]:=tavara;
end;



procedure edellinenhuonepro;

begin
  if edellinenhuone='huone1' then
    huone1pro;
  if edellinenhuone='kartta1' then
    kartta1pro;
  if edellinenhuone='huone2' then
    huone2pro;
  if edellinenhuone='huone3' then
    huone3pro;
  if edellinenhuone='huone4' then
    huone4pro;
  if edellinenhuone='huone5' then
    huone5pro;
  if edellinenhuone='huone6' then
    huone6pro;
end;



function mikatavara(var tavara : string; muuttuja : integer):integer;

begin
  for i:=1 to 5 do
  if paikka[i]=tavara then
  if (n1=1) and (muuttuja=2) and (x>488) and (x<544) then
  begin
    if i=1 then
    if y=40 then
    mikatavara:=1;
    if i=2 then
    if y=48 then
    mikatavara:=1;
    if i=3 then
    if y=56 then
    mikatavara:=1;
    if i=4 then
    if y=64 then
    mikatavara:=1;
    if i=5 then
    if y=72 then
    mikatavara:=1;
  end;
end;



procedure valitsetavarapro;

begin
  valitsexraja;
  valitseyraja;
  naytakursori;
  piirravalikko;
  valitsetavara:=true;
  repeat
    luetila(x,y,n1,n2);
    miktavara:='kartta1';
    mikmuuttuja:=kartta;
    if mikatavara(miktavara,mikmuuttuja)=1 then            { k„yt„ karttaa }
    begin
      valitsetavara:=false;
      normaalixraja;
      normaaliyraja;
      kartta1pro;
    end;
    if ((y=88) and (x<=554) and (x>=464) and (n1=1)) then  { ei k„yt„ }
    begin
      valitsetavara:=false;
      normaalixraja;
      normaaliyraja;
      edellinenhuonepro;
    end;
  until valitsetavara=false;
  normaalixraja;
  normaaliyraja;
end;



procedure tarkistavalikko;

begin
  if ((y=24) and (x>=64) and (x<=120)) then                  { ota }
  begin
    ota:=true;
    valikko:=false;
    edellinenhuonepro;
  end;
  if ((y=32) and (x>=64) and (x<=120)) then                  { k„yt„ }
  begin
    kayta := true;
    valikko:=false;
    valitsetavarapro;
  end;
  if ((y=40) and (x>=64) and (x<=120)) then                  { tutki }
  begin
    tutki:=true;
    valikko:=false;
    edellinenhuonepro;
  end;
  if ((y=48) and (x>=64) and (x<=120)) then                  { avaa }
  begin
    avaa:=true;
    valikko:=false;
    edellinenhuonepro;
  end;
  if ((y=56) and (x>=64) and (x<=120)) then                  { sulje }
  begin
    sulje:=true;
    valikko:=false;
    edellinenhuonepro;
  end;
  if ((y=64) and (x>=64) and (x<=120)) then                  { katso }
  begin
    katso:=true;
    valikko:=false;
    valitsetavarapro;
  end;
  if ((y=72) and (x>=64) and (x<=120)) then                  { puhu }
  begin
    puhu:=true;
    valikko:=false;
    edellinenhuonepro;
  end;
  if ((y=80) and (x>=64) and (x<=120)) then                  { pelaa }
  begin
    valikko:=false;
    edellinenhuonepro;
  end;
  if ((y=88) and (x>=64) and (x<=120)) then                  { lopeta }
  loppupro;
end;



procedure kaikkifalse;

begin
  ota:=false;
  kayta:=false;
  tutki:=false;
  avaa:=false;
  sulje:=false;
  katso:=false;
  puhu:=false;
end;



procedure valikkopro;

begin
  clrscr;
  kaikkifalse;
  piirravalikko;
  naytakursori;
  valikko:=true;
  repeat
    luetila(x,y,n1,n2);
    if ((x>=64) and (x<=120) and (n1=1)) then
    tarkistavalikko;
  until valikko=false;
  katkekursori;
end;



procedure messagebox;

begin
  if (ota) then
  begin
    gotoxy(62,22);
    write('Ota');
  end;
  if (avaa) then
  begin
    gotoxy(62,22);
    write('Avaa');
  end;
  if (sulje) then
  begin
    gotoxy(62,22);
    write('Sulje');
  end;
  if (puhu) then
  begin
    gotoxy(62,22);
    write('Puhu');
  end;
  if not ((ota) or (kayta) or (tutki) or (avaa) or (sulje) or (katso) or (puhu)) then
  begin
    gotoxy(62,22);
    write('              ');
  end;
end;



procedure kartanotto;

begin
  kartta:=2;
  laittavara:='kartta1';
  laitaoik(laittavara);
  gotoxy(70,22);
  writeln('kartta');
  delay(1000);
  clrscr;
  piirrahuone1;
  gotoxy(62,22);
  writeln('Otettu!        ');
  delay(1000);
  kaikkifalse;
end;



procedure avaimenotto;

begin
  avain1:=2;
  laittavara:='avain1';
  laitaoik(laittavara);
  gotoxy(70,22);
  writeln('avain');
  delay(1000);
  clrscr;
  piirrahuone2;
  gotoxy(62,22);
  writeln('Otettu!        ');
  delay(1000);
  kaikkifalse;
end;



procedure alku;

begin
  clrscr;
  if not keypressed then gotoxy(25,8);
  if not keypressed then writeln('Seppo Enarvi');
  if not keypressed then for i:=1 to 3500 do
  if not keypressed then delay(1);
  clrscr;
  if not keypressed then gotoxy(25,8);
  if not keypressed then writeln('& Jussi Markkanen');
  if not keypressed then for i:=1 to 3500 do
  if not keypressed then delay(1);
  clrscr;
  if not keypressed then gotoxy (25,8);
  if not keypressed then writeln('ESITTЋЋ:');
  if not keypressed then for i:=1 to 3500 do
  if not keypressed then delay(1);
  clrscr;
  if not keypressed then writeln;
  if not keypressed then writeln;
  if not keypressed then writeln;
  if not keypressed then writeln;
  if not keypressed then writeln('     SHOKEERAAVA   ');
  if not keypressed then writeln;
  if not keypressed then writeln('     ЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫ');
  if not keypressed then writeln('     ЫЫ');
  if not keypressed then writeln('     ЫЫ');
  if not keypressed then writeln('     ЫЫ');
  if not keypressed then writeln('     ЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫ ЫЫЫЫЫЫЫЫЫ ЫЫ  ЫЫ ЫЫ  ЫЫ ЫЫЫЫЫЫ  ЫЫ     ЫЫЫЫЫЫЫЫЫ');
  if not keypressed then writeln('                     ЫЫ ЫЫ     ЫЫ ЫЫ ЫЫ  ЫЫ ЫЫ  ЫЫ      ЫЫ     ЫЫ     ЫЫ');
  if not keypressed then writeln('                     ЫЫ ЫЫ     ЫЫ ЫЫЫЫЯ  ЫЫЫЫ   ЫЫЫЫ    ЫЫ     ЫЫ     ЫЫ');
  if not keypressed then writeln('                     ЫЫ ЫЫ     ЫЫ ЫЫ ЫЫ  ЫЫ ЫЫ  ЫЫ      ЫЫ     ЫЫ     ЫЫ');
  if not keypressed then writeln('     ЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫ ЫЫЫЫЫЫЫЫЫ ЫЫ  ЫЫ ЫЫ  ЫЫ ЫЫЫЫЫЫЫ ЫЫЫЫЫЫ ЫЫЫЫЫЫЫЫЫ');
  if not keypressed then writeln;
  if not keypressed then writeln('     ЬЬЫЫЫЫЫЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ');
  if not keypressed then writeln('     ЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЬЬЬЬЬЬЬЬЬЬЬЬЬДДДД');
  if not keypressed then writeln('     ЯЫЫЫЫЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ');
  if not keypressed then writeln;
  if not keypressed then writeln;
  if not keypressed then writeln;
  if not keypressed then writeln;
  if not keypressed then sound(200);
  if not keypressed then delay(500);
  if not keypressed then sound(250);
  if not keypressed then delay(500);
  if not keypressed then sound(200);
  if not keypressed then delay(500);
  if not keypressed then sound(320);
  if not keypressed then delay(550);
  if not keypressed then sound(200);
  if not keypressed then delay(500);
  if not keypressed then sound(250);
  if not keypressed then delay(500);
  if not keypressed then sound(200);
  if not keypressed then delay(500);
  if not keypressed then sound(400);
  if not keypressed then delay(600);
  nosound;
end;



procedure loppupro;

begin
  clrscr;
  gotoxy(30,8);
  writeln('Peli on v„h„n niinkuin p„„ttym„ss„...');
  katkekursori;
  halt (1);
end;



begin
  writeln('Shokeeraava Sokkelo  Varsion 1.0b  Copyright (c) 1993 Seppo Enarvi & Jussi Markkanen');
  if alustahiiri=0 then
    begin;
      writeln('Onko hiiri varmasti asetettu?');
      halt(1);
    end;
  loppu:=false;
  kartta:=1;
  ovi1:=1;
  ovi2:=1;
  avain1:=1;
  tavarapaikka:=0;
  for i:=1 to 5 do
  paikka[i]:='tyhja';
  alku;
  huone1pro;
end.
