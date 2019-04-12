program Linear_Interpolation;
{$APPTYPE CONSOLE}
uses   SysUtils,  Math;
const  epsilon=0.00001;
var c:double; a:double=1; b:double=5;

function f(x:double):double;
begin
result:=power(x,x)+3*x-11;
end;

begin
  try

  repeat
    c:=((b-a)*(-f(a))) / (f(b)-f(a))+a;
    writeln('a=',a:0:8,' b=',b:0:8,' c=',c:0:8,' f(c)=',f(c):0:8);
    if f(a)*f(c)<0 then b:=c else a:=c;
    if a>b then
      begin
      writeln('Error! nothing found!');
      readln;
      halt;
      end;
  until abs(f(c))<epsilon;

  writeln('f(', c:0:8, ') < ', epsilon:0:5);

  except
    on E:Exception do
      Writeln(E.Classname, ': ', E.Message);
  end;
  readln;
end.

