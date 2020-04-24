{ Written by GAS }

program C3;

uses
      Crt,Complex;

var
      A:        TComplex_Alg;
      B:        TComplex_Gon;

begin
 ClrScr;
 WriteLn('Zadej A !');
 Dej_Alg(A);

 WriteLn('Velikost A je ',Velikost(A):5:3);
 Alg_Gon(A,B);
 WriteLn('V goniometrick‚m tvaru:');
 Pis_Gon(B);

 ReadLn;
end.

