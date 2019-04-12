program EulerODE;
{$APPTYPE CONSOLE}
uses
  SysUtils,
  Math;

const  epsilon=0.01;  x0=2; y0=5; p1=6; p2=4; p3=3; h=0.00001; Xn=2.4;
var xiOld,xiNew,yiOld,yiNew:double;
    pIOld,pIIOld,pIIIOld,pINew,pIINew,pIIINew:double;

begin
  try
  xiNew:=x0;
  yiNew:=y0;
  pINew:=p1;
  pIINew:=p2;
  pIIINew:=p3;

  writeln('      Xi       Yi        pI        pII      pIII');
  writeln('-----------------------------------------------------');

  repeat
    xiOld:=xiNew;
    yiOld:=yiNew;
    pIOld:=pINew;
    pIIOld:=pIINew;
    pIIIOld:=pIIINew;

    xiNew:=xiOld + h;
    yiNew:=yiOld + h*pIOld;
    pINew:=pIOld + h * pIIOld;
    pIINew:=pIIOld + h * pIIIOld;
    pIIINew:=pIIIOld + h * (6- 4 * xiOld * xiOld * yiOld * pIIIOld - 5 * pIOld);

    writeln(xiNew:10:5,yiNew:10:5,pINew:10:5,pIINew:10:5,pIIINew:10:5);
    //readln;
  until RoundTo(xiNew,-5)=RoundTo(Xn,-5);

  except
    on E:Exception do
      Writeln(E.Classname, ': ', E.Message);
  end;
  readln;
end.
