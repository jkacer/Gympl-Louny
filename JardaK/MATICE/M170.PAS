{ Created by GAS 1994 }
{ !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  V unitu Matice je nutno prepsat
  konstanty R a S na R=10 a S=10.
  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}
program M_170;
uses Crt,Matice;
var A:     Mat;
    I,J:   Byte;
    Soum:  Boolean;

begin
 ClrScr;
 Randomize;
 DejMat(A);
 WriteLn('    A :');
 Vypis(A);
 Soum:=True;
 for I:=2 to S do
  for J:=1 to I-1 do
   if A[J,I]<>A[I,J] then Soum:=False;
 Write('Tato matice ');
 if Soum then Write('JE ')
         else Write('NENI ');
 WriteLn('soumerna podle hl. uhlopricky.');
 WriteLn;
 ReadLn;
end.
