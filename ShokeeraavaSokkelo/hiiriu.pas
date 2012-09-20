unit hiiriu;

interface

uses dos;

function alustahiiri : integer;
procedure naytakursori;
procedure katkekursori;
procedure luetila (var x,y,nappi1,nappi2 : integer);
procedure valitsexraja;
procedure valitseyraja;
procedure normaalixraja;
procedure normaaliyraja;

implementation

function alustahiiri : integer;

var regs : registers;

begin
  regs.ax:=0;
  intr(51,regs);
  alustahiiri:=regs.ax;
end;



procedure naytakursori;

var regs : registers;

begin
  regs.ax:=1;
  intr(51,regs);
end;



procedure katkekursori;

var regs : registers;

begin
  regs.ax:=2;
  intr(51,regs);
end;



procedure luetila (var x,y,nappi1,nappi2:integer);

var regs : registers;

begin
  regs.ax:=3;
  intr(51,regs);
  x:=regs.cx;
  y:=regs.dx;
  nappi1:=(regs.bx and 1 );
  nappi2:=(regs.bx and 2 ) shr 1;
end;



procedure valitsexraja;

var regs : registers;

begin
  regs.ax:=7;
  regs.cx:=456;
  regs.dx:=584;
  intr(51,regs);
end;



procedure valitseyraja;

var regs : registers;

begin
  regs.ax:=8;
  regs.cx:=16;
  regs.dx:=96;
  intr(51,regs);
end;



procedure normaalixraja;

var regs : registers;

begin
  regs.ax:=7;
  regs.cx:=0;
  regs.dx:=632;
  intr(51,regs);
end;



procedure normaaliyraja;

var regs : registers;

begin
  regs.ax:=8;
  regs.cx:=0;
  regs.dx:=200;
  intr(51,regs);
end;



end.