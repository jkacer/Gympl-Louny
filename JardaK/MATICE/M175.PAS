{ Created by GAS 1994 }
{ !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  V unitu Matice je nutno prepsat
  konstanty R a S na R<20 a S<20.
  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}
program M_175;
uses Crt,Matice;
var A:    Mat;
    I:    Byte;
    O:    Pol;
begin
 ClrScr;
 Randomize;
 DejMat(A);
 WriteLn('    A :');
 Vypis(A);
 WriteLn('Radky s permutaci : ');
 for I:=1 to R do
  begin
   Dej_Pol(A,I,O);
   if Permutace_Pol(O) then Write(I,' ');
  end;
 ReadLn;
end.
