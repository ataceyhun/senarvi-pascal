program se;
uses crt,graph;
var gd,gm,i : integer;
begin
gd:=detect;
initgraph(gd,gm,'d:\tp\bgi');
settextstyle(defaultfont,horizdir,2);
outtextxy(100,200,'Seppo');
outtextxy(200,200,'Enarvi');
repeat
if not keypressed then for i:=200 to 620 do
if not keypressed then begin
if not keypressed then setcolor(15);
if not keypressed then outtextxy(100,i,'Seppo');
if not keypressed then outtextxy(i,200,'Enarvi');
if not keypressed then delay(20);
if not keypressed then setcolor(0);
if not keypressed then outtextxy(100,i-1,'Seppo');
if not keypressed then outtextxy(i-1,200,'Enarvi');
if not keypressed then end;
if not keypressed then for i:=620 downto 200 do
if not keypressed then begin
if not keypressed then setcolor(15);
if not keypressed then outtextxy(100,i,'Seppo');
if not keypressed then outtextxy(i,200,'Enarvi');
if not keypressed then delay(20);
if not keypressed then setcolor(0);
if not keypressed then outtextxy(100,i+1,'Seppo');
if not keypressed then outtextxy(i+1,200,'Enarvi');
if not keypressed then end;
until keypressed;
closegraph;
end.