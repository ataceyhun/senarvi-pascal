{ Copyright (c) 1993-1994 Seppo Enarvi }

unit Hiiri;

interface

uses Dos;

var
  A, B, X, Y, N1, N2 : Integer;

function Alustahiiri : Integer;

procedure Naytakursori;

procedure Katkekursori;

procedure Nuolikursori;

procedure Mieskursori;

procedure LueTila;

implementation

function Alustahiiri : Integer;

var Regs : Registers;

begin
  Regs.ax:=0;
  intr(51, Regs);
  Alustahiiri:=Regs.ax;
end;

procedure Naytakursori;

var Regs : Registers;

begin
  Regs.ax:=1;
  intr(51, Regs);
end;

procedure Katkekursori;

var Regs : Registers;

begin
  Regs.ax:=2;
  intr(51, Regs);
end;

procedure Nuolikursori;

var Regs : Registers;

const cursor : array[1..32] of word =
      ($3FFF, $1FFF, $0FFF, $07FF, $03FF, $01FF, $00FF, $007F,
       $003F, $001F, $01FF, $10FF, $30FF, $F87F, $F87F, $FC3F,

       $0000, $4000, $6000, $7000, $7800, $7C00, $7E00, $7F00,
       $7F80, $7fC0, $7C00, $4600, $0600, $0300, $0300, $0000);

begin
  Regs.ax:=9;
  Regs.bx:=0;
  Regs.cx:=0;
  Regs.dx:=ofs(cursor);
  Regs.es:=seg(cursor);
  intr(51, Regs);
end;

procedure Mieskursori;

var Regs : Registers;

const cursor : array[1..32] of word =
      ($C1FF, $80FF, $80FF, $88FF, $80FF, $80FF, $007F, $007F,
       $007F, $E3FF, $C1FF, $80FF, $007F, $087F, $1C7F, $FFFF,

       $0000, $1C00, $2200, $2200, $2200, $1C00, $0800, $7F00,
       $0800, $0800, $0800, $1400, $2200, $4100, $0000, $0000);

begin
  Regs.ax:=9;
  Regs.bx:=1;
  Regs.cx:=1;
  Regs.dx:=ofs(cursor);
  Regs.es:=seg(cursor);
  intr(51, Regs);
end;

procedure LueTila;

var Regs : Registers;

begin
  Regs.ax:=3;
  intr(51, Regs);
  X:=Regs.cx;
  Y:=Regs.dx;
  N1:=(Regs.bx and 1);
  N2:=(Regs.bx and 2) shr 1;
end;

end.