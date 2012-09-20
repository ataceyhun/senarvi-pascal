{ Copyright (c) 1994,1998 Seppo Enarvi }
program Veikkaus;

uses Crt, Graph, Tluku, Tgraf;

const
  YlaMarginaali   = 30;  AlaMarginaali = 30;
  VasenMarginaali = 30;

  Keskelle = 1;  Alas = 2;

  Kaikki     = 1;  Keskenaiset = 2;
  Kierrosten = 3;

var
  TutkittavatJoukkueet: array[1..MaxJoukkueita] of Byte;
  Loppulippu: Boolean;
  Jarjestys: array[1..MaxJoukkueita] of Byte;
  MaxX, MaxY,
  KeskiKohtaX, KeskiKohtaY,
  ViivanAloitusKohta: Integer;

procedure KysyTutkittavatJoukkueet;

var
  TutkittavaJoukkue, JoukkueLaskuri,
  Joukkue: Byte;

begin  { KysyTutkittavatJoukkueet }
  TextBackground(Black);
  TextColor(LightGray);

  repeat
    ClrScr;
    Writeln('Anna tutkittava joukkue 1');
    Writeln;
    for JoukkueLaskuri := 1 to Joukkueita do
      Writeln('[', JoukkueLaskuri, '] ', JoukkueidenNimet[JoukkueLaskuri]);
    Writeln;
    {$I-}
    Readln(Joukkue);
    {$I+}
  until (IOResult = 0) and (Joukkue > 0) and (Joukkue <= Joukkueita);
  TutkittavatJoukkueet[1] := Joukkue;

  repeat
    ClrScr;
    Writeln('Anna tutkittava joukkue 2');
    Writeln;
    for JoukkueLaskuri := 1 to Joukkueita do
      Writeln('[', JoukkueLaskuri, '] ', JoukkueidenNimet[JoukkueLaskuri]);
    Writeln;
    {$I-}
    Readln(Joukkue);
    {$I+}
  until (IOResult = 0) and (Joukkue > 0) and (Joukkue <= Joukkueita) and
        (Joukkue <> TutkittavatJoukkueet[1]);
  TutkittavatJoukkueet[2] := Joukkue;
end;  { KysyTutkittavatJoukkueet }

procedure JarjestaJoukkueet;

var NykyinenJoukkue, TarkistettavaJoukkue: Byte;

procedure VaihdaPaikkaa(Joukkue1, Joukkue2: Byte);

var Temp: Byte;

begin  { VaihdaPaikkaa }
  Temp := Jarjestys[Joukkue1];
  Jarjestys[Joukkue1] := Jarjestys[Joukkue2];
  Jarjestys[Joukkue2] := Temp;
end;  { VaihdaPaikkaa }

begin  { JarjestaJoukkueet }
  for NykyinenJoukkue := 1 to Joukkueita do
    Jarjestys[NykyinenJoukkue] := NykyinenJoukkue;
  for NykyinenJoukkue := 1 to Joukkueita do
    for TarkistettavaJoukkue := 1 to Joukkueita do
    begin
      { Jarjesta kesken„isen ottelun mukaan }
      if KeskenaisetOttelut[Jarjestys[NykyinenJoukkue],
                            Jarjestys[TarkistettavaJoukkue]] >
         KeskenaisetOttelut[Jarjestys[TarkistettavaJoukkue],
                            Jarjestys[NykyinenJoukkue]] then
        VaihdaPaikkaa(NykyinenJoukkue, TarkistettavaJoukkue);
      { Jarjesta maalieron mukaan }
      if TehdytMaalit[Jarjestys[NykyinenJoukkue]] -
         PaastetytMaalit[Jarjestys[NykyinenJoukkue]] >
         TehdytMaalit[Jarjestys[TarkistettavaJoukkue]] -
         PaastetytMaalit[Jarjestys[TarkistettavaJoukkue]] then
        VaihdaPaikkaa(NykyinenJoukkue, TarkistettavaJoukkue);
      { Jarjesta pisteiden mukaan }
      if Pisteet[Jarjestys[NykyinenJoukkue]] >
         Pisteet[Jarjestys[TarkistettavaJoukkue]] then
        VaihdaPaikkaa(NykyinenJoukkue, TarkistettavaJoukkue);
    end;
end;  { JarjestaJoukkueet }

procedure NaytaSarjatilanne;

var Joukkue: Byte;

begin  { NaytaSarjatilanne }
  TextBackground(Black);
  TextColor(LightGray);
  ClrScr;
  LueTiedot;
  JarjestaJoukkueet;
  Writeln('Sarjatilanne':46);
  Writeln;
  Write('Joukkue');
  GotoXY(10, WhereY);
  Writeln('PO':6, 'V':4, 'T':4, 'H':4, 'TM':6, '-', 'PM':3, 'P':4);
  Writeln;
  TextColor(LightGray);
  for Joukkue := 1 to Joukkueita do
  begin
    if TutkittavatJoukkueet[1] = Jarjestys[Joukkue] then
      TextColor(White);
    if TutkittavatJoukkueet[2] = Jarjestys[Joukkue] then
      TextColor(White);
    Write(JoukkueidenNimet[Jarjestys[Joukkue]]);
    GotoXY(10, WhereY);
    Writeln(PelatutOttelut[Jarjestys[Joukkue]]:6,
            Voitot[Jarjestys[Joukkue]]:4,
            Tasapelit[Jarjestys[Joukkue]]:4,
            Haviot[Jarjestys[Joukkue]]:4,
            TehdytMaalit[Jarjestys[Joukkue]]:6, '-',
            PaastetytMaalit[Jarjestys[Joukkue]]:3,
            Pisteet[Jarjestys[Joukkue]]:4);
    TextColor(LightGray);
    if Joukkue = 8 then
      Writeln('-----------------------------------------');
    if Joukkue = Joukkueita - 1 then
      Writeln('- - - - - - - - - - - - - - - - - - - - -');
  end;
  Writeln;
  Writeln;
  TextColor(White);
  Writeln('Kirkas teksti on tutkittava joukkue');
  TextColor(DarkGray);
  if KeyPressed then ReadKey;
  ReadKey;
  TextColor(LightGray);
end;  { NaytaSarjatilanne }

procedure PiirraTausta(Otsikko, Huomautus: string; KeskelleTaiAlas: Integer);

const
  YlosVaihe = 1;
  AlasVaihe = 2;

var
  VaakaViivaY,
  YlosTaiAlasLaskuri, PoikittaisViivaLaskuri: Integer;
  NumeroTeksti: string;

begin  { PiirraTausta }
  VaakaViivaY := KeskiKohtaY;

  { Kirjoita otsikko }
  OutTextXY(KeskiKohtaX - TextWidth(Otsikko) div 2, 10, Otsikko);

  { Piirr„ keskelle viivat }
  Line(VasenMarginaali, VaakaViivaY, MaxX, VaakaViivaY);
  PoikittaisViivaLaskuri := VasenMarginaali;
  repeat
    Inc(PoikittaisViivaLaskuri, 10);
    { Jos poikittaisviiva on jaollinen kymmenelle }
    if (PoikittaisViivaLaskuri - VasenMarginaali) mod
       ((Joukkueita - 1) * 10) = 0 then
      Line(PoikittaisViivaLaskuri, VaakaViivaY - 5,
           PoikittaisViivaLaskuri, VaakaViivaY + 5)
    else
      Line(PoikittaisViivaLaskuri, VaakaViivaY - 2,
           PoikittaisViivaLaskuri, VaakaViivaY + 2);
  until PoikittaisViivaLaskuri >= MaxX;

  { Piirr„ vasemmalle viivat }
  if KeskelleTaiAlas = Keskelle then
  begin
    Line(VasenMarginaali, YlaMarginaali,
         VasenMarginaali, MaxY - AlaMarginaali);
    { Keskelt„ yl”s ja alas }
    for YlosTaiAlasLaskuri := YlosVaihe to AlasVaihe do
    begin
      PoikittaisViivaLaskuri := KeskiKohtaY;
      repeat
        if YlosTaiAlasLaskuri = YlosVaihe then
          Dec(PoikittaisViivaLaskuri, 10)
        else
          Inc(PoikittaisViivaLaskuri, 10);
        { Jos poikittaisviiva on jaollinen 10
          (viiva tule 10 pikselin v„lein: 10 * 10 = 100) }
        if (KeskiKohtaY - PoikittaisViivaLaskuri) mod 100 = 0 then
        begin
          { poikittaisviiva (10 pikselin v„lein: 10 / 10 = 1) }
          Str((KeskiKohtaY - PoikittaisViivaLaskuri) div 10, NumeroTeksti);
          OutTextXY(0, PoikittaisViivaLaskuri - 2, NumeroTeksti);
          Line(VasenMarginaali, PoikittaisViivaLaskuri,
               VasenMarginaali + 5, PoikittaisViivaLaskuri)
        end
        else
          Line(VasenMarginaali, PoikittaisViivaLaskuri,
               VasenMarginaali + 2, PoikittaisViivaLaskuri);
      until ((YlosTaiAlasLaskuri = YlosVaihe) and
             (PoikittaisViivaLaskuri <= YlaMarginaali)) or
            ((YlosTaiAlaslaskuri = AlasVaihe) and
             (PoikittaisViivaLaskuri >= MaxY - AlaMarginaali));
    end
  end
  else
  begin
    ViivanAloitusKohta := MaxY div 2 - Joukkueita * 10 - 10;
    Line(VasenMarginaali, ViivanAloitusKohta,
         VasenMarginaali, VaakaViivaY);
    PoikittaisViivaLaskuri := ViivanAloitusKohta;
    repeat
      Inc(PoikittaisViivaLaskuri, 10);
      { Jos poikittaisviiva on jaollinen 10
        (viiva tule 10 pikselin v„lein: 10 * 10 = 100) }
      if (PoikittaisViivaLaskuri - ViivanAloitusKohta)
         mod 100 = 0 then
      begin
        { poikittaisviiva (10 pikselin v„lein: 10 / 10 = 1) }
        Str((PoikittaisViivaLaskuri - ViivanAloitusKohta) div 10,
            NumeroTeksti);
        OutTextXY(0, PoikittaisViivaLaskuri - 2, NumeroTeksti);
        Line(VasenMarginaali, PoikittaisViivaLaskuri,
             VasenMarginaali + 5, PoikittaisViivaLaskuri)
      end
      else
        Line(VasenMarginaali, PoikittaisViivaLaskuri,
             VasenMarginaali + 2, PoikittaisViivaLaskuri);
    until (PoikittaisViivaLaskuri >= VaakaViivaY);
  end;

  OutTextXY(KeskiKohtaX - TextWidth(Huomautus) div 2, MaxY - 20, Huomautus);
  MoveTo(VasenMarginaali, VaakaViivaY);
end;  { PiirraTausta }

procedure NaytaLiigasijoitukset(Liigasijoitukset: Integer);

var
  Otsikko: string;
  TutkittavaJoukkue, Joukkue: Byte;
  Summa, Kierroksia: Integer;

procedure LueSeuraavaLiigasijoitus;

var Joukkue, Kierros: Byte;

begin
  if Liigasijoitukset = Kaikki then
    for Joukkue := 1 to Joukkueita div 2 do
      LueSeuraavatTiedot
  else
  begin
    Summa := 0;
    Kierroksia := Joukkueita - 1;
    for Kierros := 1 to Kierroksia do
    begin
      for Joukkue := 1 to Joukkueita div 2 do
        LueSeuraavatTiedot;
      JarjestaJoukkueet;
      for Joukkue := 1 to Joukkueita do
        if Jarjestys[Joukkue] = TutkittavatJoukkueet[TutkittavaJoukkue] then
          Inc(Summa, Joukkue);
    end;
  end;
  JarjestaJoukkueet;
end;

begin  { NaytaLiigasijoitukset }
  AlustaGrafiikka;
  SetBkColor(Black);
  SetColor(LightGray);
  MaxX := GetMaxX;
  MaxY := GetMaxY;
  KeskiKohtaX := GetMaxX div 2;
  KeskiKohtaY := GetMaxY div 2;

  { Tutkittavat joukkueet 1 ja 2 }
  for TutkittavaJoukkue := 1 to 2 do
  begin
    if AvaaTiedosto(Tiedosto, TulosTiedostonNimi) = 0 then
    { Jos tiedoston avaus onnistui }
      begin
      { Piirra tausta }
      ClearDevice;
      if LiigaSijoitukset = Kaikki then
        Otsikko :=
          'Joukkueen ' +
          JoukkueidenNimet[TutkittavatJoukkueet[TutkittavaJoukkue]] +
          ' edelliset liigasijoitukset'
      else
        Otsikko :=
          'Joukkueen ' +
          JoukkueidenNimet[TutkittavatJoukkueet[TutkittavaJoukkue]] +
          ' edellisten kierrosten keskim„„r„iset liigasijoitukset';
      PiirraTausta(Otsikko, '', Alas);

      NollaaTiedot;
      if not Eof(Tiedosto) then  { Jos tiedosto ei ole tyhj„ }
      begin  { Siirr„ kursori ensimm„iseen kohtaan ja piirr„ siihen neli” }
        LueSeuraavaLiigasijoitus;
        if Liigasijoitukset = Kaikki then
        begin
          for Joukkue := 1 to Joukkueita do
            if Jarjestys[Joukkue] =
               TutkittavatJoukkueet[TutkittavaJoukkue] then
              MoveTo(GetX, ViivanAloitusKohta + Joukkue * 10);
        end
        else
          MoveTo(GetX, ViivanAloitusKohta + Round(10 * Summa / Kierroksia));
        Rectangle(GetX - 2, GetY - 2, GetX + 2, GetY + 2);
        repeat  { Jatka viivaa }
          LueSeuraavaLiigasijoitus;
          if Liigasijoitukset = Kaikki then
          begin
            for Joukkue := 1 to Joukkueita do
              if Jarjestys[Joukkue] =
                 TutkittavatJoukkueet[TutkittavaJoukkue] then
              LineTo(GetX + 10, ViivanAloitusKohta + Joukkue * 10);
          end
          else
            LineTo(GetX + 10, ViivanAloitusKohta + Round(10 * Summa / Kierroksia));
          Rectangle(GetX - 2, GetY - 2, GetX + 2, GetY + 2);
        until Eof(Tiedosto);

      end
      else  { Jos tiedosto on heti tyhj„ }
        Writeln('Tiedosto ', TulosTiedostonNimi, ' on tyhj„.');
    end
    else  { Jos tiedoston avaus ei onnistunut }
      Writeln('Tiedostoa ei l”ydy: ', TulosTiedostonNimi, '.');

    if KeyPressed then
      ReadKey;
    ReadKey;
    Close(Tiedosto);
  end;
  CloseGraph;
end;  { NaytaLiigasijoitukset }

procedure NaytaMaalierot(Maalierot: Integer);

var
  TutkittavaJoukkue,
  Maalieroja,
  Kierroksia, Summa: Integer;
  Otsikko, Huomautus: string;

procedure LueSeuraavaMaaliero;

var Kierros: Integer;

begin  { LueSeuraavaMaaliero }
  with Tulos do
  begin
    case Maalierot of
      Kaikki:
        repeat
          LueSeuraavaTulos;
        until ((Joukkueet[1] = TutkittavatJoukkueet[TutkittavaJoukkue]) or
               (Joukkueet[2] = TutkittavatJoukkueet[TutkittavaJoukkue])) or
              Eof(Tiedosto);
      Keskenaiset:
        repeat
          LueSeuraavaTulos;
        until (((Joukkueet[1] = TutkittavatJoukkueet[1]) and
               (Joukkueet[2] = TutkittavatJoukkueet[2])) or
               ((Joukkueet[1] = TutkittavatJoukkueet[2]) and
                (Joukkueet[2] = TutkittavatJoukkueet[1]))) or
              Eof(Tiedosto);
      Kierrosten:
      begin
        Kierroksia := 0;
        Summa := 0;
        for Kierros := 1 to Joukkueita - 1 do
        begin
          repeat
            LueSeuraavaTulos;
          until ((Joukkueet[1] = TutkittavatJoukkueet[TutkittavaJoukkue]) or
                 (Joukkueet[2] = TutkittavatJoukkueet[TutkittavaJoukkue])) or
                Eof(Tiedosto);
          if Joukkueet[1] = TutkittavatJoukkueet[TutkittavaJoukkue] then
            Inc(Summa, Maalit[1] - Maalit[2]);
          if Joukkueet[2] = TutkittavatJoukkueet[TutkittavaJoukkue] then
            Inc(Summa, Maalit[2] - Maalit[1]);
          if not Eof(Tiedosto) then
            Inc(Kierroksia);
        end;
      end;
    end;
  end;
end;  { LueSeuraavaMaaliero }

begin  { NaytaMaalierot }
  LueTiedot;
  AlustaGrafiikka;
  SetBkColor(Black);
  SetColor(LightGray);
  MaxX := GetMaxX;
  MaxY := GetMaxY;
  KeskiKohtaX := GetMaxX div 2;
  KeskiKohtaY := GetMaxY div 2;

  { Tutkittavat joukkueet 1 ja 2 }
  for TutkittavaJoukkue := 1 to 2 do
  begin
    ClearDevice;
    if AvaaTiedosto(Tiedosto, TulosTiedostonNimi) = 0 then
    begin
      if not Eof(Tiedosto) then  { Jos tiedosto ei ole tyhj„ }
      begin
        { Piirra tausta }
        case Maalierot of
          Kaikki:
            Otsikko :=
              'Joukkueen ' +
              JoukkueidenNimet[TutkittavatJoukkueet[TutkittavaJoukkue]] +
              ' edellisten otteluiden maalierot';

          Keskenaiset:
            if TutkittavaJoukkue = 1 then
              Otsikko := 'Joukkueen ' +
                         JoukkueidenNimet[TutkittavatJoukkueet[1]] +
                         ' maalierot joukkuetta ' +
                         JoukkueidenNimet[TutkittavatJoukkueet[2]] +
                         ' vastaan'
            else
              Otsikko := 'Joukkueen ' +
                         JoukkueidenNimet[TutkittavatJoukkueet[2]] +
                         ' maalierot joukkuetta ' +
                         JoukkueidenNimet[TutkittavatJoukkueet[1]] +
                         ' vastaan';

          Kierrosten:
            Otsikko :=
              'Joukkueen ' +
              JoukkueidenNimet[TutkittavatJoukkueet[TutkittavaJoukkue]] +
              ' edellisten kierrosten keskim„„r„iset ' +
              'maalierot';
        end;
        Huomautus := 'Vihre„ neli” on koti- ja punainen vierasottelu';
        PiirraTausta(Otsikko, Huomautus, Keskelle);

        with Tulos do
        begin
          { Siirr„ kursori ensimm„iseen kohtaan ja piirr„ siihen neli” }
          LueSeuraavaMaaliero;
          if Maalierot <> Kierrosten then
            if Joukkueet[1] = TutkittavatJoukkueet[TutkittavaJoukkue] then
            begin
              MoveTo(GetX, KeskiKohtaY - (Maalit[1] - Maalit[2]) * 10);
              SetColor(Green);
            end
            else
            begin
              MoveTo(GetX, KeskiKohtaY - (Maalit[2] - Maalit[1]) * 10);
              SetColor(Red);
            end
          else
            if Summa <> 0 then
              MoveTo(GetX, KeskiKohtaY - Round(10 * Summa / Kierroksia))
            else
              MoveTo(GetX, KeskiKohtaY);
          Rectangle(GetX - 2, GetY - 2, GetX + 2, GetY + 2);
          SetColor(LightGray);

          { Jokainen ottelu }
          LueSeuraavaMaaliero;
          repeat  { Jatka viivaa }
            if Maalierot <> Kierrosten then
              if Joukkueet[1] =
                 TutkittavatJoukkueet[TutkittavaJoukkue] then
              begin
                LineTo(GetX + 10,
                       KeskiKohtaY - (Maalit[1] - Maalit[2]) * 10);
                SetColor(Green);
              end
              else
              begin
                LineTo(GetX + 10,
                       KeskiKohtaY - (Maalit[2] - Maalit[1]) * 10);
                SetColor(Red);
              end
            else
              if Summa <> 0 then
                LineTo(GetX + 10,
                       KeskiKohtaY - Round(10 * Summa / Kierroksia))
              else
                LineTo(GetX + 10, KeskiKohtaY);
            Rectangle(GetX - 2, GetY - 2, GetX + 2, GetY + 2);
            SetColor(LightGray);
            LueSeuraavaMaaliero;
          until Eof(Tiedosto);
        end;

      end
      else  { Jos tiedosto on heti tyhj„ }
        Writeln('Tiedosto ', TulosTiedostonNimi, ' on tyhj„.');
    end
    else  { Jos tiedoston avaus ei onnistunut }
      Writeln('Tiedostoa ei l”ydy: ', TulosTiedostonNimi, '.');

    if KeyPressed then
      ReadKey;
    ReadKey;
    Close(Tiedosto);
  end;
  CloseGraph;
end;  { NaytaMaalierot }

procedure KysyTehtava;

{ Huomautus: kierros tarkoittaa jaksoa, jossa kaikki joukkueet ovat pelanneet
             kaikkia vastaan }

var
  Merkki: Char;

begin  { KysyTehtava }
  TextBackground(Black);
  TextColor(LightGray);
  ClrScr;
  { Piirra tausta }
  Write('Tutkittava joukkue 1: ');
  TextColor(Cyan);
  Writeln(JoukkueidenNimet[TutkittavatJoukkueet[1]]);
  TextColor(LightGray);
  Write('Tutkittava joukkue 2: ');
  TextColor(Cyan);
  Writeln(JoukkueidenNimet[TutkittavatJoukkueet[2]]);
  TextColor(LightGray);
  Writeln;
  Write('----------------------------------------------------------------',
        '----------------');
  Writeln;
  Writeln('muuta tutkittavia joukkueita');
  Writeln;
  Writeln('sarjatilanne');
  Writeln;
  Writeln('edelliset liigasijoitukset');
  Writeln('kierrosten keskim„„r„iset liigasijoitukset');
  Writeln;
  Writeln('edellisten otteluiden maalierot');
  Writeln('kesken„isten otteluiden maalierot');
  Writeln('kierrosten keskim„„r„iset maalierot');
  Writeln;
  Writeln('keskim„„rin tehdyt - ja p„„stetyt maalit');
  Writeln('kierrosten keskim„„rin tehdyt - ja p„„stetyt maalit');
  Writeln;
  Writeln('arvio maalierojen ja liigasijoitusten perusteella');
  Writeln;
  Writeln;
  Writeln('ESC lopetus');
  Writeln;
  { Kirjoita kirkkaat kirjaimet }
  TextColor(LightCyan);
  GotoXY(7, 6); Write('t');

  GotoXY(1, 8); Write('s');

  GotoXY(11, 10); Write('l');
  GotoXY(1, 11); Write('k');

  GotoXY(23, 13); Write('m');
  GotoXY(2, 14); Write('e');
  GotoXY(2, 15); Write('i');

  GotoXY(15, 17); Write('h');
  GotoXY(4, 18); Write('r');

  GotoXY(1, 20); Write('a');

  GotoXY(1, 23); Writeln('ESC');

  TextColor(LightGray);
  { Lue toiminto }
  Writeln;
  if KeyPressed then ReadKey;
  repeat
    Merkki := UpCase(ReadKey);
  until Merkki in ['T', 'S', 'L', 'K', 'M', 'E', 'I', 'H', 'R', 'A', #27];
  case Merkki of
    'T': KysyTutkittavatJoukkueet;
    'S': NaytaSarjatilanne;
    'L': NaytaLiigasijoitukset(Kaikki);
    'K': NaytaLiigasijoitukset(Kierrosten);
    'M': NaytaMaalierot(Kaikki);
    'E': NaytaMaalierot(Keskenaiset);
    'I': NaytaMaalierot(Kierrosten);
    #27: Loppulippu := True;
  end;
end;  { KysyTehtava }

begin  { Veikkaus }
  TextBackground(Black);
  TextColor(LightGray);
  ClrScr;
  Writeln('Veikkaus  Copyright (c) 1994,1998 Seppo Enarvi');
  Writeln;
  LueJoukkueidenNimet;
  KysyTutkittavatJoukkueet;
  Loppulippu := False;
  repeat
    KysyTehtava;
  until Loppulippu;
  TextBackground(Black);
  TextColor(LightGray);
  ClrScr;
end.  { Veikkaus }