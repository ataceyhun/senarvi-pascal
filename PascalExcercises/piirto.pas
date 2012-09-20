{ Jonkin esimerkin pohjalta tehty hiirell„ piirtely }
program piirto;

uses graph, dos, crt;

var a,b,x,y,n1,n2,i1,i2,s:integer;
    endflag : boolean;

function alustahiiri : integer;

var regs : Registers;

begin
  regs.ax:=0;
  intr(51,regs);
  alustahiiri:=regs.ax;
end;

procedure naytakursori;

var regs : Registers;

begin
  regs.ax:=1;
  intr(51,regs);
end;

procedure katkekursori;

var regs : Registers;

begin
  regs.ax:=2;
  intr(51,regs);
end;

procedure luetila(var x,y,nappi1,nappi2 : integer);

var regs : Registers;

begin
  regs.ax:=3;
  intr(51,regs);
  x:=regs.cx;
  y:=regs.dx;
  nappi1:=(regs.bx and 1);
  nappi2:=(regs.bx and 2) shr 1;
end;

begin
  a:=DETECT;
  initgraph(a,b,'d:\tp\bgi');
  if alustahiiri=0 then
  begin
    closegraph;
    writeln('Mouse not installed');
    halt(1);
  end;
  naytakursori;
  repeat
    luetila(x,y,n1,n2);
    if n1=1 then
    begin
      katkekursori;
      putpixel(x,y,15);
      naytakursori;
    end;
    if n2=1 then
    begin
      katkekursori;
      for i1 := 1 to 5 do
      for i2 := 1 to 5 do
      begin
        putpixel(x-i1,y-i2,0);
        putpixel(x+i1,y+i2,0);
      end;
      naytakursori;
    end;
  until keypressed;
  katkekursori;
  closegraph;
end.
