program kuva;

uses
  Graph, Crt;

var
  GraphDriver, GraphMode : integer;
  TextMode, Color        : word;
  ErrorCode              : integer;

procedure alustus;
  begin
    GraphDriver := Detect;
    InitGraph(GraphDriver, GraphMode,'');
    SetBkColor(2);
    SetColor(15);
    ErrorCode := GraphResult;
    if ErrorCode <> grOk then
      begin
        Writeln('Grafiikka virhe: ',GraphErrorMsg(ErrorCode));
        Writeln('(Sinulla ei ole grafiikkakorttia!)');
        Writeln('Ohjelma keskeytetaan');
        Readln;
        Halt(1);
      end;
  end;

procedure piirto;
  var
    x, y : integer;

  begin
    x := 0;
    repeat
      x := x+6;
      y := 0;
      Line(0, 445, 639, 445);
      Circle(x+0, 451, 1);
      Circle(x+0, 457, 1);
      Circle(x+0, 463, 1);
      Circle(x+0, 469, 1);
      Circle(x+0, 475, 1);
    until x=630;
    SetColor(4);
    { c-kirjain }
    Circle(12, 451, 1);
    Circle(12, 457, 1);
    Circle(12, 463, 1);
    Circle(12, 463, 1);
    Circle(12, 469, 1);
    Circle(12, 475, 1);
    Circle(18, 451, 1);
    Circle(24, 451, 1);
    Circle(18, 475, 1);
    Circle(24, 475, 1);
    { s-kirjain
    Circle(12, 451, 1);
    Circle(12, 457, 1);
    Circle(12, 463, 1);
    Circle(12, 475, 1);
    Circle(18, 463, 1);
    Circle(24, 463, 1);
    Circle(24, 469, 1);
    Circle(24, 475, 1);
    Circle(18, 475, 1);
    Circle(18, 451, 1);
    Circle(24, 451, 1); }
    { e-kirjain
    Circle(36, 451, 1);
    Circle(36, 457, 1);
    Circle(36, 463, 1);
    Circle(36, 469, 1);
    Circle(36, 475, 1);
    Circle(42, 451, 1);
    Circle(48, 451, 1);
    Circle(42, 463, 1);
    Circle(42, 475, 1);
    Circle(48, 475, 1); }
    { o-kirjain }
    Circle(36, 451, 1);
    Circle(36, 457, 1);
    Circle(36, 463, 1);
    Circle(36, 469, 1);
    Circle(36, 475, 1);
    Circle(42, 451, 1);
    Circle(48, 451, 1);
    Circle(48, 457, 1);
    Circle(48, 463, 1);
    Circle(48, 469, 1);
    Circle(48, 475, 1);
    Circle(42, 475, 1);
    readln;
    halt(1);
  end;
begin
  alustus;
  piirto;
end.