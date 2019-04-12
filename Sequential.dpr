program Sequential_Search;
{$APPTYPE CONSOLE}
uses   SysUtils,  Math;
const a=1; b=5; sigma=0.000001; epsilon=0.00001;
var x:double;

function F(x:double):double;
begin
result:=power(x,x)+3*x-11;
end;

begin
  try
  x:=a;
  while x<=b do
    begin
    if abs(F(x))<epsilon then writeln('f(', x:0:8, ') < ', epsilon:0:5);
    x:=x+sigma;
    end;
  except
    on E:Exception do
      Writeln(E.Classname, ': ', E.Message);
  end;
  readln;
end.
