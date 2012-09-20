program Install;

{$M 8192,0,0}

uses Crt, Dos, Graph;

var
  Command                : string[127];
  GraphDriver, GraphMode : integer;

procedure Alustus;
  begin
    GraphDriver := Detect;
    InitGraph(GraphDriver, GraphMode,'D:\TP\BGI');
    If GraphResult <> grOk then
      WriteLn('Sinulla ei ole grafiikka korttia');
      Halt(1);
  end;

procedure Lopetus;
  begin
    CloseGraph;
    WriteLn('Installointi on p„„ttynyt onnellisesti.');
    WriteLn('Voit k„ynnist„„ ohjelman kirjoittamalla');
    WriteLn('aavikko Dosin komentoriviss„.');
    WriteLn('Paina jotain n„pp„int„');
    ReadLn;
  end;

procedure Installointi;
  begin
    TextBackGround(4);
    Line(200, 200, 400, 200);
    Line(200, 200, 200, 300);
    Line(200, 300, 400, 300);
    Line(400, 200, 400, 300);
    Lopetus;
  end;

begin
  Alustus;
  Installointi;
(*  SwapVectors;
  Exec(GetEnv('COMSPEC'), '/C' + Command);*)
end.