{ Copyright (c) 1993,1994,1998 Seppo Enarvi }

program ChineseCheckers;

uses Crt, Graph, Mouse;

const
  LastCol  = 17; LastRow  = 25;
  ColSpace = 25; RowSpace = 15;
  Margin   = 35; Radius    = 10;

  LineY = Margin + LastCol * ColSpace + Margin;

  ButtonMargin = 10;
  ButtonX      = Margin + LastCol * ColSpace + Margin + ButtonMargin;
  ButtonX2     = ButtonX + 50;
  ButtonX3     = ButtonX2 + ButtonMargin;
  ButtonX4     = ButtonX3 + 50;

  RaiseHeight = 20;
  TurnRaise   = 1; MovesRaise = 2;
  LastRaise   = MovesRaise;

  NextButton = 1; ExitButton = 2;
  SaveButton = 3; LoadButton = 4;
  LastButton = LoadButton;

  Up = True; Down = False;
  On = True; Off  = False;

  Released = 1; MovedAway = 2;

  GreenPlayer  = 1; RedPlayer   = 2;
  YellowPlayer = 3; BluePlayer  = 4;
  BrownPlayer  = 5; WhitePlayer = 6;
  NoPlayer     = 7; MaxPlayers  = 6;

  SaveFileName = 'SAVEGAME.DAT';

  StartPoint: array[1..LastCol] of Integer = (13, 12, 11, 10,
                                              1,  2,  3,  4,  5,
                                              4,  3,  2,  1,
                                              10, 11, 12, 13);
  EndPoint: array[1..LastCol] of Integer   = (13, 14, 15, 16,
                                              25, 24, 23, 22, 21,
                                              22, 23, 24, 25,
                                              16, 15, 14, 13);

  Colors: array[1..MaxPlayers] of Integer      = (LightGreen, LightRed,
                                                  Yellow,     LightMagenta,
                                                  LightCyan,  White);
  ColorStrings: array[1..MaxPlayers] of String = ('Green',  'Red',
                                                  'Yellow', 'Magenta',
                                                  'Cyan',   'White');

  Places: array[1..MaxPlayers, 1..MaxPlayers] of Integer =
          ((1, 0, 0, 0, 0, 0),
           (1, 4, 0, 0, 0, 0),
           (1, 3, 5, 0, 0, 0),
           (1, 2, 4, 5, 0, 0),
           (1, 2, 3, 4, 5, 0),
           (1, 2, 3, 4, 5, 6));

type
  PiecesType = array[1..LastCol, 1..LastRow] of Integer;
  SaveGameType = record
    Pieces: PiecesType;
    LastPlayer: Integer;
    Moves: array[1..MaxPlayers] of Integer;
  end;

var
  PlayerCount, Players,
  Col, Row,
  Player, LastPlayer,
  Count: Integer;

  New: Char;

  MessageString: String;

  Exit, Abort: Boolean;

  Pieces: PiecesType;
  Holes: array[1..LastCol, 1..LastRow] of Boolean;

  Moves: array[1..MaxPlayers] of Integer;

  SaveFile: file of SaveGameType;
  SaveData: SaveGameType;

procedure StartScreen;

begin { StartScreen }
  ClrScr;
  GotoXY(33, 10);
  Writeln('Chinese Checkers');
  GotoXY(20, 25);
  Write('Copyright (c) 1993,1994,1998 Seppo Enarvi');
  TextColor(Black);  { Hide cursor }
  Write(' ');
  GotoXY(61, 25);
  ReadKey;
  NormVideo;
end; { StartScreen }

procedure Initialize;

var GraphDriver, GraphMode, ErrorCode: Integer;

begin { Initialize }
  GraphDriver := VGA; GraphMode := VGAHi;
  InitGraph(GraphDriver, GraphMode, '');
  ErrorCode := GraphResult;
  if ErrorCode <> grOk then
    begin
      Writeln('Graphics error: ', GraphErrorMsg(ErrorCode));
      Writeln('(You probably don''t have a VGA graphics card!)');
      Writeln('Program aborted...');
      Halt(1);
    end;

  if InitMouse = 0 then
  begin
    CloseGraph;
    Writeln('Mouse not installed');
    Halt(1);
  end;
  ShowCursor;

  SetBkColor(LightBlue);
  for Col := 1 to LastCol do
    for Row := 1 to LastRow do
      Pieces[Col, Row] := NoPlayer;
  Exit := False;
  Abort := False;
end; { Initialize }

procedure ButtonXY(Button: Integer; var X, Y, X2, Y2: Integer);

begin { ButtonXY }
  if Button mod 2 <> 0 then
  begin
    X := ButtonX;
    X2 := ButtonX2;
  end
  else
  begin
    X := ButtonX3;
    X2 := ButtonX4;
  end;

  Y := LastRaise * 30 + ((Button - 1) div 2 * 50 +
                         (Button - 1) div 2 * 10);
  Y2 := Y + 50;
end; { ButtonXY }

function RaiseY(Raise: Integer): Integer;

begin { RaiseY }
  RaiseY := Raise * (RaiseHeight + 5) - RaiseHeight;
end; { RaiseY }

procedure Raise(X, Y, X2, Y2: Integer);

var LineCount: Integer;

begin { Raise }
  for LineCount := 0 to 1 do
  begin
    SetColor(White);
    Line(X + LineCount, Y + LineCount, X2 - LineCount, Y + LineCount);
    Line(X + LineCount, Y, X + LineCount, Y2 - LineCount);
    SetColor(DarkGray);
    Line(X2 - LineCount, Y + LineCount, X2 - LineCount, Y2);
    Line(X + LineCount, Y2 - LineCount, X2, Y2 - LineCount);
  end;
end; { Raise }

procedure MarkPlaces;

var Col, Row: Integer;

begin { MarkPlaces }
  for Col := 1 to LastCol do
    for Row := StartPoint[Col] to EndPoint[Col] do
      if (Row - StartPoint[Col]) mod 2 = 0 then
        Holes[Col, Row] := True;
end; { MarkPlaces }

procedure DrawPiece(Col, Row: Integer; Player: Integer);

var X, Y: Integer;

begin { DrawPiece }
  HideCursor;
  X := Col * ColSpace + Margin;
  Y := Row * RowSpace + Margin;
  SetColor(Colors[Player]);
  SetFillStyle(SolidFill, Colors[Player]);
  FillEllipse(X, Y, Radius - 1, Radius - 1);
  SetColor(White);
  Arc(X, Y, 110, 160, Radius - 2);
  Pieces[Col, Row] := Player;
  ShowCursor;
end; { DrawPiece }

procedure ClosePiece(Col, Row: Integer);

var X, Y: Integer;

begin { ClosePiece }
  HideCursor;
  X := Col * ColSpace + Margin;
  Y := Row * RowSpace + Margin;
  SetColor(Blue);
  SetFillStyle(SolidFill, Blue);
  FillEllipse(X, Y, Radius - 1, Radius - 1);
  Pieces[Col, Row] := NoPlayer;
  ShowCursor;
end; { ClosePiece }

procedure DrawButton(Button : Integer; Up : Boolean);

var X, Y, X2, Y2 : Integer;

begin { DrawButton }
  ButtonXY(Button, X, Y, X2, Y2);

  if Up then
    SetColor(White)
  else
    SetColor(DarkGray);
  Line(X, Y, X2, Y);
  Line(X, Y, X, Y2);

  if Up then
    SetColor(DarkGray)
  else
    SetColor(White);
  Line(X, Y2, X2, Y2);
  Line(X2, Y, X2, Y2);
end; { DrawButton }

procedure DrawBackGround;

var
  XLenght, YLenght,
  Count: Word;

procedure DrawPieces(Player: Integer; Place: Integer);

begin { DrawPieces }
  case Place of
    1:
    begin
      DrawPiece(5, 1, Player);
      DrawPiece(6, 2, Player);
      DrawPiece(5, 3, Player);
      DrawPiece(7, 3, Player);
      DrawPiece(6, 4, Player);
      DrawPiece(8, 4, Player);
      DrawPiece(5, 5, Player);
      DrawPiece(7, 5, Player);
      DrawPiece(6, 6, Player);
      DrawPiece(5, 7, Player);
    end;

    2:
    begin
      DrawPiece(13, 1, Player);
      DrawPiece(12, 2, Player);
      DrawPiece(11, 3, Player);
      DrawPiece(13, 3, Player);
      DrawPiece(10, 4, Player);
      DrawPiece(12, 4, Player);
      DrawPiece(11, 5, Player);
      DrawPiece(13, 5, Player);
      DrawPiece(12, 6, Player);
      DrawPiece(13, 7, Player);
    end;

    3:
    begin
      DrawPiece(14, 10, Player);
      DrawPiece(15, 11, Player);
      DrawPiece(14, 12, Player);
      DrawPiece(16, 12, Player);
      DrawPiece(15, 13, Player);
      DrawPiece(17, 13, Player);
      DrawPiece(14, 14, Player);
      DrawPiece(16, 14, Player);
      DrawPiece(15, 15, Player);
      DrawPiece(14, 16, Player);
    end;

    4:
    begin
      DrawPiece(13, 19, Player);
      DrawPiece(12, 20, Player);
      DrawPiece(11, 21, Player);
      DrawPiece(13, 21, Player);
      DrawPiece(10, 22, Player);
      DrawPiece(12, 22, Player);
      DrawPiece(11, 23, Player);
      DrawPiece(13, 23, Player);
      DrawPiece(12, 24, Player);
      DrawPiece(13, 25, Player);
    end;

    5:
    begin
      DrawPiece(5, 19, Player);
      DrawPiece(6, 20, Player);
      DrawPiece(5, 21, Player);
      DrawPiece(7, 21, Player);
      DrawPiece(6, 22, Player);
      DrawPiece(8, 22, Player);
      DrawPiece(5, 23, Player);
      DrawPiece(7, 23, Player);
      DrawPiece(6, 24, Player);
      DrawPiece(5, 25, Player);
    end;

    6:
    begin
      DrawPiece(4, 10, Player);
      DrawPiece(3, 11, Player);
      DrawPiece(2, 12, Player);
      DrawPiece(4, 12, Player);
      DrawPiece(1, 13, Player);
      DrawPiece(3, 13, Player);
      DrawPiece(2, 14, Player);
      DrawPiece(4, 14, Player);
      DrawPiece(3, 15, Player);
      DrawPiece(4, 16, Player);
    end;
  end;
end; { DrawPieces }

procedure ButtonCentre(Button: Integer);

var
  X, Y, X2, Y2: Integer;

begin { ButtonCentre }
  ButtonXY(Button, X, Y, X2, Y2);
  MoveTo((X2 - X) div 2 + X,
         (Y2 - Y) div 2 + Y);
end; { ButtonCentre }

begin; { DrawBackGround }
  HideCursor;

  SetColor(DarkGray);
  Line(LineY, 0, LineY,  GetMaxY);
  SetColor(White);
  Line(LineY + 1, 0, LineY + 1, GetMaxY);

  for Count := 1 to LastButton do
    DrawButton(Count, Up);

  ButtonCentre(NextButton);
  SetColor(Red);
  Circle(GetX, GetY, 20);
  XLenght := 13;
  YLenght := XLenght;
  Line(GetX - XLenght, GetY - YLenght, GetX + XLenght, GetY + YLenght);

  ButtonCentre(SaveButton);
  XLenght := TextWidth('SAVE') div 2;
  Ylenght := TextHeight('SAVE') div 2;
  SetColor(Yellow);
  OutTextXY(GetX - XLenght, GetY - YLenght, 'SAVE');

  ButtonCentre(LoadButton);
  Xlenght := TextWidth('LOAD') div 2;
  YLenght := TextHeight('LOAD') div 2;
  SetColor(Yellow);
  OutTextXY(GetX - XLenght, GetY - YLenght, 'LOAD');

  ButtonCentre(ExitButton);
  SetColor(Green);
  XLenght := 20;
  YLenght := 10;
  Rectangle(GetX - XLenght, GetY - YLenght, GetX + XLenght, GetY + YLenght);
  XLenght := XLenght - 5;
  YLenght := YLenght - 5;
  OutTextXY(GetX - XLenght, GetY - YLenght, 'EXIT');

  for Col := 1 to LastCol do
    for Row := 1 to LastRow do
      if Holes[Col, Row] then
        ClosePiece(Col, Row);

  for Count := 1 to Players do
    DrawPieces(Count, Places[Players, Count]);

  for Count := 1 to LastRaise do
    Raise(ButtonX, RaiseY(Count),
          ButtonX4, RaiseY(Count) + RaiseHeight);

  ShowCursor;
end; { DrawBackGround }

procedure DrawHole(Col, Row : Integer; Up: Boolean);

begin { DrawHole }
  HideCursor;

  if Up then
    SetColor(White)
  else
    SetColor(DarkGray);
  Arc(Col * ColSpace + Margin, Row * RowSpace + Margin, 45, 225, Radius);

  if Up then
    SetColor(DarkGray)
  else
    SetColor(White);
  Arc(Col * ColSpace + Margin, Row * RowSpace + Margin, 225, 45, Radius);

  ShowCursor;
end; { DrawHole }

procedure DrawHoles;

var Col, Row: Integer;

begin { DrawHoles }
  for Col := 1 to LastCol do
    for Row := 1 to LastRow do
      if Holes[Col, Row] = True then
        DrawHole(Col, Row, Down);
end; { DrawHoles }

function Winner: Integer;

var
  Count,
  WinPlace: Integer;

function PiecesOnPlace(Player: Integer; Place: Integer): Boolean;

begin { PiecesOnPlace }
  PiecesOnPlace := False;
  if (Place = 1) and
     (Pieces[5, 1] = Player) and
     (Pieces[6, 2] = Player) and
     (Pieces[5, 3] = Player) and
     (Pieces[7, 3] = Player) and
     (Pieces[6, 4] = Player) and
     (Pieces[8, 4] = Player) and
     (Pieces[5, 5] = Player) and
     (Pieces[7, 5] = Player) and
     (Pieces[6, 6] = Player) and
     (Pieces[5, 7] = Player) then
    PiecesOnPlace := True;

  if (Place = 2) and
     (Pieces[13, 1] = Player) and
     (Pieces[12, 2] = Player) and
     (Pieces[11, 3] = Player) and
     (Pieces[13, 3] = Player) and
     (Pieces[10, 4] = Player) and
     (Pieces[12, 4] = Player) and
     (Pieces[11, 5] = Player) and
     (Pieces[13, 5] = Player) and
     (Pieces[12, 6] = Player) and
     (Pieces[13, 7] = Player) then
    PiecesOnPlace := True;

  if (Place = 3) and
     (Pieces[14, 10] = Player) and
     (Pieces[15, 11] = Player) and
     (Pieces[14, 12] = Player) and
     (Pieces[16, 12] = Player) and
     (Pieces[15, 13] = Player) and
     (Pieces[17, 13] = Player) and
     (Pieces[14, 14] = Player) and
     (Pieces[16, 14] = Player) and
     (Pieces[15, 15] = Player) and
     (Pieces[14, 16] = Player) then
    PiecesOnPlace := True;

  if (Place = 4) and
     (Pieces[13, 19] = Player) and
     (Pieces[12, 20] = Player) and
     (Pieces[11, 21] = Player) and
     (Pieces[13, 21] = Player) and
     (Pieces[10, 22] = Player) and
     (Pieces[12, 22] = Player) and
     (Pieces[11, 23] = Player) and
     (Pieces[13, 23] = Player) and
     (Pieces[12, 24] = Player) and
     (Pieces[13, 25] = Player) then
    PiecesOnPlace := True;

  if (Place = 5) and
     (Pieces[5, 19] = Player) and
     (Pieces[6, 20] = Player) and
     (Pieces[5, 21] = Player) and
     (Pieces[7, 21] = Player) and
     (Pieces[6, 22] = Player) and
     (Pieces[8, 22] = Player) and
     (Pieces[5, 23] = Player) and
     (Pieces[7, 23] = Player) and
     (Pieces[6, 24] = Player) and
     (Pieces[5, 25] = Player) then
    PiecesOnPlace := True;

  if (Place = 6) and
     (Pieces[4, 10] = Player) and
     (Pieces[3, 11] = Player) and
     (Pieces[2, 12] = Player) and
     (Pieces[4, 12] = Player) and
     (Pieces[1, 13] = Player) and
     (Pieces[3, 13] = Player) and
     (Pieces[2, 14] = Player) and
     (Pieces[4, 14] = Player) and
     (Pieces[3, 15] = Player) and
     (Pieces[4, 16] = Player) then
    PiecesOnPlace := True;
end; { PiecesOnPlace }

begin { Winner }
  Winner := NoPlayer;
  for Count := 1 to Players do
  begin
    WinPlace := Places[Players, Count] + 3;
    if WinPlace > 6 then
      WinPlace := WinPlace - 6;
    if PiecesOnPlace(Count, WinPlace) then
      Winner := Count;
  end;
end; { Winner }

procedure Game;

var
  X, Y,
  Button1, Button2,
  Col, Row,
  CheckCol, CheckRow,
  OriginalCol, OriginalRow,
  MarkedPieces: Integer;

  Check: Char;

  NextTurn,
  NoJumpMove, MovedNow,
  Changed: Boolean;

  Choosed: array [1..LastCol, 1..LastRow] of Boolean;
  PlayersPiece: array [1..10, 1..2] of Integer;

function Moved: Boolean;

var PieceCount: Integer;

begin { Moved }
  Moved := False;
  for PieceCount := 1 to 10 do
    if Pieces[PlayersPiece[PieceCount, 1],
             PlayersPiece[PieceCount, 2]] <> Player then
      Moved := True;
end; { Moved }

function OnButton(Button : Integer) : Boolean;

var
  ButtonX, ButtonY, ButtonX2, ButtonY2: Integer;

begin { OnButton }
  OnButton := False;
  ButtonXY(Button, ButtonX, ButtonY, ButtonX2, ButtonY2);
  if (X > ButtonX) and (X < ButtonX2) and
     (Y > ButtonY) and (Y < ButtonY2) then
    OnButton := True;
end; { OnButton }

function OnHole(HoleX, HoleY : Integer) : Boolean;

begin { OnHole }
  OnHole := False;
  if (X > Margin + HoleX * ColSpace - Radius) and
     (X < Margin + HoleX * ColSpace + Radius) and
     (Y > Margin + HoleY * RowSpace - Radius) and
     (Y < Margin + HoleY * RowSpace + Radius) and
     ((HoleY - StartPoint[HoleX]) mod 2 = 0) then
    OnHole := True;
end; { OnHole }

procedure MessageBox(Message: String; On: Boolean);

begin { MessageBox }
  if On then
    SetColor(LightRed)
  else
    SetColor(Black);
  Rectangle(10, 10, TextWidth(Message) + 20, TextHeight(Message) + 20);
  OutTextXY(15, 15, 'Are you sure (Y / N) ?');
end; { MessageBox }

procedure Save;

var Count: Integer;

begin { Save }
  SaveData.Pieces := Pieces;
  SaveData.LastPlayer := LastPlayer;
  for Count := 1 to LastPlayer do
    SaveData.Moves[Count] := Moves[Count];
  Assign(SaveFile, SaveFileName);
  Rewrite(SaveFile);
  Write(SaveFile, SaveData);
  Close(SaveFile);
end; { Save }

procedure Load;

var Count: Integer;

begin { Load }
  Assign(SaveFile, SaveFileName);
  {$I-}
  Reset(SaveFile);
  {$I+}
  if IOResult <> 0 then
  begin
    MessageString := 'No file found: ' + SaveFileName;
    MessageBox(MessageString, On);
    if KeyPressed then
      ReadKey;
    ReadKey;
    MessageBox(MessageString, Off);
  end;
  Read(SaveFile, SaveData);
  Close(SaveFile);
  Pieces := SaveData.Pieces;
  LastPlayer := SaveData.LastPlayer;
  for Count := 1 to LastPlayer do
    Moves[Count] := SaveData.Moves[Count];
end; { Load }

function CheckButton(Button: Integer): Integer;

begin { CheckButton }
  HideCursor;
  DrawButton(Button, Down);
  ShowCursor;
  repeat
    ReadState(X, Y, Button1, Button2);
  until (Button1 = Free) or (not OnButton(Button));
  if not OnButton(Button) then
    CheckButton := MovedAway
  else
    CheckButton := Released;
  HideCursor;
  DrawButton(Button, Up);
  ShowCursor;
end; { CheckButton }

begin { Game }
  MessageString := 'Turn: ' + ColorStrings[Player];
  SetColor(Colors[Player]);
  OutTextXY(ButtonX + 5, RaiseY(TurnRaise) + 5, MessageString);

  Str(Moves[Player], MessageString);
  MessageString := 'Moves: ' + MessageString;
  SetColor(White);
  OutTextXY(ButtonX + 5, RaiseY(MovesRaise) + 5, MessageString);

  MarkedPieces := 0;
  NextTurn     := False;
  NoJumpMove   := False;
  Changed := False;
  for Col := 1 to LastCol do
    for Row := 1 to LastRow do
    begin
      Choosed[Col, Row] := False;
      if Holes[Col, Row] then
        DrawHole(Col, Row, Down);
      if Pieces[Col, Row] = Player then
      begin
        MarkedPieces := MarkedPieces + 1;
        PlayersPiece[MarkedPieces, 1] := Col;
        PlayersPiece[MarkedPieces, 2] := Row;
      end;
    end;

  repeat
    MovedNow := False;
    ReadState(X, Y, Button1, Button2);

    { Check buttons }

    if OnButton(NextButton) and (Button1 = Press) and
       (CheckButton(NextButton) = Released) then
      NextTurn := True;

    if OnButton(ExitButton) and (Button1 = Press) and
       (CheckButton(ExitButton) = Released) then
    begin
      if KeyPressed then
        ReadKey;
      MessageBox('Are you sure (Y / N) ?', On);
      Check := ReadKey;
      if UpCase(Check) <> 'Y' then
      begin
        Abort := False;
        MessageBox('Are you sure (Y / N) ?', Off);
      end
      else
      begin
        if (not Moved) then
          Moves[Player] := Moves[Player] - 1;
        Abort := True;
      end
    end;

    if OnButton(SaveButton) and (Button1 = Press) and
       (CheckButton(SaveButton) = Released) then
      Save;

    if OnButton(LoadButton) and (Button1 = Press) and
       (CheckButton(LoadButton) = Released) then
      Load;

    if not Moved then
      for Col := 1 to LastCol do
        for Row := 1 to LastRow do
          if OnHole(Col, Row) and (Button1 = 1) and
             (Pieces[Col, Row] = NoPlayer) and
             Holes[Col, Row] then
            if (Choosed[Col, Row - 2] or
                Choosed[Col - 1, Row - 1] or
                Choosed[Col + 1, Row - 1] or
                Choosed[Col - 1, Row + 1] or
                Choosed[Col + 1, Row + 1] or
                Choosed[Col, Row + 2]) then
            begin  { Single move }
              DrawPiece(Col, Row, Player);
              if Choosed[Col, Row - 2] then
              begin
                OriginalCol := Col;
                OriginalRow := Row - 2;
                ClosePiece(Col, Row - 2);
              end;
              if Choosed[Col - 1, Row - 1] then
              begin
                OriginalCol := Col - 1;
                OriginalRow := Row - 1;
                ClosePiece(Col - 1, Row - 1);
              end;
              if Choosed[Col + 1, Row - 1] then
              begin
                OriginalCol := Col + 1;
                OriginalRow := Row - 1;
                ClosePiece(Col + 1, Row - 1);
              end;
              if Choosed[Col - 1, Row + 1] then
              begin
                OriginalCol := Col - 1;
                OriginalRow := Row + 1;
                ClosePiece(Col - 1, Row + 1);
              end;
              if Choosed[Col + 1, Row + 1] then
              begin
                OriginalCol := Col + 1;
                OriginalRow := Row + 1;
                ClosePiece(Col + 1, Row + 1);
              end;
              if Choosed[Col, Row + 2] then
              begin
                OriginalCol := Col;
                OriginalRow := Row + 2;
                ClosePiece(Col, Row + 2);
              end;
              NoJumpMove := True;
              MovedNow := True;
            end;

    if Moved and NoJumpMove and (not Changed) and
       OnHole(OriginalCol, OriginalRow) and (Button1 = 1) then
    begin  { User wants to cancel a single move }
      DrawPiece(OriginalCol, OriginalRow, Player);
      NoJumpMove := False;
      for Col := 1 to LastCol do
        for Row := 1 to LastRow do
          if Choosed[Col, Row] then
            ClosePiece(Col, Row);
    end;

    if (not NoJumpMove) and (not Changed) then
      for Col := 1 to LastCol do
        for Row := 1 to LastRow do
          if OnHole(Col, Row) and (Button1 = 1) and
             (Pieces[Col, Row] = NoPlayer) and
             Holes[Col, Row] then
            if (Choosed[Col, Row - 4] and
                (Pieces[Col, Row - 2] <> NoPlayer)) or
               (Choosed[Col - 2, Row - 2] and
                (Pieces[Col - 1, Row - 1] <> NoPlayer)) or
               (Choosed[Col + 2, Row - 2] and
                (Pieces[Col + 1, Row - 1] <> NoPlayer)) or
               (Choosed[Col - 2, Row + 2] and
                (Pieces[Col - 1, Row + 1] <> NoPlayer)) or
               (Choosed[Col + 2, Row + 2] and
                (Pieces[Col + 1, Row + 1] <> NoPlayer)) or
               (Choosed[Col, Row + 4] and
                (Pieces[Col, Row + 2] <> NoPlayer)) then
            begin  { Jump move }
              DrawPiece(Col, Row, Player);
              if Choosed[Col, Row - 4] then
                ClosePiece(Col, Row - 4);
              if Choosed[Col - 2, Row - 2] then
                ClosePiece(Col - 2, Row - 2);
              if Choosed[Col + 2, Row - 2] then
                ClosePiece(Col + 2, Row - 2);
              if Choosed[Col - 2, Row + 2] then
                ClosePiece(Col - 2, Row + 2);
              if Choosed[Col + 2, Row + 2] then
                ClosePiece(Col + 2, Row + 2);
              if Choosed[Col, Row + 4] then
                ClosePiece(Col, Row + 4);
              MovedNow := True;
            end;

    for Col := 1 to LastCol do
      for Row := 1 to LastRow do
        if OnHole(Col, Row) and (Button1 = 1) and
           (Pieces[Col, Row] = Player) and
           (not Choosed[Col, Row]) then
          begin  { User selects another piece or has moved a piece }
            for CheckCol := 1 to LastCol do
              for CheckRow := 1 to LastRow do
                if Choosed[CheckCol, CheckRow] then
                begin
                  Choosed[CheckCol, CheckRow] := False;
                  DrawHole(CheckCol, CheckRow, Down);
                end;
            Choosed[Col, Row] := True;
            DrawHole(Col, Row, Up);
            if (not MovedNow) and Moved then
              Changed := True;
          end;

  until NextTurn or Abort or (Winner <> NoPlayer);

  SetColor(Black);

  MessageString := 'Turn: ' + ColorStrings[Player];
  OutTextXY(ButtonX + 5, RaiseY(TurnRaise) + 5, MessageString);

  Str(Moves[Player], MessageString);
  MessageString := 'Moves: ' + MessageString;
  OutTextXY(ButtonX + 5, RaiseY(MovesRaise) + 5, MessageString);

  Moves[Player] := Moves[Player] + 1;
end; { Game }

begin { ChineseCheckers }
  StartScreen;
  repeat
    ClrScr;
    repeat
      {$I-}
      Write('How many players (1 - ', MaxPlayers, '): ');
      Readln(Players);
      {$I+}
    until (IOResult = 0) and (Players >= 1) and (Players <= 6);
    Initialize;
    MarkPlaces;
    DrawHoles;
    DrawBackGround;
    Player := GreenPlayer;
    for Count := 1 to MaxPlayers do
      Moves[Count] := 0;
    repeat
      Game;
      if Player = Players then
        Player := GreenPlayer
      else
        Player := Player + 1;
    until (Winner <> NoPlayer) or Abort;
    CloseGraph;

    if Winner <> NoPlayer then
      Writeln(ColorStrings[Winner], ' player won!');
    if Abort then
      Writeln('You aborted game!');
    Writeln;
    for Count := 1 to Players do
      Writeln(ColorStrings[Count], ' player''s moves: ', Moves[Count]);
    Writeln;

    if KeyPressed then
      ReadKey;
    Write('Do you want a new game (Y/N)? ');
    New := ReadKey;
    if UpCase(New) = 'N' then
      Exit := True;
  until Exit;
  ClrScr;
  NormVideo;
end. { ChineseCheckers }