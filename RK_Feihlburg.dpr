program RK_Feihlburg;
{$APPTYPE CONSOLE}
uses
  SysUtils,
  Math;

const  x0=2; y0=7; h=0.0001; Xn=3;
var xiOld,xiNew,yiOld,yiNew:double;
    k1,k2,k3,k4,k5,k6:double;


function F(x,y:double):double;
begin
result:=x*x*y + Log10(x+y)+7;
end;

begin
  try
  xiNew:=x0;
  yiNew:=y0;

  writeln('   Xi         Yi        k1        k2       k3        k4         k5         k6');
  writeln('------------------------------------------------------------------------------');

  repeat
    xiOld:=xiNew;
    yiOld:=yiNew;

    xiNew:=xiOld + h;

    k1:=h * F(xiOld,yiOld);

    k2:=h * F(xiOld + h/4, yiOld + k1/4);

    k3:=h * F(xiOld + 3*h/8, yiOld + 3*k1/32 + 9*k2/32);

    k4:=h * F(xiOld + 12*h/13, yiOld + 1932*k1/2197 - 7200*k2/2197 + 7296*k3/2197);

    k5:=h * F(xiOld + h, yiOld + 439*k1/216 - 8*k2 + 3680*k3/513 - 845*k4/4104);

    k6:=h * F(xiOld + h/2, yiOld + 8*k1/27 + 2*k2 - 3544*k3/2565 + 1859*k4/4104 - 11*k5/40);

    yiNew:=yiOld + 16*k1/135 + 6656*k3/12825 + 28561*k4/56430 - 9*k5/50 + 2*k6/55;

    writeln(xiNew:6:4,yiNew:13:6,k1:10:6,k2:10:6,k3:10:6,k4:10:6,k5:10:6,k6:10:6);

  until RoundTo(xiNew,-4)=RoundTo(Xn,-4);

  except
    on E:Exception do
      Writeln(E.Classname, ': ', E.Message);
  end;
  readln;
end.
