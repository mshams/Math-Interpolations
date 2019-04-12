program NewtonNolinear;
{$APPTYPE CONSOLE}
uses   SysUtils, Math;

const  epsilon=0.01;  x0=1; y0=1;
var xiOld,xiNew,yiOld,yiNew:double;

function F(x,y:double):double;
begin
result:=power(x,3)+power(y,5)-3;
end;

function G(x,y:double):double;
begin
result:=x+y+0.5;
end;

function Fx(x,y:double):double;
begin
result:=3*power(x,2);
end;

function Fy(x,y:double):double;
begin
result:=5*power(y,4);
end;

function Gx(x,y:double):double;
begin
result:=1;
end;

function Gy(x,y:double):double;
begin
result:=1;
end;

function Det(d11,d12,d21,d22:double):double;
begin
result:=d11*d22-d21*d12;
end;

function h(x,y:double):double;
begin
result:=Det(-F(x,y),Fy(x,y),-G(x,y),Gy(x,y))/Det(Fx(x,y),Fy(x,y),Gx(x,y),Gy(x,y));
end;

function k(x,y:double):double;
begin
result:=Det(Fx(x,y),-F(x,y),Gx(x,y),-G(x,y))/Det(Fx(x,y),Fy(x,y),Gx(x,y),Gy(x,y));
end;

function Percent(New,Old:double):double;
begin
result:=abs((New-Old) / New)*100;
end;

begin
  try
  xiNew:=x0;
  yiNew:=y0;
  writeln('      Xi         Yi        %X          %Y');
  writeln('--------------------------------------------');

  repeat
    xiOld:=xiNew;
    yiOld:=yiNew;
    xiNew:=xiOld + h(xiOld,yiOld);
    yiNew:=yiOld + k(xiOld,yiOld);
    writeln(xiNew:10:4,yiNew:10:4,percent(xiNew,xiOld):12:4,percent(yiNew,yiOld):12:4);
  until (percent(xiNew,xiOld)<=epsilon)and(percent(yiNew,yiOld)<=epsilon);

  except
    on E:Exception do
      Writeln(E.Classname, ': ', E.Message);
  end;
  readln;
end.
