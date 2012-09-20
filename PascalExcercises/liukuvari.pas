program Liukuvari;

uses Crt;

const
  VGASegment = $A000;

var
  Count,
  Count1,
  MemPosUp,
  MemPosDown,
  Color: Integer;

procedure VideoMode(Mode: Byte); assembler;

asm { VideoMode }
  MOV   AH,00H
  MOV   AL,Mode
  INT   10H
end; { VideoMode }

procedure SetColor(Color, Red, Green, Blue: Byte);

begin { SetColor }
  Port[$3C8] := Color;
  Port[$3C9] := Red;
  Port[$3C9] := Green;
  Port[$3C9] := Blue;
end; { SetColor }

begin { Liukuvari }
  VideoMode($13);
  Color := 1;  { V„ri }
  for Count := 100 downto 0 do  { Kirkkaus }
  begin
    SetColor(Color, Round(Count / 100 * 63), Round(Count / 100 * 63), 0);
    Color := Color + 1;
  end;
  for Count1 := 100 downto 1 do  { Kirkastuu }
  begin
    MemPosUp := 101 * 320;  { Yl”sRivit }
    MemPosDown := 100 * 320;  { AlasRivit }
    for Count := Count1 to 100 do  { V„ri }
    begin
      FillChar(Mem[VGASegment:MemPosUp], 320, Chr(Count));
      FillChar(Mem[VGASegment:MemPosDown], 320, Chr(Count));
      MemPosUp := MemPosUp + 320;
      MemPosDown := MemPosDown - 320;
    end;
  end;  { Kirkastuminen loppuu }
  for Count1 := 1 to 100 do  { Tummenee }
  begin
    MemPosUp := 101 * 320;  { Yl”sRivit }
    MemPosDown := 100 * 320;  { AlasRivit }
    for Count := Count1 to 100 do  { V„ri }
    begin
      FillChar(Mem[VGASegment:MemPosUp], 320, Chr(Count));
      FillChar(Mem[VGASegment:MemPosDown], 320, Chr(Count));
      MemPosUp := MemPosUp + 320;
      MemPosDown := MemPosDown - 320;
    end;
  end;
end. { Liukuvari }