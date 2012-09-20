unit huone2u;

interface

uses kuvatu;

procedure huone2pro;

implementation

procedure huone2pro;

begin
  clrscr;
  naytakursori;
  piirrahuone2;
  huone2:=true;
  edellinenhuone:='huone2';
  repeat
    luetila(x,y,n1,n2);
    messagebox;
    if n2=1 then
    begin
      huone2:=false;
      katkekursori;
      valikkopro;
    end;
    if ((ota) and (x=32) and ((y=144) or (y=152)) and (n1=1) and (avain1=1)) then
    avaimenotto;
    if ((tutki) and (x=32) and ((y=144) or (y=152)) and (avain1=1)) then
    begin
      gotoxy(62,22);
      write ('avain');
      gotoxy(62,22);
      write ('     ');
    end;
    if ((avaa) and (x>=120) and (Y=32) and (x<=264) and (n1=1)) then
    begin
      ovi2:=2;
      gotoxy(70,22);
      write('ovi');
      delay(1000);
      gotoxy(62,22);
      writeln('Avattu!        ');
      delay(1000);
      kaikkifalse;
      clrscr;
      piirrahuone2;
    end;
    if ((sulje) and (x>=120) and (Y=32) and (x<=264) and (n1=1)) then
    begin
      ovi2:=1;
      gotoxy(70,22);
      write('ovi');
      delay(1000);
      gotoxy(62,22);
      writeln('Suljettu!   ');
      delay(1000);
      kaikkifalse;
      clrscr;
      piirrahuone2;
    end;
    if ((tutki) and (x>=120) and (Y=32) and (x<=264)) then
    begin
      gotoxy(62,22);
      write ('ovi');
      gotoxy(62,22);
      write ('   ');
    end;
  until ((huone2=false) or loppu);
  katkekursori;
end;



end.