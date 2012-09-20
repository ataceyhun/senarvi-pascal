unit huone5u;

interface

uses kuvatu;

procedure huone5pro;

implementation

procedure huone5pro;

begin
  clrscr;
  huone5:=true;
  naytakursori;
  edellinenhuone:='huone5';
  piirrahuone5;
  repeat
    luetila(x,y,n1,n2);
    if n2=1 then
    begin
      huone5:=false;
      katkekursori;
      valikkopro;
    end;
    messagebox;
  until ((huone5=false) or loppu);
  katkekursori;
end;



end.