program Earth;

uses Crt, Graph;

var GraphDriver, GraphMode, ErrorCode : Integer;
    R : Char;
    X, Y, I : Integer;

procedure Initialize;

begin
  GraphDriver := Detect;
  InitGraph(GraphDriver, GraphMode, 'D:\TP\BGI');
  ErrorCode := GraphResult;
  if GraphResult <> grOk then
    Halt(1);
end;

procedure DrawEarth;

begin
  X := 200;
  Y := 200;
  Line(10, Y, 390, Y);
  Line(X, 10, X, 390);
  Circle(X, Y, 180);
  for I := 1 to 8 do
  begin
    Ellipse(X, Y, 0, 360, I * 20, 180);
    Ellipse(X, Y, 0, 360, 180, I * 20);
  end;
  for I := 1 to 360 do
  begin
  PieSlice(GetMaxX-60, 35, 0, I, 25);
  Delay(25);
  end;
end;

begin
  Initialize;
  DrawEarth;
  ReadKey;
  CloseGraph;
end.