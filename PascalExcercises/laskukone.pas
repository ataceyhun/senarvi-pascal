program laskukone;

uses crt,dos;

var
  x,y,n1,n2,ekanumero,tokanumero,vaihe,num,tekija :integer;
  tulos                                           : real;
  t                                               : char;

procedure alku;

begin
  writeln;
  writeln;
  writeln('                    Laskukone by:');
  writeln('                    Seppo Enarvi');
  delay(3000);
  clrscr;
  writeln;
  writeln;
  writeln('Ensimm„inen hiiren nappi valitsee merkin,');
  writeln('toinen hypp„„ pois ohjelmasta');
  delay(3000);
  clrscr;
end;

procedure piirralaskukone;

begin
  writeln('1 2 3 +');
  writeln('4 5 6 -');
  writeln('7 8 9 *');
  writeln('  0   /');
end;

procedure textikursori;

var regs : registers;

begin
  regs.ax:=10;
  regs.bx:=1;
  intr(51,regs);
end;

procedure xraja;

var regs : registers;

begin
  regs.ax:=7;
  regs.cx:=0;
  regs.dx:=48;
  intr(51,regs);
end;

procedure yraja;

var regs : registers;

begin
  regs.ax:=8;
  regs.cx:=0;
  regs.dx:=24;
  intr(51,regs);
end;

function alustahiiri : integer;

var regs : registers;

begin
  regs.ax:=0;
  intr(51,regs);
  alustahiiri:=regs.ax;
end;

procedure naytakursori;

var regs : registers;

begin
  regs.ax:=1;
  intr(51,regs);
end;

procedure luetila(var x,y,nappi1,nappi2 : integer);

var regs : registers;

begin
  regs.ax:=3;
  intr(51,regs);
  x:=regs.cx;
  y:=regs.dx;
  nappi1:=(regs.bx and 1);
  nappi2:=(regs.bx and 2) shr 1;
end;

procedure nume;

begin
   if vaihe=2 then
    begin
      if (num=10) or (num=11) or (num=12) or (num=13) then
        begin
          tekija:=num;
          vaihe:=3;
        end;
    end;
  if vaihe=1 then
    begin
      if num<>10 then
        if num<>11 then
          if num<>12 then
            if num<>13 then
              begin
                ekanumero:=num;
                vaihe:=2
              end;
    end;
  if vaihe=3 then
    begin
      if num<>10 then
        if num<>11 then
          if num<>12 then
            if num<>13 then
              begin
                tokanumero:=num;
                vaihe:=4;
              end;
    end;
end;

procedure tarkista1rivi;

begin
  if x=0 then
    begin
      num:=1;
      nume;
    end;
  if x=16 then
    begin
      num:=2;
      nume;
    end;
  if x=32 then
    begin
      num:=3;
      nume;
    end;
  if x=48 then
    begin
      num:=10;
      nume;
    end;
end;

procedure tarkista2rivi;

begin
  if x=0 then
    begin
      num:=4;
      nume;
    end;
  if x=16 then
    begin
      num:=5;
      nume;
    end;
  if x=32 then
    begin
      num:=6;
      nume;
    end;
  if x=48 then
    begin
      num:=11;
      nume;
    end;
end;

procedure tarkista3rivi;

begin
  if x=0 then
    begin
      num:=7;
      nume;
    end;
  if x=16 then
    begin
      num:=8;
      nume;
    end;
  if x=32 then
    begin
      num:=9;
      nume;
    end;
  if x=48 then
    begin
      num:=12;
      nume;
    end;
end;

procedure tarkista4rivi;

begin
  if x=24 then
    begin
      num:=0;
      nume;
    end;
  if x=48 then
    begin
      num:=13;
      nume;
    end;
end;

begin
  clrscr;
  alku;
  if alustahiiri=0 then
    begin
      writeln('Mouse not installed');
      writeln('Program halted...');
      halt(1);
    end;
  vaihe:=1;
  piirralaskukone;
  xraja;
  yraja;
  textikursori;
  naytakursori;
  repeat
    luetila(x,y,n1,n2);
    if n1=1 then
      begin
        if y=0 then
          tarkista1rivi;
        if y=8 then
          tarkista2rivi;
        if y=16 then
          tarkista3rivi;
        if y=24 then
          tarkista4rivi;
      end;
    naytakursori;
  until (n2=1) or (vaihe=4);
  if tekija=10 then
    t:='+';
  if tekija=11 then
    t:='-';
  if tekija=12 then
    t:='*';
  if tekija=13 then
    t:='/';
  if t='+' then
    tulos:=ekanumero+tokanumero;
  if t='-' then
    tulos:=ekanumero-tokanumero;
  if t='*' then
    tulos:=ekanumero*tokanumero;
  if t='/' then
    tulos:=ekanumero/tokanumero;
  if vaihe=4 then
    writeln(ekanumero,t,tokanumero,' = ',tulos:8:2);
  if n2=1 then
    begin
      writeln('J„rkev„„ nyt kesken laskemisen hyp„t„ pois,');
      writeln('vai ets„ osaa k„ytt„„ laskukonetta');
    end;
  readln;
end.
