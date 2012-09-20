program Cannon;

uses Crt, Graph, Mouse;

var
  StartX, StartY,
  StartSpeed, Angle: Integer;

procedure Shoot(StartX, StartY, StartSpeed, Angle: Integer);

const Gravity = -9.81;  DT = 0.01;

var
  T, G,
  Sine, Cosine: Real;
  X, Y: Integer;

function Rad(Alpha: Integer): Real;

begin  { Rad }
  Rad := (Alpha / 180) * Pi;
end;  { Rad }

begin  { Shoot }
  T := 0;
  Cosine := StartSpeed * Cos(Rad(Angle));  { Count something already }
  Sine := StartSpeed * Sin(Rad(Angle));
  G := 0.5 * Gravity;

  repeat
    X := StartX + Round(Cosine * T);
    Y := StartY + Round(Sine * T + G * Sqr(T));
    PutPixel(X, 199 - Y, 15);
    T := T + DT;
  until KeyPressed or (Y = 0);
end;  { Shoot }

begin  { Cannon }
  SetMode(VGA256Mode);  { Graph mode }

  Shoot(0, 100, 50, 50);

  while KeyPressed do  { Wait until a key has been pressed }
    ReadKey;
  repeat
  until KeyPressed;

  SetMode(LastMode);  { Back to text mode }
end. { Cannon }