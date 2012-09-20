program Aavikon_Arvoitus;

uses
  Crt, Graph;

type Tallennustietue = record
  Tpaikka   : integer;
  Tkeppi    : integer;
  Tkivi     : integer;
  Tportti   : integer;
  Tkaupunki : integer;
  Tvartijat : integer;
end;

var
  Tallennus                    : Tallennustietue;
  Tehtava                      : string;
  LuettuPaikka                 : string;
  Muuri                        : integer;
  Paikka, VanhaPaikka          : integer;
  Keppi, Kivi, Portti          : integer;
  Kaupunki, Vartijat           : integer;
  tiedostonimi                 : string;
  tiedosto                     : file of Tallennustietue;
  GraphDriver, GraphMode       : integer;
  OrigMode, LastCol, LastRow   : Word;

procedure Alustus;
  begin
    CheckBreak := False;
    OrigMode := LastMode;
    TextMode(Lo(LastMode)+Font8x8);
    LastCol := Lo(WindMax)+1;
    LastRow := Hi(WindMax)+1;
  end;

procedure Tausta;
  begin
    GoToXY(1, LastRow);
    TextBackground(Black);
    TextColor(White);
    WriteLn('--------------------------------------------------------------------------------');
    Write('   Ota     ',
          'K„yt„     ',
          'Katso     ',
          'Avaa     ',
          'Sulje     ',
          'Tallenna     ',
          'Lataa     ',
          'Exit     ');
    Dec(LastRow, 80 div LastCol);
    GotoXY(1, 1);
  end;

procedure AlkuAnsi;
  begin
    ClrScr;
    WriteLn;
    WriteLn;
    WriteLn('             ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿');
    WriteLn('             ³ AAVIKON ARVOITUS ³');
    WriteLn('             ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ');
    WriteLn;
    Delay(2000);
  end;

procedure Kartta;
  begin
    WriteLn('Katsot karttaa...');
    Delay(2000);
    Vanhapaikka := Paikka;
    GraphDriver := Detect;
    InitGraph(GraphDriver, GraphMode, 'D:\TP\BGI');
    if GraphResult <> grOk then
      Halt(1);
    { Kaupunki }
    Circle(110, 155, 25);
    { Muuri }
    Line(20, 55, 200, 55);
    Line(210, 65, 210, 245);
    Line(10, 65, 10, 245);
    Line(20, 255, 200, 255);
    { Vasen yl„torni }
    Line(20, 45, 20, 65);
    Line(0, 45, 20, 45);
    Line(0, 45, 0, 65);
    Line(0, 65, 20, 65);
    { Oikea yl„torni }
    Line(200, 45, 200, 65);
    Line(200, 45, 220, 45);
    Line(220, 45, 220, 65);
    Line(200, 65, 220, 65);
    { Vasen alatorni }
    Line(0, 245, 20, 245);
    Line(0, 245, 0, 265);
    Line(0, 265, 20, 265);
    Line(20, 265, 20, 245);
    { Oikea alatorni }
    Line(200, 245, 220, 245);
    Line(200, 245, 200, 265);
    Line(200, 265, 220, 265);
    Line(220, 245, 220, 265);
    { L„hde }
    Circle(500, 250, 15);
    { Vasen palmu }
    Arc(400, 250, 10, 30, 90);
    Line(478, 205, 466, 217);
    Line(478, 205, 495, 215);
    { Oikea palmu }
    Arc(600, 250, 150, 170, 90);
    Line(523, 204, 535, 216);
    Line(523, 204, 510, 215);
    { Kivi }
    Circle(375, 100, 10);
    { Paikannimet }
    MoveTo(81, 190);
    OutText('Kaupunki');
    MoveTo(220, 155);
    OutText('Portti');
    MoveTo(480, 270);
    OutText('L„hde');
    MoveTo(360, 120);
    OutText('Kivi');
    MoveTo(0, 450);
    OutText('Minne haluat menn„? ');
    ReadLn(LuettuPaikka);
    CloseGraph;
    Alustus;
    If LuettuPaikka = 'L„hteelle' then
      Paikka := 1;
    If LuettuPaikka = 'Portin luo' then
      Paikka := 2;
    If LuettuPaikka = 'Kiven luo' then
      Paikka := 3;
    If LuettuPaikka = 'Kaupunkiin' then
      Paikka := 4;
    If LuettuPaikka <> 'L„hteelle' then
      If LuettuPaikka <> 'Portin luo' then
        If LuettuPaikka <> 'Kiven luo' then
          If LuettuPaikka <> 'Kaupunkiin' then
            Paikka := 5;
    If Paikka = 5 then
      begin
        Paikka := VanhaPaikka;
        WriteLn('Et p„„se sinne');
      end;
    If Paikka = 4 then
      If Portti = 1 then
        begin
          Paikka := VanhaPaikka;
          WriteLn('Portti on kiinni');
        end;
    If Paikka = 4 then
      If Vartijat = 1 then
        begin
          Paikka := VanhaPaikka;
          WriteLn('Portin edess„ olevat vartijat heitt„v„t sinut takaisin aavikolle');
        end;
    If Paikka = 4 then
      If Vartijat = 2 then
        WriteLn('Vartijat eiv„t huomaa kun livahdat sis„„n, koska he tappelevat');
  end;

procedure PKeppi;
  begin
    If Paikka = 1 then
      If Keppi <> 1 then
        WriteLn('Olet ottanut sen jo');
    If Paikka = 1 then
      If Keppi = 1 then
        begin
          WriteLn('Otat kepin maasta');
          Keppi := 2;
        end;
    If Paikka <> 1 then
      WriteLn('Ei t„„ll„ ole mit„„n keppi„');
  end;

procedure Kivet;
  begin
    If Paikka = 3 then
      If Kivi = 2 then
        WriteLn('Olet ottanut ne jo');
    If Paikka = 3 then
      If Keppi = 3 then
        begin
          WriteLn('Otat maasta pikkukivi„');
          Kivi := 2;
        end;
    If Paikka = 3 then
      If Keppi = 2 then
        WriteLn('Ei t„„ll„ ole mit„„n pikkukivi„');
    If Paikka <> 3 then
      WriteLn('Ei t„„ll„ ole mit„„n pikkukivi„');
  end;

procedure Tallentaminen;
  begin
    Tiedostonimi := 'aavikko.sav';
    assign(tiedosto, tiedostonimi);
    rewrite(tiedosto);
    while not Eof(tiedosto) do
    with tallennus do
      begin
        Tpaikka   := Paikka;
        Tkeppi    := Keppi;
        Tkivi     := Kivi;
        Tportti   := Portti;
        Tkaupunki := Kaupunki;
        Tvartijat := Vartijat;
        Write(tiedosto, tallennus);
      end;
    close(tiedosto);
  end;

procedure Lataaminen;
  begin
    Tiedostonimi := 'aavikko.sav';
    assign(tiedosto, tiedostonimi);
    rewrite(tiedosto);
    Reset(tiedosto);
    While not Eof(tiedosto) do
    begin
      with tallennus do
        begin
          Read(tiedosto, tallennus);
          Paikka   := Tpaikka;
          Keppi    := Tkeppi;
          Kivi     := Tkivi;
          Portti   := Tportti;
          Kaupunki := Tkaupunki;
          Vartijat := Tvartijat;
        end;
    end;
    close(tiedosto);
  end;

procedure Pelaaminen;
  begin
    Paikka   := 1;
    Keppi    := 1;
    Portti   := 1;
    Vartijat := 1;
    While Tehtava <> 'Exit' do
    begin
      ClrScr;
      Tausta;
      If Paikka = 1 then
        WriteLn('Olet l„hteell„');
      If Paikka = 2 then
        WriteLn('Olet portin luona');
      If Paikka = 3 then
        WriteLn('Olet kiven luona');
      If Paikka = 4 then
        WriteLn('Olet kaupungissa');
      WriteLn('Sinulla on kartta ');
      If Keppi = 2 then
        WriteLn('ja keppi');
      If Kivi = 2 then
        WriteLn('ja kivi„');
      Write('Mit„ teet? '); ReadLn(Tehtava);
      If Tehtava = 'Tallenna' then
        Tallentaminen;
      If Tehtava = 'Lataa' then
        Lataaminen;
      If Paikka = 1 then
        If Tehtava = 'Juo' then
          WriteLn('Ei sinua janota');
      If Tehtava = 'Tarina' then
        WriteLn('Olet menett„nyt muistisi ja joutunut aavikolle');
      If Tehtava = 'Katso' then
        WriteLn('Mihin tai mit„?');
      If Paikka = 1 then
        If Tehtava = 'Katso ymp„rillesi' then
          begin
            WriteLn('N„et l„hteen ja pari palmua ja aaviikkoa ');
            if Keppi = 1 then WriteLn('ja kepin maassa');
          end;
      If Tehtava = 'Katso karttaa' then
        Kartta;
      If Tehtava = 'Ota keppi' then
        PKeppi;
      If Paikka = 3 then
        If Tehtava = 'Katso ymp„rillesi' then
          begin
            WriteLn('N„et kiven');
            If Keppi = 3 then
              If Kivi = 1 then
                WriteLn('ja sen ymp„rill„ pikkukivi„');
          end;
      If Paikka = 3 then
        If Tehtava = 'K„yt„ keppi„ kiveen' then
          If Keppi = 2 then
            begin
              WriteLn('Taivutat keppisi rikki ja kivest„ irtoaa pikkukivi„');
              Keppi := 3;
            end;
      If Tehtava = 'Ota pikkukivi„' then
        Kivet;
      If Paikka = 2 then
        If Tehtava = 'Katso ymp„rillesi' then
            WriteLn('N„et muurin kaupungin ymp„rill„ ja siin„ portin');
      If Paikka = 2 then
        If Tehtava = 'Katso muuria' then
          WriteLn('N„et siin„ pienen kolon');
      If Paikka = 2 then
        If Tehtava = 'Katso koloon' then
          WriteLn('N„et siint„ kaksi vartijaa');
      If Paikka = 2 then
        If Tehtava = 'Katso porttia' then
          WriteLn('Se on tavallinen puuportti');
      If Paikka = 2 then
        If Tehtava = 'Avaa portti' then
          begin
            If Portti = 2 then
              WriteLn('Olet avannut sen jo');
            If Portti = 1 then
              begin
                Portti := 2;
                WriteLn('Avaat portin raolleen');
              end;
          end;
      If Paikka = 2 then
        If Tehtava = 'Sulje portti' then
          begin
            If Portti = 1 then
              WriteLn('Se on jo kiinni');
            If Portti = 2 then
              begin
                WriteLn('Suljet portin');
                Portti := 1;
              end;
          end;
      If Paikka = 2 then
        If Tehtava = 'Heit„ kivet muurin yli' then
          If Kivi = 2 then
            begin
              Kivi := 3;
              Vartijat := 2;
              WriteLn('Heit„t kivet muurin yli ja ne osuvat toista vartijaa,');
              WriteLn('joka luulee, ett„ se oli toinen vartija ja n„in he');
              WriteLn('rupeavat tappelemaan');
            end;
      If Paikka = 2 then
        If Portti = 2 then
          If Vartijat = 2 then
            Kaupunki := 2;
      If Paikka = 2 then
        If Tehtava = 'K„yt„ keppi„ koloon' then
          If Keppi = 2 then
            begin
              WriteLn('Ty”nn„t kepin muurissa olevaan koloon...');
              Delay(2000);
              WriteLn('...mutta mit„„n ei tapahdu ja otat sen pois');
            end;
      If Tehtava = 'Exit' then
        WriteLn('Paina jotain n„pp„int„...');
      ReadLn;
    end;
  end;

procedure Lopetus;
  begin
    TextMode(OrigMode);
    WriteLn('Thanx for playing Aavikon Arvoitus');
  end;

begin
  AlkuAnsi;
  Alustus;
  Pelaaminen;
  Lopetus;
end.