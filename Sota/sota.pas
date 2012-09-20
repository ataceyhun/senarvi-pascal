{               Sotapeli               }
{ Copyright (c) 1993-1994 Seppo Enarvi }

program Sota;

uses Graph, Crt, Mies, Hiiri;

const Pienuus = 300;
      MaxMiehet = 5;

var GraphDriver, GraphMode : integer;
    ErrorCode              : integer;
    MiesX, MiesY           : integer;
    PMiehet, VMiehet       : integer;
    Vihrea, Punainen       : boolean;
    I                      : integer;
    Napit                  : array [0..11, 1..4] of integer;
    Maasto                 : array [0..800] of integer;
    PMiehetX, VMiehetX     : array [1..MaxMiehet] of integer;
    PMiehetY, VMiehetY     : array [1..MaxMiehet] of integer;
    LoppuLippu             : boolean;
    Ch                     : char;

procedure Alustus;

begin { Alustus }
  GraphDriver := detect;
  InitGraph(GraphDriver, GraphMode, '');
  ErrorCode := GraphResult;
  if ErrorCode <> 0 then
  begin
    Writeln('Graphics error: ',GraphErrorMsg(ErrorCode));
    Writeln('Program aborted...');
    readkey;
    Halt(1);
  end;
  if Alustahiiri=0 then
  begin
    CloseGraph;
    Writeln('Mouse not installed');
    Writeln('Program aborted...');
    readkey;
    Halt(1);
  end;
  Randomize;
  PMiehet := 0;
  VMiehet := 0;
end; { Alustus }

procedure Alkudemo;

var II : integer;

begin { Alkudemo }
  SetBkColor(4);
  SetTextStyle(DefaultFont,HorizDir,2);
  II := -200;
  for I := 620 downto 200 do
  begin
    SetColor(0);
    OutTextXY(100, I + 1, 'Seppo');
    OutTextXY(I + 1, 200, 'Enarvi');
    OutTextXY(100, II - 1, 'presents:');
    OutTextXY(II - 1 + 35, 220, 'Sota');
    SetColor(15);
    OutTextXY(100, I, 'Seppo');
    OutTextXY(I, 200, 'Enarvi');
    OutTextXY(100, II, 'presents:');
    OutTextXY(II + 35, 220, 'Sota');
    II := II + 1;
  end;
end; { Alkudemo }

procedure PiirraMies(X, Y, Vari : integer);

begin { PiirraMies }
  for MiesY := 0 to 12 do
    for MiesX := 1 to 7 do
      if MiesTab[MiesY*7+MiesX] <> 0 then
        PutPixel(MiesX+X-1, MiesY+Y, Vari);
end; { PiirraMies }

procedure NostaYlos(I : Integer);

begin { NostaYlos }
  SetColor(15);
  Line(Napit[I, 1], Napit[I, 2], Napit[I, 3], Napit[I, 2]);
  Line(Napit[I, 1], Napit[I, 2], Napit[I, 1], Napit[I, 4]);
  SetColor(8);
  Line(Napit[I, 3], Napit[I, 2], Napit[I, 3], Napit[I, 4]);
  Line(Napit[I, 1], Napit[I, 4], Napit[I, 3], Napit[I, 4]);
end; { NostaYlos }

procedure PiirraTausta;

procedure PiirraMaasto(AlkuY, Vari : integer);

var MaastoX : integer;

procedure ArvoMaasto(AlkuY : integer);

begin { ArvoMaasto }
  for I := 1 to GetMaxX do
    Maasto[I] := random(3) - 1;
  Maasto[0] := AlkuY;
  for I := 1 to GetMaxX do
  begin
    Maasto[I] := Maasto[I - 1] + Maasto[I];
    if Maasto[I] < 20 then
      Maasto[I] := 20;
    if Maasto[I] > GetMaxY - 55 then
      Maasto[I] := GetMaxY - 55;
  end;
end; { ArvoMaasto }

begin { PiirraMaasto}
  ArvoMaasto(AlkuY);
  SetColor(Vari);
  for MaastoX := 0 to GetMaxX do
    PutPixel(MaastoX, Maasto[MaastoX], Vari);
end; { PiirraMaasto }

procedure PiirraValikot;

begin { PiirraValikot }
  SetColor(8);
  Line(0, GetMaxY-54, GetMaxX, GetMaxY-54);
  SetColor(15);
  Line(0, GetMaxY-53, GetMaxX, GetMaxY-53);
  for I := 0 to 4 do
  begin
    Napit[I, 1] := I*52+9;
    Napit[I, 2] := GetMaxY-51;
    Napit[I, 3] := I*52+9+50;
    Napit[I, 4] := GetMaxY-1;
    SetColor(4);
    Rectangle(Napit[I, 1]+1, Napit[I, 2]+1, Napit[I, 3]-1, Napit[I, 4]-1);
    NostaYlos(I);
  end;
  for I := 7 to 11 do
  begin
    Napit[I, 1] := I*52+9;
    Napit[I, 2] := GetMaxY-51;
    Napit[I, 3] := I*52+9+50;
    Napit[I, 4] := GetMaxY-1;
    SetColor(10);
    Rectangle(Napit[I, 1]+1, Napit[I, 2]+1, Napit[I, 3]-1, Napit[I, 4]-1);
    NostaYlos(I);
  end;
end; { PiirraValikot }

begin { PiirraTausta }
  SetBkColor(7);
  ClearDevice;
  PiirraValikot;
  PiirraMaasto(Random(10) + Pienuus, 2);
end; { PiirraTausta }

function Sisalla(Laatikko : integer) : boolean;

begin { Sisalla }
  Sisalla := False;
  if (X >= Napit[Laatikko, 1]) and
  (X <= Napit[Laatikko, 3]) and
     (Y >= Napit[Laatikko, 2]) and
      (Y <= Napit[Laatikko, 4]) then
    Sisalla := True;
end; { Sisalla }

procedure Peli;

procedure TarkistaNapit;

procedure PainaAlas(I : Integer);

begin { PainaAlas }
  SetColor(8);
  Line(Napit[I, 1], Napit[I, 2], Napit[I, 3], Napit[I, 2]);
  Line(Napit[I, 1], Napit[I, 2], Napit[I, 1], Napit[I, 4]);
  SetColor(15);
  Line(Napit[I, 3], Napit[I, 2], Napit[I, 3], Napit[I, 4]);
  Line(Napit[I, 1], Napit[I, 4], Napit[I, 3], Napit[I, 4]);
end; { PainaAlas }

begin { TarkistaNapit }
  if (N1=1) and Sisalla(0) then            { Nappi 1 }
  begin
    Vihrea := False;
    Punainen := True;
    Katkekursori;
    PainaAlas(0);
    Naytakursori;
    Repeat
      LueTila;
    Until (N1=0) or (not Sisalla(0));
    Katkekursori;
    NostaYlos(0);
    Naytakursori;
  end;
  if (N1=1) and Sisalla(1) then            { Nappi 2 }
  begin
    Vihrea := False;
    Punainen := True;
    Katkekursori;
    PainaAlas(1);
    Naytakursori;
    Repeat
      LueTila;
    Until (N1=0) or (not Sisalla(1));
    Katkekursori;
    NostaYlos(1);
    Naytakursori;
  end;
  if (N1=1) and Sisalla(2) then            { Nappi 3 }
  begin
    Vihrea := False;
    Punainen := True;
    Katkekursori;
    PainaAlas(2);
    Naytakursori;
    Repeat
    LueTila;
    Until (N1=0) or (not Sisalla(2));
    Katkekursori;
    NostaYlos(2);
    Naytakursori;
  end;
  if (N1=1) and Sisalla(3) then            { Nappi 4 }
  begin
    Vihrea := False;
    Punainen := True;
    Katkekursori;
    PainaAlas(3);
    Naytakursori;
    Repeat
      LueTila;
    Until (N1=0) or (not Sisalla(3));
    Katkekursori;
    NostaYlos(3);
    Naytakursori;
  end;
  if (N1=1) and Sisalla(4) then            { Nappi 5 }
  begin
    Vihrea := False;
    Punainen := True;
    Katkekursori;
    PainaAlas(4);
    Naytakursori;
    Repeat
      LueTila;
    Until (N1=0) or (not Sisalla(4));
    Katkekursori;
    NostaYlos(4);
    Naytakursori;
  end;
  if (N1=1) and Sisalla(7) then            { Nappi 6 }
  begin
    Punainen := False;
    Vihrea := True;
    Katkekursori;
    PainaAlas(7);
    Naytakursori;
    Repeat
      LueTila;
    Until (N1=0) or (not Sisalla(7));
    Katkekursori;
    NostaYlos(7);
    Naytakursori;
  end;
  if (N1=1) and Sisalla(8) then            { Nappi 7 }
  begin
    Punainen := False;
    Vihrea := True;
    Katkekursori;
    PainaAlas(8);
    Naytakursori;
    Repeat
      LueTila;
    Until (N1=0) or (not Sisalla(8));
    Katkekursori;
    NostaYlos(8);
    Naytakursori;
  end;
  if (N1=1) and Sisalla(9) then            { Nappi 8 }
  begin
    Punainen := False;
    Vihrea := True;
    Katkekursori;
    PainaAlas(9);
    Naytakursori;
    Repeat
      LueTila;
    Until (N1=0) or (not Sisalla(9));
    Katkekursori;
    NostaYlos(9);
    Naytakursori;
  end;
  if (N1=1) and Sisalla(10) then           { Nappi 9 }
  begin
    Punainen := False;
    Vihrea := True;
    Katkekursori;
    PainaAlas(10);
    Naytakursori;
    Repeat
      LueTila;
    Until (N1=0) or (not Sisalla(10));
    Katkekursori;
    NostaYlos(10);
    Naytakursori;
  end;
  if (N1=1) and Sisalla(11) then           { Nappi 10 }
  begin
    Punainen := False;
    Vihrea := True;
    Katkekursori;
    PainaAlas(11);
    Naytakursori;
    Repeat
      LueTila;
    Until (N1=0) or (not Sisalla(11));
    Katkekursori;
    NostaYlos(11);
    Naytakursori;
  end;
end; { TarkistaNapit }

begin { Peli }
  LoppuLippu := False;
  Mieskursori;
  Naytakursori;
  repeat
    LueTila;
    if Y >= GetMaxY - 66 then
      Nuolikursori;
    if Y < GetMaxY - 66 then
      Mieskursori;
    TarkistaNapit;
    if (N1 = 1) and Punainen and (Y < GetMaxY-66) and
       (Y < Maasto[X] - 3) and (Y > Maasto[X] - 23) then
    begin { Laitetaan punainen mies }
      PMiehet := PMiehet + 1;
      PMiehetX[PMiehet] := X;
      PMiehetY[PMiehet] := Maasto[X] - 13;
      Katkekursori;
      PiirraMies(X, Maasto[X] - 13, 4);
      Naytakursori;
    end; { Laitetaan punainen mies }
    if (N1 = 1) and Vihrea and (Y < GetMaxY-66) and
       (Y < Maasto[X] - 3) and (Y > Maasto[X] - 23) then
    begin { Laitetaan vihre„ mies }
      VMiehet := VMiehet + 1;
      VMiehetX[VMiehet] := X;
      VMiehetY[VMiehet] := Maasto[X] - 13;
      Katkekursori;
      PiirraMies(X, Maasto[X] - 13, 10);
      NaytaKursori;
    end; { Laitetaan vihre„ mies }
    if KeyPressed then LoppuLippu := True;
  until LoppuLippu;
end; { Peli }

begin { P„„ohjelma }
  Alustus;
  Katkekursori;
  { Alkudemo; }
  Naytakursori;
  PiirraTausta;
  Peli;
  Katkekursori;
  RestoreCrtMode;
  WriteLn('Thanx for playing...');
end. { P„„ohjelma }