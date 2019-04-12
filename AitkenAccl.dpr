program AitkenAccleration;
{$APPTYPE CONSOLE}
uses  SysUtils, Math;
const  epsilon=0.0000000001;
var i,j:integer;
    xv:Array[0..50]of double;

function f(x:double):double;
begin
result:=power(x,x+2)+3*x-11;
//result:=power(x,3.1)+5*x-7;
//result:=power(x,4.3)+15*power(x,2.3)+16*power(x,1.1)+17*x-16;
//result:=power(x,3)+x-1;
end;

function X(i:byte):double; //Xi+1 determine in secant method
begin
if i>j then
  begin
  if i=0 then
     result:=0
  else if i=1 then
     result:=4
  else
     result:=X(i-1)-(  f(X(i-1))*(X(i-1)-X(i-2))  )/(  f(X(i-1))-f(X(i-2))  );
  xv[i]:=result;
  j:=i;
  end
else
  result:=xv[i];
end;

function Percent(i:byte):double;
begin
result:=abs( X(i)/X(i+1) -1)*100;
end;

function Acl(i:byte):double;
begin
result:=X(i-2)-(X(i-1)-X(i-2))*(X(i-1)-X(i-2))/(X(i)-2*X(i-1)+X(i-2));
end;

begin
  try
  i:=3;
  writeln('    Xi           %        Aitken Accl');
  writeln('--------------------------------------');
  repeat
      //writeln(X(i):8:4, percent(i):10:4,'  ',//);
      //{writeln(}X(i-1):6:4, '-(', f(X(i-1)):6:4, '*(', X(i-1):6:4, '-',
       //X(i-2):6:4, ')/(', f(X(i-1)):6:4, '-', f(X(i-2)):6:4, ')');
      writeln(X(i):14:8, percent(i):14:8,Acl(i):14:8);
      i:=i+1;
  until percent(i)<=epsilon;

  except
    on E:Exception do
      Writeln(E.Classname, ': ', E.Message);
  end;
  readln;
end.

