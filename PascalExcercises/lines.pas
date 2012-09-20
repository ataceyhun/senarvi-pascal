program LineScroll;

uses Graph, Crt;

var
  GraphDriver, GraphMode,
  ErrorCode,
  X1, Y1,
  X2, Y2,
  XDelay, YDelay,
  OrigXD, OrigYD: Integer;

procedure Initialize;

begin
  GraphDriver := VGA;
  GraphMode := VGAHi;
  InitGraph(GraphDriver, GraphMode, '');
  ErrorCode := GraphResult;
  if ErrorCode <> grOk then
  begin
    Writeln('Graphics error: ', GraphErrorMsg(ErrorCode));
    Writeln('Program aborted...');
    Halt(1);
  end;
  Randomize;
end;

begin
  Initialize;
  repeat
    ClearDevice;
    SetColor(Random(15) + 1);
    X1 := Random(200) + 10;
    X2 := X1;
    Y1 := Random(200) + 10;
    Y2 := Y1 + 100;
    XDelay := 0;
    YDelay := 100;
    OrigXD := 0;
    OrigYD := 100;
    repeat
      if XDelay = 0 then
      begin
        X1 := X1 + 2;
        X2 := X2 + 4;
        Line(X1, Y1, X2, Y2);
        XDelay := OrigXD + 1;
        OrigXD := XDelay;
      end;
      if YDelay = 0 then
      begin
        Y1 := Y1 + 4;
        Y2 := Y2 + 2;
        Line(X1, Y1, X2, Y2);
        YDelay := OrigYD - 1;
        OrigYD := YDelay;
      end;
      XDelay := XDelay - 1;
      YDelay := YDelay - 1;
      Delay(1);
    until Y1 = Y2;
  until KeyPressed;
  ReadKey;
  CloseGraph;
end.