program Pi;

{$APPTYPE CONSOLE}

uses
  SysUtils;
const g=800000000;
var
  x,y:double; i,h:longint;

begin
  try
  randomize;
  h:=0;
  for I := 0 to g do
    begin
    x:=2*random-1;
    y:=2*random-1;
    if(x*x + y*y)<1 then h:=h+1;
    

    end;
  writeln(4*h/g:15:10);
  readln;

  except
    on E:Exception do
      Writeln(E.Classname, ': ', E.Message);
  end;
end.
