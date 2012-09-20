Unit Kuvatu;

interface

uses Crt, muutu;

procedure piirravalikko;

procedure piirrahuone1;

procedure piirrahuone2;

procedure piirrahuone3;

procedure piirrahuone4;

procedure piirrahuone5;

procedure piirrahuone6;

procedure piirrakartta1;

implementation



procedure piirravalikko;

{ const es=#27+'['; }

begin
  clrscr;
  writeln;
  writeln;
  writeln('     ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»  ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»  ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»');
  writeln('     º                 º  º                          º  º                 º');
  writeln('     º  Ota            º  º      Adventures in:      º  º  Tavarasi:      º');
  writeln('     º  K„yt„          º  º                          º  º                 º');
  writeln('     º  Tutki          º  º   SHOKEERAAVA SOKKELO    º  º  1)             º');
  writeln('     º  Avaa           º  º                          º  º  2)             º');
  writeln('     º  Sulje          º  º                          º  º  3)             º');
  writeln('     º  Katso          º  ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼  º  4)             º');
  writeln('     º  Puhu           º  ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»  º  5)             º');
  writeln('     º  Pelaa          º  º                          º  º                 º');
  writeln('     º  Lopeta         º  º      Version 1.00b       º  º  Enp„ k„yt„     º');
  writeln('     º                 º  º                          º  º                 º');
  writeln('     ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼  ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼  ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼');
  writeln('     ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»');
  writeln('     º Apua!                                                              º');
  writeln('     º                                                                    º');
  writeln('     º Valitse hiirell„ vasemman puoleisesta laatikosta komento ja sen    º');
  writeln('     º j„lkeen huoneenkuvasta mihin sit„ k„yt„t. Jos valitset k„yt„, niin º');
  writeln('     º voit valita oikeanpuoleisesta laatikosta mit„ tavaraa k„yt„t, tai  º');
  writeln('     º enp„ k„yt„.                                                        º');
  writeln('     º                                                                    º');
  writeln('     ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼');
  writeln;
  for i:=1 to 5 do
  begin
  if paikka[i]='kartta1' then
  begin
     gotoxy(63,i+5);
     write('kartta');
  end;
  if paikka[i]='avain1' then
  begin
     gotoxy(63,7);
     write ('avain');
  end;
  end;
end;



procedure piirrahuone1;

begin
  write('ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ');
  write('ÛÛ°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÛÛ');
  write('ÛÛ°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÛÛ');
  write('ÛÛ°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÛÛ');
  write('³³°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÛÛ');
  write('³³°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÛÛ');
  write('³³°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÛÛ');
  write('³³°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÛÛ');
  write('³³O°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÛÛ');
  write('³³°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°³³');
  write('Ã´°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÚÄ³³');
  write('³³°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°³³');
  write('³³O°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°³³');
  write('³³°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°³³');
  write('³³°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°³³');
  write('³³°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÛÛ');
  write('³³°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÛÛ');
  write('ÛÛ°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÛÛ');
  write('ÛÛ°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÛÛ');
  write('ÛÛ°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÛÛ');
  write('ÛÛ°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿°ÛÛ');
  write('ÛÛ°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°³                ³°ÛÛ');
  write('ÛÛ°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ°ÛÛ');
  write('ÛÛ°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÛÛ');
  write('ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ');
  if kartta=1 then
  begin
    gotoxy(69,5);
    write('²²²²');
    gotoxy(70,6);
    write('²²²²');
    gotoxy(69,7);
    write('²²²²');
  end;
  if ovi1 <>1 then
  begin
    gotoxy (79,10);
    write ('°°');
    gotoxy (77,11);
    write ('°°°°');
    gotoxy (79,12);
    write ('°°');
    gotoxy (79,13);
    write ('°°');
    gotoxy (79,14);
    write ('°°');
    gotoxy (79,15);
    write ('°°');
    gotoxy (79,16);
    write ('°°');
    gotoxy (69,16);
    write ('ÍÍÍÍÍÍÍÍÍÍÍÍ');
    gotoxy (71,17);
    write ('ÀÄ');
   end;
end;



procedure piirrahuone2;

begin
  clrscr;
  write ('            ÛÛ°°°°°°°°°°°°ÛÛ                                                    ');
  write ('            ÛÛ°°°°°°°°°°°°ÛÛ                                                    ');
  write ('            ÛÛ°°°°°°°°°°°°ÛÛ                                                    ');
  write ('            ÛÛ°°°°°°°°Ä¿°°ÛÛ                                                    ');
  write ('            ÛÛÍÍÍÍÍÍÍÍÍÍÍÍÛÛ                                                    ');
  write ('ÛÛÛÛÛÛÛÛÛÛÛÛÛÛ°°°°°°°°°°°°ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ');
  write ('ÛÛ°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÛÛ');
  write ('ÛÛ°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÛÛ');
  write ('ÛÛ°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÛÛ');
  write ('ÛÛ°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÛÛ');
  write ('ÛÛ°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÛÛ');
  write ('ÛÛ°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÛÛ');
  write ('ÛÛ°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÛÛ');
  write ('ÛÛ°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÛÛ');
  write ('ÛÛ°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÛÛ');
  write ('ÛÛ°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÛÛ');
  write ('ÛÛ°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÛÛ');
  write ('ÛÛ°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÛÛ');
  write ('ÛÛ°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÛÛ');
  write ('ÛÛ°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÛÛ');
  write ('ÛÛ°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿°ÛÛ');
  write ('ÛÛ°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°³                ³°ÛÛ');
  write ('ÛÛ°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ°ÛÛ');
  write ('ÛÛ°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÛÛ');
  write ('ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ');
  if (avain1=1) then
  begin
    gotoxy (5,19);
    write ('¸');
    gotoxy(5,20);
    write('ø');
  end;
  if (ovi2<>1) then
  begin
    gotoxy (15,5);
    write ('°°°°°°°°°°°°');
    gotoxy (23,4);
    write ('°°');
    gotoxy (15,5);
    write ('º');
    gotoxy (15,6);
    write ('º');
    gotoxy (15,7);
    write ('º');
    gotoxy (15,8);
    write ('º');
    gotoxy (15,9);
    write ('º');
    gotoxy (15,10);
    write ('º');
    gotoxy (16,9);
    write ('Ù');
  end;
end;



procedure piirrahuone3;

begin
  clrscr;
  write ('ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ');
  write ('ÛÛ°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÛÛ');
  write ('ÛÛ°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÛÛ');
  write ('ÛÛ°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÛÛ');
  write ('ÛÛ°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÛÛ');
  write ('ÛÛ°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÛÛ');
  write ('ÛÛ°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÛÛ');
  write ('³³°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÛÛ');
  write ('³³°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÛÛ');
  write ('³³°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÛÛ');
  write ('³³°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÛÛ');
  write ('³³°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÛÛ');
  write ('³³ÄÙ°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÛÛ');
  write ('³³°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÛÛ');
  write ('ÛÛ°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÛÛ');
  write ('ÛÛ°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÛÛ');
  write ('ÛÛ°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÛÛ');
  write ('ÛÛ°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÛÛ');
  write ('ÛÛ°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÛÛ');
  write ('ÛÛ°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÛÛ');
  write ('ÛÛ°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿°ÛÛ');
  write ('ÛÛ°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°³                ³°ÛÛ');
  write ('ÛÛ°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ°ÛÛ');
  write ('ÛÛ°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÛÛ');
  write ('ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ');
end;



procedure piirrahuone4;

begin
  clrscr;
  write ('           ÛÛ°°°°°°°°°°°°°°°°°°°°ÛÛ                                             ');
  write ('           ÛÛ°°°°°°°°°°°°°°°°¿°°°ÛÛ                                             ');
  write ('           ÛÛÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÛÛ                                             ');
  write ('ÛÛÛÛÛÛÛÛÛÛÛÛÛ°°°°°°°°°°°°°°°°Ù°°°ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ');
  write ('ÛÛ°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÛÛ');
  write ('ÛÛ°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÛÛÛÛÛÛÛÛ°°°°°°°°°°ÛÛ');
  write ('ÛÛ°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÛÛ³   ÛÛÛÛ°°°°°°°°ÛÛ');
  write ('ÛÛ°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÛÛ³       ÛÛ°°°°°°ÛÛ');
  write ('ÛÛ°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÛÛ³     /   ÛÛ°°°°ÛÛ');
  write ('ÛÛ°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÛÛ³   /     ÛÛ°°°°ÛÛ');
  write ('ÛÛ°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÛÛ³ /         ÛÛ°°ÛÛ');
  write ('ÛÛ°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÃÄÄÄÄÄÄÄÄÄÄÄÛÛ°°ÛÛ');
  write ('ÛÛ°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÛÛ           /³\          ÛÛ°°ÛÛ');
  write ('ÛÛ°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÛÛ         /  ³  \        ÛÛ°°ÛÛ');
  write ('ÛÛ°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÛÛ     /    ³    \    ÛÛ°°°°ÛÛ');
  write ('ÛÛ°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÛÛ   /      ³      \  ÛÛ°°°°ÛÛ');
  write ('ÛÛ°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÛÛ        ³       ÛÛ°°°°°°ÛÛ');
  write ('ÛÛ°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÛÛÛÛ    ³   ÛÛÛÛ°°°°°°°°ÛÛ');
  write ('ÛÛ°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÛÛÛÛÛÛÛÛ°°°°°°°°°°°°ÛÛ');
  write ('ÛÛ°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÛÛ');
  write ('ÛÛ°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿°ÛÛ');
  write ('ÛÛ°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°³                ³°ÛÛ');
  write ('ÛÛ°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ°ÛÛ');
  write ('ÛÛ°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÛÛ');
  write ('ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ');
end;



procedure piirrahuone5;

begin
  clrscr;
  write ('    ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ');
  write ('    ÛÛ°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÛÛ');
  write ('    ÛÛ°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÛÛ');
  write ('    ÛÛ°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÛÛ');
  write ('    ÛÛ°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÛÛ');
  write ('    ÛÛ°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÛÛ');
  write ('    ÛÛ°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÛÛ');
  write ('ÛÛÛÛÛÛ°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÛÛ');
  write ('°°°°³³°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÛÛ');
  write ('°°°°³³Ä¿°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÛÛ');
  write ('°°°°³³°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÛÛ');
  write ('°°°°³³°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÛÛ');
  write ('°°°°³³°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÛÛ');
  write ('°°°°³³°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÛÛ');
  write ('ÛÛÛÛÛÛ°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÛÛ');
  write ('    ÛÛ°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÛÛ');
  write ('    ÛÛ°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÛÛ');
  write ('    ÛÛ°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÛÛ');
  write ('    ÛÛ°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÛÛ');
  write ('    ÛÛ°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÛÛ');
  write ('    ÛÛ°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿°ÛÛ');
  write ('    ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ³                ³ÛÛÛ');
  write('                                                           ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ   ');
end;



procedure piirrahuone6;

begin
write ('HUONE VI');
end;



procedure piirrakartta1;

begin
  clrscr;
  write('                                                                                ');
  write('             ÚÄÄÄÄÄ¿                                                            ');
  write(' ÚÄ¿      ÚÄÄÙ     À¿      ÚÄÄÄÄÄÄÄ¿                                            ');
  write(' ³ ÀÄÄÂÄÄÄÁ         ÁÄÄÄÄÄÄÁ       ÁÄÄ¿         ÚÄÄÄÄÄÄÄÄ¿                      ');
  write(' À¿    ±±±±±±±±                       ÀÄÄÄÄÄÄÄÄÄÙ        ÀÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄ¿     ');
  write('  À¿   ±±±±±±±±                                           ±±±±±±±±±±±     ÀÄÄ¿  ');
  write('   ÀÄ¿ ±±±±±±±±°°°°°°°°°°°°°°°°°°                         ±±±±±±±±±±±        ÀÄ¿');
  write('    ÚÙ ±±±±±±±±                °°°°°°°°°°°°°°°°°°°°°°°°°°°±±±±±±±±±±±          ³');
  write('    ³  ±±±±±±±±                °°                         ±±±±±±±±±±±          ³');
  write('  ÚÄÙ                          °°                                              ³');
  write('  ³                            °°                                              ³');
  write('  À¿                           °°                           ±±±±±±±±±          ³');
  write('   À¿                          °°°°°°°°°°°°°°°°°°°°°°°°°°°°°±±±±±±±±±         ÚÙ');
  write('    À¿                            °°                        ±±±±±±±±±       ÚÄÙ ');
  write('     ÀÁ¿                          °°                                       ÚÙ   ');
  write('     ÚÂÙ    ±±°°°°°°°°°°°°°°°°°°°°°°                                       ³    ');
  write('    ÚÙ                            °°                 N                     À¿   ');
  write('   ÚÙ       °°                    °°                 |                      ÀÄ¿ ');
  write('  ÚÙ   ±±±±±±±±±±                ±±±±±±±±±±      ___\|/___     KERROS I       À¿');
  write('  ³    ±±±±±±±±±±                ±±±±±±±±±±         /|\                        ³');
  write('  ³    ±±±±±±±±±±                ±±±±±±±±±±          |                         ³');
  write('  À¿   ±±±±±±±±±±   ÚÄÄ¿                                   ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿  ³');
  write('   ÀÄ¿             ÂÙ  Ã                                   ³                ³ÄÄÙ');
  write('     ÀÄÄÄ¿       ÚÄÙ   À¿                     ÚÄÄÄÄ¿       ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ   ');
  write('         ÀÄÄÄÄÄÄÄÙ      ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ    ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ     ');
  write('');
end;



end.
