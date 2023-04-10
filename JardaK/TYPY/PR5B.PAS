{ Written by GAS }

program LinearniR;

uses
      Crt;

var
      A,B,X:    Real;
      Q:        Byte;
begin
 ClrScr;
 repeat
  WriteLn('Znění rovnice je A*X = B');
  WriteLn('Zadávej!');

  Write('A = ');  ReadLn(A);
  Write('B = ');  ReadLn(B);

  if A=0 then if B=0 then WriteLn('Rovnice má nekonečně mnoho řešení.')
                     else WriteLn('Rovnice nemá žádné řešení.')
         else begin
               X:=B/A;
               WriteLn('Rovnice má 1 řešení: ',X:6:3);
              end;
  repeat
   WriteLn('Chceš ještě? - 1/0');
   ReadLn(Q);
  until (Q=1) or (Q=0);

 until Q=0;
end.
