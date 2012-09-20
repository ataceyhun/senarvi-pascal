unit Mouse;

interface

uses Dos;

const
  Up = 0;  Down = 1;

  MouseError = 0;

function InitMouse: Integer;
procedure ShowCursor;
procedure HideCursor;
procedure ArrowCursor;
procedure ReadState(var X, Y, Button1, Button2: Integer);

implementation

function InitMouse: Integer;

var Regs: Registers;

begin  { InitMouse }
  Regs.AX := 0;
  Intr(51, Regs);
  InitMouse := Regs.AX;
end;  { InitMouse }

procedure ShowCursor;

var Regs: Registers;

begin  { ShowCursor }
  Regs.AX := 1;
  Intr(51, Regs);
end;  { ShowCursor }

procedure HideCursor;

var Regs: Registers;

begin  { HideCursor }
  Regs.AX := 2;
  Intr(51, Regs);
end;  { HideCursor }

procedure ArrowCursor;

var Regs: Registers;

const Cursor: array[1..32] of Word =
              ($3FFF, $1FFF, $0FFF, $07FF, $03FF, $01FF, $00FF, $007F,
               $003F, $001F, $01FF, $10FF, $30FF, $F87F, $F87F, $FC3F,

               $0000, $4000, $6000, $7000, $7800, $7C00, $7E00, $7F00,
               $7F80, $7FC0, $7C00, $4600, $0600, $0300, $0300, $0000);

begin  { ArrowCursor }
  with Regs do
  begin
    AX := 9;
    BX := 0;
    CX := 0;
    DX := Ofs(Cursor);
    ES := Seg(Cursor);
  end;
  Intr(51, Regs);
end;  { ArrowCursor }

procedure ReadState(var X, Y, Button1, Button2: Integer);

var Regs: Registers;

begin  { ReadState }
  with Regs do
  begin
    AX := 3;
    Intr(51, Regs);
    X := CX;
    Y := DX;
    Button1 := (BX and 1);
    Button2 := (BX and 2) shr 1;
  end;
end;  { ReadState }

end.