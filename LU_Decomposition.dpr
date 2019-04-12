program LU_Decomposition;
{* LU Decomposition, systems of linear equations solver  By: Mohammad Shams *}
{$APPTYPE CONSOLE}
uses SysUtils;
var A,L,U: array of array of real;
    D,Z,X : array of real;
    n,i,j,k: integer;
    sum: real;

begin
  try
  write('Enter equations count:');
  readln(n);

  setlength(A, n,n);
  setlength(L, n,n);
  setlength(U, n,n);
  setlength(D, n);
  setlength(Z, n);
  setlength(X, n);

  for i:= 0 to n-1 do
    begin
    for j:= 0 to n-1 do
       begin
       write('Equation',i,' Enter X',j,':');
       readln(A[i,j]);

       if i=j then U[i,i]:=1;
       if i<j then L[i,j]:=0;
       if i>j then U[i,j]:=0;
       end;

    write('Equation',i,' Enter Result :');
    readln(D[i]);
    end;

  for i := 0 to n-1 do         //fill L and U matrixes
    for j:= 0 to n-1 do
      begin

      if j<=i then
        begin
        sum:=0;
        for k := 0 to j-1 do sum:=sum + L[i,k] * U[k,j];
        L[i,j]:=A[i,j]-sum;
        end;

      if j>i then
        begin
        sum:=0;
        for k := 0 to i-1 do sum:=sum + L[i,k] * U[k,j];
        U[i,j]:=(A[i,j]-sum)/L[i,i];    
        end; 
        
      end;  

  for i := 0 to n-1 do   //calculate Z's
    begin
    sum:=0;
    for j := 0 to i - 1 do sum:=sum + L[i,j]*Z[j];
    Z[i]:=(D[i]-sum)/L[i,i];
    end;

  for i := n-1 downto 0 do   //calculate X's
    begin
    sum:=0;
    for j := i+1 to n - 1 do sum:=sum+U[i,j]*X[j];
    X[i]:=(Z[i]-sum)/U[i,i];
    end;


  writeln('------------------------------------------------------------------');
  for i := 0 to n - 1 do
    begin
    write('|');
    for j := 0 to n - 1 do write(L[i,j]:7:3, ' ');
    write('|','|');
    for j := 0 to n - 1 do write(U[i,j]:7:3, ' ');
    write('|');
    if i=n div 2 then write(' X = ') else write('     ');
    writeln('|', D[i]:7:3, '|');
    end;

 writeln;
 for i := 0 to n - 1 do write('X', i, '=', X[i]:7:3, '  ');

  except
    on E:Exception do
      Writeln(E.Classname, ': ', E.Message);
  end;
  readln;
end.

