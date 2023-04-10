{ Written by GAS }

program AbsHodnR;

uses
      Crt;

var
      A,B,
      X1,X2:    Real;
      Q:        Byte;
begin
 ClrScr;
 repeat
  WriteLn('Znění rovnice je │ X-A │  = B');
  WriteLn('Zadávej!');

  Write('A = ');  ReadLn(A);
  Write('B = ');  ReadLn(B);

  X1:=A+B;
  X2:=A-B;
  WriteLn('Rovnice má 2 řešení: ',X1:6:3,' a ',X2:6:3);

  repeat
   WriteLn('Chceš ještě? - 1/0');
   ReadLn(Q);
  until (Q=1) or (Q=0);

 until Q=0;
end.