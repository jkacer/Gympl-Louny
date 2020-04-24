{ Written by GAS }

program C1;

uses
      Crt,Complex;

var
      A,B,C:    TComplex_Alg;

begin
 ClrScr;
 WriteLn('Zadej A !');
 Dej_Alg(A);
 WriteLn('Zadej B !');
 Dej_Alg(B);

 WriteLn('Velikost A je ',Velikost(A):5:3);
 WriteLn('Velikost B je ',Velikost(B):5:3);

 Plus(A,B,C);
 Write('A + B = '); Pis_Alg(C); WriteLn;
 WriteLn('Velikost A+B je ',Velikost(C):5:3);

 Minus(A,B,C);
 Write('A - B = '); Pis_Alg(C); WriteLn;
 WriteLn('Velikost A-B je ',Velikost(C):5:3);

 ReadLn;
end.

