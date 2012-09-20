unit huone1u;

interface

uses kuvatu,    crt,
     hiiriu,    muutu;

procedure huone1pro;

implementation

procedure huone1pro;

begin
  clrscr;
  naytakursori;
  piirrahuone1;
  huone1:=true;
  edellinenhuone:='huone1';
  repeat
    luetila(x,y,n1,n2);
    messagebox;
    if (kartta=1) and (tutki) and (x>=544) and (x<=576) and (y>=32) and (y<=48) then
    begin
      gotoxy(62,22);
      write ('kartta');
      gotoxy(62,22);
      write ('      ');
    end;
    if ((ota) and (kartta=1) and (n1=1) and (x>=544) and (x<=576) and (y>=32) and (y<=48)) then
    kartanotto;
    if n2=1 then
    begin
      huone1:=false;
      katkekursori;
      valikkopro;
    end;
    if ((tutki) and (x>=624) and (Y>=72) and (y<=112)) then
    begin
      gotoxy(62,22);
      write ('ovi');
      gotoxy(62,22);
      write ('   ');
    end;
    if ((avaa) and (x>=624) and (Y>=72) and (y<=112) and (n1=1)) then
    begin
      ovi1:=2;
      gotoxy(70,22);
      write('ovi');
      delay(1000);
      clrscr;
      piirrahuone1;
      gotoxy(62,22);
      writeln('Avattu!        ');
      delay(1000);
      kaikkifalse;
    end;
    if ((sulje) and (x>=624) and (Y>=72) and (y<=112) and (N1=1)) then
    begin
      ovi1:=1;
      gotoxy(70,22);
      write('ovi');
      delay(1000);
      clrscr;
      piirrahuone1;
      gotoxy(62,22);
      writeln('Suljettu!      ');
      delay(1000);
      kaikkifalse;
    end;
  until ((huone1=false) or loppu);
  katkekursori;
end;



end.