{ Copyright (c) 1993,1994 Seppo Enarvi }

unit Mouse;

interface

uses Dos;

const
  Free  = 0;
  Press = 1;

function InitMouse : Integer;

procedure ShowCursor;

procedure HideCursor;

procedure ArrowCursor;

procedure ReadState(var X, Y, Button1, Button2 : Integer);

implementation

function InitMouse : Integer;

var Regs : Registers;

begin
  Regs.AX:=0;
  Intr(51, Regs);
  InitMouse:=Regs.AX;
end;

procedure ShowCursor;

var Regs : Registers;

begin
  Regs.AX:=1;
  Intr(51, Regs);
end;

procedure HideCursor;

var Regs : Registers;

begin
  Regs.AX:=2;
  Intr(51, Regs);
end;

procedure ArrowCursor;

var Regs : Registers;

const Cursor : array[1..32] of word =
      ($3FFF, $1FFF, $0FFF, $07FF, $03FF, $01FF, $00FF, $007F,
       $003F, $001F, $01FF, $10FF, $30FF, $F87F, $F87F, $FC3F,

       $0000, $4000, $6000, $7000, $7800, $7C00, $7E00, $7F00,
       $7F80, $7fC0, $7C00, $4600, $0600, $0300, $0300, $0000);

begin
  Regs.AX:=9;
  Regs.BX:=0;
  Regs.CX:=0;
  Regs.DX:=ofs(Cursor);
  Regs.ES:=seg(Cursor);
  Intr(51, Regs);
end;

procedure ReadState(var X, Y, Button1, Button2 : Integer);

var Regs : Registers;

begin
  Regs.AX:=3;
  Intr(51, Regs);
  X:=Regs.CX;
  Y:=Regs.DX;
  Button1:=(Regs.BX and 1);
  Button2:=(Regs.BX and 2) shr 1;
end;

end.