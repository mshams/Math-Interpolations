program Newton;
{$APPTYPE CONSOLE}
uses   SysUtils,  Math;
var xiOld,xiNew:double;

function FX(x:double):double;
begin
result:=x-(power(x,5)+4*power(x,-3)+6*power(x,1.1)-10)/
          (5*power(x,4)-12*power(x,-4)+6.6*power(x,0.1));
//result:=x-(power(x,3.7)+6*x-13)/(3.7*power(x,2.7)+6);
end;

function Percent(xiOld:double):double;
begin
result:=abs( (FX(xiOld)-xiOld) / FX(xiOld))*100;
end;

begin
  try
  xiNew:=1;
  writeln('      Xi       Xi+1    |Xi+1 -Xi|     %');
  writeln('--------------------------------------------');
  repeat
    xiOld:=xiNew;
    xiNew:=FX(xiOld);
    writeln(xiOld:10:5, xiNew:10:5, abs(xiNew-xiOld):12:5, percent(xiOld):12:5);
  until percent(xiOld)<=0.01;

  except
    on E:Exception do
      Writeln(E.Classname, ': ', E.Message);
  end;
  readln;
end.

