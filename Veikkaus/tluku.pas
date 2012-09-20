{ Copyright (c) 1994,1998 Seppo Enarvi }
unit Tluku;

interface

const
  MaxJoukkueita        = 14;
  JoukkueTiedostonNimi = 'JOUKKUE.CSV';
  TulosTiedostonNimi   = 'TULOKSET.CSV';
  TietojaOttelussa     = 5;

type
  TulosTyyppi = record
    Joukkueet: array[1..2] of Byte;
    Eria: Byte;
    Maalit: array[1..2] of Byte;
  end;

var
  JoukkueidenNimet: array[1..MaxJoukkueita] of string;
  Joukkueita: Byte;
  Tiedosto: Text;
  Tulos: TulosTyyppi;
  Pisteet,
  TehdytMaalit, PaastetytMaalit,
  Voitot, TasaPelit, Haviot,
  PelatutOttelut: array[1..MaxJoukkueita] of Integer;
  KeskenaisetOttelut: array[1..MaxJoukkueita, 1..MaxJoukkueita] of Integer;

function AvaaTiedosto(var Tiedosto: Text; TiedostoNimi: string): Integer;
function LueJoukkueidenNimet: Integer;
procedure LueSeuraavaTulos;
procedure NollaaTiedot;
procedure LueSeuraavatTiedot;
procedure LueTiedot;

implementation

function AvaaTiedosto(var Tiedosto: Text; TiedostoNimi: string): Integer;

begin  { AvaaTiedosto }
  Assign(Tiedosto, TiedostoNimi);
  {$I-}
  Reset(Tiedosto);
  {$I+}
  AvaaTiedosto := IOResult;
end;  { AvaaTiedosto }

function MuunnaLuvuksi(Merkkijono: string): Integer;

var
  Laskuri,
  Luku,
  Pituus: Integer;

begin  { MuunnaLuvuksi }
  Luku := 0;
  Laskuri := 0;
  Pituus := Length(Merkkijono);
  repeat
     Inc(Laskuri);
     case Merkkijono[Laskuri] of
       '1': Luku := Luku * 10 + 1;
       '2': Luku := Luku * 10 + 2;
       '3': Luku := Luku * 10 + 3;
       '4': Luku := Luku * 10 + 4;
       '5': Luku := Luku * 10 + 5;
       '6': Luku := Luku * 10 + 6;
       '7': Luku := Luku * 10 + 7;
       '8': Luku := Luku * 10 + 8;
       '9': Luku := Luku * 10 + 9;
       '0': Luku := Luku * 10 + 0;
     end;
  until Laskuri = Pituus;
  MuunnaLuvuksi := Luku;
end;  { MuunnaLuvuksi }

function LueJoukkueidenNimet: Integer;

var
  Laskuri: Integer;
  Merkki: Char;
  Nimi: string;

begin  { LueJoukkueidenNimet }
  if AvaaTiedosto(Tiedosto, JoukkueTiedostonNimi) = 0 then
  { Jos tiedoston avaus onnistui }
  begin
    Laskuri := 0;
    if not Eof(Tiedosto) then  { Jos tiedosto ei ole tyhj„ }
      repeat  { Lue joukkueiden nimet }
        Inc(Laskuri);
        Joukkueita := Laskuri;
        Nimi := '';
        repeat  { Lue joukkueen nimi }
          Read(Tiedosto, Merkki);
          if Merkki = '#' then
            repeat
              Read(Tiedosto, Merkki);
            until (Merkki in [#13, #10]) or Eof(Tiedosto);
          if (not (Merkki in [',', ' ', #13, #10])) and
             (not Eof(Tiedosto)) then
            Nimi := Nimi + Merkki;
        until (Merkki = ',') or Eof(Tiedosto);
        JoukkueidenNimet[Laskuri] := Nimi;
      until Eof(Tiedosto) or (Laskuri = MaxJoukkueita)
    else  { Jos tiedosto on tyhj„ }
    begin
      Writeln('Tiedosto ', JoukkueTiedostonNimi, ' on tyhj„.');
      Halt(2);
    end;
  end
  else  { Jos tiedoston avaus ei onnistunut }
  begin
    Writeln('Tiedostoa ei l”ydy: ', JoukkueTiedostonNimi, '.');
    Halt(1);
  end;
  Close(Tiedosto);
end;  { LueJoukkueidenNimet }

procedure LueSeuraavaTulos;

var
  Merkki: Char;
  Merkkijono: string;
  Luku,
  Laskuri: Integer;

begin  { LueSeuraavaTulos }
  with Tulos do
  begin
    Laskuri := 0;
    repeat  { Lue tiedot }
      Inc(Laskuri);
      Merkkijono := '';
      repeat  { Lue tieto }
        Read(Tiedosto, Merkki);
        if Merkki = '#' then
          repeat
            Read(Tiedosto, Merkki);
          until (Merkki in [#13, #10]) or Eof(Tiedosto);
        if (not (Merkki in [',', ' ', #13, #10])) and
           (not Eof(Tiedosto)) then
          Merkkijono := Merkkijono + Merkki;
      until (Merkki = ',') or Eof(Tiedosto);
      Luku := MuunnaLuvuksi(Merkkijono);  { Muunna merkkijono luvuksi }
      case Laskuri of
        1: Joukkueet[1] := Luku;
        2: Joukkueet[2] := Luku;
        3: Eria := Luku;
        4: Maalit[1] := Luku;
        5: Maalit[2] := Luku;
      end;
    until Laskuri = TietojaOttelussa;
  end;
end;  { LueTulos }

procedure NollaaTiedot;

var
  Laskuri, Laskuri2: Integer;

begin  { NollaaTiedot }
  for Laskuri := 1 to Joukkueita do
  begin
    Pisteet[Laskuri] := 0;
    for Laskuri2 := 1 to Joukkueita do
      KeskenaisetOttelut[Laskuri, Laskuri2] := 0;
    PelatutOttelut[Laskuri] := 0;
    TehdytMaalit[Laskuri] := 0;
    PaastetytMaalit[Laskuri] := 0;
    Voitot[Laskuri] := 0;
    Tasapelit[Laskuri] := 0;
    Haviot[Laskuri] := 0;
  end;
end;  { NollaaTiedot }

procedure LueSeuraavatTiedot;

var
  Laskuri: Integer;

begin  { LueSeuraavatTiedot }
  LueSeuraavaTulos;
  with Tulos do
  begin
    if Maalit[1] > Maalit[2] then  { Jos joukkue 1 voitti }
    begin
      Inc(Pisteet[Joukkueet[1]], 2);
      Inc(KeskenaisetOttelut[Joukkueet[1], Joukkueet[2]], 2);
      Inc(Voitot[Joukkueet[1]]);
      Inc(Haviot[Joukkueet[2]]);
    end;
    if Maalit[1] < Maalit[2] then  { Jos joukkue 2 voitti }
    begin
      Inc(Pisteet[Joukkueet[2]], 2);
      Inc(KeskenaisetOttelut[Joukkueet[2], Joukkueet[1]], 2);
      Inc(Voitot[Joukkueet[2]]);
      Inc(Haviot[Joukkueet[1]]);
    end;
    for Laskuri := 1 to 2 do
    begin
      if Maalit[1] = Maalit[2] then  { Jos tasapeli }
      begin
        Inc(Pisteet[Joukkueet[Laskuri]], 1);
        Inc(Tasapelit[Joukkueet[Laskuri]]);
      end;
      Inc(PelatutOttelut[Joukkueet[Laskuri]]);
      Inc(TehdytMaalit[Joukkueet[Laskuri]], Maalit[Laskuri]);
    end;
    Inc(PaastetytMaalit[Joukkueet[1]], Maalit[2]);
    Inc(PaastetytMaalit[Joukkueet[2]], Maalit[1]);
    Inc(KeskenaisetOttelut[Joukkueet[2], Joukkueet[1]]);
    Inc(KeskenaisetOttelut[Joukkueet[1], Joukkueet[2]]);
  end;
end;  { LueSeuraavatTiedot }

procedure LueTiedot;

begin  { LueTiedot }
  NollaaTiedot;
  if AvaaTiedosto(Tiedosto, TulosTiedostonNimi) = 0 then
  { Jos tiedoston avaus onnistui }
  begin
    if not Eof(Tiedosto) then  { Jos tiedosto ei ole tyhj„ }
    repeat
      LueSeuraavatTiedot;
    until Eof(Tiedosto)
    else  { Jos tiedosto on tyhj„ }
    begin
      Writeln('Tiedosto ', JoukkueTiedostonNimi, ' on tyhj„.');
      Close(Tiedosto);
      Halt(2);
    end;
  end
  else  { Jos tiedoston avaus ei onnistunut }
  begin
    Writeln('Tiedostoa ei l”ydy: ', JoukkueTiedostonNimi, '.');
    Halt(1);
  end;
  Close(Tiedosto);
end;  { LueTiedot }

end.