unit kartta1u;

interface

uses kuvatun;

procedure kartta1pro;

implementation

procedure kartta1pro;

begin
  clrscr;
  piirrakartta1;
  naytakursori;
  kartta1:=true;
  edellinenhuone:='kartta1';
  delay(200);
  repeat
    luetila(x,y,n1,n2);
    if ((x>=56) and (x<=112) and (y>=24) and (y<=56) and (n1=1)) then
    begin
      huone1pro;
      kartta1:=false;
    end;
    if ((y>=136) and (y<=152) and (x>=264) and (x<=336) and (n1=1)) then
    begin
      huone2pro;
      kartta1:=false;
    end;
    if ((y>=32) and (y<=56) and (x>=464) and (x<=544) and (n1=1)) then
    begin
      huone3pro;
      kartta1:=false;
    end;
    if ((x<=128) and (x>=56) and (y>=136) and (y<=160) and (n1=1)) then
    begin
      huone4pro;
      kartta1:=false;
    end;
    if ((x>=480) and (x<552) and (y>=80) and (y<=96) and (n1=1)) then
    begin
      huone5pro;
      kartta1:=false;
    end;
    if ((x<=104) and (x>=96) and (y=112) and (n1=1)) then
    begin
      huone6pro;
      kartta1:=false;
    end;
    if n2=1 then
    begin
      kartta1:=false;
      katkekursori;
      valikkopro;
    end;
    messagebox;
  until ((kartta1=false) or loppu);
  katkekursori;
end;



end.