{ Created by GAS 1994 }
{ !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  V unitu Matice je nutno prepsat
  konstanty R a S na R<20 a S<20.
  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}
program M_174;
uses Crt,Matice;
var A:    Mat;
    I:    Byte;
    O:    Pol;
    Pom:  Integer;
begin
 ClrScr;
 Randomize;
 DejMat(A);
 WriteLn('    A :');
 Vypis(A);
 Pom:=0;
 for I:=1 to R do
  begin
   Dej_Pol(A,I,O);
   if Permutace_Pol(O) then Inc(Pom);
  end;
 WriteLn('V matici je ',Pom,' radku s permutaci.');
 ReadLn;
end.
