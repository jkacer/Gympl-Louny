{ Written by GAS }

program C4;

uses
      Crt,Complex;

var
      A:        TComplex_Alg;
      B:        TComplex_Gon;

begin
 ClrScr;
 WriteLn('Zadej B !');
 Dej_Gon(B);

 Gon_Alg(B,A);
 WriteLn('V algebraickém tvaru:');
 Pis_Alg(A);

 ReadLn;
end.

