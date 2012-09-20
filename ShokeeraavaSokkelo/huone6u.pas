unit huone6u;

interface

uses kuvatu;

procedure huone6pro;

implementation



procedure huone6pro;

begin
  clrscr;
  huone6:=true;
  naytakursori;
  edellinenhuone:='huone6';
  piirrahuone6;
  repeat
    luetila(x,y,n1,n2);
    if n2=1 then
    begin
      huone6:=false;
      katkekursori;
      valikkopro;
    end;
    messagebox;
  until ((huone6=false) or loppu);
  katkekursori;
end;



end.