unit huone4u;

interface

uses kuvatu;

procedure huone4pro;

implementation

procedure huone4pro;

begin
  clrscr;
  huone4:=true;
  naytakursori;
  edellinenhuone:='huone4';
  piirrahuone4;
  repeat
    luetila(x,y,n1,n2);
    if n2=1 then
    begin
      huone4:=false;
      katkekursori;
      valikkopro;
    end;
    messagebox;
  until ((huone4=false) or loppu);
  katkekursori;
end;



end.