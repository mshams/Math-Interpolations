program Lagrang;   {* Recursive Lagrange Function  By: Mohammad Shams *}
{$APPTYPE CONSOLE}
uses  SysUtils;

type   DynamicArray=array [0..1] of array of real;
       {Dimension 0=X   Dimension 1=Y}
       
var v:DynamicArray;  x:real;   deg:byte;   i:integer;
    //With dynamic array we can calculate Lagrange degree of N
    
function Mult(buf:DynamicArray; n,j,k:byte; x:real):real;
begin
if k>n then  result:=1
else if k=j then
  result:=Mult(buf, n, j, k+1, x)
else
  result:=(x-buf[0,k])/(buf[0,j]-buf[0,k]) * Mult(buf, n, j, k+1, x);
end;
    
function Lagrange(buf:DynamicArray; n,j:byte; x:real):real;
begin
if j<=n then
  begin
  result:=Mult(buf, n, j, 0, x) * buf[1,j] + Lagrange(buf, n, j+1, x);
  end
else
  result:=0;
end;
    
begin
  try
  write('Enter Degree:');
  readln(deg);
  write('Enter X=');
  readln(x);

  setlength(v[0],deg+1);
  setlength(v[1],deg+1);

  for i:=0 to deg do  {input Xi,Yi}
     begin
     write('Enter X',i,':');
     readln(v[0,i]);
     write('Enter Y',i,':');
     readln(v[1,i]);
     end;

  writeln('X=', x:0:8, '  Lagrange=', Lagrange(v, deg, 0, x):0:8);

  except
    on E:Exception do
      Writeln(E.Classname, ': ', E.Message);
  end;
  readln;
end.
