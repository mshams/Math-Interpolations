program NewtonInterpolation; {* Recursive Newton Function  By: Mohammad Shams *}
{$APPTYPE CONSOLE}
uses  SysUtils;

type   ByteArray=array of byte;
       DynamicArray=array [0..1] of array of real;
       {Dimension 0=X   Dimension 1=Y}
       FR=(Front,Rear);
       
var v: DynamicArray;
    b: ByteArray;     //buffer of Xi variables
    x:real;
    deg:byte;
    i:integer;

function DivDif(bf:ByteArray; f,r:byte):real; //divided difference
begin
if f=r then  result:=v[1,bf[f]]     //[Y0]=Y0
else
  result:=(DivDif(bf, f+1, r)-DivDif(bf, f, r-1)) / (v[0,bf[r]]-v[0,bf[f]]);
end;

function Mult(n:byte; x:real):real;
begin
if n=0 then  result:=x-v[0,0]
else
  result:=(x-v[0,n]) * Mult(n-1, x); 
end;

function Newton(const buf:ByteArray; f, r, n:byte):real; //f=front r=rear
begin
if n=0 then  result:=v[1,0]
else
  result:=DivDif(buf,f,r)*Mult(n-1, x) + Newton(buf,f,r-1, n-1) ;
end;

begin
  try
  write('Enter Degree:');
  readln(deg);
  write('Enter X=');
  readln(x);

  setlength(b,deg+1);
  setlength(v[0],deg+1);
  setlength(v[1],deg+1);

  for i:=0 to deg do  {input Xi,Yi}
     begin
     b[i]:=i;
     write('Enter X',i,':');
     readln(v[0,i]);
     write('Enter Y',i,':');
     readln(v[1,i]);
     end;

  writeln('X=', x:0:6, '  Newton=', Newton(b,0,deg, deg):0:6);

  except
    on E:Exception do
      Writeln(E.Classname, ': ', E.Message);
  end;
  readln;
end.

