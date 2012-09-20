unit huone3u;

interface

uses kuvatu;

procedure huone3pro;

implementation

procedure huone3pro;

begin
  clrscr;
  huone3:=true;
  naytakursori;
  edellinenhuone:='huone3';
  piirrahuone3;
  repeat
    luetila(x,y,n1,n2);
    if n2=1 then
    begin
      huone3:=false;
      katkekursori;
      valikkopro;
    end;
    messagebox;
  until ((huone3=false) or loppu);
  katkekursori;
end;



end.