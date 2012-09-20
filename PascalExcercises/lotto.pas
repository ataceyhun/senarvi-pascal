{ lotto.pas -- arvotaan seitsem„n numeroa (ei lis„numeroita) }

program lotto;

uses
  crt;

const
  NUM    = 7;
  MINVAL = 1;
  MAXVAL = 37;

var
  nume : array [0..NUM] of integer;        { lottonumerot sis„lt„v„ taulukko }
  i, test : integer;

procedure bubblesort (a : array of integer; num : integer); forward;
procedure swap (x, y : integer); forward;
function isalready (test, i : integer) : boolean; forward;

procedure bubblesort (a : array of integer; num : integer);

var
  i, j : integer;

begin
  for i := 0 to num-1 do
  begin
    for j := num-1 downto i+1 do
      if a[j-1] > a[j] then
        swap (a[j-1], a[j]);
  end;
end;

procedure swap (x, y : integer);

var
  temp : integer;

begin
  temp := x;
  x := y;
  y := temp;
end;

function isalready (test, i : integer) : boolean;

var
  n : integer;

begin
  isalready := false;
  for n := 0 to i-1 do
    if nume[n] = test then
      isalready := true;
end;

begin
  randomize;        { alustaa generaattorin }

  i := 0;
  while i < NUM do
  begin
    test := random (MAXVAL+1) + 1;
    if isalready (test, i) then
    begin
      continue;
    end
    else
      nume[i] := test;
    i := i+1;
  end;

  bubblesort (nume, NUM);

  writeln;
  for i := 0 to NUM-1 do
    writeln (nume[i]);
end.