program Stars;

uses Crt;

const
  StarAmount = 300;
  StarDelay  = 1;
  VGASegment = $A000;
  VGA320x200 = $13;
  TextMode   = $3;

type
  StarType = record
    X, Y, Z,
    Delay: Integer;
  end;

var
  Star: array[1..StarAmount] of StarType;
  StarCount,
  DelayCount: Integer;
  Ch: Char;

procedure VideoMode(Mode: Byte); assembler;

asm
  MOV   AH,00h
  MOV   AL,Mode
  INT   10h
end;

procedure PutPixel(X, Y, Color: Integer);

begin
  Mem[VGASegment:Y * 320 + X] := Color;
end;

procedure InitializeStars;

begin
  for StarCount := 1 to StarAmount do
    with Star[StarCount] do
    begin
      X := Random(320);
      Y := Random(200);
      Z := Random(14) + 1;
      Delay := 15 - Z + StarDelay;
    end;
end;

procedure UpdateStars;

begin
  for StarCount := 1 to StarAmount do
    with Star[StarCount] do
    begin
      Delay := Delay - 1;
      if Delay = 0 then
      begin
        PutPixel(X, Y, 16);
        if X = 0 then
        begin
          X := 320;
          Y := Random(200);
          Z := Random(14) + 1;
        end
        else
          X := X - 1;
        Delay := 15 - Z + StarDelay;
      end;
      PutPixel(X, Y, 16 + Z);
    end;
end;

begin
  VideoMode(VGA320x200);
  CheckBreak := False;
  Randomize;
  InitializeStars;
  repeat
    UpdateStars;
    if KeyPressed then
      Ch := ReadKey;
  until Ch = #27;
  VideoMode(TextMode);
end.