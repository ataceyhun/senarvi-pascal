program Spiral;

uses Dos, Crt;

const
  Points = 90;  Step = 15;  { 17, 15 }

  BallX      = 160;  BallY = 100;
  BallRadius = 100;

  LastSine   = 255;  SineSize = 100;

  VGA256Mode = $13;  VGASegment = $A000;

type
  SineTabType = array[0..LastSine] of Integer;
  PointType = record
    X, Y,
    StartY,
    Radius: Word;
  end;

var
  SineTab: SineTabType;
  PointCount, MoveCount: Byte;
  PointTab: array[0..Points - 1] of PointType;

procedure CreateSineTab(var SineTab: SineTabType);

var Count: Byte;

begin  { CreateSinTab }
  for Count := 0 to LastSine do
    SineTab[Count] := Round(Sin(2 * Pi * Count / LastSine) * SineSize);
end;  { CreateSinTab }

procedure SetMode(Mode: Byte); assembler;

asm  { SetMode }
  MOV   AH,00H
  MOV   AL,Mode
  INT   10H
end;  { SetMode }

procedure PutPixel(X, Y: Word; Color: Byte);

begin  { PutPixel }
  Mem[VGASegment:Y * 320 + X] := Color;
end;  { PutPixel }

function KeyPressed: Boolean;

var Regs: Registers;

begin  { KeyPressed }
  with Regs do
  begin
    AH := $01;
    Intr($16, Regs);
    if Flags and 64 = 64 then
      KeyPressed := False
    else
      KeyPressed := True;
    end;
end;  { KeyPressed }

function ReadKey: Char;

var Result: Word;

begin  { ReadKey }
  asm
    MOV   AH,00H
    INT   16H
    MOV   Result,AX
  end;
  ReadKey := Chr(Result);
end;  { ReadKey }

begin  { Ball }
  CreateSineTab(SineTab);
  for PointCount := 0 to Points - 1 do
  begin
    PointTab[PointCount].X := PointCount * Step;
    PointTab[PointCount].StartY := PointCount;
  end;
  SetMode(VGA256Mode);
  repeat
    for PointCount := 0 to Points - 1 do
    begin
      PointTab[PointCount].X := 1 + PointTab[PointCount].X mod LastSine;
      PointTab[PointCount].Y := (PointTab[PointCount].X + 319) mod LastSine;
      PutPixel(BallX + SineTab[PointTab[PointCount].X],
               PointTab[PointCount].StartY + BallY +
               SineTab[PointTab[PointCount].Y] div 10, 15);
      PutPixel(BallX + SineTab[PointTab[PointCount].X - 1],
               PointTab[PointCount].StartY + BallY +
               SineTab[PointTab[PointCount].Y - 1] div 10, 0);
    end;
    Delay(20);
  until KeyPressed;
  ReadKey;
  SetMode(LastMode);
end.  { Ball }