program meteoripeli;
uses crt,initgraph;
const
  alus : array [0..44] of byte =(15,0,9,0,2,1,192,128,2,5,240,128,2,
                17,204,128,2,81,207,128,2,65,195,128,9,85,255,224,41,85,
                255,232,105,65,195,235,105,41,232,235,64,40,40,3,170);
  rajahdys : array [0..44] of byte =(15,0,9,0,0,48,128,192,1,3,32,16,
                0,144,177,35,24,236,148,172,2,79,88,96,233,20,172,128,
                44,71,0,180,57,98,58,202,14,47,225,64,2,66,32,192,170);
  meteori  : array [0..44] of byte =(15,0,9,0,0,37,213,0,2,170,238,80,
                10,170,170,236,42,170,170,173,170,170,42,171,136,174,138,
                170,128,3,10,170,32,0,0,136,10,0,0,160,0,170,170,0,0);
  maara = 4;
var gradriv,gramode,x,y,pisteet,ind,nopeus,aika :integer;
    meteo_x, meteo_y :array[1..maara] of integer;
    tormays : boolean;

procedure aloitus;
begin
  gradriv := cga;  gramode := cgac1;
  initgraph (gradriv, gramode, '');
  randomize;
  setfillstyle (emptyfill,0);
  pisteet :=0;  aika :=0;
  x := 160;  y := 164;
  for ind := 1 to maara do
  begin
    meteo_x [ind] := random (200) +50;
    meteo_y [ind] := pred (ind) * 30;
  end;
  nopeus := 3;
  tormays := false;
end; {aloitus}

procedure meteorit;
begin
  delay(50);
  for ind := 1 to maara do
  begin
    bar (meteo_x [ind],meteo_y [ind],meteo_x [ind]+15,meteo_y[ind]+9);
    meteo_y[ind] := meteo_y[ind]+nopeus;
    if meteo_y[ind] > 170 then
    begin
      inc(pisteet);
      meteo_y[ind] := 10;
      meteo_x[ind] := random (200) + 50;
    end;
    putimage (meteo_x[ind],meteo_y[ind],meteori,normalput);
    if (meteo_y[ind] > y-10) and (meteo_x[ind] < x+16)
    and (meteo_x[ind] > x-16) then tormays := true;
  end;
  if ((aika and 63) = 0) and (nopeus < 10) then inc(nopeus);
end; {meteorit}

procedure pelaa;
var c:integer;
begin
  c:=1;
  repeat
  inc(aika); c:= c+1;
  bar(x, y, x+15, y+9);
  if (mem [$40:$17] and 1 > 0) and (x < 240) then
  x := x+8;
  if (mem [$40:$17] and 2 > 0) and (x > 70) then
  x := x-8;
  putimage (x, y, alus, normalput);
  meteorit;
  until tormays;
end; {pelaa}

procedure lopetus;
var h,l:integer;
begin
  putimage(x, y, rajahdys, normalput);
  randomize;
  l:=1;
  for h:=1 to 2000 do
  begin
    l:= l+1;
    if l>1800 then l:= 1800;
    sound(random(2000-l)+400 );
    delay(1);
  end;  nosound;
  delay(1000);
  closegraph;
  writeln ('sait ',pisteet,' pistett„');
  delay(2000);
end;  {lopetus}

begin
  aloitus;
  pelaa;
  lopetus;
end. {p„„ohjelma}