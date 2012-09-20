unit Graph;

interface

const
  VGA256Mode = $13;

procedure SetMode(Mode: Integer);
procedure PutPixel(X, Y, Color: Word);

implementation

procedure SetMode(Mode: Integer); assembler;

asm  { SetMode }
  MOV  AX,Mode
  INT  10h
end;  { SetMode }

procedure PutPixel(X, Y, Color: Word);

const
  VGASeg: Word = $A000;

begin  { PutPixel }
  Mem[VGASeg:Y * 320 + X] := Color;
end;  { PutPixel }

end.